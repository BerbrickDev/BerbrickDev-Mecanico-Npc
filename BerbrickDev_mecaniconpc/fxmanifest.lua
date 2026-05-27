--[[
    ____             __         _      __   ____             
   / __ )___  _____ / /_  _____(_)____/ /__/ __ \___  _   __
  / __  / _ \/ ___/ __ \/ ___/ / ___/ //_/ / / / _ \| | / /
 / /_/ /  __/ /  / /_/ / /  / / /__/ ,< / /_/ /  __/| |/ / 
/_____/\___/_/  /_.___/_/  /_/\___/_/|_/_____/\___/ |___/  
                                                            
    Sistema de Mecánico Móvil NPC
    Autor: BerbrickDev
    Versión: 2.0.0
    © 2026 BerbrickDev - Todos los derechos reservados
    
    GitHub: https://github.com/BerbrickDev
    Tebex: https://berbrickdev.tebex.io
    CFX: https://forum.cfx.re/u/berbrickdev
]]--

fx_version 'cerulean'
game 'gta5'
lua54 'yes'

author 'BerbrickDev'
description 'Sistema profesional de mecánico móvil NPC con animaciones realistas'
version '2.0.0'

repository 'https://github.com/BerbrickDev/mecanico-npc'

shared_scripts {
    '@es_extended/imports.lua',
    'config.lua'
}

client_scripts {
    'client/*.lua'
}

server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'server/*.lua'
}

dependencies {
    'es_extended'
}

escrow_ignore {
    'config.lua',
    'README.md',
    'LICENSE.md'
}
