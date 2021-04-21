// SPDX-License-Identifier: UNLICENSED

pragma solidity 0.8.3;

import {InterfaceContract} from "./interfaces/CourseInterfaces.sol";

contract thisContract is InterfaceContract {
    uint256[] valueArray;
    mapping(uint256 => uint256) mappingAll;

    function set(uint256 key, uint256 value) external override {
        require(mappingAll[key] == 0);
        mappingAll[key] = value;
        valueArray.push(value);
    }

    function get(uint256 key) external view override returns (uint256) {
        return mappingAll[key];
    }

    function length() external view override returns (uint256) {
        return valueArray.length;
    }

    function at(uint256 index) external view override returns (uint256) {
        return valueArray[index];
    }
}
