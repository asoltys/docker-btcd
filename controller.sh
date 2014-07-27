#!/bin/bash

cmd=$1
shift

case $cmd in
   shell)
      sh -c "$*"
      exit $?
      ;;
   login)
      bash -l
      exit $?
      ;;
   init)
      exit 0
      ;;
   btcd)
      btcd "$@"
      exit $?
      ;;
   log)
      tail -f $HOME/.btcd/logs/debug.log
      ;;
   getconfig)
      cat $HOME/.btcd/btcd.conf
      ;;
   *)
      echo "Unknown cmd $cmd"
      exit 1
esac
