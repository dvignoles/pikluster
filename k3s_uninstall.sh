#! /bin/bash

export SERVER_IP=192.168.50.101
export AGENT1=192.168.50.103
export AGENT2=192.168.50.105
export AGENT3=192.168.50.107

uninstall_agent () {
    ssh pi@$1 "/usr/local/bin/k3s-agent-uninstall.sh"
}

uninstall_server() {
    ssh pi@$1 "/usr/local/bin/k3s-uninstall.sh"
}

uninstall_agent $AGENT3
uninstall_agent $AGENT2
uninstall_agent $AGENT1
uninstall_server $SERVER_IP
