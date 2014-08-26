#!/bin/bash
    echo "Starting dogecoind"
    dogecoin/src/./dogecoind
    echo "Starting P2Pool"
    p2pool/run_p2pool.py --give-author 0 --net dogecoin dogecoinrpc 4Z3uvSaMgrGqazzixCnz68Ymgiwqyt45W6oyne3ksPrV --fee 1.0 --address DFsJtx8YCVd8fuWj5GFijYcg3RfvZnDd7v
