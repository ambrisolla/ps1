# PS1
set_ps1() {
        ret_code=$(echo $?)
        if test $ret_code -ne 0
        then
                ps1_retcode="\[\e[38;5;160m\] $ret_code"
        else
                ps1_retcode="\[\e[38;5;64m\] $ret_code"
        fi

        # whoami
        if test "$( whoami )" = "root"
        then
                ps1_user="\[\e[38;5;1m\] \u"
        else
                ps1_user="\[\e[38;5;154m\] \u"
        fi

        ps1_date="\[\e[38;5;227m\] \t"
        ps1_host="\[\e[38;5;255m\](\[\e[38;5;162m\] \h \[\e[38;5;255m\])"
        ps1_pwd="\[\e[38;5;69m\] \w"
        ps1_ret="\[\e[38;5;228m\]$(echo $?)\[\e[0m\]"

        PS1="\n\[\e[48;5;235m\]$ps1_retcode$ps1_date$ps1_user$ps1_pwd $ps1_host \[\e[0m\]\n▶ "
}
PROMPT_COMMAND=set_ps1
