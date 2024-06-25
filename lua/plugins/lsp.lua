return {
  -- lsp config
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        tsserver = {
          keys = {
            { "<leader>co", "<cmd>TypescriptOrganizeImports<CR>", desc = "Organize Imports" },
            { "<leader>cR", "<cmd>TypescriptRenameFile<CR>", desc = "Rename File" },
          },
        },
      },
    },
  },

  -- mason
  {

    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "clangd",
        "html-lsp",
        "css-lsp",
        "json-lsp",
        "svelte-language-server",
        "tailwindcss-language-server",
        "typescript-language-server",
      },
    },
  },
}
