return {
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup()
        end
    },
    {
        "williamboman/mason-lspconfig.nvim",
        config = function()
            require("mason-lspconfig").setup({
                -- clangd handles Make using compile_commands.json
                ensure_installed = { "lua_ls", "clangd", "pyright", "tsserver", "cmake" }
            })
        end
    },
    {
        "neovim/nvim-lspconfig",
        config = function()
            local capabilities = require("cmp_nvim_lsp").default_capabilities()
            local lspconfig = require("lspconfig")
            local util = require("lspconfig/util")
            local servers = require("mason-lspconfig").get_installed_servers()

            -- Setup every server automatically
            for _, lsp in ipairs(servers) do
                lspconfig[lsp].setup {
                    capabilities = capabilities
                }
            end

            -- Check if VULKAN_SDK is set
            local vulkan_sdk = os.getenv("VULKAN_SDK")
            local vulkan_include = vulkan_sdk and ("-I" .. vulkan_sdk .. "/include") or ""

            lspconfig.clangd.setup {
                cmd = {
                    "clangd",
                    "--background-index",
                    "--clang-tidy",
                    "--completion-style=bundled",
                    "--pch-storage=memory",
                    "--header-insertion=iwyu",
                    "--header-insertion-decorators",
                    "--compile-commands-dir=build",
                },
                capabilities = capabilities,
                root_dir = util.root_pattern("CMakeLists.txt", "compile_commands.json", ".git"),
                init_options = {
                    compilationDatabasePath = "build",
                    fallbackFlags = {
                        "-std=c++20",
                        vulkan_include,
                        "-I/usr/include/c++/v1",
                        "-I/Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/include"
                    }
                },
                on_attach = function(client, bufnr)
                    local bufopts = { noremap=true, silent=true, buffer=bufnr }
                    vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
                    vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, bufopts)
                    vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, bufopts)
                    vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, bufopts)
                end
            }
        end
    }
}
