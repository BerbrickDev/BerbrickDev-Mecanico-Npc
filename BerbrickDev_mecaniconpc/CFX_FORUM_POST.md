# [ESX] 🔧 Sistema de Mecánico Móvil NPC - GRATIS | Multiidioma | Optimizado

---

## 📢 SCRIPT COMPLETAMENTE GRATUITO

**Autor:** BerbrickDev  
**Versión:** 2.0.0  
**Licencia:** Gratis para uso personal y comercial

---

## 🎬 Video Demostración

[Próximamente]

---

## 📸 Capturas de Pantalla

[Imagen 1: Mecánico llegando al vehículo]
[Imagen 2: Mecánico reparando con capó abierto]
[Imagen 3: Notificación de reparación completada]
[Imagen 4: Configuración del script]

---

## 📋 Descripción

Sistema profesional de mecánico móvil NPC para servidores ESX. Permite a los jugadores llamar a un mecánico que repara su vehículo de forma realista con animaciones, efectos y múltiples opciones de personalización.

**¿Por qué este script?**
- ✅ Completamente GRATIS
- ✅ Código limpio y optimizado
- ✅ Fácil de instalar y configurar
- ✅ Soporte multiidioma
- ✅ Actualizaciones regulares
- ✅ Documentación completa

---

## ✨ Características

### 🎮 Funcionalidad
- Comando `/mecanico` simple y efectivo
- NPC mecánico con IA que camina hacia tu vehículo
- Animaciones realistas de reparación
- Apertura y cierre automático del capó
- Reparación completa (motor, carrocería, ventanas, neumáticos)
- Sistema de pago flexible (efectivo, banco, dinero negro)
- Cooldown configurable entre usos

### 🌍 Idiomas Soportados
- 🇪🇸 Español
- 🇬🇧 Inglés
- 🇫🇷 Francés
- 🇩🇪 Alemán
- 🇵🇹 Portugués

### ⚙️ Configuración
- Precio personalizable
- Tiempo de reparación ajustable
- Trabajos con servicio gratuito
- Lista de vehículos prohibidos
- Múltiples sistemas de notificaciones (ESX, Mythic, okokNotify)
- Discord Webhooks para logs

### 🛡️ Seguridad
- Verificación de dinero en servidor
- Protección anti-exploit
- Sistema de cooldown
- Validación de permisos
- Logs detallados

### ⚡ Rendimiento
- **0.00ms** en idle
- **0.01ms** en uso
- **~2MB** de memoria
- Sin lag ni stuttering
- Código optimizado

---

## 🔧 Requisitos

- FiveM Server actualizado (build 2802+)
- ESX Legacy (recomendado) o ESX 1.2+
- (Opcional) oxmysql para logs avanzados

---

## 📥 Descarga e Instalación

### Descarga

**GitHub:** https://github.com/BerbrickDev/mecanico-npc

```bash
git clone https://github.com/BerbrickDev/mecanico-npc.git BerbrickDev_mecaniconpc
```

### Instalación

1. Descarga el script desde GitHub
2. Coloca la carpeta en `resources/[esx]/BerbrickDev_mecaniconpc/`
3. Añade a tu `server.cfg`:
   ```cfg
   ensure BerbrickDev_mecaniconpc
   ```
4. (Opcional) Configura `config.lua` a tu gusto
5. Reinicia el servidor

**Documentación completa:** Incluida en el script

---

## ⚙️ Configuración

El script incluye un archivo `config.lua` completamente personalizable:

```lua
-- Configuración básica
Config.Locale = 'es'                    -- Idioma
Config.PrecioReparacion = 500           -- Precio
Config.TiempoReparacion = 30            -- Tiempo en segundos
Config.MetodoPago = 'money'             -- money, bank, black_money
Config.Cooldown = 60                    -- Cooldown en segundos

-- Trabajos con servicio gratis
Config.TrabajosGratis = {
    'mechanic',
    'police',
    'ambulance'
}

-- Vehículos prohibidos
Config.VehiculosProhibidos = {
    'bmx',
    'cruiser',
    'fixter'
}

-- Discord Logs
Config.UsarLogs = true
Config.WebhookDiscord = 'TU_WEBHOOK_AQUI'
```

---

## 🎮 Uso

### Para Jugadores

1. Entra en tu vehículo como conductor
2. Escribe `/mecanico` en el chat
3. Asegúrate de tener dinero suficiente (por defecto 500€)
4. Espera 30 segundos mientras el mecánico repara
5. ¡Listo! Tu vehículo estará como nuevo

### Para Administradores

```
/setpreciomecanico [cantidad] - Cambia el precio de la reparación
```

---

## 📝 Funcionamiento

