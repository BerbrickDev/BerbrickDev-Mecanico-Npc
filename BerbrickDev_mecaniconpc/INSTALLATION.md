# 📦 Guía de Instalación Detallada

Esta guía te ayudará a instalar **BerbrickDev Mecánico NPC** en tu servidor FiveM paso a paso.

---

## 📋 Requisitos Previos

Antes de comenzar, asegúrate de tener:

### Obligatorios
- ✅ Servidor FiveM actualizado (build 2802 o superior recomendado)
- ✅ ESX Framework instalado (Legacy o 1.2+)
- ✅ Acceso FTP o panel de control del servidor
- ✅ Permisos de administrador en el servidor

### Opcionales
- 📊 oxmysql (para logs avanzados)
- 🔔 Sistema de notificaciones (Mythic, okokNotify, etc.)
- 💬 Discord Webhook (para logs en Discord)

---

## 🚀 Instalación Paso a Paso

### Método 1: Descarga desde GitHub (Recomendado)

#### 1. Descargar el Script

**Opción A: Descarga directa**
```
1. Ve a: https://github.com/BerbrickDev/mecanico-npc
2. Haz clic en "Code" → "Download ZIP"
3. Extrae el archivo ZIP
```

**Opción B: Git Clone**
```bash
cd resources/[esx]
git clone https://github.com/BerbrickDev/mecanico-npc.git BerbrickDev_mecaniconpc
```

#### 2. Subir al Servidor

```
1. Conecta por FTP a tu servidor
2. Navega a: /resources/[esx]/
3. Sube la carpeta "BerbrickDev_mecaniconpc"
4. Verifica que la estructura sea correcta
```

**Estructura correcta:**
```
resources/
└── [esx]/
    └── BerbrickDev_mecaniconpc/
        ├── client/
        │   └── main.lua
        ├── server/
        │   └── main.lua
        ├── .github/
        ├── config.lua
        ├── fxmanifest.lua
        ├── README.md
        ├── LICENSE.md
        └── ...
```

#### 3. Configurar server.cfg

Abre tu archivo `server.cfg` y añade:

```cfg
# BerbrickDev Mecánico NPC
ensure BerbrickDev_mecaniconpc
```

**Ubicación recomendada en server.cfg:**
```cfg
# ESX
ensure es_extended
ensure esx_menu_default
ensure esx_menu_list
ensure esx_menu_dialog

# Scripts adicionales
ensure BerbrickDev_mecaniconpc  # <-- Añadir aquí

# Otros recursos
...
```

#### 4. Configurar el Script (Opcional)

Edita `config.lua` según tus preferencias:

```lua
-- Cambiar idioma
Config.Locale = 'es'  -- 'es', 'en', 'fr', 'de', 'pt'

-- Cambiar precio
Config.PrecioReparacion = 500  -- Cambia a tu precio deseado

-- Cambiar tiempo de reparación
Config.TiempoReparacion = 30  -- Segundos

-- Método de pago
Config.MetodoPago = 'money'  -- 'money', 'bank', 'black_money'
```

#### 5. Reiniciar el Servidor

**Opción A: Reinicio completo**
```
Reinicia tu servidor FiveM completamente
```

**Opción B: Reinicio del recurso (si el servidor ya está corriendo)**
```
1. Conecta al servidor
2. Abre la consola (F8)
3. Escribe: restart BerbrickDev_mecaniconpc
```

#### 6. Verificar Instalación

```
1. Conecta al servidor
2. Abre la consola del servidor
3. Busca el mensaje:
   [BerbrickDev] Sistema de Mecánico NPC
   Versión: 2.0.0
   Estado: Iniciado correctamente
```

---

## ⚙️ Configuración Avanzada

### Configurar Discord Logs

1. Crea un Webhook en tu servidor de Discord:
   ```
   Configuración del Canal → Integraciones → Webhooks → Nuevo Webhook
   ```

2. Copia la URL del Webhook

3. Edita `config.lua`:
   ```lua
   Config.UsarLogs = true
   Config.WebhookDiscord = 'https://discord.com/api/webhooks/TU_WEBHOOK_AQUI'
   ```

### Configurar Trabajos Gratuitos

Edita `config.lua`:

```lua
Config.TrabajosGratis = {
    'mechanic',    -- Mecánicos
    'police',      -- Policía
    'ambulance',   -- Ambulancia
    'admin'        -- Administradores
}
```

### Configurar Vehículos Prohibidos

