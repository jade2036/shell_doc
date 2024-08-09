export CLICOLOR=1
# export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.7.0_80.jdk/Contents/Home/
# export CLASSPAHT=.:$JAVA_HOME/lib/dt.jar:$JAVA_HOME/lib/tools.jar
# export PATH=$JAVA_HOME/bin:$PATH:
# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

if [ -f ~/.gitbash/git-completion.bash ];then
    source ~/.gitbash/git-completion.bash
fi

if [ -f ~/.gitbash/git-prompt.sh ];then
    source ~/.gitbash/git-prompt.sh
fi

export GIT_PS1_SHOWDIRTYSTATE=1
export GIT_PS1_SHOWCOLORHINTS=true
# export PS1='\w$(__git_ps1) " (%s)"\$ '
# export PS1='[\u@\h \W$(__git_ps1 " (%s)")]\$ '
export PS1='[\u@\h:\w$(__git_ps1 "(\[\e[32m\]%s"\[\e[0m\]\))]\$ '


