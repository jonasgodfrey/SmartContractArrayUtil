// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// The target contract with state variables
contract TargetContract {
    uint256 public data;

    function setData(uint256 _data) external {
        data = _data;
    }
}

// The interacting contract
contract InteractingContract {
    address public targetContractAddress;
    
    constructor(address _targetContractAddress) {
        targetContractAddress = _targetContractAddress;
    }

    // Function to update the data variable in the target contract using delegate call
    function updateData(uint256 _newData) external {
        (bool success, ) = targetContractAddress.delegatecall(
            abi.encodeWithSignature("setData(uint256)", _newData)
        );
        
        require(success, "Delegate call failed");
    }
}
