
return {
  "stevearc/conform.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local conform = require("conform")

    conform.setup({
      formatters_by_ft = {
        lua = { "stylua" },
        svelte = { "prettierd", "prettier" },  -- Corrección aquí: no es necesario usar {} en este caso
        astro = { "prettierd", "prettier" },
        javascript = { "prettierd", "prettier" },  -- Corrección aquí
        typescript = { "prettierd", "prettier" },  -- Corrección aquí
        javascriptreact = { "prettierd", "prettier" },
        typescriptreact = { "prettierd", "prettier" },
        json = { "prettierd", "prettier" },
        graphql = { "prettierd", "prettier" },
        java = { "google-java-format" },
        kotlin = { "ktlint" },
        ruby = { "standardrb" },
        markdown = { "prettierd", "prettier" },
        erb = { "htmlbeautifier" },
        html = { "htmlbeautifier" },
        bash = { "beautysh" },
        proto = { "buf" },
        rust = { "rustfmt" },
        yaml = { "yamlfix" },
        toml = { "taplo" },
        css = { "prettierd", "prettier" },
        scss = { "prettierd", "prettier" },
        sh = { "shellcheck" },
        go = { "gofmt" },
        xml = { "xmllint" },
      },

      -- Habilitar el formateo de archivos al guardar
      format_on_save = true,
      timeout_ms = 500,  -- Ajuste de tiempo de espera
    })

    -- Mapea la tecla <leader>l para formatear el archivo
    vim.keymap.set({ "n", "v" }, "<leader>l", function()
      conform.format({
        lsp_fallback = true,
        async = false,
        timeout_ms = 1000,
      })
    end, { desc = "Format file or range (in visual mode)" })
  end,
}

