// SPDX-License-Identifier: UNLICENSED

pragma solidity 0.8.3;

interface InterfaceContract {
    function set(uint256 key, uint256 value) external;

    function get(uint256 key) external view returns (uint256);

    function length() external view returns (uint256);

    function at(uint256 index) external view returns (uint256);
}
