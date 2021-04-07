// SPDX-License-Identifier: UNLICENSED

pragma solidity 0.7.3;

interface InterfaceContract {
    function set(uint256 key, uint256 value) external;

    function get(uint256 key) external view returns (uint256);

    function length() external view returns (uint256);

    function at(uint256 index) external view returns (uint256);
}

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
