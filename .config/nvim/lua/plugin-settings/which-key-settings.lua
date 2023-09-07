local wk = require('which-key')
local telescopeFuncs = require("telescope.builtin")
local harpoonUI = require('harpoon.ui');
local harpoonMark = require('harpoon.mark');

-- leader keys
wk.register({
    w = {
        name = "Window",
        s = {"<cmd>split<CR>", "Horizontal Split"},
        v = {"<cmd>vsplit<CR>", "Vertical Split"},
        h = {"<C-w>h", "Left"},
        l = {"<C-w>l", "Right"},
        j = {"<C-w>j", "Down"},
        k = {"<C-w>k", "Up"},
        H = {"<C-w>H", "Move Left"},
        L = {"<C-w>L", "Move Right"},
        J = {"<C-w>J", "Move Down"},
        K = {"<C-w>K", "Move Up"},
        f = {"<cmd>NvimTreeToggle<CR>", "File Tree"},
        ["<Left>"] = {"<C-w>20<", "Resize -x"},
        ["<Right>"] = {"<C-w>20>", "Resize +x"},
        ["<Up>"] = {"<C-w>10+", "Resize +y"},
        ["<Down>"] = {"<C-w>10-", "Resize -y"},
    },
    t = {
        name = "Tab",
        n = {"<cmd>tabnew<CR>", "New"},
        l = {"<cmd>tabn<CR>", "Next"},
        h = {"<cmd>tabn<CR>", "Previous"},
    },
    f = {
        name = "File",
        f = { telescopeFuncs.find_files, "Find File"},
        b = { "<cmd>Telescope file_browser<CR>", "Browser"},
        g = { telescopeFuncs.live_grep, "Live Grep"},
        o = {telescopeFuncs.buffers, "Buffers"}
    },
    c = {
        name = "Code",
        d = { telescopeFuncs.diagnostics, "Diagnostics"},
        q = { telescopeFuncs.quickfix, "Quickfix"},
        s = { telescopeFuncs.treesitter, "Symbols"},
        k = { vim.lsp.buf.hover, "Lsp Hover"},
        f = { vim.diagnostic.open_float, "Floating Diagnostics"},
        c = { "<cmd>FloatermNew make<CR>", "Run Makefile"},
        C = { "<cmd>FloatermNew cmake --build build<CR>", "Cmake build"},
    },
    r = {
        name = "Replace",
        a = {":%s/", "Replace All"},
        r = {":s/", "Replace Single"},
        s = {vim.lsp.buf.rename, "Rename Symbol"},
    },
    h = {
        name = "Harpoon",
        a = { harpoonMark.add_file, "Add"},
        l = { harpoonUI.nav_next, "Next"},
        h = { harpoonUI.nav_next, "Previous"},
        m = { harpoonUI.toggle_quick_menu, "Next"},
    },
    s = {
        name = "Shell",
        t = {"<cmd>tabnew<CR><cmd>terminal<CR>A", "New Tab"},
        n = {"<cmd>FloatermNew<CR>", "New Floating"},
        s = {"<cmd>FloatermToggle<CR>", "Toggle Floating"},
        c = {"<cmd>FloatermKill<CR>", "Kill Floating"}
    }
},
{
    prefix = "<leader>"
})

wk.register({
    r = { telescopeFuncs.lsp_references, "Goto References"},
    i = { telescopeFuncs.lsp_implementations, "Goto Implementations"},
    d = { telescopeFuncs.lsp_definitions, "Goto Definitions"},
},
{
    prefix = "g"
})
