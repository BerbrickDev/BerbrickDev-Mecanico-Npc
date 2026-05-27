--[[
    © 2026 BerbrickDev - Todos los derechos reservados
    Configuración del Sistema de Mecánico Móvil NPC
]]--

Config = {}

-- ============================================
-- CONFIGURACIÓN GENERAL
-- ============================================

Config.Locale = 'es' -- Idioma: 'es', 'en', 'fr', 'de', 'pt'

-- Precio de la reparación
Config.PrecioReparacion = 500

-- Tiempo de reparación en segundos
Config.TiempoReparacion = 30

-- Distancia máxima para spawneo del mecánico (metros)
Config.DistanciaSpawn = 5.0

-- Tiempo que tarda el mecánico en llegar al vehículo (ms)
Config.TiempoLlegada = 3000

-- Tiempo que el mecánico permanece después de reparar (ms)
Config.TiempoDespedida = 5000

-- ============================================
-- CONFIGURACIÓN DE NOTIFICACIONES
-- ============================================

Config.TipoNotificacion = 'esx' -- 'esx', 'mythic', 'okokNotify', 'custom'

-- ============================================
-- CONFIGURACIÓN DE PAGO
-- ============================================

Config.MetodoPago = 'money' -- 'money' (efectivo), 'bank' (banco), 'black_money' (dinero negro)

-- Permitir reparación si el vehículo ya está reparado
Config.PermitirSiReparado = false

-- ============================================
-- CONFIGURACIÓN DE MECÁNICOS
-- ============================================

-- Modelos de mecánicos NPC (se elige uno aleatorio)
-- ⚠️ SOLO MODELOS DE MECÁNICOS - NO MÉDICOS NI OTROS
Config.ModelosMecanicos = {
    's_m_m_autoshop_01',  -- Mecánico de taller 1
    's_m_m_autoshop_02',  -- Mecánico de taller 2
    's_m_y_xmech_01',     -- Mecánico joven 1
    's_m_y_xmech_02'      -- Mecánico joven 2
}

-- ============================================
-- CONFIGURACIÓN DE ANIMACIONES
-- ============================================

Config.Animaciones = {
    reparacion = {
        dict = 'mini@repair',
        anim = 'fixing_a_ped'
    },
    cobrar = {
        dict = 'mp_common',
        anim = 'givetake1_a',
        duracion = 2000
    }
}

-- ============================================
-- CONFIGURACIÓN DE EFECTOS
-- ============================================

-- Mostrar partículas de chispas durante la reparación
Config.MostrarParticulas = true

-- Reproducir sonidos durante la reparación
Config.ReproducirSonidos = true

-- ============================================
-- CONFIGURACIÓN DE RESTRICCIONES
-- ============================================

-- Trabajos que pueden usar el comando gratis (VACÍO = TODOS PAGAN)
Config.TrabajosGratis = {
    -- Deshabilitado: Todos los jugadores deben pagar 500€
    -- 'mechanic',
    -- 'police',
    -- 'ambulance'
}

-- Cooldown entre usos del comando (segundos)
Config.Cooldown = 60

-- Permitir uso en vehículos de emergencia
Config.PermitirEmergencia = true

-- Lista de vehículos prohibidos (por modelo)
Config.VehiculosProhibidos = {
    'bmx',
    'cruiser',
    'fixter',
    'scorcher',
    'tribike',
    'tribike2',
    'tribike3'
}

-- ============================================
-- CONFIGURACIÓN DE LOGS
-- ============================================

Config.UsarLogs = true
Config.WebhookDiscord = '' -- URL del webhook de Discord (opcional)

-- ============================================
-- CONFIGURACIÓN DE COMANDOS
-- ============================================

Config.Comando = 'mecanico' -- Comando principal
Config.ComandoAdmin = 'setpreciomecanico' -- Comando para cambiar precio (solo admins)

-- ============================================
-- TRADUCCIONES
-- ============================================