```lua
Config.VehiculosProhibidos = {
    'bmx',         -- Bicicletas
    'cruiser',
    'fixter',
    'oppressor',   -- Oppressor
    'oppressor2',  -- Oppressor MK2
    'deluxo'       -- Deluxo
}
```

### Configurar Sistema de Notificaciones

```lua
-- Para ESX nativo
Config.TipoNotificacion = 'esx'

-- Para Mythic Notify
Config.TipoNotificacion = 'mythic'

-- Para okokNotify
Config.TipoNotificacion = 'okokNotify'

-- Para sistema personalizado
Config.TipoNotificacion = 'custom'
```

---

## 🔧 Solución de Problemas

### El script no inicia

**Problema:** No aparece el mensaje de inicio en la consola

**Soluciones:**
1. Verifica que el nombre de la carpeta sea exactamente `BerbrickDev_mecaniconpc`
2. Comprueba que `ensure BerbrickDev_mecaniconpc` esté en server.cfg
3. Revisa los logs del servidor para errores
4. Asegúrate de que ESX esté instalado y funcionando

### Error: "attempt to index a nil value (global 'ESX')"

**Problema:** ESX no está cargado correctamente

**Soluciones:**
1. Verifica que ESX esté instalado
2. Asegúrate de que ESX se cargue ANTES del script:
   ```cfg
   ensure es_extended
   ensure BerbrickDev_mecaniconpc
   ```
3. Comprueba la versión de ESX (debe ser Legacy o 1.2+)

### El comando /mecanico no funciona

**Problema:** El comando no responde

**Soluciones:**
1. Verifica que el script esté iniciado (consola del servidor)
2. Comprueba que estés en un vehículo como conductor
3. Asegúrate de tener dinero suficiente
4. Revisa la consola del cliente (F8) para errores

### El mecánico no aparece

**Problema:** El NPC no se genera

**Soluciones:**
1. Verifica que tengas dinero suficiente
2. Comprueba que el vehículo no esté en la lista de prohibidos
3. Asegúrate de que no haya otro mecánico activo
4. Revisa los logs del servidor

### No se cobra el dinero

**Problema:** El servicio es gratis para todos

**Soluciones:**
1. Verifica `Config.MetodoPago` en config.lua
2. Comprueba que el trabajo del jugador no esté en `Config.TrabajosGratis`
3. Revisa los logs del servidor para detectar exploits

---

## 📊 Verificación de Instalación

Usa esta checklist para verificar que todo esté correcto:

- [ ] Carpeta en la ubicación correcta
- [ ] `ensure BerbrickDev_mecaniconpc` en server.cfg
- [ ] Servidor reiniciado
- [ ] Mensaje de inicio en consola del servidor
- [ ] Comando `/mecanico` funciona
- [ ] Se cobra el dinero correctamente
- [ ] El mecánico aparece y repara
- [ ] Logs funcionando (si están activados)
- [ ] Discord webhook funciona (si está configurado)

---

## 🆘 Soporte

Si después de seguir esta guía sigues teniendo problemas:

1. **Revisa los logs:**
   - Consola del servidor
   - Consola del cliente (F8)
   - Logs de FiveM

2. **Busca en GitHub:**
   - [Issues existentes](https://github.com/BerbrickDev/mecanico-npc/issues)
   - [Discussions](https://github.com/BerbrickDev/mecanico-npc/discussions)

3. **Únete a Discord:**
   - [Servidor de Discord](https://discord.gg/5SCEyzJ8)
   - Pregunta en el canal de soporte
   - Comunidad activa que puede ayudarte

4. **Reporta el problema:**
   - [Crear nuevo issue](https://github.com/BerbrickDev/mecanico-npc/issues/new)
   - Usa la plantilla de bug report
   - Incluye toda la información solicitada

5. **Contacto directo:**
   - Email: berbrickdev@gmail.com

---

## 🎓 Tutoriales en Video

> Próximamente: Enlaces a tutoriales en video

---

## ✅ Instalación Completada

Si has llegado hasta aquí y todo funciona correctamente:

🎉 **¡Felicidades! Has instalado exitosamente BerbrickDev Mecánico NPC**

Ahora tus jugadores pueden usar `/mecanico` para reparar sus vehículos.

---

**Última actualización:** 27 de Mayo de 2026  
**Versión:** 2.0.0  
**Autor:** BerbrickDev

© 2026 BerbrickDev - Todos los derechos reservados
