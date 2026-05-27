--[[
    © 2026 BerbrickDev - Todos los derechos reservados
    Servidor Principal - Sistema de Mecánico Móvil NPC
]]--

-- ============================================
-- VERIFICAR DINERO
-- ============================================

ESX.RegisterServerCallback('mecanico:verificarDinero', function(source, cb)
    local xPlayer = ESX.GetPlayerFromId(source)
    
    if not xPlayer then
        cb({puede = false, gratis = false})
        return
    end
    
    -- Verificar si el trabajo tiene servicio gratis
    local trabajoGratis = false
    for _, trabajo in ipairs(Config.TrabajosGratis) do
        if xPlayer.job.name == trabajo then
            trabajoGratis = true
            break
        end
    end
    
    if trabajoGratis then
        cb({puede = true, gratis = true})
        return
    end
    
    -- 💰 VERIFICAR DINERO: Primero efectivo, luego banco
    local dineroEfectivo = xPlayer.getMoney()
    local dineroBanco = xPlayer.getAccount('bank').money
    local dineroTotal = dineroEfectivo + dineroBanco
    
    -- Si tiene suficiente dinero entre efectivo y banco
    local tieneDinero = dineroTotal >= Config.PrecioReparacion
    
    cb({puede = tieneDinero, gratis = false})
end)

-- ============================================
-- COBRAR REPARACIÓN
-- ============================================

RegisterNetEvent('mecanico:cobrarReparacion')
AddEventHandler('mecanico:cobrarReparacion', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    
    if not xPlayer then
        return
    end
    
    -- Verificar si el trabajo tiene servicio gratis
    local trabajoGratis = false
    for _, trabajo in ipairs(Config.TrabajosGratis) do
        if xPlayer.job.name == trabajo then
            trabajoGratis = true
            break
        end
    end
    
    if trabajoGratis then
        EnviarLog(_source, xPlayer, 0, true)
        return
    end
    
    -- 💰 COBRAR: Primero intenta efectivo, luego banco, luego combinado
    local dineroEfectivo = xPlayer.getMoney()
    local dineroBanco = xPlayer.getAccount('bank').money
    local precioTotal = Config.PrecioReparacion
    local cobrado = false
    
    -- Caso 1: Tiene suficiente efectivo
    if dineroEfectivo >= precioTotal then
        xPlayer.removeMoney(precioTotal)
        cobrado = true
        print(string.format('^2[MECANICO] %s pagó %s€ en efectivo^0', xPlayer.getName(), precioTotal))
    
    -- Caso 2: Tiene suficiente en banco
    elseif dineroBanco >= precioTotal then
        xPlayer.removeAccountMoney('bank', precioTotal)
        cobrado = true
        print(string.format('^2[MECANICO] %s pagó %s€ desde el banco^0', xPlayer.getName(), precioTotal))
    
    -- Caso 3: Tiene que combinar efectivo + banco
    elseif (dineroEfectivo + dineroBanco) >= precioTotal then
        -- Usar todo el efectivo primero
        xPlayer.removeMoney(dineroEfectivo)
        local restante = precioTotal - dineroEfectivo
        -- Completar con banco
        xPlayer.removeAccountMoney('bank', restante)
        cobrado = true
        print(string.format('^2[MECANICO] %s pagó %s€ (%s€ efectivo + %s€ banco)^0', 
            xPlayer.getName(), precioTotal, dineroEfectivo, restante))
    end
    
    if cobrado then
        EnviarLog(_source, xPlayer, Config.PrecioReparacion, false)
    else
        -- Seguridad: Si no tiene dinero, posible exploit
        print(string.format('^1[EXPLOIT] %s intentó usar mecánico sin dinero (Efectivo: %s€, Banco: %s€)^0', 
            xPlayer.getName(), dineroEfectivo, dineroBanco))
        DropPlayer(_source, '[BerbrickDev] Intento de exploit detectado en sistema de mecánico')
        EnviarLogExploit(_source, xPlayer)
    end
end)

-- ============================================
-- SISTEMA DE LOGS
-- ============================================

