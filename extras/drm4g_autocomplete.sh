
_drm4g()
{
    local cur
    cur="${COMP_WORDS[COMP_CWORD]}"

    if [ $COMP_CWORD -eq 1 ]; then
        COMPREPLY=( $( compgen -W '-h --help --version --dbg status resource clear stop host start job conf id restart' -- $cur) )
    else
        case ${COMP_WORDS[1]} in
            status)
            _drm4g_status
        ;;
            resource)
            _drm4g_resource
        ;;
            clear)
            _drm4g_clear
        ;;
            stop)
            _drm4g_stop
        ;;
            host)
            _drm4g_host
        ;;
            start)
            _drm4g_start
        ;;
            job)
            _drm4g_job
        ;;
            conf)
            _drm4g_conf
        ;;
            id)
            _drm4g_id
        ;;
            restart)
            _drm4g_restart
        ;;
        esac

    fi
}

_drm4g_status()
{
    local cur
    cur="${COMP_WORDS[COMP_CWORD]}"

    if [ $COMP_CWORD -ge 2 ]; then
        COMPREPLY=( $( compgen -W '--dbg' -- $cur) )
    fi
}

_drm4g_resource()
{
    local cur
    cur="${COMP_WORDS[COMP_CWORD]}"

    if [ $COMP_CWORD -eq 2 ]; then
        COMPREPLY=( $( compgen -W 'edit list check create destroy' -- $cur) )
    else
        case ${COMP_WORDS[2]} in
            edit)
            _drm4g_resource_edit
        ;;
            list)
            _drm4g_resource_list
        ;;
            check)
            _drm4g_resource_check
        ;;
           create)
            _drm4g_resource_create
        ;;
           destroy)
            _drm4g_resource_destroy
        ;;        
        esac

    fi
}

_drm4g_resource_edit()
{
    local cur
    cur="${COMP_WORDS[COMP_CWORD]}"

    if [ $COMP_CWORD -ge 3 ]; then
        COMPREPLY=( $( compgen -W '--dbg' -- $cur) )
    fi
}

_drm4g_resource_list()
{
    local cur
    cur="${COMP_WORDS[COMP_CWORD]}"

    if [ $COMP_CWORD -ge 3 ]; then
        COMPREPLY=( $( compgen -W '--dbg --all' -- $cur) )
    fi
}

_drm4g_resource_check()
{
    local cur
    cur="${COMP_WORDS[COMP_CWORD]}"

    if [ $COMP_CWORD -ge 3 ]; then
        COMPREPLY=( $( compgen -W '--dbg' -- $cur) )
    fi
}

_drm4g_resource_destroy()
{
    local cur
    cur="${COMP_WORDS[COMP_CWORD]}"

    if [ $COMP_CWORD -ge 3 ]; then
        COMPREPLY=( $( compgen -W '--dbg' -- $cur) )
    fi
}

_drm4g_resource_create()
{
    local cur
    cur="${COMP_WORDS[COMP_CWORD]}"

    if [ $COMP_CWORD -ge 3 ]; then
        COMPREPLY=( $( compgen -W '--dbg' -- $cur) )
    fi
}

_drm4g_clear()
{
    local cur
    cur="${COMP_WORDS[COMP_CWORD]}"

    if [ $COMP_CWORD -ge 2 ]; then
        COMPREPLY=( $( compgen -W '--dbg' -- $cur) )
    fi
}

_drm4g_stop()
{
    local cur
    cur="${COMP_WORDS[COMP_CWORD]}"

    if [ $COMP_CWORD -ge 2 ]; then
        COMPREPLY=( $( compgen -W '--dbg' -- $cur) )
    fi
}

_drm4g_host()
{
    local cur
    cur="${COMP_WORDS[COMP_CWORD]}"

    if [ $COMP_CWORD -eq 2 ]; then
        COMPREPLY=( $( compgen -W '--dbg list') )
    fi
}

_drm4g_start()
{
    local cur
    cur="${COMP_WORDS[COMP_CWORD]}"

    if [ $COMP_CWORD -ge 2 ]; then
        COMPREPLY=( $( compgen -W '--dbg' -- $cur) )
    fi
}

_drm4g_job()
{
    local cur
    cur="${COMP_WORDS[COMP_CWORD]}"

    if [ $COMP_CWORD -eq 2 ]; then
        COMPREPLY=( $( compgen -W 'cancel history list log submit' -- $cur) )
    else
        case ${COMP_WORDS[2]} in
            cancel)
            _drm4g_job_cancel
        ;;
            history)
            _drm4g_job_history
        ;;
            list)
            _drm4g_job_list
        ;;
            log)
            _drm4g_job_log
        ;;
            submit)
            _drm4g_job_submit
        ;;
        esac

    fi
}

