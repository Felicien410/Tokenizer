// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract Uranium42 is ERC20, Ownable {
    uint256 private _maxSupply;
    bool public mintingFinished = false;
    uint8 private _decimals;

    event MintingFinished();
    event TokensMinted(address indexed to, uint256 amount);
    event TokensBurned(address indexed from, uint256 amount);

    constructor(uint256 initialSupply) 
        ERC20("Uranium42", "U42") 
        Ownable(msg.sender)  
    {
        _decimals = 18;
        _maxSupply = 42000 * 10**_decimals;
        _mint(msg.sender, initialSupply * 10**_decimals);
    }

    function decimals() public view virtual override returns (uint8) {
        return _decimals;
    }

    function mint(address to, uint256 amount) public onlyOwner {
        require(!mintingFinished, "Minting is finished");
        require(totalSupply() + amount <= _maxSupply, "Would exceed max supply");
        _mint(to, amount);
        emit TokensMinted(to, amount);
    }

    function burn(uint256 amount) public {
        _burn(msg.sender, amount);
        emit TokensBurned(msg.sender, amount);
    }

    function finishMinting() public onlyOwner {
        mintingFinished = true;
        emit MintingFinished();
    }

    function maxSupply() public view returns (uint256) {
        return _maxSupply;
    }
}