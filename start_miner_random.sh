#!/bin/bash

# Buat angka acak 3 digit
WORKER_NUMBER=$(shuf -i 100-999 -n 1)

# Format nama worker
WORKER_NAME="Worker${WORKER_NUMBER}"

# Jalankan miner dengan nama worker yang tergenerate
pm2 start /root/iniminer-linux-x64 --name iniminer --no-daemon -- --pool "stratum+tcp://0x74c1dabf09386bbb94dd1c46ac950ab754b0839b.$WORKER_NAME@pool-core-testnet.inichain.com:32672" --cpu-devices 1
pm2 startup
pm2 save
pm2 list
