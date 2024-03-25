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
        c = {"<C-w>c", "Close"},
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
    f = {telescopeFuncs.find_files, "Find file"},
    ["/"] = {telescopeFuncs.live_grep, "Live Grep"},
    b = {
        name = "Browse",
        f = { "<cmd>Telescope file_browser<CR>", "File Browser"},
        b = {telescopeFuncs.buffers, "Buffers"}
    },
    t = {
        name = "Tab",
        n = {"<cmd>tabnew<CR>", "New"},
        l = {"<cmd>tabn<CR>", "Next"},
        h = {"<cmd>tabn<CR>", "Previous"},
    },
    c = {
        name = "Code",
        d = { telescopeFuncs.diagnostics, "Diagnostics"},
        q = { telescopeFuncs.quickfix, "Quickfix"},
        s = { telescopeFuncs.lsp_document_symbols, "Symbols"},
        t = { telescopeFuncs.treesitter, "Treesitter"},
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
        m = { harpoonUI.toggle_quick_menu, "Menu"},
        ["1"] = { "<cmd> lua require('harpoon.ui').nav_file(1)<CR>", "Harpoon 1"},
        ["2"] = { "<cmd> lua require('harpoon.ui').nav_file(2)<CR>", "Harpoon 2"},
        ["3"] = { "<cmd> lua require('harpoon.ui').nav_file(3)<CR>", "Harpoon 3"},
        ["4"] = { "<cmd> lua require('harpoon.ui').nav_file(4)<CR>", "Harpoon 4"},
    },
    s = {
        name = "Shell",
        t = {"<cmd>tabnew<CR><cmd>terminal<CR>A", "New Tab"},
        n = {"<cmd>FloatermNew<CR>", "New Floating"},
        s = {"<cmd>FloatermToggle<CR>", "Toggle Floating"},
        c = {"<cmd>FloatermKill<CR>", "Kill Floating"}
    },
    ["."] = {
        c ={ telescopeFuncs.colorscheme, "Colorscheme"},
    }
},
{
    prefix = "<leader>"
})

wk.register({
    r = { telescopeFuncs.lsp_references, "Goto References"},
    i = { telescopeFuncs.lsp_implementations, "Goto Implementations"},
    d = { telescopeFuncs.lsp_definitions, "Goto Definitions"},
    l = { "$", "Goto End of Line"},
    h = { "^", "Goto Start of Line"},
},
{
    prefix = "g"
})
