// SPDX-License-Identifier: MIT

pragma solidity ^0.7.0;

import "./AccessControl.sol";

contract Roles is AccessControl {

    bytes32 public constant MINTER_ROLE = keccak256("MINTER_ROLE");

    constructor () {
        _setupRole(DEFAULT_ADMIN_ROLE, _msgSender());
        // _setupRole(MINTER_ROLE, _msgSender());
    }

    modifier onlyMinter() {
        require(hasRole(MINTER_ROLE, _msgSender()), "Roles: caller does not have the MINTER role");
        _;
    }
    
    modifier onlyAdmin() {
        require(hasRole(DEFAULT_ADMIN_ROLE, _msgSender()), "Roles: caller does not have the ADMIN role");
        _;
    }
}
