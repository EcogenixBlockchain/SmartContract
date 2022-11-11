// SPDX-License-Identifier: UNLICENSED

pragma solidity 0.8.16;

import "@openzeppelin/contracts/security/Pausable.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract Ecogenix is ERC20Burnable, Pausable, Ownable {
    constructor(
        address supplyHolder,
        address _owner,
        uint256 _supply
    ) ERC20("Ecogenix", "ECG") {
        _mint(supplyHolder, _supply);
        transferOwnership(_owner);
    }

    function pause() external onlyOwner {
        _pause();
    }

    function unpause() external onlyOwner {
        _unpause();
    }

    function _transfer(
        address from,
        address to,
        uint256 amount
    ) internal override whenNotPaused {
        super._transfer(from, to, amount);
    }
}
