#!/bin/bash

./build.sh && \
export NEAR_ACCT=challenge7-voting1.3ugen.testnet && \
near delete $NEAR_ACCT 3ugen.testnet && \
sleep 1 && \
near create-account $NEAR_ACCT --masterAccount 3ugen.testnet --initialBalance 10 && \
sleep 1 && \
near deploy $NEAR_ACCT --wasmFile ./res/challenge7_voting.wasm && \
sleep 1 && \
echo "!!! call init contract" && \
near call $NEAR_ACCT new '{"proposal_names": ["alice", "bob", "eva"]}' --accountId 3ugen.testnet && \
sleep 1 && \
echo "!!! call get_number" && \
near view $NEAR_ACCT winning_proposal && \
#echo "!!! call give_right_to_vote" && \
#near call $NEAR_ACCT give_right_to_vote '{
#  "voter_id": "3ugen-faucet2.testnet"
#}' --accountId 3ugen.testnet
sleep 1 && \
echo "!!! call vote" && \
near call $NEAR_ACCT vote '{"proposal_id": "alice"}' --accountId 3ugen.testnet && \
sleep 1 && \
echo "!!! call winning_proposal" && \
near view $NEAR_ACCT winning_proposal
#sleep 1 && \
#echo "!!! call hello [username]" && \
#near call $NEAR_ACCT hello '{
#  "username": "molly"
#}' --accountId 3ugen.testnet



#echo "Keys after"
#near keys $NEAR_ACCT
#near view $NEAR_ACCT get_unsolved_puzzles
#near view $NEAR_ACCT debug_get_puzzle '{"pk": "ed25519:CpqWpFLps6zNNXSwn9ZYgvTgSVQ598fn1kWXgjcA2uLp"}'
