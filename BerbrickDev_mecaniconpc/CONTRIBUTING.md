# 🤝 Guía de Contribución

¡Gracias por tu interés en contribuir al proyecto **BerbrickDev Mecánico NPC**!

## 📋 Código de Conducta

Este proyecto sigue un código de conducta simple:

- Sé respetuoso con todos los colaboradores
- Acepta críticas constructivas
- Enfócate en lo mejor para la comunidad
- Mantén un ambiente profesional y amigable

## 🚀 Cómo Contribuir

### Reportar Bugs

1. Verifica que el bug no haya sido reportado antes
2. Usa la plantilla de bug report
3. Incluye toda la información solicitada
4. Sé claro y conciso en la descripción

### Sugerir Funcionalidades

1. Verifica que la funcionalidad no exista ya
2. Usa la plantilla de feature request
3. Explica claramente el beneficio
4. Proporciona ejemplos si es posible

### Contribuir con Código

#### 1. Fork y Clone

```bash
# Fork el repositorio en GitHub
# Luego clona tu fork
git clone https://github.com/TU_USUARIO/mecanico-npc.git
cd mecanico-npc
```

#### 2. Crea una Rama

```bash
git checkout -b feature/mi-nueva-funcionalidad
# o
git checkout -b fix/correccion-de-bug
```

#### 3. Realiza tus Cambios

- Sigue el estilo de código existente
- Comenta tu código cuando sea necesario
- Mantén los cambios enfocados y específicos
- Prueba tus cambios exhaustivamente

#### 4. Commit

```bash
git add .
git commit -m "feat: descripción clara del cambio"
```

**Formato de commits:**
- `feat:` Nueva funcionalidad
- `fix:` Corrección de bug
- `docs:` Cambios en documentación
- `style:` Formato, punto y coma, etc.
- `refactor:` Refactorización de código
- `test:` Añadir tests
- `chore:` Mantenimiento

#### 5. Push y Pull Request

```bash
git push origin feature/mi-nueva-funcionalidad
```

Luego crea un Pull Request en GitHub con:
- Título descriptivo
- Descripción detallada de los cambios
- Referencias a issues relacionados
- Capturas de pantalla si aplica

## 📝 Estándares de Código

### Lua

```lua
-- Usa comentarios claros
-- Nombres de variables en camelCase
local miVariable = 'valor'

-- Nombres de funciones descriptivos
function MiFuncionDescriptiva()
    -- Código aquí
end

-- Indentación de 4 espacios
if condicion then
    -- código
end
```

### Configuración

- Mantén `config.lua` organizado y comentado
- Agrupa configuraciones relacionadas
- Usa valores por defecto sensatos
- Documenta cada opción

### Traducciones

Al añadir nuevas traducciones:

```lua
Config.Traducciones = {
    ['es'] = {
        ['nueva_clave'] = 'Texto en español'
    },
    ['en'] = {
        ['nueva_clave'] = 'Text in English'
    },
    -- Añade para todos los idiomas soportados
}
```

## 🧪 Testing

Antes de enviar un PR, asegúrate de:

- [ ] El script inicia sin errores
- [ ] Todas las funcionalidades funcionan correctamente
- [ ] No hay conflictos con la versión actual
- [ ] El código está optimizado
- [ ] Los logs no muestran errores
- [ ] Has probado en un servidor real

## 📚 Documentación

Si añades nuevas funcionalidades:

- Actualiza el README.md
- Añade comentarios en el código
- Documenta nuevas configuraciones
- Actualiza el CHANGELOG

## 🎨 Estilo de Código

### Nombres

```lua
-- Variables: camelCase
local miVariable = true

-- Funciones: PascalCase
function MiFuncion()
end

-- Constantes: UPPER_CASE
local PRECIO_MAXIMO = 1000

-- Configuración: PascalCase
Config.MiOpcion = true
```

### Comentarios

```lua
-- Comentarios de una línea para explicaciones breves

--[[
    Comentarios de múltiples líneas
    para explicaciones más detalladas
    o bloques de código importantes
]]--

-- ============================================
-- SECCIÓN IMPORTANTE
-- ============================================
```

## 🔍 Revisión de Código

Tu PR será revisado considerando:

- Calidad del código
- Funcionalidad
- Optimización
- Compatibilidad
- Documentación
- Estilo de código

## ❓ Preguntas

Si tienes preguntas sobre cómo contribuir:

- Abre un issue con la etiqueta `question`
- Únete a Discord: https://discord.gg/5SCEyzJ8
- Email: berbrickdev@gmail.com

## 🏆 Reconocimiento

Los contribuidores serán reconocidos en:

- README.md (sección de créditos)
- CHANGELOG (en la versión correspondiente)
- Comentarios del código (si aplica)

## 📜 Licencia

Al contribuir, aceptas que tus contribuciones se licenciarán bajo la misma licencia del proyecto.

---

## 🎯 Áreas de Contribución

Áreas donde más se necesita ayuda:

- 🌍 **Traducciones:** Nuevos idiomas o mejoras
- 🐛 **Bug Fixes:** Corrección de errores
- 📚 **Documentación:** Mejoras en README y guías
- ✨ **Funcionalidades:** Nuevas características
- 🎨 **Optimización:** Mejoras de rendimiento
- 🧪 **Testing:** Pruebas y reportes

---

**¡Gracias por contribuir a BerbrickDev Mecánico NPC!** 🚗🔧

*Desarrollado con ❤️ por la comunidad*
