local U = require "rms.utils"
local g = vim.g


U.map("n", "<leader>ff", ":Telescope find_files<CR>", { silent = true })
U.map("n", "<leader>fh", ":Telescope git_files<CR>", { silent = true })
U.map("n", "<leader>fl", ":Telescope lsp_document_symbols<CR>", { silent = true })
U.map("n", "<leader>fs", ":Telescope current_buffer_fuzzy_find sorting_strategy=ascending layout_config.prompt_position=top<CR>", { silent = true })
-- i'm dumb chck my conf
U.map("n", "<leader>con", ":Telescope find_files cwd=~/.config sorting_strategy=ascending layout_config.prompt_position=top<CR>", { silent = true })


require('telescope').setup{
    defaults = {
      -- Default configuration for telescope goes here:
      -- config_key = value,
      mappings = {
        i = {
          -- map actions.which_key to <C-h> (default: <C-/>)
          -- actions.which_key shows the mappings for your picker,
          -- e.g. git_{create, delete, ...}_branch for the git_branches picker
          ["<C-h>"] = "which_key"
        }
      }
    },
    pickers = {
      -- Default configuration for builtin pickers goes here:
      -- picker_name = {
      --   picker_config_key = value,
      --   ...
      -- }
      -- Now the picker_config_key will be applied every time you call this
      -- builtin picker
    },
    extensions = {
      -- Your extension configuration goes here:
      -- extension_name = {
      --   extension_config_key = value,
      -- }
      -- please take a look at the readme of the extension you want to configure
        fzf = {
            fuzzy = true,                    -- false will only do exact matching
            override_generic_sorter = true,  -- override the generic sorter
            override_file_sorter = true,     -- override the file sorter
            case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
                                            -- the default case_mode is "smart_case"
        }
    }
  }


-- load_extension, somewhere after setup function:
require('telescope').load_extension('fzf')