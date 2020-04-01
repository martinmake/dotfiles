command! -nargs=*       GitStatus exec 'lcd '.helpers#find_git_root() | Gstatus <args>
command! -nargs=*       Gdiff    exec 'lcd '.helpers#find_git_root() | Gdiff <args>
command! -nargs=*       GitCommit exec 'lcd '.helpers#find_git_root() | Gcommit <args>
command! -nargs=*       GitWrite  exec 'lcd '.helpers#find_git_root() | Gwrite <args>
command! -nargs=* -bang GitMain   exec 'lcd '.helpers#find_git_root() | Git<bang> <args>
command! -nargs=*       GitCd     exec 'lcd '.helpers#find_git_root() | Gcd <args>
command! -nargs=*       GitLCd    exec 'lcd '.helpers#find_git_root() | Glcd <args>
command! -nargs=* -bang GitGrep   exec 'lcd '.helpers#find_git_root() | Ggrep<bang> <args>
command! -nargs=*       GitLog    exec 'lcd '.helpers#find_git_root() | Glog <args>
command! -nargs=*       GitPush   exec 'lcd '.helpers#find_git_root() | Gpush <args>
command! -nargs=*       GitPull   exec 'lcd '.helpers#find_git_root() | Gpull <args>

if exists(':Alias')
	call CmdAlias('gstatus', 'GitStatus')
	call CmdAlias('gdiff', 'Gdiff')
	call CmdAlias('gcommit', 'GitCommit')
	call CmdAlias('gwrite', 'GitWrite')
	call CmdAlias('git', 'GitMain')
	call CmdAlias('gcd', 'GitCd')
	call CmdAlias('glcd', 'GitLCd')
	call CmdAlias('ggrep', 'GitGrep')
	call CmdAlias('glog', 'GitLog')
	call CmdAlias('gpush', 'GitPush')
	call CmdAlias('gpull', 'GitPull')
endif
