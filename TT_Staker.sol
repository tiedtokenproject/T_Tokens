// SPDX-License-Identifier: MIT

pragma solidity ^0.8;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract TT_Staker is Ownable {
    IERC20 public stakingToken;

    uint private _totalSupply;
    mapping(address => uint) private _balances;

    constructor() {
//        stakingToken = IERC20(0xE06c3CABDC1011426a65a0718A0C7c4410840550);
    }

	//************************************************************************
  //***                  Received tokens processing                      ***
	//************************************************************************
	function receiveToken() {
	
	}

    function stake(uint _amount) public {
        _totalSupply += _amount;
        _balances[msg.sender] += _amount;
        stakingToken.transferFrom(msg.sender, address(this), _amount);
        emit Staked(msg.sender, _amount);
    }

    function withdraw(uint _amount) public {
        _totalSupply -= _amount;
        _balances[msg.sender] -= _amount;
        stakingToken.transfer(msg.sender, _amount);
        emit Withdrawn(msg.sender, _amount);
    }

    event Staked(address indexed user, uint256 amount);
    event Withdrawn(address indexed user, uint256 amount);
}
