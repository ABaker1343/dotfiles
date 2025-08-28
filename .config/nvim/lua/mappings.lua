local telescopeFuncs = require("telescope.builtin")
local harpoonUI = require('harpoon.ui');
local harpoonMark = require('harpoon.mark');
local snipe = require('snipe')
local flash = require('flash')
local tree = require('nvim-tree')

vim.g.mapleader=' '

if vim.g.neovide then
    -- NEOVIDE_CURRENT_FONT_SIZE defined in settings.lua
    function zoom(delta)
        NEOVIDE_CURRENT_FONT_SIZE = NEOVIDE_CURRENT_FONT_SIZE + delta;
        if NEOVIDE_FONT_BOLD then
            vim.o.guifont = NEOVIDE_FONT .. ":h" .. tostring(NEOVIDE_CURRENT_FONT_SIZE) .. ":b"
        else
            vim.o.guifont = NEOVIDE_FONT .. ":h" .. tostring(NEOVIDE_CURRENT_FONT_SIZE)
        end
    end

        vim.keymap.set('n', "<C-=>", function() zoom(2) end, {noremap = {true}})
        vim.keymap.set('n', "<C-->", function() zoom(-2) end, {noremap = {true}})
    end


-- raw commands
vim.keymap.set('n', "<leader>f", telescopeFuncs.find_files, {noremap = {true}})
vim.keymap.set('n', "<leader>/", telescopeFuncs.live_grep, {noremap = {true}})

-- window keys
vim.keymap.set('n', "<leader>ws", "<cmd>split<CR>", {noremap = {true}})
vim.keymap.set('n', "<leader>wv", "<cmd>vsplit<CR>", {noremap = {true}})
vim.keymap.set('n', "<leader>wt", ":NvimTreeToggle<CR>", {noremap = {true}})
vim.keymap.set('n', "<leader>wc", "<C-w>c", {noremap = {true}})
vim.keymap.set('n', "<leader>wh", "<C-w>h", {noremap = {true}})
vim.keymap.set('n', "<leader>wl", "<C-w>l", {noremap = {true}})
vim.keymap.set('n', "<leader>wj", "<C-w>j", {noremap = {true}})
vim.keymap.set('n', "<leader>wk", "<C-w>k", {noremap = {true}})
vim.keymap.set('n', "<leader>wH", "<C-w>H", {noremap = {true}})
vim.keymap.set('n', "<leader>wL", "<C-w>L", {noremap = {true}})
vim.keymap.set('n', "<leader>wJ", "<C-w>J", {noremap = {true}})
vim.keymap.set('n', "<leader>wK", "<C-w>K", {noremap = {true}})
vim.keymap.set('n', "<leader>w<Left>", "<C-w>20<", {noremap = {true}})
vim.keymap.set('n', "<leader>w<Right>", "<C-w>20>", {noremap = {true}})
vim.keymap.set('n', "<leader>w<Up>", "<C-w>10+", {noremap = {true}})
vim.keymap.set('n', "<leader>w<Down>", "<C-w>10-", {noremap = {true}})

-- browse
vim.keymap.set('n', "<leader>bb", telescopeFuncs.buffers, {noremap = {true}})
vim.keymap.set('n', "<leader>bf", "<cmd>Telescope file_browser<CR>", {noremap = {true}})

-- tabs
vim.keymap.set('n', "<leader>tn", "<cmd>tabnew<CR>", {noremap = {true}})
vim.keymap.set('n', "<leader>tl", "<cmd>tabn<CR>", {noremap = {true}})
vim.keymap.set('n', "<leader>th", "<cmd>tabp<CR>", {noremap = {true}})

-- code
vim.keymap.set('n', "<leader>cd", telescopeFuncs.diagnostics, {noremap = {true}})
vim.keymap.set('n', "<leader>cq", telescopeFuncs.quickfix, {noremap = {true}})
vim.keymap.set('n', "<leader>cs", telescopeFuncs.lsp_document_symbols, {noremap = {true}})
vim.keymap.set('n', "<leader>ct", telescopeFuncs.treesitter, {noremap = {true}})
vim.keymap.set('n', "<leader>ck", vim.lsp.buf.hover, {noremap = {true}})
vim.keymap.set('n', "<leader>cf", vim.diagnostic.open_float, {noremap = {true}})
vim.keymap.set('n', "<leader>cc", "<cmd>FloatermNew make<CR>", {noremap = {true}})
vim.keymap.set('n', "<leader>cC", "<cmd>FloatermNew cmake --build build<CR>", {noremap = {true}})

