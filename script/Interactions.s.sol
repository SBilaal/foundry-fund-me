// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity 0.8.19;

import {Script, console} from "forge-std/Script.sol";
import {DevOpsTools} from "lib/foundry-devops/src/DevOpsTools.sol";
import {FundMe} from "../src/FundMe.sol";

contract FundFundMe is Script {
    uint256 constant SEND_VALUE = 0.01 ether;

    function fundFundMe(address mostRecentlyDeployedAddress) public {
        vm.startBroadcast();
        FundMe(payable(mostRecentlyDeployedAddress)).fund{value: SEND_VALUE}();
        vm.stopBroadcast();
        console.log("Funded FundMe with %s", SEND_VALUE);
    }
    
    function run() external {
        address mostRecentlyDeplyoyed = DevOpsTools.get_most_recent_deployment("FundMe", block.chainid);
        fundFundMe(mostRecentlyDeplyoyed);
    }
}

contract WithdrawFundMe is Script {
    uint256 constant SEND_VALUE = 0.01 ether;

    function withdrawFundMe(address mostRecentlyDeployedAddress) public {
        vm.startBroadcast();
        FundMe(payable(mostRecentlyDeployedAddress)).withdraw();
        vm.stopBroadcast();
        console.log("Withdrew from FundMe");
    }
    
    function run() external {
        address mostRecentlyDeplyoyed = DevOpsTools.get_most_recent_deployment("FundMe", block.chainid);
        withdrawFundMe(mostRecentlyDeplyoyed);
    }
}
