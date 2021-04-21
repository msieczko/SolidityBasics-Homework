// SPDX-License-Identifier: MIT

pragma solidity ^0.8.3;

import "./IterableMap.sol";

contract Homework {
    IterableMap map = new IterableMap();

    event DisplayValue(uint value);

    function iterateOverMap() public
    {
        uint numElements = map.length();

        for(uint i=0; i<numElements; i++)
        {
            emit DisplayValue(map.at(i));
        }
    }

    function set(address _key, uint _value) public
    {
        map.set(_key,_value);
    }

    function get(address _key) public view returns(uint)
    {
        return map.get(_key);
    }

    function length() public view returns (uint)
    {
        return map.length();
    }

    function at(uint _index) public view returns (uint)
    {
        return map.at(_index);
    }

    function getIndex(address _key) public view returns (uint)
    {
        return map.getIndex(_key);
    }
}
