return {
    "kevinhwang91/nvim-ufo",
    dependencies = { "kevinhwang91/promise-async", lazy = true },
    -- Using ufo provider need remap `zR` and `zM`
    keys = {
        { "zR", function() require("ufo").openAllFolds() end, desc = "Fold Open all" },
        { "zM", function() require("ufo").closeAllFolds() end, desc = "Fold Close all" },
    },
    opts = {
        provider_selector = function(_, _, _)
            return { "treesitter", "indent" }
        end,
    },
}
