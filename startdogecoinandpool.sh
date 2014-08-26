#!/bin/bash
# /etc/init.d/startdogecoinandpool

### BEGIN INIT INFO
# Provides:          dogecoind
# Required-Start:    $remote_fs $syslog
# Required-Stop:     $remote_fs $syslog
# Default-Start:     2 3 4 5
# Default-Stop:      0 1 6
# Short-Description: Starts the dogecoind daemon
# Description:       dogecoind is the core of dogecoin and manages the blockchain
### END INIT INFO
    echo "Starting dogecoind"
    /home/pi/dogecoin/src/dogecoind
    echo "Starting P2Pool"
    screen -d -m /home/pi/dogecoin/src/dogecoind/p2pool/run_p2pool.py --give-author 0 --net dogecoin dogecoinrpc 4Z3uvSaMgrGqazzixCnz68Ymgiwqyt45W6oyne3ksPrV --fee 1.0 --address DFsJtx8YCVd8fuWj5GFijYcg3RfvZnDd7v

exit 0