1. **Verificación:** El sistema verifica que tengas dinero y estés en un vehículo válido
2. **Spawneo:** Aparece un NPC mecánico cerca de tu vehículo
3. **Llegada:** El mecánico camina hacia el capó de tu vehículo
4. **Reparación:** Abre el capó y realiza animaciones de reparación durante 30 segundos
5. **Finalización:** Repara completamente el vehículo, cobra el dinero y se retira

---

## 🔍 Características Técnicas

### Estructura de Archivos
```
BerbrickDev_mecaniconpc/
├── client/
│   └── main.lua          (Lógica del cliente)
├── server/
│   └── main.lua          (Lógica del servidor)
├── config.lua            (Configuración)
├── fxmanifest.lua        (Manifest)
├── README.md             (Documentación)
├── INSTALLATION.md       (Guía de instalación)
├── LICENSE.md            (Licencia)
└── CHANGELOG.md          (Historial de cambios)
```

### Optimización
- Uso eficiente de threads
- Limpieza automática de entidades
- Sin bucles innecesarios
- Código modular y limpio

### Seguridad
- Todas las verificaciones en servidor
- Protección contra exploits
- Sistema de logs detallado
- Validación de datos

---

## 🐛 Solución de Problemas

### El comando no funciona
- Verifica que el script esté iniciado
- Comprueba que estés en un vehículo como conductor
- Asegúrate de tener dinero suficiente

### El mecánico no aparece
- Revisa los logs del servidor
- Verifica que el vehículo no esté prohibido
- Comprueba que no haya cooldown activo

**Más ayuda:** Consulta INSTALLATION.md incluido en el script

---

## 📊 Compatibilidad

### Frameworks
- ✅ ESX Legacy
- ✅ ESX 1.2+
- ✅ ESX 1.1

### Notificaciones
- ✅ ESX Default
- ✅ Mythic Notify
- ✅ okokNotify
- ✅ Sistema personalizado

---

## 🔄 Actualizaciones

**v2.0.0** (27/05/2026)
- Reescritura completa del código
- Sistema multiidioma
- Configuración avanzada
- Mejoras de seguridad y rendimiento
- Documentación completa

**Historial completo:** Ver CHANGELOG.md

---

## 📜 Licencia

**© 2026 BerbrickDev - Todos los derechos reservados**

Este script es **GRATIS** para uso personal y comercial.

### ✅ Permitido:
- Usar en tu servidor FiveM
- Modificar para uso personal
- Compartir el enlace oficial

### ❌ NO Permitido:
- Revender o redistribuir
- Eliminar créditos del autor
- Usar en proyectos comerciales sin autorización

---

## 🤝 Contribuciones

¡Las contribuciones son bienvenidas!

- **GitHub:** https://github.com/BerbrickDev/mecanico-npc
- **Issues:** Reporta bugs o sugiere mejoras
- **Pull Requests:** Contribuye con código

---

## 💬 Soporte

### Documentación
- README.md completo incluido
- Guía de instalación detallada
- Archivo de configuración comentado

### Contacto
- **GitHub Issues:** https://github.com/BerbrickDev/mecanico-npc/issues
- **Discord:** https://discord.gg/5SCEyzJ8 (¡Únete a la comunidad!)
- **Email:** berbrickdev@gmail.com

---

## 🌟 Otros Proyectos

Próximamente más scripts gratuitos de BerbrickDev:
- Sistema de garajes
- Sistema de concesionario
- Sistema de multas
- Y más...

**Sígueme en GitHub para estar al día:** https://github.com/BerbrickDev

---

## ❤️ Agradecimientos

Gracias a la comunidad de FiveM por el apoyo y feedback.

Si te gusta este script:
- ⭐ Dale una estrella en GitHub
- 💬 Deja un comentario
- 📢 Compártelo con otros
- 🤝 Contribuye al proyecto

---

## 📞 Enlaces

- **GitHub:** https://github.com/BerbrickDev/mecanico-npc
- **Descargas:** https://github.com/BerbrickDev/mecanico-npc/releases
- **Issues:** https://github.com/BerbrickDev/mecanico-npc/issues
- **Wiki:** https://github.com/BerbrickDev/mecanico-npc/wiki

---

<div align="center">

**Desarrollado con ❤️ por BerbrickDev para la comunidad de FiveM**

[![GitHub](https://img.shields.io/badge/GitHub-BerbrickDev-black?style=for-the-badge&logo=github)](https://github.com/BerbrickDev)
[![Version](https://img.shields.io/badge/version-2.0.0-blue?style=for-the-badge)](https://github.com/BerbrickDev/mecanico-npc)
[![License](https://img.shields.io/badge/license-Free-green?style=for-the-badge)](LICENSE.md)

</div>
