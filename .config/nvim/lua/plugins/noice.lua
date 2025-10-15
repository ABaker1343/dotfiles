function ConfigureNoice ()
    require('noice').setup({
      lsp = {
        signature = {
          enabled = false;
        };
      },
      messages = {
        enabled = false;
      },
      popupmenu = {
        enabled = false,
      }
    })

    require("nvim-notify").setup({
        background_color = "#ffffff"
    })
end

return
{
    {
      "folke/noice.nvim",
      lazy = false,
      dependencies = {
        "MunifTanjim/nui.nvim",
        "rcarriga/nvim-notify",
      },
      config = ConfigureNoice
    },
}
