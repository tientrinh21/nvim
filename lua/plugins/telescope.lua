local Util = require("lazyvim.util")
local actions = require("telescope.actions")

return {
  -- Fuzzy finder.
  -- The default key bindings to find files will use Telescope's
  -- `find_files` or `git_files` depending on whether the
  -- directory is a git repo.
  {
    "nvim-telescope/telescope-file-browser.nvim",
    event = "VeryLazy",
  },
  {
    "nvim-telescope/telescope.nvim",
    event = "VeryLazy",
    keys = function()
      return {
        -- basic
        { "<leader>f", Util.telescope("files"), desc = "Find Files (root dir)" },
        { "<leader>rg", Util.telescope("live_grep"), desc = "Grep (root dir)" },
        { "<leader>:", "<cmd>Telescope command_history<cr>", desc = "Command History" },
        {
          "<leader>,",
          "<cmd>Telescope buffers initial_mode=normal sort_mru=true sort_lastused=true<cr>",
          desc = "Buffers",
        },
        -- ripgrep
        { "<leader>sg", Util.telescope("live_grep"), desc = "Grep (root dir)" },
        { "<leader>sG", Util.telescope("live_grep", { cwd = false }), desc = "Grep (cwd)" },
        -- file browser
        {
          "<leader>t",
          function()
            local telescope = require("telescope")

            telescope.extensions.file_browser.file_browser({
              respect_gitignore = false,
              hidden = true,
              grouped = true,
              initial_mode = "normal",
              path = "%:p:h",
            })
          end,
          desc = "File browser (root dir)",
        },
        -- utils
        { "<leader>sh", "<cmd>Telescope help_tags<cr>", desc = "Help Pages" },
        { "<leader>sH", "<cmd>Telescope highlights<cr>", desc = "Search Highlight Groups" },
        { "<leader>sk", "<cmd>Telescope keymaps<cr>", desc = "Key Maps" },
        { "<leader>sM", "<cmd>Telescope man_pages<cr>", desc = "Man Pages" },
        { "<leader>sm", "<cmd>Telescope marks<cr>", desc = "Jump to Mark" },
        { "<leader>so", "<cmd>Telescope vim_options<cr>", desc = "Options" },
        { "<leader>sR", "<cmd>Telescope resume<cr>", desc = "Resume" },
        { "<leader>sw", Util.telescope("grep_string", { word_match = "-w" }), desc = "Word (root dir)" },
        { "<leader>sW", Util.telescope("grep_string", { cwd = false, word_match = "-w" }), desc = "Word (cwd)" },
        { "<leader>sw", Util.telescope("grep_string"), mode = "v", desc = "Selection (root dir)" },
        { "<leader>sW", Util.telescope("grep_string", { cwd = false }), mode = "v", desc = "Selection (cwd)" },
        { "<leader>uC", Util.telescope("colorscheme", { enable_preview = true }), desc = "Colorscheme with preview" },
        -- symbols
        {
          "<leader>ss",
          function()
            require("telescope.builtin").lsp_document_symbols({
              symbols = require("lazyvim.config").get_kind_filter(),
            })
          end,
          desc = "Goto Symbol",
        },
        {
          "<leader>sS",
          function()
            require("telescope.builtin").lsp_dynamic_workspace_symbols({
              symbols = require("lazyvim.config").get_kind_filter(),
            })
          end,
          desc = "Goto Symbol (Workspace)",
        },
      }
    end,

    opts = {
      defaults = {
        prompt_prefix = "🔍  ",
        selection_caret = "  ",
        mappings = {
          i = {
            ["<C-j>"] = actions.move_selection_next,
            ["<C-k>"] = actions.move_selection_previous,
            ["<C-l>"] = actions.preview_scrolling_right,
            ["<C-h>"] = actions.preview_scrolling_left,
            ["<Tab>"] = actions.move_selection_next,
            ["<S-Tab>"] = actions.move_selection_previous,
          },
          n = {
            ["<C-c>"] = actions.close,
            ["<C-l>"] = actions.preview_scrolling_right,
            ["<C-h>"] = actions.preview_scrolling_left,
          },
        },
        sorting_strategy = "ascending",
        preview = false,
        layout_config = {
          prompt_position = "top",
          height = 40,
        },
      },
    },
  },
}