Config.Traducciones = {
    ['es'] = {
        ['mecanico_camino'] = '🔧 Mecánico en camino...',
        ['reparando'] = '⚙️ El mecánico está reparando tu vehículo...',
        ['tiempo_restante'] = '⏱️ Tiempo restante: %s segundos',
        ['reparado'] = '✅ ¡Vehículo reparado! Se han cobrado %s€',
        ['sin_dinero'] = '❌ No tienes suficiente dinero. Necesitas %s€',
        ['no_vehiculo'] = '❌ Debes estar dentro de un vehículo',
        ['no_conductor'] = '❌ Debes ser el conductor del vehículo',
        ['ya_reparando'] = '⚠️ Ya hay un mecánico trabajando',
        ['vehiculo_prohibido'] = '❌ Este tipo de vehículo no puede ser reparado',
        ['cooldown'] = '⏳ Debes esperar %s segundos antes de volver a usar este servicio',
        ['ya_reparado'] = '✅ Tu vehículo ya está en perfecto estado',
        ['precio_actualizado'] = '✅ Precio del mecánico actualizado a: %s€',
        ['precio_invalido'] = '❌ Precio inválido',
        ['servicio_gratis'] = '🎁 Servicio gratuito por tu trabajo'
    },
    ['en'] = {
        ['mecanico_camino'] = '🔧 Mechanic on the way...',
        ['reparando'] = '⚙️ The mechanic is repairing your vehicle...',
        ['tiempo_restante'] = '⏱️ Time remaining: %s seconds',
        ['reparado'] = '✅ Vehicle repaired! %s€ charged',
        ['sin_dinero'] = '❌ You don\'t have enough money. You need %s€',
        ['no_vehiculo'] = '❌ You must be inside a vehicle',
        ['no_conductor'] = '❌ You must be the driver of the vehicle',
        ['ya_reparando'] = '⚠️ A mechanic is already working',
        ['vehiculo_prohibido'] = '❌ This type of vehicle cannot be repaired',
        ['cooldown'] = '⏳ You must wait %s seconds before using this service again',
        ['ya_reparado'] = '✅ Your vehicle is already in perfect condition',
        ['precio_actualizado'] = '✅ Mechanic price updated to: %s€',
        ['precio_invalido'] = '❌ Invalid price',
        ['servicio_gratis'] = '🎁 Free service for your job'
    },
    ['fr'] = {
        ['mecanico_camino'] = '🔧 Mécanicien en route...',
        ['reparando'] = '⚙️ Le mécanicien répare votre véhicule...',
        ['tiempo_restante'] = '⏱️ Temps restant: %s secondes',
        ['reparado'] = '✅ Véhicule réparé! %s€ facturés',
        ['sin_dinero'] = '❌ Vous n\'avez pas assez d\'argent. Vous avez besoin de %s€',
        ['no_vehiculo'] = '❌ Vous devez être dans un véhicule',
        ['no_conductor'] = '❌ Vous devez être le conducteur du véhicule',
        ['ya_reparando'] = '⚠️ Un mécanicien travaille déjà',
        ['vehiculo_prohibido'] = '❌ Ce type de véhicule ne peut pas être réparé',
        ['cooldown'] = '⏳ Vous devez attendre %s secondes avant d\'utiliser ce service à nouveau',
        ['ya_reparado'] = '✅ Votre véhicule est déjà en parfait état',
        ['precio_actualizado'] = '✅ Prix du mécanicien mis à jour: %s€',
        ['precio_invalido'] = '❌ Prix invalide',
        ['servicio_gratis'] = '🎁 Service gratuit pour votre travail'
    },
    ['de'] = {
        ['mecanico_camino'] = '🔧 Mechaniker unterwegs...',
        ['reparando'] = '⚙️ Der Mechaniker repariert Ihr Fahrzeug...',
        ['tiempo_restante'] = '⏱️ Verbleibende Zeit: %s Sekunden',
        ['reparado'] = '✅ Fahrzeug repariert! %s€ berechnet',
        ['sin_dinero'] = '❌ Sie haben nicht genug Geld. Sie brauchen %s€',
        ['no_vehiculo'] = '❌ Sie müssen in einem Fahrzeug sein',
        ['no_conductor'] = '❌ Sie müssen der Fahrer des Fahrzeugs sein',
        ['ya_reparando'] = '⚠️ Ein Mechaniker arbeitet bereits',
        ['vehiculo_prohibido'] = '❌ Diese Art von Fahrzeug kann nicht repariert werden',
        ['cooldown'] = '⏳ Sie müssen %s Sekunden warten, bevor Sie diesen Service erneut nutzen',
        ['ya_reparado'] = '✅ Ihr Fahrzeug ist bereits in perfektem Zustand',
        ['precio_actualizado'] = '✅ Mechanikerpreis aktualisiert auf: %s€',
        ['precio_invalido'] = '❌ Ungültiger Preis',
        ['servicio_gratis'] = '🎁 Kostenloser Service für Ihre Arbeit'
    },
    ['pt'] = {
        ['mecanico_camino'] = '🔧 Mecânico a caminho...',
        ['reparando'] = '⚙️ O mecânico está reparando seu veículo...',
        ['tiempo_restante'] = '⏱️ Tempo restante: %s segundos',
        ['reparado'] = '✅ Veículo reparado! %s€ cobrados',
        ['sin_dinero'] = '❌ Você não tem dinheiro suficiente. Você precisa de %s€',
        ['no_vehiculo'] = '❌ Você deve estar dentro de um veículo',
        ['no_conductor'] = '❌ Você deve ser o motorista do veículo',
        ['ya_reparando'] = '⚠️ Um mecânico já está trabalhando',
        ['vehiculo_prohibido'] = '❌ Este tipo de veículo não pode ser reparado',
        ['cooldown'] = '⏳ Você deve esperar %s segundos antes de usar este serviço novamente',
        ['ya_reparado'] = '✅ Seu veículo já está em perfeito estado',
        ['precio_actualizado'] = '✅ Preço do mecânico atualizado para: %s€',
        ['precio_invalido'] = '❌ Preço inválido',
        ['servicio_gratis'] = '🎁 Serviço gratuito pelo seu trabalho'
    }
}

-- ============================================
-- FUNCIONES AUXILIARES
-- ============================================

function _T(key, ...)
    local locale = Config.Traducciones[Config.Locale] or Config.Traducciones['es']
    local text = locale[key] or key
    return string.format(text, ...)
end
