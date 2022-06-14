// SPDX-License-Identifier: AGPL-3.0-only
pragma solidity 0.8.11;

import {ERC20} from "solmate/tokens/ERC20.sol";
import {Auth, Authority} from "solmate/auth/Auth.sol";
import {Bytes32AddressLib} from "solmate/utils/Bytes32AddressLib.sol";

import {License} from "./License.sol";
import {AuthorityModule} from "./AuthorityModule.sol";
import {AccessToken} from "./AccessToken.sol";


/// @title Combined Factory
/// @author 
/// @notice Factory which enables deploying a Vault for any ERC20 token.
contract Factory is Auth {
    using Bytes32AddressLib for address;
    using Bytes32AddressLib for bytes32;


    /*///////////////////////////////////////////////////////////////
                               CONSTRUCTOR
    //////////////////////////////////////////////////////////////*/

    /// @notice Creates a Factory.
    /// @param _owner The owner of the factory.
    /// @param _authority The Authority of the factory.
    constructor(address _owner, Authority _authority) Auth(_owner, _authority) {}

    /*///////////////////////////////////////////////////////////////
                            CONTRACT DEPLOYMENT 
    //////////////////////////////////////////////////////////////*/

    event AuthorityModuleDeployed(AuthorityModule authorityModule); 

    event LicenseDeployed(License license);

    event AccessTokenDeployed(AccessToken accessToken); 

    License license;
    AuthorityModule authorityModule;
    AccessToken accessToken;

    function deployLicense (string memory name, string memory symbol, string memory baseURI, uint256 expiryTime, uint256 maxSupply, uint256 price) external returns (License) {
      license = new License(name, symbol, baseURI, expiryTime, maxSupply, price); 
      emit LicenseDeployed(license);
      return (license);
    }

    function deployAuthorityModule () external returns (AuthorityModule) {
      authorityModule = new AuthorityModule(msg.sender, license);
      emit AuthorityModuleDeployed(authorityModule);
      return (authorityModule);
    }

    function deployAccessToken (string memory name, string memory symbol, string memory baseURI, uint256 expiryTime, uint256 maxSupply, uint256 price) external returns (AccessToken) {
      accessToken = new AccessToken(name, symbol, baseURI, expiryTime, maxSupply, price, authorityModule); 
      emit AccessTokenDeployed(accessToken);
      return (accessToken);
    }
}
