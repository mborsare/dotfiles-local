let g:prettier#autoformat = 0 " Disable auto formatting of files that have '@format' tag
let g:prettier#exec_cmd_async = 1 " Run Prettier before saving async (vim 8+):
let g:prettier#config#prose_wrap = 'preserve' " Wrap prose as-is

autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.html PrettierAsync
