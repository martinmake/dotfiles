class LoadBreakpoints(GenericCommand):
    _cmdline_ = "lb"
    _syntax_  = f"{_cmdline_}"
    __doc__ = "SFS"

    def do_invoke(self, argv):
        for filename in os.popen("find -name '.breakpoints_*'").read().split('\n'):
            if filename:
                gdb.execute(f'source {filename}')
        return
register_external_command(LoadBreakpoints())