_drm4g_job_cancel()
{
    local cur
    cur="${COMP_WORDS[COMP_CWORD]}"

    if [ $COMP_CWORD -ge 3 ]; then
        COMPREPLY=( $( compgen -W '--dbg' -- $cur) )
    fi
}

_drm4g_job_history()
{
    local cur
    cur="${COMP_WORDS[COMP_CWORD]}"

    if [ $COMP_CWORD -ge 3 ]; then
        COMPREPLY=( $( compgen -W '--dbg' -- $cur) )
    fi
}

_drm4g_job_list()
{
    local cur
    cur="${COMP_WORDS[COMP_CWORD]}"

    if [ $COMP_CWORD -ge 3 ]; then
        COMPREPLY=( $( compgen -W '--dbg' -- $cur) )
    fi
}

_drm4g_job_log()
{
    local cur
    cur="${COMP_WORDS[COMP_CWORD]}"

    if [ $COMP_CWORD -ge 3 ]; then
        COMPREPLY=( $( compgen -W '--dbg' -- $cur) )
    fi
}

_drm4g_job_submit()
{
    local cur
    cur="${COMP_WORDS[COMP_CWORD]}"

    if [ $COMP_CWORD -ge 3 ]; then
        COMPREPLY=( $( compgen -W '--dep= --ntask=' -- $cur) )
        # Expand tilder to $HOME
        [[ ${cur} == "~/"* ]] && cur=${cur/\~/$HOME}
        compopt +o filenames
        local files=("${cur}"*)
        # Show completion if path exist (and escape spaces)
        [[ -e ${files[0]} ]] && COMPREPLY=( "${files[@]// /\ }" )
    fi
}

_drm4g_conf()
{
    local cur
    cur="${COMP_WORDS[COMP_CWORD]}"

    if [ $COMP_CWORD -eq 2 ]; then
        COMPREPLY=( $( compgen -W 'daemon sched logger' -- $cur) )
    else
        case ${COMP_WORDS[2]} in
            daemon)
            _drm4g_conf_daemon
        ;;
            sched)
            _drm4g_conf_sched
        ;;
            logger)
            _drm4g_conf_logger
        ;;
        esac

    fi
}

_drm4g_conf_daemon()
{
    local cur
    cur="${COMP_WORDS[COMP_CWORD]}"

    if [ $COMP_CWORD -ge 3 ]; then
        COMPREPLY=( $( compgen -W '--dbg' -- $cur) )
    fi
}

_drm4g_conf_sched()
{
    local cur
    cur="${COMP_WORDS[COMP_CWORD]}"

    if [ $COMP_CWORD -ge 3 ]; then
        COMPREPLY=( $( compgen -W '--dbg' -- $cur) )
    fi
}

_drm4g_conf_logger()
{
    local cur
    cur="${COMP_WORDS[COMP_CWORD]}"

    if [ $COMP_CWORD -ge 3 ]; then
        COMPREPLY=( $( compgen -W '--dbg' -- $cur) )
    fi
}

_drm4g_id()
{
    local cur
    cur="${COMP_WORDS[COMP_CWORD]}"

    if [ $COMP_CWORD -eq 3 ]; then
        COMPREPLY=( $( compgen -W 'info init delete' -- $cur) )
    else
        case ${COMP_WORDS[3]} in
            info)
            _drm4g_id_info
        ;;
            init)
            _drm4g_id_init
        ;;
            delete)
            _drm4g_id_delete
        ;;
        esac

    fi
}

_drm4g_id_info()
{
    local cur
    cur="${COMP_WORDS[COMP_CWORD]}"

    if [ $COMP_CWORD -ge 4 ]; then
        COMPREPLY=( $( compgen -W '--dbg' -- $cur) )
    fi
}

_drm4g_id_init()
{
    local cur
    cur="${COMP_WORDS[COMP_CWORD]}"

    if [ $COMP_CWORD -ge 4 ]; then
        COMPREPLY=( $( compgen -W '--dbg -l= --lifetime=' -- $cur) )
    fi
}

_drm4g_id_delete()
{
    local cur
    cur="${COMP_WORDS[COMP_CWORD]}"

    if [ $COMP_CWORD -ge 4 ]; then
        COMPREPLY=( $( compgen -W '--dbg' -- $cur) )
    fi
}

_drm4g_restart()
{
    local cur
    cur="${COMP_WORDS[COMP_CWORD]}"

    if [ $COMP_CWORD -ge 2 ]; then
        COMPREPLY=( $( compgen -W '--dbg' -- $cur) )
    fi
}

complete -F _drm4g drm4g
