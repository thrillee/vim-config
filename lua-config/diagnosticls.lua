local nvim_lsp = require('lspconfig')

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    underline = true,
    -- This sets the spacing and the prefix, obviously.
    virtual_text = {
      spacing = 4,
      prefix = '🧐'
    }
  }
)

nvim_lsp.diagnosticls.setup {
    on_attach = on_attach,
      filetypes = { 
        'css', 
        'less', 
        'scss', 
        'json', 
        'pandoc',
        'python',
        'markdown', 
        'typescript', 
        'javascript', 
        'javascriptreact', 
        'typescriptreact', 
        },
      init_options = {
        linters = {
          pylint = {
            command = 'pylint',
            rootPatterns = { '.git' },
            debounce = 100,
            args= {
                  "--output-format",
                  "text",
                  "--score",
                  "no",
                  "--msg-template",
                  "'{line}:{column}:{category}:{msg} ({msg_id}:{symbol})'",
                  "%file"
                },
            formatPattern = {
                  "^(\\d+?):(\\d+?):([a-z]+?):(.*)$",
                  {
                    line = 1,
                    column= 2,
                    security= 3,
                    message= 4
                  }
                },
            rootPatterns = {
                    "pyproject.toml", 
                    "setup.py",
                    "main.py", 
                    ".vim", 
                    ".git", 
                },
             securities = {
                  -- informational= "hint",
                  -- refactor= "info",
                  -- convention= "info",
                  -- warning= "warning",
                  -- error= "error",
                  -- fatal= "error"
              [2] = 'error',
              [1] = 'warning'
            },
            offsetColumn= 1,
            formatLines= 1
          },
          flake8 = {
           command = "flake8",
            sourceName = "flake8",
            args = {"--format", "%(row)d:%(col)d:%(code)s: %(text)s", "%file"},
            formatPattern = {
              "^(\\d+):(\\d+):(\\w+):(\\w).+: (.*)$",
              {
                  line = 1,
                  column = 2,
                  message = {"[", 3, "] ", 5},
                  security = 4
              }
            },
            securities = {
              E = "error",
              W = "warning",
              F = "info",
              B = "hint",
            },
          },
          eslint = {
            command = 'eslint_d',
            rootPatterns = { '.git' },
            debounce = 100,
            args = { 
                    '--stdin-filename', 
                    '%filepath', 
                    '--format', 
                    '--stdin', 
                    'json' 
                },
            sourceName = 'eslint_d',
            parseJson = {
              errorsRoot = '[0].messages',
              line = 'line',
              column = 'column',
              endLine = 'endLine',
              endColumn = 'endColumn',
              message = '[eslint] ${message} [${ruleId}]',
              security = 'severity'
            },
            securities = {
              [2] = 'error',
              [1] = 'warning'
            }
          },
        },
        filetypes = {
          javascript = 'eslint',
          typescript = 'eslint',
          javascriptreact = 'eslint',
          typescriptreact = 'eslint',
          python = 'pylint',
        },
        formatters = {
          eslint_d = {
            command = 'eslint_d',
            args = { 
                    '--stdin', 
                    '%filename', 
                    '--fix-to-stdout',
                    '--stdin-filename', 
                },
            rootPatterns = { '.git' },
          },
          autopep8 = {
                args = { },
                command = 'autopep8',
            },
          black = {
                command = 'autopep8',
                args = { "--quiet", "-" },
            },
          isort = {
                command = 'isort',
                args = { "--quiet", "-" },
            },
          prettier = {
            command = 'prettier',
            args = { '--stdin-filepath', '%filename' }
          }
        },
        formatFiletypes = {
          css = 'prettier',
          json = 'prettier',
          scss = 'prettier',
          less = 'prettier',
          json = 'prettier',
          -- python = "flake8",
          markdown = 'prettier',
          javascript = 'eslint_d',
          typescript = 'eslint_d',
          javascriptreact = 'eslint_d',
          typescriptreact = 'eslint_d',
          python = "autopep8", --"isort",
        }
      }
}
