#!/bin/bash


# Verificar si se proporcionan argumentos
usage() {
    echo "Use: "
    echo "	$(basename $0) status"
    echo "	$(basename $0) restart"
    echo "	$(basename $0) stop"
    echo "	$(basename $0) start"
}

DAEMON="amule-daemon"

if [ $# -eq 0 ]; then
        ORDER="status"
else
        ORDER=$(echo $1 |  tr [:upper:] [:lower:])
fi

ORDER=$(echo $1 |  tr [:upper:] [:lower:])

case $ORDER in
	"status") 
		service $DAEMON status
		exit 0
		;;
	"restart") 
		service $DAEMON restart
		exit 0
		;;
	"start") 
		service $DAEMON start
		exit 0
		;;
	"stop") 
		service $DAEMON stop
		exit 0
		;;
	
	*)
		echo "<$ORDER> option invalid"
		usage
		exit 1
		;;
esac