function EnviarLog(source, xPlayer, precio, gratis)
    if not Config.UsarLogs then
        return
    end
    
    local mensaje = string.format(
        '[MECANICO] %s (%s) | Trabajo: %s | Precio: %s€ | Gratis: %s',
        xPlayer.getName(),
        xPlayer.identifier,
        xPlayer.job.name,
        precio,
        gratis and 'Sí' or 'No'
    )
    
    print(mensaje)
    
    -- Enviar a Discord si está configurado
    if Config.WebhookDiscord and Config.WebhookDiscord ~= '' then
        EnviarDiscord(
            'Uso de Mecánico NPC',
            mensaje,
            gratis and 65280 or 3447003 -- Verde si es gratis, azul si es de pago
        )
    end
end

function EnviarLogExploit(source, xPlayer)
    if not Config.UsarLogs then
        return
    end
    
    local mensaje = string.format(
        '[EXPLOIT] %s (%s) intentó usar el mecánico sin dinero',
        xPlayer.getName(),
        xPlayer.identifier
    )
    
    print('^1' .. mensaje .. '^0')
    
    if Config.WebhookDiscord and Config.WebhookDiscord ~= '' then
        EnviarDiscord(
            '⚠️ INTENTO DE EXPLOIT',
            mensaje,
            16711680 -- Rojo
        )
    end
end

function EnviarDiscord(titulo, descripcion, color)
    local embed = {
        {
            ['title'] = titulo,
            ['description'] = descripcion,
            ['color'] = color,
            ['footer'] = {
                ['text'] = '© BerbrickDev - Sistema de Mecánico NPC',
            },
            ['timestamp'] = os.date('!%Y-%m-%dT%H:%M:%S')
        }
    }
    
    PerformHttpRequest(Config.WebhookDiscord, function(err, text, headers) end, 'POST', json.encode({
        username = 'BerbrickDev Mecánico',
        embeds = embed
    }), {
        ['Content-Type'] = 'application/json'
    })
end

-- ============================================
-- COMANDO DE ADMINISTRADOR
-- ============================================

RegisterCommand(Config.ComandoAdmin, function(source, args, rawCommand)
    local xPlayer = ESX.GetPlayerFromId(source)
    
    if not xPlayer then
        return
    end
    
    if xPlayer.getGroup() ~= 'admin' and xPlayer.getGroup() ~= 'superadmin' then
        TriggerClientEvent('esx:showNotification', source, '~r~No tienes permisos para usar este comando')
        return
    end
    
    local nuevoPrecio = tonumber(args[1])
    
    if not nuevoPrecio or nuevoPrecio < 0 then
        TriggerClientEvent('esx:showNotification', source, _T('precio_invalido'))
        return
    end
    
    Config.PrecioReparacion = nuevoPrecio
    TriggerClientEvent('esx:showNotification', source, _T('precio_actualizado', nuevoPrecio))
    
    -- Notificar a todos los jugadores
    TriggerClientEvent('esx:showNotification', -1, string.format('~y~El precio del mecánico ha sido actualizado a %s€', nuevoPrecio))
    
    print(string.format('[MECANICO] %s cambió el precio a %s€', xPlayer.getName(), nuevoPrecio))
end, false)

-- ============================================
-- INFORMACIÓN DE INICIO
-- ============================================

AddEventHandler('onResourceStart', function(resourceName)
    if GetCurrentResourceName() == resourceName then
        print('^2========================================^0')
        print('^2[BerbrickDev] ^0Sistema de Mecánico NPC')
        print('^2Versión:^0 2.0.0')
        print('^2Estado:^0 ^2Iniciado correctamente^0')
        print('^2Precio:^0 ' .. Config.PrecioReparacion .. '€')
        print('^2Método de pago:^0 ' .. Config.MetodoPago)
        print('^2Idioma:^0 ' .. Config.Locale)
        print('^2========================================^0')
    end
end)

-- ============================================
-- FUNCIÓN AUXILIAR DE TRADUCCIÓN
-- ============================================

function _T(key, ...)
    local locale = Config.Traducciones[Config.Locale] or Config.Traducciones['es']
    local text = locale[key] or key
    return string.format(text, ...)
end
