require "nvchad.options"

-- add yours here!

-- relative numbers
local o = vim.o
o.relativenumber = true

-- Reducir la altura del área de comandos
o.cmdheight = 0  -- o 0 si quieres que se oculte por completo cuando no se está usando

-- También puedes reducir el tamaño del 'statusline' si es necesario
o.laststatus = 3  -- 'laststatus=3' muestra la barra de estado solo cuando sea necesario
-- o.cursorlineopt ='both' -- to enable cursorline!
