
-- Plugin: nvim-notify
-- URL: https://github.com/rcarriga/nvim-notify
-- Description: A fancy notification manager
return {
  "rcarriga/nvim-notify",
  opts = {
    timeout = 4000,
  },
  config = function(_, opts)
    local notify = require("notify")
    notify.setup(opts)

    -- Usar nvim-notify como el gestor predeterminado de notificaciones
    vim.notify = notify

    -- Autocomando para mostrar notificación al guardar un archivo
    vim.api.nvim_create_autocmd("BufWritePost", {
      callback = function()
        local file_path = vim.fn.expand("%:p") -- Obtén la ruta completa del archivo
        notify("Archivo guardado: " .. file_path, "info", {
          title = "Neovim",
          timeout = opts.timeout, -- Usa el timeout configurado
        })
      end,
    })
  end,
}

