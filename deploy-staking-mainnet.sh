#!/bin/bash
set -e

REPL=$(cat <<-END
const accountId = "alantests.near";
const contractName = "generic-cli.near";
const fs = require('fs');
const account = await near.account(accountId);
const code = fs.readFileSync("res/sputnik_staking.wasm");
account.signAndSendTransaction(
    contractName,
    [
        nearAPI.transactions.functionCall("store", code, 20000000000000, "10000000000000000000000000"),
    ]);
END
)
echo $REPL | near repl