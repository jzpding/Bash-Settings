#!/usr/bin/env bash

export __LS_OPTIONS='--color=auto -h'

alias ls='ls $__LS_OPTIONS'
alias ll='ls $__LS_OPTIONS -l'
alias la='ls $__LS_OPTIONS -la'
alias l='ls $__LS_OPTIONS -CF'
alias sl='ls $__LS_OPTIONS'

alias cd..='cd ..'
alias ..='cd ..'
alias ...='cd ../..'

alias bc='bc -l'


alias mkdir='mkdir -p -v'
alias mv='mv -iv'
alias rm='rm -v --preserve-root'

# function checks if the application is installed
function __add_command_replace_alias() {
    if [ -x "`which $2 2>&1`" ]; then
    alias $1=$2
    fi
}

if [ -x "`which most 2>&1`" ]; then
    alias less=most
    export PAGER=most
fi

if [ -x "`which vim 2>&1`" ]; then
    export EDITOR=vim
fi

__add_command_replace_alias tail 'multitail'
__add_command_replace_alias df 'pydf'
__add_command_replace_alias traceroute 'mtr'
__add_command_replace_alias tracepath 'mtr'
__add_command_replace_alias top 'htop'

function allcolors() {
    # credit to http://askubuntu.com/a/279014
    for x in 0 1 4 5 7 8; do
    for i in `seq 30 37`; do
        for a in `seq 40 47`; do
        echo -ne "\e[$x;$i;$a""m\\\e[$x;$i;$a""m\e[0;37;40m "
        done
        echo
    done
    done
    echo ""
}


# Added aliases
alias storage='cd /home/scratch.jacding_sw'
alias storage1='cd /home/scratch.jacding_sw_1'

alias soe='cd /home/scratch.jacding_sw/jacding-ws1/sw/dev/gpu_drv/chips_a/uproc/soe/src'
alias mods='cd /home/scratch.jacding_sw/jacding-ws1/sw/dev/gpu_drv/chips_a/diag/mods'
alias nvswitch='cd /home/scratch.jacding_sw/jacding-ws1/sw/dev/gpu_drv/chips_a/drivers/nvswitch/kernel/'
alias hvalavala='cd /home/scratch.hvalavala_gpu/trees/nvgpu_amap/hw/nvgpu/diag/testgen/switch_sanity_jd/tests/ampere_a_ogtest/00/00/01/000001'

alias qbash='qsub -Is -q o_cpu_16G_4H --projectMode direct -P sw_inf_sw_mods bash'

alias p4review='/home/scratch.jacding_sw/jacding-ws1/sw/main/apps/p4review/p4review.pl'
alias p4review-create='/home/scratch.jacding_sw/jacding-ws1/sw/misc/linux/p4review-create'

# Newer version of emacs
alias emacs='/home/utils/emacs-24.5/bin/emacs'
alias git='/home/utils/git-2.9.1/bin/git'
