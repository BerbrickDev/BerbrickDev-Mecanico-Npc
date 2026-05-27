--[[
    © 2026 BerbrickDev - Todos los derechos reservados
    Cliente Principal - Sistema de Mecánico Móvil NPC
    VERSIÓN CORREGIDA - Sin bugs
]]--

local mecanicoPed = nil
local reparandoVehiculo = false
local ultimoUso = 0

-- ============================================
-- FUNCIONES DE NOTIFICACIÓN
-- ============================================

function Notificar(mensaje, tipo)
    if Config.TipoNotificacion == 'esx' then
        ESX.ShowNotification(mensaje)
    elseif Config.TipoNotificacion == 'mythic' then
        exports['mythic_notify']:DoHudText(tipo or 'inform', mensaje)
    elseif Config.TipoNotificacion == 'okokNotify' then
        exports['okokNotify']:Alert('Mecánico', mensaje, 5000, tipo or 'info')
    elseif Config.TipoNotificacion == 'custom' then
        print(mensaje)
    end
end

-- ============================================
-- FUNCIONES DE MECÁNICO
-- ============================================

function CrearMecanico(coords)
    -- ⚠️ SOLO modelos de mecánicos (NO médicos ni otros NPCs)
    local modelosMecanicos = {
        's_m_m_autoshop_01',  -- Mecánico de taller 1
        's_m_m_autoshop_02',  -- Mecánico de taller 2
        's_m_y_xmech_01',     -- Mecánico joven 1
        's_m_y_xmech_02'      -- Mecánico joven 2
    }
    
    local modeloAleatorio = modelosMecanicos[math.random(#modelosMecanicos)]
    local modelHash = GetHashKey(modeloAleatorio)
    
    -- Cargar modelo con reintentos
    RequestModel(modelHash)
    local intentos = 0
    while not HasModelLoaded(modelHash) and intentos < 50 do
        Wait(100)
        intentos = intentos + 1
        RequestModel(modelHash) -- Reintentar
    end
    
    if not HasModelLoaded(modelHash) then
        print('^1[ERROR] No se pudo cargar el modelo del mecánico: ' .. modeloAleatorio .. '^0')
        return nil
    end
    
    -- Crear el PED (tipo 4 = NPC civil)
    local ped = CreatePed(4, modelHash, coords.x, coords.y, coords.z, 0.0, true, false)
    
    -- Verificar que se creó correctamente
    if not DoesEntityExist(ped) then
        print('^1[ERROR] No se pudo crear el mecánico^0')
        SetModelAsNoLongerNeeded(modelHash)
        return nil
    end
    
    -- Configurar el PED para que sea un mecánico funcional
    SetEntityAsMissionEntity(ped, true, true)
    SetBlockingOfNonTemporaryEvents(ped, true)
    SetPedFleeAttributes(ped, 0, false)
    SetPedCombatAttributes(ped, 17, true)
    SetPedCanRagdoll(ped, false)
    SetEntityInvincible(ped, true)
    SetPedKeepTask(ped, true)
    TaskSetBlockingOfNonTemporaryEvents(ped, true)
    
    -- Liberar modelo
    SetModelAsNoLongerNeeded(modelHash)
    
    return ped
end

function MecanicoCaminarHacia(ped, coords)
    TaskGoToCoordAnyMeans(ped, coords.x, coords.y, coords.z, 1.0, 0, 0, 786603, 0xbf800000)
end

function AnimacionReparacion(ped)
    local dict = 'mini@repair'
    local anim = 'fixing_a_ped'
    
    RequestAnimDict(dict)
    local timeout = 0
    while not HasAnimDictLoaded(dict) and timeout < 5000 do
        Wait(100)
        timeout = timeout + 100
    end
    
    if HasAnimDictLoaded(dict) then
        TaskPlayAnim(ped, dict, anim, 8.0, -8.0, -1, 1, 0, false, false, false)
    end
end

function AnimacionCobrar(ped)
    local dict = 'mp_common'
    local anim = 'givetake1_a'
    
    RequestAnimDict(dict)
    local timeout = 0
    while not HasAnimDictLoaded(dict) and timeout < 5000 do
        Wait(100)
        timeout = timeout + 100
    end
    
    if HasAnimDictLoaded(dict) then
        TaskPlayAnim(ped, dict, anim, 8.0, -8.0, 2000, 0, 0, false, false, false)
    end
end

function EsVehiculoProhibido(vehicle)
    local modelo = GetEntityModel(vehicle)
    local nombreModelo = GetDisplayNameFromVehicleModel(modelo):lower()
    
    for _, prohibido in ipairs(Config.VehiculosProhibidos) do
        if nombreModelo == prohibido:lower() then
            return true
        end
    end
    
    return false
end

function VehiculoEstaReparado(vehicle)
    local bodyHealth = GetVehicleBodyHealth(vehicle)
    local engineHealth = GetVehicleEngineHealth(vehicle)
    
    return bodyHealth >= 1000.0 and engineHealth >= 1000.0
end

-- ============================================
-- COMANDO PRINCIPAL
-- ============================================

RegisterCommand(Config.Comando, function()
    -- Verificar cooldown
    local tiempoActual = GetGameTimer()
    local tiempoTranscurrido = (tiempoActual - ultimoUso) / 1000
    
    if tiempoTranscurrido < Config.Cooldown then
        local tiempoRestante = math.ceil(Config.Cooldown - tiempoTranscurrido)
        Notificar(_T('cooldown', tiempoRestante), 'error')
        return
    end
    
    if reparandoVehiculo then
        Notificar(_T('ya_reparando'), 'error')
        return
    end
    
    local playerPed = PlayerPedId()
    local vehicle = GetVehiclePedIsIn(playerPed, false)
    
    -- Verificar si el jugador está en un vehículo
    if vehicle == 0 then
        Notificar(_T('no_vehiculo'), 'error')
        return
    end
    
    -- Verificar si el jugador es el conductor
    if GetPedInVehicleSeat(vehicle, -1) ~= playerPed then
        Notificar(_T('no_conductor'), 'error')
        return
    end
    
    -- Verificar si el vehículo está prohibido
    if EsVehiculoProhibido(vehicle) then
        Notificar(_T('vehiculo_prohibido'), 'error')
        return
    end
    
    -- Verificar si el vehículo ya está reparado
    if not Config.PermitirSiReparado and VehiculoEstaReparado(vehicle) then
        Notificar(_T('ya_reparado'), 'info')
        return
    end
    
    -- Solicitar al servidor
    ESX.TriggerServerCallback('mecanico:verificarDinero', function(resultado)
        if resultado.puede then
            ultimoUso = GetGameTimer()
            reparandoVehiculo = true
            IniciarReparacion(vehicle, resultado.gratis)
        else
            Notificar(_T('sin_dinero', Config.PrecioReparacion), 'error')
        end
    end)
end, false)

-- Sugerencia de comando
TriggerEvent('chat:addSuggestion', '/' .. Config.Comando, 'Llama a un mecánico NPC para reparar tu vehículo', {})

-- ============================================
-- PROCESO DE REPARACIÓN (CORREGIDO)
-- ============================================

function IniciarReparacion(vehicle, esGratis)
    local playerPed = PlayerPedId()
    local vehicleCoords = GetEntityCoords(vehicle)
    local vehicleHeading = GetEntityHeading(vehicle)
    
    -- Calcular posición delante del vehículo
    local offsetX = vehicleCoords.x + (math.sin(math.rad(-vehicleHeading)) * 5.0)
    local offsetY = vehicleCoords.y + (math.cos(math.rad(-vehicleHeading)) * 5.0)
    local spawnCoords = vector3(offsetX, offsetY, vehicleCoords.z)
    
    if esGratis then
        Notificar(_T('servicio_gratis'), 'success')
    end
    
    Notificar(_T('mecanico_camino'), 'info')
    
    -- Crear mecánico
    mecanicoPed = CrearMecanico(spawnCoords)
    
    -- 🔧 FIX 2: VERIFICAR QUE EL MECÁNICO SE CREÓ
    if not mecanicoPed or not DoesEntityExist(mecanicoPed) then
        Notificar('❌ Error: No se pudo crear el mecánico. Intenta de nuevo.', 'error')
        reparandoVehiculo = false
        return
    end
    
    -- Calcular posición del capó
    local capoCoords = GetWorldPositionOfEntityBone(vehicle, GetEntityBoneIndexByName(vehicle, "bonnet"))
    
    -- Si no encuentra el hueso del capó, usar posición frontal
    if capoCoords.x == 0 and capoCoords.y == 0 and capoCoords.z == 0 then
        local frontOffset = GetOffsetFromEntityInWorldCoords(vehicle, 0.0, 2.5, 0.0)
        capoCoords = frontOffset
    end
    
    -- Hacer que el mecánico camine hacia el capó
    MecanicoCaminarHacia(mecanicoPed, capoCoords)
    
    -- Esperar a que llegue
    Wait(3000)
    
    -- 🔧 BLOQUEAR VEHÍCULO DURANTE REPARACIÓN (después de que llegue el mecánico)
    FreezeEntityPosition(vehicle, true)
    SetVehicleEngineOn(vehicle, false, true, true)
    SetVehicleUndriveable(vehicle, true)
    
    -- 🔧 ABRIR EL CAPÓ (índice 4 = capó delantero)
    SetVehicleDoorOpen(vehicle, 4, false, false)
    Wait(500)
    
    Notificar(_T('reparando'), 'info')
    
    -- Posicionar al mecánico frente al capó
    SetEntityCoords(mecanicoPed, capoCoords.x, capoCoords.y, capoCoords.z, false, false, false, true)
    Wait(500)
    
    -- Hacer que mire hacia el capó
    TaskTurnPedToFaceEntity(mecanicoPed, vehicle, 1000)
    Wait(1000)
    
    -- Iniciar animación de reparación
    AnimacionReparacion(mecanicoPed)
    
    -- Esperar tiempo de reparación con notificaciones
    local tiempoReparacion = Config.TiempoReparacion
    for i = tiempoReparacion, 0, -5 do
        if i > 0 and i % 10 == 0 then
            Notificar(_T('tiempo_restante', i), 'info')
        end
        Wait(5000)
    end
    
    -- Reparar el vehículo
    SetVehicleFixed(vehicle)
    SetVehicleDeformationFixed(vehicle)
    SetVehicleBodyHealth(vehicle, 1000.0)
    SetVehicleEngineHealth(vehicle, 1000.0)
    SetVehiclePetrolTankHealth(vehicle, 1000.0)
    
    -- Reparar todas las ventanas
    for i = 0, 7 do
        FixVehicleWindow(vehicle, i)
    end
    
    -- Reparar todos los neumáticos
    for i = 0, 7 do
        SetVehicleTyreFixed(vehicle, i)
    end
    
    -- Detener animación
    ClearPedTasksImmediately(mecanicoPed)
    
    Wait(500)
    
    -- 🔧 CERRAR EL CAPÓ
    SetVehicleDoorShut(vehicle, 4, false)
    
    Wait(1000)
    
    -- 🔧 FIX 3: DESBLOQUEAR VEHÍCULO DESPUÉS DE REPARAR
    FreezeEntityPosition(vehicle, false)
    SetVehicleUndriveable(vehicle, false)
    SetVehicleEngineOn(vehicle, true, true, false)
    
    -- Animación de cobrar dinero
    AnimacionCobrar(mecanicoPed)
    
    Wait(2000)
    
    -- Cobrar dinero (si no es gratis)
    if not esGratis then
        TriggerServerEvent('mecanico:cobrarReparacion')
        Notificar(_T('reparado', Config.PrecioReparacion), 'success')
    else
        Notificar(_T('reparado', 0), 'success')
    end
    
    -- El mecánico se va
    TaskWanderStandard(mecanicoPed, 10.0, 10)
    
    Wait(5000)
    
    -- Eliminar el mecánico
    if DoesEntityExist(mecanicoPed) then
        DeleteEntity(mecanicoPed)
    end
    
    mecanicoPed = nil
    reparandoVehiculo = false
end

-- ============================================
-- LIMPIEZA AL DESCONECTAR
-- ============================================

AddEventHandler('onResourceStop', function(resourceName)
    if GetCurrentResourceName() == resourceName then
        if mecanicoPed ~= nil and DoesEntityExist(mecanicoPed) then
            DeleteEntity(mecanicoPed)
        end
        
        -- Desbloquear vehículo si estaba bloqueado
        local playerPed = PlayerPedId()
        local vehicle = GetVehiclePedIsIn(playerPed, false)
        if vehicle ~= 0 then
            FreezeEntityPosition(vehicle, false)
            SetVehicleUndriveable(vehicle, false)
        end
    end
end)

-- ============================================
-- INFORMACIÓN DE INICIO
-- ============================================

CreateThread(function()
    Wait(1000)
    print('^2========================================^0')
    print('^2[BerbrickDev] ^0Sistema de Mecánico NPC')
    print('^2Versión:^0 2.0.1 (CORREGIDA)')
    print('^2Autor:^0 BerbrickDev')
    print('^2Comando:^0 /' .. Config.Comando)
    print('^2Discord:^0 discord.gg/5SCEyzJ8')
    print('^2========================================^0')
end)
