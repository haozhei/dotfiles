return {
    "goolord/alpha-nvim",
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },

    config = function()
        local alpha = require("alpha")
        local dashboard = require("alpha.themes.dashboard")

        dashboard.section.header.val = {
            [[                                              ]],
            [[              Welcome to NeoVim!              ]],
            [[                                              ]],
            [[                           .'\                ]],
            [[                          //  ;               ]],
            [[                         /'   |               ]],
            [[        .----..._    _../ |   \               ]],
            [[         \'---._ `.-'      `  .'              ]],
            [[          `.    '              `.             ]],
            [[            :            _,.    '.            ]],
            [[            |     ,_    (() '    |            ]],
            [[            ;   .'(().  '      _/__..-        ]],
            [[            \ _ '       __  _.-'--._          ]],
            [[            ,'.'...____'::-'  \     `'        ]],
            [[           / |   /         .---.              ]],
            [[     .-.  '  '  / ,---.   (     )             ]],
            [[    / /       ,' (     )---`-`-`-.._          ]],
            [[   : '       /  '-`-`-`..........--'\         ]],
            [[   ' :      /  /                     '.       ]],
            [[   :  \    |  .'         o             \      ]],
            [[    \  '  .' /          o       .       '     ]],
            [[     \  `.|  :      ,    : _o--'.\      |     ]],
            [[      `. /  '       ))    (   )  \>     |     ]],
            [[        ;   |      ((      \ /    \___  |     ]],
            [[        ;   |      _))      `'.-'. ,-'` '     ]],
            [[        |    `.   ((`            |/    /      ]],
            [[        \     ).  .))            '    .       ]],
            [[     ----`-'-'  `''.::.________::::.'' ---    ]],
        }

        dashboard.section.buttons.val = {
            dashboard.button("e", "  > New file", ":ene <BAR> startinsert <CR>"),
            dashboard.button("f", "󰱼  > Find file", ":Telescope find_files<CR>"),
            dashboard.button("r", "  > Recent", ":Telescope oldfiles<CR>"),
            dashboard.button("q", "󰗼  > Quit NeoVim", ":qa<CR>"),
        }

        alpha.setup(dashboard.opts)

        vim.cmd([[
            autocmd FileType alpha setlocal nofoldenable
        ]])
    end,
}
