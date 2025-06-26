pragma solidity ^0.8.0

contract MyToken {

    string public name = "MyToken";
    string public symbol = "MTK";

    mapping(address => unit256) public balanceOf;
    event Transfer(address indexed from, address indexed to, unit256 value);

    constructor(unit256 initialSupply) {
        balanceOf[msg.sender] = initialSupply;
    }

    function transfer(address _to, unit256 _value) public returns (bool success) {
        require(balanceOf[msg.sender] >= _value, "Insufficient balance");


        balanceOf[msg.sender] -= _value;
        balanceOf[_to] += _value;
        emit Transfer(msg.sender, _to, _value);
        return true;
    }
}
