#!/usr/bin/env zsh

if [ -x "$(command which svn)" ]; then
  alias svs='svn status'
  alias sa='svn add'
  alias sci='svn ci -m'
  alias sco='svn co'
  alias sup='svn up'
  alias scu='svn cleanup'
  alias sli='svn list'
  alias sdel='svn delete'
  alias sdif='svn diff'
  alias slog='svn log'
  alias smv='svn move'
  rm_svn() {
    # about 'remove ".svn" files from directory'
    # param '1: directory to search for files'
    # group 'svn'
    if [ -z "$1" ]; then
      reference rm_svn
      return
    fi
    find $1 -name .svn -print0 | xargs -0 rm -rf
  }
  svn_add() {
    # about 'add to svn repo'
    # group 'svn'
    svn status | grep '^\?' | sed -e 's/? *//' | sed -e 's/ /\ /g' | xargs svn add
  }
fi
