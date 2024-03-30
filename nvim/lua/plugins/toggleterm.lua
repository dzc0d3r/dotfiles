return {
    "akinsho/toggleterm.nvim",
    config = function()
      require("toggleterm").setup({
        open_mapping = [[<c-\>]],
        shade_terminals = false,
        -- add --login so ~/.zprofile is loaded
        -- https://vi.stackexchange.com/questions/16019/neovim-terminal-not-reading-bash-profile/16021#16021
        shell = "zsh --login",
      })
    end,
    keys = {
      { [[<C-\>]] },
      { "<leader>tv", "<Cmd>2ToggleTerm<Cr>", desc = "Terminal #2",
      desc = "Open a floating terminal at the current directory",
         
      },
      {
        "<leader>tf",
        "<cmd>ToggleTerm size=50 direction=float<cr>",
        desc = "Open a floating terminal at the current directory",
      },
    },   
}