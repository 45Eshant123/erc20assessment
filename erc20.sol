// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./IERC20.sol";
import "../../utils/Context.sol";

contract My_Token is Context, IERC20 {
    mapping(address => uint256) private _Balances;
    mapping(address => mapping(address => uint256)) private _allowing;

    uint256 private _total_Supply;
    string private _NAAM_;
    string private _LOGO_;
    address private _OWNER_;

    modifier only_Owner() {
        require(_OWNER_ == _msgSender(), "Ownable caller is definitely not the owner.");
        _;
    }

    constructor(string memory name_, string memory symbol_, uint256 initialSupply) {
        _NAAM_ = name_;
        _LOGO_ = symbol_;
        _OWNER_ = _msgSender();
        _mint(_OWNER_, initialSupply);
    }

    // Required functions only
    function transfer(address RECI, uint256 AMOUNT) public override returns (bool) {
        _transfer(_msgSender(), RECI, AMOUNT);
        return true;
    }

    function burn(uint256 amount) public returns (bool) {
        _burn(_msgSender(), amount);
        return true;
    }

    function mint(address account, uint256 amount) public only_Owner returns (bool) {
        _mint(account, amount);
        return true;
    }

    function totalSupply() public view override returns (uint256) {
        return _total_Supply;
    }

    function balanceOf(address account) public view override returns (uint256) {
        return _Balances[account];
    }

    function allowance(address owner, address spender) public view override returns (uint256) {
        return _allowing[owner][spender];
    }

    function approve(address spender, uint256 amount) public override returns (bool) {
        _approving(_msgSender(), spender, amount);
        return true;
    }

    function transferFrom(address sender, address recipient, uint256 amount) public override returns (bool) {
        _transfer(sender, recipient, amount);
        uint256 currentAllowance = _allowing[sender][_msgSender()];
        require(currentAllowance >= amount, "The transfer amount for ERC20 exceeds the allowed limit.");
        _approving(sender, _msgSender(), currentAllowance - amount);
        return true;
    }

    function _transfer(address sender, address recipient, uint256 amount) internal {
        require(sender != address(0), "ERC20 --> transfer from the zero address");
        require(recipient != address(0), "ERC20 --> transfer to the zero address");
        uint256 senderBalance = _Balances[sender];
        require(senderBalance >= amount, "ERC20 --> transfer amount exceeds balance");
        _Balances[sender] = senderBalance - amount;
        _Balances[recipient] += amount;
        emit Transfer(sender, recipient, amount);
    }

    function _mint(address account, uint256 amount) internal {
        require(account != address(0), "ERC20 --> mint to the zero address");
        _total_Supply = _total_Supply + amount;
        _Balances[account] += amount;
        emit Transfer(address(0), account, amount);
    }

    function _burn(address account, uint256 amount) internal {
        require(account != address(0), "ERC20 --> burn from the zero address");
        uint256 accountBalance = _Balances[account];
        require(accountBalance >= amount, "ERC20 --> burn amount exceeds balance");
        _Balances[account] = accountBalance - amount;
        _total_Supply = _total_Supply - amount;
        emit Transfer(account, address(0), amount);
    }

    function _approving(address owner, address spender, uint256 amount) internal {
        require(owner != address(0), "ERC20 --> approve from the zero address");
        require(spender != address(0), "ERC20 --> approve to the zero address");
        _allowing[owner][spender] = amount;
        emit Approval(owner, spender, amount);
    }
}
