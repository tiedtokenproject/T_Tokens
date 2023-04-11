// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract pToken is ERC20 {
		constructor() ERC20("Tied Token Project", "TTP") {
    }

    uint price = 1;

    // @dev Set price of tokens
    //
    // @param _price Price of token
    function setPrice (uint _price) public {
        price = _price;
        emit SetPrice(price);
    }

    // @dev Get price of tokens
    //
    function getPrice() public view returns (uint) {
        return price;
    }

    // @dev Get price of tokens (another version)
    //
    function getTokenPrice() public view returns (uint) {
        return price;
    }

    // @dev Return decimals
    //
    function decimals() public view virtual override returns (uint8) {
        return 6;
    }    

    // @dev Issue a new amount of tokens
    // these tokens are deposited into the owner address
    //
    // @param _amount Number of tokens to be issued
    function issue(uint amount) public {
        _mint(msg.sender, amount * (10 ** uint256(decimals())));
    }

    // @dev Redeem tokens
    // These tokens are withdrawn from the owner address
    // if the balance must be enough to cover the redeem
    // or the call will fail.
    // @param _amount Number of tokens to be issued
    function redeem(uint amount) public {
 		_burn(msg.sender, amount);
    }

    event SetPrice(uint _price);
}