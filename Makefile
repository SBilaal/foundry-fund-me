-include .env
build:
	forge build
despolia:
	forge script script/DeployFundMe.s.sol:DeployFundMe --rpc-url $(S_RPC_URL) --private-key $(S_PRIVATE_KEY) --broadcast --verify --etherscan-api-key $(ETHERSCAN_KEY) -vvvv