local fl_tools = require('flutter-tools')

fl_tools.setup {
	decorations = {
		statusline = {
			app_version = true,
			device = true,
		}
	},
	widget_guides = {
		enabled = true,
	},
	closing_tags = {
		enabled = true,
	},
	debugger = {
		enabled = true,
		run_via_dap = true,
		exception_breakpoints = 'default',
		register_configurations= function (paths)
			local dap = require('dap')

			dap.adapters.dart = {
				type = 'executable',
				command = 'node',
				args = {'D:\\Softwares\\bin\\Dart-Code\\out\\dist\\debug.js', 'flutter'},
				-- command = 'dart',
				-- args = {'debug_adapter'},
			}
			dap.configurations.dart = {}

			require('dap.ext.vscode').load_launchjs()
		end,
	},
	lsp = {
		color = {
			enabled = true,
		},
		settings = {
			showTodos = true,
		}
	}
}
