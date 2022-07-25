if executable('tailwindcss-intellisense')
    autocmd User lsp_setup call lsp#register_server({
          \ 'name': 'tailwindcss-intellisense',
          \ 'cmd': {server_info->['tailwindcss-intellisense', '--stdio']},
          \ 'allowlist': ['css', 'html', 'htmldjango'],
          \ 'root_uri': {server_info->lsp#utils#path_to_uri(lsp#utils#find_nearest_parent_file_directory(lsp#utils#get_buffer_path(), 'tailwind.config.js'))},
          \ })
  endif
