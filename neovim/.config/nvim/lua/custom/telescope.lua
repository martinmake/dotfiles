local actions = require('telescope.actions')

require('telescope').setup {
	defaults = {
		file_sorter = require('telescope.sorters').get_fzy_sorter,
		prompt_prefix = '',
		color_devicons = true,

		  file_previever = require('telescope.previewers').vim_buffer_cat.new,
		  grep_previever = require('telescope.previewers').vim_buffer_vimgrep.new,
		qflist_previever = require('telescope.previewers').vim_buffer_qflist.new,

		mapping = {
			i = {
				-- ["<C-j>"] = actions.select_default + actions.center,
				["<CR>"] = actions.select_default + actions.center,
				-- ["<C-x>"] = false,
				-- ["<C-s>"] = actions.select_horizontal,
				["<C-x>"] = actions.select_horizontal,
				["<C-v>"] = actions.select_vertical,
				["<C-q>"] = actions.send_to_qflist,
			},
		}
	},
	pickers = {
		find_files = {
			find_command = {"rg", "--ignore", "--hidden", "--files"},
		}
	},
	extensions = {
		fzf = {
			fuzzy = true,
			override_generic_sorter = false,
			override_file_sorter    = true,
			case_mode = "smart_case",
		}
	}
}

require('telescope').load_extension('fzf')

local custom = {}

custom.find_dotfiles = function()
	require("telescope.builtin").find_files({
		prompt_title = "Find Dotfiles",
		cwd = "~/dotfiles",
	})
end
custom.git_branches = function()
	require("telescope.builtin").git_branches({
		attach_mappings = function(prompt_bufnr, map)
			map('i', '<C-d>', actions.git_delete_branch)
			map('n', '<C-d>', actions.git_delete_branch)
			return true
		end
	})
end

return custom
