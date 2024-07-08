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
end

return
{
    {
      "folke/noice.nvim",
      dependencies = {
        "MunifTanjim/nui.nvim",
        "rcarriga/nvim-notify",
      },
      --init = function()
        --require('plugin-settings.noice-settings')
      --end,
      config = ConfigureNoice
    },
}
