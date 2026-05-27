# BerbrickDev-Mecanico-Npc
🔧 Sistema de Mecánico NPC IA para FiveM - Compatible con ESX, QBCore y Standalone | NPCs realistas con IA | 5 idiomas | 0.00ms | Anti-exploit | Discord logs | Gratis y Open-source

**Funcionalidades:**
- ✅ Comando simple e intuitivo: `/mecanico`
- ✅ NPCs con IA realista que se comportan naturalmente
- ✅ Animaciones profesionales de mecánico trabajando
- ✅ Apertura y cierre automático del capó del vehículo
- ✅ Reparación completa: motor, carrocería, ventanas, neumáticos
- ✅ Sistema de pago inteligente (efectivo + banco automático)
- ✅ Notificaciones en cada paso del proceso
- ✅ Feedback visual constante para el jugador

### 🌍 Sistema Multiidioma Profesional

No es solo traducir textos, es adaptar la experiencia completa:

| Idioma | Código | Estado | Calidad |
|--------|--------|--------|---------|
| 🇪🇸 Español | `es` | ✅ Completo | Nativo |
| 🇬🇧 Inglés | `en` | ✅ Completo | Profesional |
| 🇫🇷 Francés | `fr` | ✅ Completo | Profesional |
| 🇩🇪 Alemán | `de` | ✅ Completo | Profesional |
| 🇵🇹 Portugués | `pt` | ✅ Completo | Profesional |

**¿Tu idioma no está?** Añádelo en 5 minutos editando el archivo `config.lua`

### ⚙️ Configuración Avanzada

El archivo `config.lua` incluye todas las opciones que necesitas:

```lua
Config = {
    -- BÁSICO
    Locale = 'es',                    -- Idioma del script
    Comando = 'mecanico',             -- Comando personalizable
    
    -- ECONOMÍA
    PrecioReparacion = 500,           -- Precio en tu moneda
    MetodoPago = 'money',             -- money, bank, black_money
    
    -- GAMEPLAY
    TiempoReparacion = 30,            -- Segundos de reparación
    Cooldown = 60,                    -- Segundos entre usos
    PermitirSiReparado = false,       -- ¿Permitir si ya está reparado?
    
    -- TRABAJOS CON SERVICIO GRATIS
    TrabajosGratis = {
        -- 'mechanic',
        -- 'police',
        -- 'ambulance'
    },
    
    -- VEHÍCULOS PROHIBIDOS
    VehiculosProhibidos = {
        'bmx',
        'cruiser',
        'fixter',
        'scorcher',
        'tribike'
    },
    
    -- NOTIFICACIONES
    TipoNotificacion = 'esx',         -- esx, mythic, okokNotify, custom
    
    -- LOGS Y SEGURIDAD
    UsarLogs = true,
    WebhookDiscord = '',              -- URL de tu webhook
}
