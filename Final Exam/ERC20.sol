// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.0;

contract ERC20Token {
    mapping (address => uint256) balances; // 각 계정이 소유한 토큰 수 저장
    mapping (address => mapping(address => uint256)) allowed; // 각 계정이 다른 계정들이 대리 전송할 수 있도록 허용한 토큰 수 저장
    uint256 private total; // 총 발생 토큰 수
    string public name;
    string public symbol;
    uint8 public decimals;

    event Transfer(
        address indexed from,
        address indexed to,
        uint256 value
    );

    event Approval(
        address indexed owner,
        address indexed spender,
        uint256 value
    );

    constructor(
        string memory _name,
        string memory _symbol,
        uint _totalSupply
    ) {
        total = _totalSupply;
        name = _name;
        symbol = _symbol;
        decimals = 0;
        balances[msg.sender] = _totalSupply; // 모든 token을 배포자가 소유한다
        emit Transfer(
            address(0x0), 
            msg.sender, 
            _totalSupply
        );
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
        returns(uint256 balance){
            return balances[_owner];
        }
    
    function allowance(
        address _owner,
        address _spender
    )   public 
        view 
        returns(uint256 remaining) {
            return allowed[_owner][_spender];
        }
    
    function transfer(
        address _to,
        uint256 _value
    )   public 
        returns(bool success) {
            require(_value <= balances[msg.sender], "Error : Transaction failed. check your balances");
            if ((balances[_to] + _value) >= balances[_to]) {
                balances[msg.sender] -= _value;
                balances[_to] += _value;
                emit Transfer(msg.sender, _to, _value);
                return true;
            } else {
                return false;
            }
        }
    
    function transferFrom(
        address _from,
        address _to,
        uint256 _value
    )   public 
        returns (bool success) {
            require(
                _value <= balances[_from] && _value <= allowed[_from][msg.sender], 
                "Error : Transaction failed. check your allowances"
            );
            if ((balances[_to] + _value) >= balances[_to]) { // overflow 방지책인듯 하다
                balances[_from] -= _value;
                balances[_to] += _value;
                allowed[_from][msg.sender] -= _value;
                emit Transfer(_from, _to, _value);
                return true;
            } else {
                return false;
            }
        }
    
    function approve(
        address _spender,
        uint256 _value
    )   public 
        returns(bool success) {
            if ((allowed[msg.sender][_spender] + _value) > allowed[msg.sender][_spender]){
                allowed[msg.sender][_spender] += _value;
                emit Approval(msg.sender, _spender, _value);
                return true;
            } else {
                return false;
            }
        }
}