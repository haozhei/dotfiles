return {
    "andweeb/presence.nvim",
    config = function()
        require("presence").setup({
            main_image = "file",
            neovim_image_text = "唯一真正的文本编辑器",
            editing_text = "编辑 %s",
            file_explorer_text = "浏览 %s",
            git_commit_text = "提交更改",
            plugin_manager_text = "管理插件",
            reading_text = "阅读 %s",
            workspace_text = "正在处理 %s",
            line_number_text = "第 %s 行，共 %s 行",
        })
    end,
}
