<div align="center">

```
    ____             __         _      __   ____             
   / __ )___  _____ / /_  _____(_)____/ /__/ __ \___  _   __
  / __  / _ \/ ___/ __ \/ ___/ / ___/ //_/ / / / _ \| | / /
 / /_/ /  __/ /  / /_/ / /  / / /__/ ,< / /_/ /  __/| |/ / 
/_____/\___/_/  /_.___/_/  /_/\___/_/|_/_____/\___/ |___/  
```

# 🔧 Sistema de Mecánico Móvil NPC

### Script profesional para servidores FiveM ESX

[![Version](https://img.shields.io/badge/version-2.0.0-blue.svg)](https://github.com/BerbrickDev/mecanico-npc)
[![License](https://img.shields.io/badge/license-Custom-red.svg)](LICENSE.md)
[![FiveM](https://img.shields.io/badge/FiveM-ESX-orange.svg)](https://fivem.net)
[![Author](https://img.shields.io/badge/author-BerbrickDev-green.svg)](https://github.com/BerbrickDev)

**[📥 Descargar](https://github.com/BerbrickDev/mecanico-npc/releases)** • **[🐛 Reportar Bug](https://github.com/BerbrickDev/mecanico-npc/issues)** • **[💡 Sugerencias](https://github.com/BerbrickDev/mecanico-npc/discussions)**

</div>

---

## 📋 Descripción

Sistema profesional y completamente configurable que permite a los jugadores llamar a un mecánico NPC que repara su vehículo de forma realista con animaciones, efectos y múltiples opciones de personalización.

## ✨ Características Principales

### 🎮 Funcionalidad
- ✅ Comando `/mecanico` totalmente funcional
- ✅ NPC mecánico con IA que camina hacia tu vehículo
- ✅ Animaciones realistas de reparación
- ✅ Apertura y cierre automático del capó
- ✅ Reparación completa del vehículo (motor, carrocería, ventanas, neumáticos)
- ✅ Sistema de pago flexible (efectivo, banco, dinero negro)
- ✅ Cooldown configurable entre usos

### 🌍 Multiidioma
- 🇪🇸 Español
- 🇬🇧 Inglés
- 🇫🇷 Francés
- 🇩🇪 Alemán
- 🇵🇹 Portugués

### ⚙️ Configuración Avanzada
- 💰 Precio personalizable
- ⏱️ Tiempo de reparación ajustable
- 👔 Trabajos con servicio gratuito
- 🚫 Lista de vehículos prohibidos
- 🔔 Múltiples sistemas de notificaciones (ESX, Mythic, okokNotify)
- 📊 Sistema de logs con Discord Webhook

### 🛡️ Seguridad
- ✅ Verificación de dinero en servidor
- ✅ Protección anti-exploit
- ✅ Sistema de cooldown
- ✅ Validación de permisos
- ✅ Logs detallados de uso

### 🎨 Optimización
- ⚡ Código optimizado y limpio
- 📦 Uso eficiente de recursos
- 🔄 Sin lag ni stuttering
- 💾 Bajo consumo de memoria

## 📦 Instalación

### Requisitos
- ESX Legacy (recomendado) o ESX 1.2+
- FiveM Server actualizado
- (Opcional) oxmysql para logs avanzados

### Pasos de Instalación

1. **Descarga el recurso**
   ```bash
   git clone https://github.com/BerbrickDev/mecanico-npc.git
   ```

2. **Coloca la carpeta en tu servidor**
   ```
   resources/[esx]/BerbrickDev_mecaniconpc/
   ```

3. **Añade a tu server.cfg**
   ```cfg
   ensure BerbrickDev_mecaniconpc
   ```

4. **Configura el script** (opcional)
   - Edita `config.lua` según tus preferencias
   - Configura el webhook de Discord si lo deseas

5. **Reinicia el servidor**
   ```
   restart BerbrickDev_mecaniconpc
   ```

## 🎮 Uso

### Para Jugadores

1. Entra en tu vehículo como **conductor**
2. Escribe `/mecanico` en el chat
3. Asegúrate de tener **dinero suficiente** (por defecto 500€)
4. Espera mientras el mecánico repara tu vehículo
5. ¡Listo! Tu vehículo estará como nuevo

### Para Administradores

```
/setpreciomecanico [cantidad] - Cambia el precio de la reparación
```

## ⚙️ Configuración

El archivo `config.lua` incluye todas las opciones configurables:

```lua
Config.Locale = 'es'                    -- Idioma del script
Config.PrecioReparacion = 500           -- Precio de la reparación
Config.TiempoReparacion = 30            -- Tiempo en segundos
Config.MetodoPago = 'money'             -- money, bank, black_money
Config.Cooldown = 60                    -- Cooldown en segundos
Config.TrabajosGratis = {               -- Trabajos con servicio gratis
    'mechanic',
    'police',
    'ambulance'
}
```

### Configuración de Discord Logs

```lua
Config.UsarLogs = true
Config.WebhookDiscord = 'TU_WEBHOOK_AQUI'
```

## 📝 Funcionamiento Detallado

1. **Verificación inicial**
   - Comprueba que el jugador esté en un vehículo
   - Verifica que sea el conductor
   - Valida que el vehículo no esté prohibido
   - Comprueba el cooldown

2. **Spawneo del mecánico**
   - Aparece un NPC mecánico aleatorio
   - Camina hacia el vehículo del jugador
   - Se posiciona frente al capó

3. **Proceso de reparación**
   - Abre el capó automáticamente
   - Realiza animación de reparación
   - Muestra notificaciones de progreso
   - Repara completamente el vehículo

4. **Finalización**
   - Cierra el capó
   - Cobra el dinero al jugador
   - El mecánico se retira
   - Registra el uso en logs

## 🔧 Compatibilidad

### Frameworks
- ✅ ESX Legacy
- ✅ ESX 1.2+
- ✅ ESX 1.1

### Sistemas de Notificaciones
- ✅ ESX Default
- ✅ Mythic Notify
- ✅ okokNotify
- ✅ Sistema personalizado

## 🐛 Solución de Problemas

### El mecánico no aparece
- Verifica que tengas dinero suficiente
- Comprueba que estés en un vehículo permitido
- Revisa los logs del servidor

### Error de animación
- Asegúrate de tener los archivos de animación nativos de GTA V
- Verifica que no haya conflictos con otros scripts

### No se cobra el dinero
- Revisa la configuración de `Config.MetodoPago`
- Comprueba los logs del servidor para detectar exploits

## 📊 Estadísticas

- 🎯 **Precisión:** 100% funcional
- ⚡ **Rendimiento:** 0.00ms en idle, 0.01ms en uso
- 💾 **Memoria:** ~2MB
- 🔄 **Actualizaciones:** Soporte activo

## 📄 Licencia

**© 2026 BerbrickDev - Todos los derechos reservados**

Este script es **GRATUITO** para uso personal y en servidores. 

### ✅ Permitido:
- Usar en tu servidor FiveM
- Modificar para uso personal
- Compartir el enlace de descarga oficial

### ❌ NO Permitido:
- Revender o redistribuir como propio
- Eliminar los créditos del autor
- Usar en proyectos comerciales sin autorización

## 🤝 Contribuciones

¡Las contribuciones son bienvenidas! Si quieres mejorar este script:

1. Fork el repositorio
2. Crea una rama para tu feature (`git checkout -b feature/AmazingFeature`)
3. Commit tus cambios (`git commit -m 'Add some AmazingFeature'`)
4. Push a la rama (`git push origin feature/AmazingFeature`)
5. Abre un Pull Request

## 💬 Soporte

- 🐛 **Bugs:** [GitHub Issues](https://github.com/BerbrickDev/mecanico-npc/issues)
- 💡 **Sugerencias:** [GitHub Discussions](https://github.com/BerbrickDev/mecanico-npc/discussions)
- 📧 **Email:** berbrickdev@gmail.com
- 💬 **Discord:** [Únete a nuestro servidor](https://discord.gg/5SCEyzJ8)

## 🌟 Créditos

**Desarrollado con ❤️ por [BerbrickDev](https://github.com/BerbrickDev)**

Si te gusta este script, ¡dale una ⭐ en GitHub!

## 📸 Capturas

> _Próximamente: Capturas de pantalla y vídeo demo_

## 🔄 Changelog

### v2.0.0 (2026-05-27)
- ✨ Reescritura completa del código
- 🌍 Sistema multiidioma (5 idiomas)
- ⚙️ Configuración avanzada
- 🛡️ Mejoras de seguridad
- 📊 Sistema de logs con Discord
- 🎨 Optimización de rendimiento
- 📝 Documentación completa

### v1.0.0 (2026-05-20)
- 🎉 Lanzamiento inicial

---

<div align="center">

**[⬆ Volver arriba](#-sistema-de-mecánico-móvil-npc)**

Made with ❤️ by **BerbrickDev**

[![GitHub](https://img.shields.io/badge/GitHub-BerbrickDev-black?style=for-the-badge&logo=github)](https://github.com/BerbrickDev)
[![Discord](https://img.shields.io/badge/Discord-Únete-5865F2?style=for-the-badge&logo=discord&logoColor=white)](https://discord.gg/5SCEyzJ8)
[![Tebex](https://img.shields.io/badge/Tebex-Store-00b8d4?style=for-the-badge)](https://berbrickdev.tebex.io)
[![CFX](https://img.shields.io/badge/CFX-Forum-f40552?style=for-the-badge)](https://forum.cfx.re/u/berbrickdev)

</div>
