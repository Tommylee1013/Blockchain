// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ERC20StdToken {
    mapping(address => uint256) balances;
    mapping(address => mapping(address => uint256)) allowed; // allowed[key][key]

    uint256 private total;
    string public name;
    string public symbol;
    uint8 public decimals;

    event Transfer(address indexed from, 
                   address indexed to, 
                   uint256 value); // indexed는 meta data처럼 사용

    event Approval(address indexed owner, 
                   address indexed spender, 
                   uint256 value);

    constructor (string memory _name, 
                 string memory _symbol, 
                 uint _totalSupply)
                 {
            total = _totalSupply;
            name = _name;
            symbol = _symbol;
            decimals = 0;
            balances[msg.sender] = _totalSupply;
            emit Transfer(address(0x0), msg.sender, _totalSupply);
        }
    
    function totalSupply()
        public 
        view 
        returns(uint256) {
            return total;
        }
    
    function balanceOf(address _owner)
        public 
        view 
        returns(uint256 balance) {
            return balances[_owner];
        }
    
    function allowance(address _owner,
                       address _spender)
        public 
        view 
        returns(uint256 remaining) {
            return allowed[_owner][_spender];
        }
    
    function transfer(address _to,
                      uint256 _value)
        public 
        returns(bool success) {
            require(_value <= balances[msg.sender], "Error : you need to have much more balances");
            if ((balances[_to] + _value) >= balances[_to]) {
                balances[msg.sender] -= _value; // 보내는 쪽은 차감한다
                balances[_to] += _value; // 받는 쪽은 더해준다
                emit Transfer(msg.sender, _to, _value);
                return true;
            } else {
                return false;
            }
        }
    
    function transferFrom(address _from,
                          address _to,
                          uint256 _value)
        public 
        returns(bool success) {
            require(_value <= balances[_from] && allowed[_from][msg.sender] >= _value, "Error");
            if ((balances[_to] + _value) >= balances[_to]) {
                balances[_to] += _value;
                balances[_from] -= _value;
                allowed[_from][msg.sender] -= _value;
                emit Transfer(_from, _to, _value);
                return true;
            } else {
                return false;
            }
        }
    
    function approve(address _spender,
                     uint256 _value)
        public 
        returns(bool success){
            allowed[msg.sender][_spender] = _value;
            emit Approval(msg.sender, _spender, _value);
            return true;
        }
}