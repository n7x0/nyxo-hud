fx_version 'cerulean'
game 'gta5'


ui_page 'ui/ui.html'

files {
    'ui/***/***',
    'stream/***/***'
}

client_script 'client/main.lua'
server_script 'server/main.lua'

shared_scripts {
    '@ox_lib/init.lua',
    'config.lua',
}

lua54 'yes'

local postalFile = 'new-postals.json'

file(postalFile)
postal_file(postalFile)