# singles
alias s='sync'
alias ct='connect-to'
alias ip="ifconfig | grep 'inet addr:192.168' | cut -d ':' -f2 | cut -d ' ' -f1"
alias sqldeveloper='~mschober/apps/sqldeveloper/sqldeveloper/bin/sqldeveloper'
alias grep='grep --color=always'
#
# === VirtualBox ===
#alias dbstart='nohup VBoxHeadless --startvm "Oracle11g32" &> /dev/null &'
alias dbshut='VBoxManage controlvm Oracle11g32 poweroff'

# === Reset DW ===
alias reset-dw='unset JAVA_HOME; cd ~/cj/perforce/personal/calbright/cjo/main/database; ant -f devdb.xml initdb-dw'
alias view-reset-dw='unset JAVA_HOME; cd ~/cj/perforce/personal/calbright/cjo/main/database; ant -f devdb.xml -p'

# === Places ===
alias kata='cd ~/cj/perforce/personal/mschober/kata/robocode'
alias main='cd ~/cj/perforce/cjo/main'
alias personal-git='cd $PERSONAL_GIT'
alias personal='cd $PERSONAL'
alias bugfix='cd ~/cj/perforce/cjo/bugfix'
alias chris='cd ~/cj/perforce/personal/calbright/cjo/main'
alias wad='cd ~/cj/perforce/personal/wad/main'
alias chris-git='cd ~/cj/git-area/personal/calbright/cjo/main'
alias ofive='cd ~/perforce/cj/cjo/2011.deployments/cjo2011.05'
alias scripts='cd ~/perfoce/software/bin'
alias hdfs='cd ~/cj/pig_experiments'
alias team='cd ~/cj/git-area/personal/calbright/cjo/main'
alias software='cd ~/cj/perforce/software'
alias traffic='cd hadoop-dw/src/main/pig/traffic'

# === Build ===
alias build='mvn clean install -Pft'
alias bd='Build_stale_dependents'
alias bu='Build_stale_dependencies'
#alias bdw='mvn clean install -Pdw'

# === Operations ===
alias ll='ls -la | grep ^l | grep "\->"'
alias bin-look='ls ~/bin'
alias wt='watchTest'
alias br='become-rob'
alias dev='local_devdb'
alias bin-files='find ~/bin'
alias stopEclipse='ps -e | grep "\(STS\|java\)"'
alias pdrive='smb://CORP%5Cmschober@sb-fs01.corp.valueclick.com/Public'
alias sqlplus='rlwrap sqlplus'
alias set-p4Client-mike='cp ~/.mike-client ~/.p4config'
alias set-p4Client-robocode='cp ~/.robocode-client ~/.p4config'
alias notes=' ~/cj/cj-docs/notes/howto.note'
alias dep-top='mvn dependency:tree  | grep "\[INFO\] +"'
alias used='du -h --max-depth=1'
alias mock-examples='ack-grep "\[.*.\]" member/* --groovy'
alias ticket='use python or groovy, and access the DOM to .get the div'
alias edit-commit='git rebase -i HEAD~2'
alias vim='vim --servername DEV'
alias gp='git-p4'
alias fn='findname -i'
alias cs='count-star'


# === Filters ===
alias ref='find . | grep -v "target"'
alias ref-main='find . | grep -v "target" | grep -v "src/test"'
alias ref-test='find . | grep -v "target" | grep -v "src/main"'
alias ref-test-class='find target | grep -v "target/classes"' 
alias ref-main-class='find target | grep -v "target/test-classes"' 
alias ref-class='find target' 
alias ref-jar='find . | grep -v "src/main" | grep -v "src/test" | grep jar'

# === Shell Accounts ===
alias zerbat='ssh-add; ssh -D 8001 zerbat.com'
alias ssh-alias-devdb='ssh-add; ssh -X oracle@localhost -p 2222'
alias ssh-alias-mn102='ssh-add; ssh mn102.wl.cj.com'
alias ssh-alias-busimp102='ssh-add; ssh busimp102.wl.cj.com'
alias ssh-alias-name101='ssh-add; ssh name101.hadoop.wl.cj.com'

# === Alias Ops ===
alias alias-edit='vim ~/.bash_aliases'
alias alias-build='source ~/.bash_aliases'
alias alias-view='cat ~/.bash_aliases'

# === Dev Environment ===
alias idea='idea.sh'
alias eclipse='eclipse &'
alias squirrel='squirrel &'
alias ut='nice Build_stale_dependents'
alias submit='p4 submit -d "No Issue: Integration From Main"'
alias p4SyncPersonal='p4 sync //cj/personal/mschober/main/...'
alias home-dev='cd ~mschober/3706b/technical/development'

# === Sandboxes ===
alias sandbox='cd ~/sandbox'
alias haskell-sandbox='cd ~/sandbox/haskell'

# === Games ===
alias starcraft='wine ~/.wine/drive_c/Program\ Files/Starcraft/StarCraft.exe' #  $ xinit -e '/usr/bin/wine ~/.wine/drive_c/Programme/Starcraft/StarCraft.exe' -- :1
alias baldursgate='wine /media/games/bg/bg1/autorun.exe'

# === stty Help ===
alias stty-view='stty -a'
alias stty-set-intr='echo stty intr (arg)'

# === temp ===
alias view-query='cat /home/mschober/cj/git-area/personal/mschober/main/performancereporting/src/main/resources/cj/performancereporting/dao/publisher/ByPublisherDayOverDayTotalsQuery.sql'
alias vim-query='vim /home/mschober/cj/git-area/personal/mschober/main/performancereporting/src/main/resources/cj/performancereporting/dao/publisher/ByPublisherDayOverDayTotalsQuery.sql'
alias copy-query='`view-query | parcellite`'

alias cjCompile='mvn cj:build-stale-dependents -Dgoals=clean,install,-Ddelta.skip=true,-Dcleanup.skip=true -Ddelta.skip=true -Dadd.folders=common-test -DskipTests=true'