-- replace
vim.keymap.set('n', "<leader>ra", ":%s/", {noremap = {true}})
vim.keymap.set('n', "<leader>rr", ":s/", {noremap = {true}})
vim.keymap.set('n', "<leader>rs", vim.lsp.buf.rename, {noremap = {true}})

-- harpoon
--vim.keymap.set('n', "<leader>ha", harpoonMark.add_file, {noremap = {true}})
--vim.keymap.set('n', "<leader>hl", harpoonUI.nav_next, {noremap = {true}})
--vim.keymap.set('n', "<leader>hh", harpoonUI.nav_next, {noremap = {true}})
--vim.keymap.set('n', "<leader>hm", harpoonUI.toggle_quick_menu, {noremap = {true}})
--vim.keymap.set('n', "<leader>h1", "<cmd> lua require('harpoon.ui').nav_file(1)<CR>", {noremap = {true}})
--vim.keymap.set('n', "<leader>h2", "<cmd> lua require('harpoon.ui').nav_file(2)<CR>", {noremap = {true}})
--vim.keymap.set('n', "<leader>h3", "<cmd> lua require('harpoon.ui').nav_file(3)<CR>", {noremap = {true}})
--vim.keymap.set('n', "<leader>h4", "<cmd> lua require('harpoon.ui').nav_file(4)<CR>", {noremap = {true}})

-- snipe

vim.keymap.set('n', "<leader>h", snipe.open_buffer_menu, {noremap = {true}})

-- shell
vim.keymap.set('n', "<leader>st","<cmd>tabnew<CR><cmd>terminal<CR>A", {noremap = {true}})
vim.keymap.set('n', "<leader>sn","<cmd>FloatermNew<CR>", {noremap = {true}})
vim.keymap.set('n', "<leader>ss","<cmd>FloatermToggle<CR>", {noremap = {true}})
vim.keymap.set('n', "<leader>sc","<cmd>FloatermKill<CR>", {noremap = {true}})
--vim.keymap.set('n', "<leader>", telescopeFuncs.colorScheme, {noremap = {true}})

-- goto
vim.keymap.set('n', "gr", telescopeFuncs.lsp_references, {noremap = {true}})
vim.keymap.set('n', "gi", telescopeFuncs.lsp_implementations, {noremap = {true}})
vim.keymap.set('n', "gd", telescopeFuncs.lsp_definitions, {noremap = {true}})
vim.keymap.set('n', "gl", "$", {noremap = {true}})
vim.keymap.set('n', "gh", "^", {noremap = {true}})
vim.keymap.set('v', "gl", "$", {noremap = {true}})
vim.keymap.set('v', "gh", "^", {noremap = {true}})

-- regular mappings
vim.keymap.set('n', "n", "nzzNn", {noremap = {true}}) -- next will center
vim.keymap.set('n', "G", "Gzz", {noremap = {true}}) -- go to end of file will center
vim.keymap.set('n', "<leader>nh", "<cmd>nohl<CR>", {noremap = {true}}) -- remove all highlights
vim.keymap.set('n', "/", "/\\c", {noremap = {true}}) -- default search case insensitive
vim.keymap.set('n', "<C-u>", "<C-y>", {noremap = {true}}) -- ctrl u scrolls up
vim.keymap.set('n', "<C-y>", "<C-u>", {noremap = {true}})
vim.keymap.set('n', "s", flash.jump, {noremap = {true}})
vim.keymap.set('v', "s", "S", {noremap = {false}}) -- change s to surround in visual mode

-- terminal mappings
vim.keymap.set('t', "<Esc>", "<C-\\><C-n>:q<CR>", {noremap = {true}}) -- escape to exit terminal
vim.keymap.set('t', "<C-p>", "<cmd>FloatermPrev<CR>", {noremap = {true}}) -- previous float terminal
vim.keymap.set('t', "<C-n>", "<cmd>FloatermNext<CR>", {noremap = {true}}) -- next float terminal
vim.keymap.set('t', "<C-k>", "<cmd>FloatermKill<CR>", {noremap = {true}}) -- kill float terminal
