// SPDX-License-Identifier: MIT

pragma solidity ^0.8.3;

import "./IterableMappingAddressUint.sol";

contract IterableMap is IterableMappingAddressUint {
    mapping (address => uint) data;
    address[] keys;

    function set(address _key, uint _value) public override
    {
        data[_key] = _value;
        updateKeys(_key);
    }

    function get(address _key) public override view returns (uint)
    {
        return data[_key];
    }

    function length() public override view returns (uint)
    {
        return keys.length;
    }

    function at(uint _index) public override view returns(uint)
    {
        require(keys.length > _index,"Given index is out of range");
        return data[keys[_index]];
    }

    function getIndex(address _key) public override view returns(uint)
    {
        for(uint i=0; i<keys.length; i++)
        {
            if(keys[i] == _key) return i;
        }
        revert("Given address was not set in this mapping");
    }

    function updateKeys(address _key) private onlyUnique(_key)
    {
        keys.push(_key);
    }

    modifier onlyUnique (address _key)
    {
        bool isNotInArray = true;
        for(uint i=0; i<keys.length; i++)
        {
            if(keys[i] == _key) isNotInArray = false;
        }
        if (isNotInArray) _;
    }
}
