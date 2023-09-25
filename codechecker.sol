// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CodeChecker {
    //function to check for code availability
    function hasCode(address target) external view returns (bool) {
        uint256 size;
        assembly {
            size := extcodesize(target)
        }
        return size > 0;
    }
}
