
local options = {
  -- formatters to use
  formatters_by_ft = {
    lua = { "stylua" },
    css = { "prettier, prettierd" },
    html = { "prettier, prettierd" },
    jsx = { "prettier, prettierd" },             -- Añadido JSX
    tsx = { "prettier, prettierd" },             -- Añadido TSX
    js = { "prettier, prettierd" },              -- Añadido JS
    ts = { "prettier, prettierd" },              -- Añadido TS
    py = { "isort", "black" },
    python = { "isort", "black" },
  },

  -- Habilitar formato automático al guardar
  format_on_save = {
    timeout_ms = 500,
    lsp_fallback = true,  -- Utiliza LSP si está disponible para formateo
  },
}

return options

