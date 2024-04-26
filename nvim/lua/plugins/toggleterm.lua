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
    --vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')

    local Terminal = require("toggleterm.terminal").Terminal
    local lazygit = Terminal:new({ cmd = "lazygit", hidden = true, direction = "float" })

    local lazydocker = Terminal:new({ cmd = "lazydocker", hidden = true, direction = "float" })
    local python = Terminal:new({ cmd = "python3", hidden = true, direction = "float" })
    local node = Terminal:new({ cmd = "node", hidden = true, direction = "float" })

    function _LAZYGIT_TOGGLE()
      lazygit:toggle()
    end
    function _LAZYDOCKER_TOGGLE()
      lazydocker:toggle()
    end
    function _PYTHON_TOGGLE()
      python:toggle()
    end
    function _NODE_TOGGLE()
      node:toggle()
    end
  end,

  keys = {
    { [[<C-\>]] },
    { "<leader>tv", "<Cmd>2ToggleTerm<Cr>",
      desc = "Open a floating terminal at the current directory",

    },
    { "<leader>td", "<Cmd>lua _LAZYDOCKER_TOGGLE()<Cr>", 
      desc = "Open lazydocker in a floating terminal",

    },

    { "<leader>tl", "<Cmd>lua _LAZYGIT_TOGGLE()<Cr>", 
      desc = "Open lazygit in a floating terminal",

    },

    { "<leader>tp", "<Cmd>lua _PYTHON_TOGGLE()<Cr>", 
      desc = "Open python in a floating terminal",

    },
    { "<leader>tn", "<Cmd>lua _NODE_TOGGLE()<Cr>", 
      desc = "Open node in a floating terminal",
    },
    {
      "<leader>tf",
      "<cmd>ToggleTerm size=50 direction=float<cr>",
      desc = "Open a floating terminal at the current directory",
    },
  },   
}
