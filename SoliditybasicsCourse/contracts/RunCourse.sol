// SPDX-License-Identifier: UNLICENSED

pragma solidity 0.8.3;

import {thisContract} from "./OverrideCourse.sol";
import {InterfaceContract} from "./interfaces/CourseInterfaces.sol";

contract RunContract {
    InterfaceContract contractInterface = new thisContract();

    function setInterface(uint256 key, uint256 value) external {
        return contractInterface.set(key, value);
    }

    function getInterface(uint256 key) external view returns (uint256) {
        return contractInterface.get(key);
    }

    function lengthInterface() external view returns (uint256) {
        return contractInterface.length();
    }

    function atInterface(uint256 index) external view returns (uint256) {
        return contractInterface.at(index);
    }
}
