return {
	{
		"lervag/vimtex",
		lazy = false,
		init = function()
			-- Turn off VimTeX indentation
			vim.g.vimtex_indent_enabled = 0
			-- Disable default mappings; I'll define my own
			vim.g.vimtex_mappings_enabled = 0
			-- Disable insert mode mappings (in favor of a dedicated snippet engine)
			vim.g.vimtex_imaps_enabled = 0
			-- -- Disable completion
			-- vim.g.vimtex_complete_enabled = 0
			-- Disable syntax conceal
			vim.g.vimtex_syntax_conceal_disable = 0
			-- Default is 500 lines and gave me lags on missed key presses
			vim.g.vimtex_delim_stopline = 50
			-- VimTeX toggle delimeter configuration
			vim.g.vimtex_delim_toggle_mod_list = {
				{ "\\left", "\\right" },
				{ "\\big", "\\big" },
			}
			-- Don't open quickfix for warning messages if no errors are present
			vim.g.vimtex_quickfix_open_on_warning = 0
			vim.g.vimtex_quickfix_ignore_filters = {
				"LaTeX hooks Warning",
				"Underfull \\hbox",
				"Overfull \\hbox",
				"LaTeX Warning: .\\+ float specifier changed to",
				'Package siunitx Warning: Detected the "physics" package:',
				"Package hyperref Warning: Token not allowed in a PDF string",
				"Fatal error occured, no output PDF file produced!",
			}
			-- VimTeX configuration goes here, e.g.
			vim.g.vimtex_view_method = "zathura"

			vim.g.vimtex_compiler_latexmk_engines = {
				["_"] = "-xelatex",
				pdfdvi = "-pdfdvi",
				pdfps = "-pdfps",
				pdflatex = "-pdf",
				luatex = "-lualatex",
				lualatex = "-lualatex",
				xelatex = "-xelatex",
				["context (pdftex)"] = "-pdf -pdflatex=texexec",
				["context (luatex)"] = "-pdf -pdflatex=context",
				["context (xetex)"] = "-pdf -pdflatex='texexec --xtx'",
			}

			vim.cmd([==[
                " Get Vim's window ID for switching focus from Zathura to Vim using xdotool.
                " Only set this variable once for the current Vim instance.
                if !exists("g:vim_window_id")
                    let g:vim_window_id = system("xdotool getactivewindow")
                endif

                function! s:TexFocusVim() abort
                    " Give window manager time to recognize focus moved to Zathura;
                    " tweak the 200m (200 ms) as needed for your hardware and window manager.
                    sleep 200m

                    " Refocus Vim and redraw the screen
                    silent execute "!xdotool windowfocus " . expand(g:vim_window_id)
                    redraw!
                endfunction

                augroup vimtex_event_focus
                    au!
                    au User VimtexEventView call s:TexFocusVim()
                augroup END

                " KEYMAPS
                " ---------------------------------------------
                " Compilation
                noremap <localleader>c <cmd>VimtexCompile<cr>
                noremap <localleader>i <cmd>VimtexInfo<cr>
                " nmap <localleader>ll <cmd>update<cr><cmd>VimtexCompileSS<cr>

                " Forward search
                noremap <localleader>v <cmd>VimtexView<cr>

                " Some default (and modified) VimTeX keymaps
                nmap dse <plug>(vimtex-env-delete)
                nmap dsc <plug>(vimtex-cmd-delete)
                nmap dsm <plug>(vimtex-env-delete-math)
                nmap dsd <plug>(vimtex-delim-delete)
                nmap cse <plug>(vimtex-env-change)
                nmap csc <plug>(vimtex-cmd-change)
                nmap csm <plug>(vimtex-env-change-math)
                nmap csd <plug>(vimtex-delim-change-math)
                nmap tsf <plug>(vimtex-cmd-toggle-frac)
                nmap tsc <plug>(vimtex-cmd-toggle-star)
                nmap tse <plug>(vimtex-env-toggle-star)
                nmap tsd <plug>(vimtex-delim-toggle-modifier)
                nmap tsD <plug>(vimtex-delim-toggle-modifier-reverse)
                nmap tsm <plug>(vimtex-env-toggle-math)
                " imap \]\] <plug>(vimtex-delim-close)

                " Text objects in operator-pending mode
                omap ac <plug>(vimtex-ac)
                xmap ac <plug>(vimtex-ac)
                omap ic <plug>(vimtex-ic)
                xmap ic <plug>(vimtex-ic)

                omap ad <plug>(vimtex-ad)
                xmap ad <plug>(vimtex-ad)
                omap id <plug>(vimtex-id)
                xmap id <plug>(vimtex-id)

                omap ae <plug>(vimtex-ae)
                xmap ae <plug>(vimtex-ae)
                omap ie <plug>(vimtex-ie)
                xmap ie <plug>(vimtex-ie)

                omap am <plug>(vimtex-a$)
                xmap am <plug>(vimtex-a$)
                omap im <plug>(vimtex-i$)
                xmap im <plug>(vimtex-i$)

                omap aP <plug>(vimtex-aP)
                xmap aP <plug>(vimtex-aP)
                omap iP <plug>(vimtex-iP)
                xmap iP <plug>(vimtex-iP)

                omap ai <plug>(vimtex-am)
                xmap ai <plug>(vimtex-am)
                omap ii <plug>(vimtex-im)
                xmap ii <plug>(vimtex-im)

                " nvo mode mappings
                map %  <plug>(vimtex-%)
                map ]] <plug>(vimtex-]])
                map ][ <plug>(vimtex-][)
                map [] <plug>(vimtex-[])
                map [[ <plug>(vimtex-[[)

                map ]m <plug>(vimtex-]m)
                map ]M <plug>(vimtex-]M)
                map [m <plug>(vimtex-[m)
                map [M <plug>(vimtex-[M)

                map ]n <plug>(vimtex-]n)
                map ]N <plug>(vimtex-]N)
                map [n <plug>(vimtex-[n)
                map [N <plug>(vimtex-[N)

                map ]r <plug>(vimtex-]r)
                map ]R <plug>(vimtex-]R)
                map [r <plug>(vimtex-[r)
                map [R <plug>(vimtex-[R)

                map ]/ <plug>(vimtex-]/
                map ]* <plug>(vimtex-]star
                map [/ <plug>(vimtex-[/
                map [* <plug>(vimtex-[star
            ]==])
		end,
	},
}
