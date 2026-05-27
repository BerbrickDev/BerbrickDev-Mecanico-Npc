# 📝 Changelog

Todos los cambios notables en este proyecto serán documentados en este archivo.

El formato está basado en [Keep a Changelog](https://keepachangelog.com/es-ES/1.0.0/),
y este proyecto adhiere a [Semantic Versioning](https://semver.org/lang/es/).

---

## [2.0.0] - 2026-05-27

### ✨ Añadido

- **Sistema multiidioma completo**
  - Español (es)
  - Inglés (en)
  - Francés (fr)
  - Alemán (de)
  - Portugués (pt)

- **Configuración avanzada**
  - Archivo `config.lua` completamente personalizable
  - Múltiples métodos de pago (efectivo, banco, dinero negro)
  - Sistema de cooldown configurable
  - Lista de trabajos con servicio gratuito
  - Lista de vehículos prohibidos

- **Sistema de notificaciones flexible**
  - Soporte para ESX nativo
  - Soporte para Mythic Notify
  - Soporte para okokNotify
  - Opción para sistema personalizado

- **Sistema de logs avanzado**
  - Logs en consola del servidor
  - Integración con Discord Webhooks
  - Detección de intentos de exploit
  - Registro detallado de cada uso

- **Mejoras de seguridad**
  - Verificación de dinero en servidor
  - Protección anti-exploit mejorada
  - Sistema de cooldown
  - Validación de vehículos
  - Detección de intentos de fraude

- **Optimizaciones**
  - Código completamente reescrito
  - Mejor gestión de recursos
  - Reducción de uso de memoria
  - Eliminación de código redundante

- **Documentación**
  - README.md profesional y detallado
  - LICENSE.md con términos claros
  - CONTRIBUTING.md para colaboradores
  - Plantillas de issues para GitHub
  - Comentarios detallados en el código

- **Funcionalidades adicionales**
  - Verificación de estado del vehículo
  - Opción para no permitir reparación si ya está reparado
  - Reparación completa (motor, carrocería, ventanas, neumáticos)
  - Animaciones mejoradas
  - Mejor IA del mecánico NPC

### 🔧 Cambiado

- Estructura de archivos reorganizada (client/ y server/)
- Sistema de traducciones completamente renovado
- Mejoras en las animaciones del mecánico
- Optimización del spawneo del NPC
- Mejor manejo de errores

### 🐛 Corregido

- Problema con el capó en algunos vehículos
- Error al eliminar el NPC en algunos casos
- Conflictos con otros scripts de reparación
- Problemas de sincronización cliente-servidor
- Bugs menores de animación

### 🗑️ Eliminado

- Código obsoleto y redundante
- Dependencias innecesarias

---

## [1.0.0] - 2026-05-20

### ✨ Añadido

- Lanzamiento inicial del script
- Comando `/mecanico` básico
- Sistema de pago simple (500€)
- Animaciones básicas del mecánico
- Apertura y cierre del capó
- Reparación completa del vehículo
- Sistema anti-exploit básico
- Comando de administrador para cambiar precio

### 📋 Características Iniciales

- NPC mecánico que camina hacia el vehículo
- Tiempo de reparación de 30 segundos
- Verificación de dinero en servidor
- Logs básicos en consola
- Compatibilidad con ESX

---

## [Unreleased]

### 🚀 Planeado para Futuras Versiones

- [ ] Sistema de niveles de reparación (básica, media, completa)
- [ ] Múltiples mecánicos simultáneos
- [ ] Sistema de citas programadas
- [ ] Integración con sistema de garajes
- [ ] Estadísticas de uso por jugador
- [ ] Sistema de descuentos y promociones
- [ ] Mecánicos especializados por tipo de vehículo
- [ ] Efectos de partículas durante la reparación
- [ ] Sonidos personalizados
- [ ] Sistema de reputación del mecánico
- [ ] Modo de emergencia (reparación rápida más cara)
- [ ] Integración con sistema de seguros
- [ ] Panel de administración web
- [ ] API para otros scripts

---

## Tipos de Cambios

- `✨ Añadido` - Para nuevas funcionalidades
- `🔧 Cambiado` - Para cambios en funcionalidades existentes
- `🗑️ Obsoleto` - Para funcionalidades que serán eliminadas
- `🗑️ Eliminado` - Para funcionalidades eliminadas
- `🐛 Corregido` - Para corrección de bugs
- `🔒 Seguridad` - Para vulnerabilidades de seguridad

---

## Versionado

Este proyecto usa [Semantic Versioning](https://semver.org/lang/es/):

- **MAJOR** (X.0.0) - Cambios incompatibles con versiones anteriores
- **MINOR** (0.X.0) - Nuevas funcionalidades compatibles con versiones anteriores
- **PATCH** (0.0.X) - Correcciones de bugs compatibles con versiones anteriores

---

**Nota:** Las fechas están en formato YYYY-MM-DD (ISO 8601)

---

© 2026 BerbrickDev - Todos los derechos reservados
