// SPDX-License-Identifier: MIT

pragma solidity ^0.8.3;

interface IterableMappingAddressUint {
    function set(address _key, uint _value) external;
    function get(address _key) external returns (uint);
    function length() external returns (uint);
    function at(uint _index) external returns (uint);
    function getIndex(address _key) external returns (uint);
}
