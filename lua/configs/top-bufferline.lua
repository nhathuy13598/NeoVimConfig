require('bufferline').setup {
    options = {
        numbers                 = "both",
        number_style            = "superscript", -- buffer_id at index 1, ordinal at index 2
        mappings                = true,
        close_command           = "bdelete! %d",
        right_mouse_command     = "bdelete! %d",
        left_mouse_command      = "buffer %d",
        middle_mouse_command    = nil,

        indicator_icon      = "▎",
        buffer_close_icon   = "",
        modified_icon       = "●",
        close_icon          = "",
        left_trunc_marker   = "",
        right_trunc_marker  = "",
        max_name_length     = 18,
        max_prefix_length   = 15, -- prefix used when a buffer is de-duplicated
        tab_size            = 18,

        -- config for showing errors in buffers
        --- count is an integer representing total count of errors
        --- level is a string "error" | "warning"
        --- diagnostics_dict is a dictionary from error level ("error", "warning" or "info")to number of errors for each level.
        --- this should return a string
        --- Don't get too fancy as this function will be executed a lot
        diagnostics             = "nvim_lsp",
        diagnostics_indicator   = function(count, level, diagnostics_dict, context)
          local s = " "
          for e, n in pairs(diagnostics_dict) do
            local sym = e == "error" and " "
              or (e == "warning" and " " or "" )
            s = s .. n .. sym
          end
          return s
        end,

        offsets                     = {{filetype = "NvimTree", text = "File Explorer", highlight = "Directory", text_align = "left"}},
        show_buffer_icons           = true, -- disable filetype icons for buffers
        show_buffer_close_icons     = true,
        show_close_icon             = true,
        show_tab_indicators         = true,
        persist_buffer_sort         = true,
        separator_style             = "thick",
        enforce_regular_tabs        = true,
        always_show_bufferline      = true,

        custom_areas = {
            right = function()
                local result    = {}
                local error     = vim.lsp.diagnostic.get_count(0, [[Error]])
                local warning   = vim.lsp.diagnostic.get_count(0, [[Warning]])
                local info      = vim.lsp.diagnostic.get_count(0, [[Information]])
                local hint      = vim.lsp.diagnostic.get_count(0, [[Hint]])

                if error ~= 0 then
                    result[1] = {text = "  " .. error, guifg = "#EC5241"}
                end

                if warning ~= 0 then
                    result[2] = {text = "  " .. warning, guifg = "#EFB839"}
                end

                if hint ~= 0 then
                    result[3] = {text = "  " .. hint, guifg = "#A3BA5E"}
                end

                if info ~= 0 then
                    result[4] = {text = "  " .. info, guifg = "#7EA9A7"}
                end
                return result
            end
        }
    }
}
