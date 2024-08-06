function ConfigureWhichKey ()
    local wk = require('which-key')
    local telescopeFuncs = require("telescope.builtin")
    local harpoonUI = require('harpoon.ui');
    local harpoonMark = require('harpoon.mark');
    local flash = require('flash')

    wk.add(
    {
        mode = {"n"},
        -- raw commands
        { "<leader>f", telescopeFuncs.find_files, desc = "Find Files"},
        { "<leader>/", telescopeFuncs.live_grep, desc = "Live Grep"},

        -- window keys
        {
            group = "Window",
            { "<leader>ws", "<cmd>split<CR>", desc = "Horizontal Split"},
            { "<leader>wv", "<cmd>vsplit<CR>", desc = "Vertical Split"},
            { "<leader>wc", "<C-w>c", desc = "Close"},
            { "<leader>wh", "<C-w>h", desc = "Left"},
            { "<leader>wl", "<C-w>l", desc = "Right"},
            { "<leader>wj", "<C-w>j", desc = "Down"},
            { "<leader>wk", "<C-w>k", desc = "Up"},
            { "<leader>wH", "<C-w>H", desc = "Move Left"},
            { "<leader>wL", "<C-w>L", desc = "Move Right"},
            { "<leader>wJ", "<C-w>J", desc = "Move Down"},
            { "<leader>wK", "<C-w>K", desc = "Move Up"},
            { "<leader>w<Left>", "<C-w>20<", desc = "Resize -x"},
            { "<leader>w<Right>", "<C-w>20>", desc = "Resize +x"},
            { "<leader>w<Up>", "<C-w>10+", desc = "Resize +y"},
            { "<leader>w<Down>", "<C-w>10-", desc = "Resize -y"},
        },

        -- browse
        {
            group = "Browse",
            { "<leader>bb", telescopeFuncs.buffers, desc = "Buffers"},
            { "<leader>bf", "<cmd>Telescope file_browser<CR>", desc = "File Browser"},
            --{ "<leader>bf", telescopeFuncs.file_browser, desc = "File Browser"},
        },

        -- tabs
        {
            group = "Tab",
            { "<leader>tn", "<cmd>tabnew<CR>", desc = "New"},
            { "<leader>tl", "<cmd>tabn<CR>", desc = "Next"},
            { "<leader>th", "<cmd>tabn<CR>", desc = "Previous"},
        },

        -- code
        {
            group = "Code",
            { "<leader>cd", telescopeFuncs.diagnostics, desc = "Diagnostics"},
            { "<leader>cq", telescopeFuncs.quickfix, desc = "Quickfix"},
            { "<leader>cs", telescopeFuncs.lsp_document_symbols, desc = "Symbols"},
            { "<leader>ct", telescopeFuncs.treesitter, desc = "Treesitter"},
            { "<leader>ck", vim.lsp.buf.hover, desc = "Lsp Hover"},
            { "<leader>cf", vim.diagnostic.open_float, desc = "Floating Diagnostics"},
            { "<leader>cc", "<cmd>FloatermNew make<CR>", desc = "Run Makefile"},
            { "<leader>cC", "<cmd>FloatermNew cmake --build build<CR>", desc = "Cmake build"},
        },

        -- replace
        {
            group = "Replace",
            { "<leader>ra", ":%s/", desc = "Replace All"},
            { "<leader>rr", ":s/", desc = "Replace Single"},
            { "<leader>rs", vim.lsp.buf.rename, desc = "Rename Symbol"}, 
        },

        -- harpoon
        {
            group = "Harpoon",
            { "<leader>ha", harpoonMark.add_file, desc = "Add"},
            { "<leader>hl", harpoonUI.nav_next, desc = "Next"},
            { "<leader>hh", harpoonUI.nav_next, desc = "Previous"},
            { "<leader>hm", harpoonUI.toggle_quick_menu, desc = "Menu"},
            { "<leader>h1", "<cmd> lua require('harpoon.ui').nav_file(1)<CR>", desc = "Harpoon 1"},
            { "<leader>h2", "<cmd> lua require('harpoon.ui').nav_file(2)<CR>", desc = "Harpoon 2"},
            { "<leader>h3", "<cmd> lua require('harpoon.ui').nav_file(3)<CR>", desc = "Harpoon 3"},
            { "<leader>h4", "<cmd> lua require('harpoon.ui').nav_file(4)<CR>", desc = "Harpoon 4"},
        },

        -- shell
        {
            group = "Shell",
            { "<leader>st","<cmd>tabnew<CR><cmd>terminal<CR>A", desc = "New Tab"},
            { "<leader>sn","<cmd>FloatermNew<CR>", desc = "New Floating"},
            { "<leader>ss","<cmd>FloatermToggle<CR>", desc = "Toggle Floating"},
            { "<leader>sc","<cmd>FloatermKill<CR>", desc = "Kill Floating"},
            { "<leader>.c",telescopeFuncs.colorScheme, desc = "Kill Floating"},
        },

        -- goto
        {
            group = "Goto",
            { "gr", telescopeFuncs.lsp_references, desc = "Goto References"},
            { "gi", telescopeFuncs.lsp_implementations, desc = "Goto Implementations"},
            { "gd", telescopeFuncs.lsp_definitions, desc = "Goto Definitions"},
            {
                mode = {"n", "v"},
                { "gl", "$", desc = "Goto End of Line"},
                { "gh", "^", desc = "Goto Start of Line"},
            }
        },

        -- regular mappings
        { "n", "nzzNn" }, -- next will center
        { "G", "Gzz" }, -- go to end of file will center
        { "<leader>nh", "<cmd>nohl<CR>" }, -- remove all highlights
        { "/", "/\\c" }, -- default search case insensitive

        { "<C-u>", "<C-y>" }, -- ctrl u scrolls up
        { "<C-y>", "<C-u>" },

        { "s", flash.jump, desc = "flash jump" },

        {
            mode = {"t"},
            { "<Esc>", "<C-\\><C-n>:q<CR>" }, -- escape to exit terminal
            { "<C-p>", "<cmd>FloatermPrev<CR>" }, -- previous float terminal
            { "<C-n>", "<cmd>FloatermNext<CR>" }, -- next float terminal
            { "<C-k>", "<cmd>FloatermKill<CR>" }, -- kill float terminal
        }
    }
    )
end

return
{
    {
        "folke/which-key.nvim",
        lazy = false,
        --init = function()
            --vim.o.timeout = true
            --vim.o.timeoutlen = 100
        --end,
        --config = ConfigureWhichKey
        init = ConfigureWhichKey
    },
}
