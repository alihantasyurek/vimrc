if exists("current_compiler")
	finish
endif
let current_compiler = "c"

CompilerSet makeprg =gcc\ -Wall\ -Wextra\ -Werror\ %
