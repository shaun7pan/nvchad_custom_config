local M = {}

-- more keybinds!
M.shaun = {
  i = {
    ["jk"] = { "<ESC>", "escape insert mode", opts = { nowait = true } },
    ["<C-s>"] = { "<ESC>:w<CR>", "save in insert mode", opts = { nowait = true } },
  },
  n = {
    ["<C-q>"] = { '<cmd>lua require("custom.functions").smart_quit()<CR>', "smart quit", opts = { nowait = true } },
    ["Y"] = { '"+y$', "yank to clipboardvim", opts = { nowait = true } },
    ["<Left>"] = { "<cmd>vertical resize-5<CR>", "adjust vsplit", opts = { nowait = true } },
    ["<Right>"] = { "<cmd>vertical resize+5<CR>", "adjust vsplit", opts = { nowait = true } },
    ["<leader>sh"] = { "<cmd>set nosplitright <CR> <cmd>vsplit<CR>", "split left", opts = { nowait = true } },
    ["<leader>sl"] = { "<cmd>set splitright <CR> <cmd>vsplit<CR>", "split right", opts = { nowait = true } },
    ["<leader>sj"] = { "<cmd>set splitbelow <CR> <cmd>split<CR>", "split below", opts = { nowait = true } },
    ["<leader>sk"] = { "<cmd>set nosplitbelow <CR> <cmd>split<CR>", "split up", opts = { nowait = true } },

    ["<leader>ww"] = { "<cmd>e /Users/a560827/.shaunTILlkjlkj<CR>", "edit my file", opts = { nowait = true } },

    ["j"] = { "<Plug>(accelerated_jk_gj)", "accelerated_jk_j", opts = { nowait = true } },
    ["k"] = { "<Plug>(accelerated_jk_gk)", "accelerated_jk_k", opts = { nowait = true } },
    ["<leader>ad"] = {
      '<cmd>lua require("harpoon.mark").add_file()<CR>',
      "harpoon add file",
      opts = { nowait = true },
    },
    ["<C-e>"] = {
      '<cmd>lua require("harpoon.ui").toggle_quick_menu()<CR>',
      "toggle harpoon",
      opts = { nowait = true },
    },
    ["<leader>1"] = {
      '<cmd>lua require("harpoon.ui").nav_file(1)<CR>',
      "harpoon select file",
      opts = { nowait = true },
    },
    ["<leader>2"] = {
      '<cmd>lua require("harpoon.ui").nav_file(2)<CR>',
      "harpoon select file",
      opts = { nowait = true },
    },
    ["<leader>3"] = {
      '<cmd>lua require("harpoon.ui").nav_file(3)<CR>',
      "harpoon select file",
      opts = { nowait = true },
    },
    ["<leader>4"] = {
      '<cmd>lua require("harpoon.ui").nav_file(4)<CR>',
      "harpoon select file",
      opts = { nowait = true },
    },
    ["<leader>5"] = {
      '<cmd>lua require("harpoon.ui").nav_file(5)<CR>',
      "harpoon select file",
      opts = { nowait = true },
    },
    ["<leader>6"] = {
      '<cmd>lua require("harpoon.ui").nav_file(6)<CR>',
      "harpoon select file",
      opts = { nowait = true },
    },
    ["<leader>7"] = {
      '<cmd>lua require("harpoon.ui").nav_file(7)<CR>',
      "harpoon select file",
      opts = { nowait = true },
    },
    ["<leader>8"] = {
      '<cmd>lua require("harpoon.ui").nav_file(8)<CR>',
      "harpoon select file",
      opts = { nowait = true },
    },
    ["<leader>9"] = {
      '<cmd>lua require("harpoon.ui").nav_file(9)<CR>',
      "harpoon select file",
      opts = { nowait = true },
    },
    ["<C-c>"] = { "<Esc>", "unmap tab", opts = { nowait = true } },
    -- ["s"] = { "<cmd>HopChar2<CR>", "hop word", opts = { nowait = true } },
  },
  v = {
    ["Y"] = { '"+y', "yank to clipboardvim", opts = { nowait = true } },
    ["<leader>p"] = { '"_dP', "greatest remap ever", opts = { nowait = true } },
  },
}

return M
