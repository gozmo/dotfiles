-- Snippets configuration for Luasnip
local luasnip = require("luasnip")
local keys = require("luasnip.util.keys")
local snippets = require("luasnip.loaders.from_vscode").lazy_load

luasnip.config.setup({
  -- Extensions
  extensions = {
    silent = false,
  },
})

-- Load snippets
snippets()

-- Add keybindings
local function load_keymaps()
  local opts = { noremap = true, silent = true }

  -- Insert mode
  vim.keymap.set("i", "<A-/>", function()
    luasnip.jump(1)
  end, opts)

  vim.keymap.set("i", "<A-\\>", function()
    luasnip.jump(-1)
  end, opts)

  -- Visual mode
  vim.keymap.set("v", "<leader><tab>", function()
    luasnip.lsp_expand(vim.fn.expand("<cword>"))
  end, opts)
end

load_keymaps()

-- Add snippet directory
snippets.add_file_source({
  path = vim.fn.stdpath("data") .. "/snippets",
})
