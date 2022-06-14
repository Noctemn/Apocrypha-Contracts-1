// // SPDX-License-Identifier: UNLICENSED

// // The BundleTest is old. 
// // This is the test that I am using to build
// pragma solidity 0.8.11;

// // import "ds-test/test.sol";
// import "forge-std/Test.sol";
// import "forge-std/console.sol";

// import "./mocks/MockNFT.sol";



import {Auth} from "solmate/auth/Auth.sol";
import {AccessToken} from "../AccessToken.sol";
import {AuthorityModule} from "../AuthorityModule.sol";
import {License} from "../License.sol";
import {MockERC20} from "solmate/test/utils/mocks/MockERC20.sol";
import {Factory} from "../Factory.sol";
import {Authority} from "solmate/auth/Auth.sol";



// interface CheatCodes {
//     function deal(address who, uint256 newBalance) external;
//     function addr(uint256 privateKey) external returns (address);
//     function warp(uint256) external;    // Set block.timestamp
// }


contract FactoryTest is Test {
    AccessToken accessToken;
    AuthorityModule authorityModule;
    License license;
    MockERC20 token;
    Factory factory;


// contract FactoryTest is Test {
//     AccessToken accessToken;
//     LicenseAuthority licenseAuthority;
//     License license;
//     MockERC20 token;
//     Factory factory;

//     MasterCopyAuthority masterCopyAuthority;

//     CheatCodes cheats = CheatCodes(HEVM_ADDRESS);
//   // HEVM_ADDRESS = 0x7109709ECfa91a80626fF3989D68f67F5b1DD12D

//     address alice = cheats.addr(1);
//     address bob = cheats.addr(2);

    function setUp() public {
      

      // license = new License("GEB", "GEB", "www.google.com"); 
      // hoax(alice);
      /// @notice You've got to deploy the three contracts all at once.
      factory = new Factory(address(alice), Authority(alice));
      (license, authorityModule) = factory.deployLicenseBundle("GEB", "GEB", "www.google.com", 10 days, 100, 1 ether, 69);
      console.log("Set up is successful!");
    }

    function testOwners() public {
    }


    function testLicenseAuthorities() public {
    }
//     // function testPropABC() public {
//     //     license.setAuthority(new MasterCopyAuthority(address(0xBEEF)));
//     //     license.setOwner(address(0));
//     //     assertEq(address(license.authority()), address(0xBEEF));
//     //     startHoax(address(0xBEEF));
//     //     license.updateFlag();
        
//     // }

//     // function testPropCallFunctionWithPermissiveAuthority(
//     //   // address deadOwner
//     //   ) public {
//     //     address deadOwner = address(0);
//     //     // if (deadOwner == address(this)) deadOwner = address(0);
//     //     license.setAuthority(new MasterCopyAuthority(address(0xBEEF)));
//     //     // license.setAuthority(new MockAuthority(true));
//     //     license.setOwner(deadOwner);
//     //     license.updateFlag();
//     // }


//     function testA() public {
//         // license.setAuthority(Authority(address(0xBEEF))); // assertEq works but not updateFlag
//         // license.setAuthority(MasterCopyAuthority(address(0xBEEF))); // assertEq works but not updateFlag
//         console.log("license.authority address: ", address(license.authority()));
//         // console.log("factory.authority address: ", address(factory.authority()));
//         // console.log("license.authority address: ", address(license.authority()));
//         MasterCopyAuthority newMasterCopyAuthority = new MasterCopyAuthority(address(0xBEEF));
//         license.setAuthority(newMasterCopyAuthority);
//         // license.setAuthority(new MasterCopyAuthority(address(0xBEEF)));  // assertEq doesn't work
//         console.log("license.authority address: ", address(license.authority()));
//         console.log("MasterCopyAuthority address:", address(newMasterCopyAuthority));
//         assertEq(address(license.authority()), address(newMasterCopyAuthority));
//         // console.log("this address:", address(this));
//         // console.log("msg.sender is:", msg.sender);
//         // console.log("address of this license is", address(license));
//         // assertEq(address(license.authority()), address(0xBEEF));
//         license.setOwner(address(0));
//         hoax(address(0xBEEF));
//         license.updateFlag();
//         // license.setOwner(address(0));
        
//     }

//     function testB() public {
//       console.log("license.authority address: ", address(license.authority()));
      
//       license.setAuthority(Authority(address(0xBEEF)));
      
//       console.log("license.authority address: ", address(license.authority()));
//       assertEq(address(license.authority()), address(0xBEEF));
//       //  This couldn't work because Authority has no implementation of the CanCall function
//       // So when requiresAuth calls the CanCall function check if something has authority 
//       // It automatically returns false 
//       // So no one has any authority
      
//       // startHoax(address(0xBEEF));
//       // license.setOwner(address(0));
      
//       // license.updateFlag();
//     }

//     // function testBpermissiveAuthority() public {
//     //     license.setAuthority(new MasterCopyAuthority(address(0xBEEF)));
//     //     license.setOwner(address(0));
//     //     license.updateFlag();
        
//     // }
//     // function testB() public {
//     //     license.setAuthority(new MasterCopyAuthority(address(0xBEEF)));
//     //     license.setOwner(address(0));
//     //     license.updateFlag();
        
//     // }



//       function testC() public {
//         license.setAuthority(Authority(address(0xBEEF)));
//         assertEq(address(license.authority()), address(0xBEEF));
//     }
    

//     function testSetOwnerAsOwner() public {
//         license.setOwner(address(0xBEEF));
//         assertEq(license.owner(), address(0xBEEF));
//     }

//     function testSetAuthorityAsOwner() public {
//         license.setAuthority(Authority(address(0xBEEF)));
//         assertEq(address(license.authority()), address(0xBEEF));
//     }

//     function testCallFunctionAsOwner() public {
//         license.updateFlag();
//     }

//     function testSetOwnerWithPermissiveAuthority() public {
//         license.setAuthority(new MockAuthority(true));
//         license.setOwner(address(0));
//         license.setOwner(address(this));
//     }

//     function testSetAuthorityWithPermissiveAuthority() public {
//         license.setAuthority(new MockAuthority(true));
//         license.setOwner(address(0));
//         license.setAuthority(Authority(address(0xBEEF)));
//     }

//     function testCallFunctionWithPermissiveAuthority() public {
//         license.setAuthority(new MockAuthority(true));
//         license.setOwner(address(0));
//         license.updateFlag();
        
//     }

//     function testSetAuthorityAsOwnerWithOutOfOrderAuthority() public {
//         license.setAuthority(new OutOfOrderAuthority());
//         license.setAuthority(new MockAuthority(true));
//     }

//     function testFailSetOwnerAsNonOwner() public {
//         license.setOwner(address(0));
//         license.setOwner(address(0xBEEF));
//     }

//     function testFailSetAuthorityAsNonOwner() public {
//         license.setOwner(address(0));
//         license.setAuthority(Authority(address(0xBEEF)));
//     }

//     function testFailCallFunctionAsNonOwner() public {
//         license.setOwner(address(0));
//         license.updateFlag();
//     }

//     function testFailSetOwnerWithRestrictiveAuthority() public {
//         license.setAuthority(new MockAuthority(false));
//         license.setOwner(address(0));
//         license.setOwner(address(this));
//     }

//     function testFailSetAuthorityWithRestrictiveAuthority() public {
//         license.setAuthority(new MockAuthority(false));
//         license.setOwner(address(0));
//         license.setAuthority(Authority(address(0xBEEF)));
//     }

//     function testFailCallFunctionWithRestrictiveAuthority() public {
//         license.setAuthority(new MockAuthority(false));
//         license.setOwner(address(0));
//         license.updateFlag();
//     }

//     function testFailSetOwnerAsOwnerWithOutOfOrderAuthority() public {
//         license.setAuthority(new OutOfOrderAuthority());
//         license.setOwner(address(0));
//     }

//     function testFailCallFunctionAsOwnerWithOutOfOrderAuthority() public {
//         license.setAuthority(new OutOfOrderAuthority());
//         license.updateFlag();
//     }

//     function testSetOwnerAsOwner(address newOwner) public {
//         license.setOwner(newOwner);
//         assertEq(license.owner(), newOwner);
//     }

//     function testSetAuthorityAsOwner(Authority newAuthority) public {
//         license.setAuthority(newAuthority);
//         assertEq(address(license.authority()), address(newAuthority));
//     }

//     function testSetOwnerWithPermissiveAuthority(address deadOwner, address newOwner) public {
//         if (deadOwner == address(this)) deadOwner = address(0);

//         license.setAuthority(new MockAuthority(true));
//         license.setOwner(deadOwner);
//         license.setOwner(newOwner);
//     }

//     function testSetAuthorityWithPermissiveAuthority(address deadOwner, Authority newAuthority) public {
//         if (deadOwner == address(this)) deadOwner = address(0);

//         license.setAuthority(new MockAuthority(true));
//         license.setOwner(deadOwner);
//         license.setAuthority(newAuthority);
//     }

//     function testCallFunctionWithPermissiveAuthority(address deadOwner) public {
//         if (deadOwner == address(this)) deadOwner = address(0);

//         license.setAuthority(new MockAuthority(true));
//         license.setOwner(deadOwner);
//         license.updateFlag();
//     }

//     function testFailSetOwnerAsNonOwner(address deadOwner, address newOwner) public {
//         if (deadOwner == address(this)) deadOwner = address(0);

//         license.setOwner(deadOwner);
//         license.setOwner(newOwner);
//     }

//     function testFailSetAuthorityAsNonOwner(address deadOwner, Authority newAuthority) public {
//         if (deadOwner == address(this)) deadOwner = address(0);

//         license.setOwner(deadOwner);
//         license.setAuthority(newAuthority);
//     }

//     function testFailCallFunctionAsNonOwner(address deadOwner) public {
//         if (deadOwner == address(this)) deadOwner = address(0);

//         license.setOwner(deadOwner);
//         license.updateFlag();
//     }

//     function testFailSetOwnerWithRestrictiveAuthority(address deadOwner, address newOwner) public {
//         if (deadOwner == address(this)) deadOwner = address(0);

//         license.setAuthority(new MockAuthority(false));
//         license.setOwner(deadOwner);
//         license.setOwner(newOwner);
//     }

//     function testFailSetAuthorityWithRestrictiveAuthority(address deadOwner, Authority newAuthority) public {
//         if (deadOwner == address(this)) deadOwner = address(0);

//         license.setAuthority(new MockAuthority(false));
//         license.setOwner(deadOwner);
//         license.setAuthority(newAuthority);
//     }

//     function testFailCallFunctionWithRestrictiveAuthority(address deadOwner) public {
//         if (deadOwner == address(this)) deadOwner = address(0);

//         license.setAuthority(new MockAuthority(false));
//         license.setOwner(deadOwner);
//         license.updateFlag();
//     }

//     function testFailSetOwnerAsOwnerWithOutOfOrderAuthority(address deadOwner) public {
//         if (deadOwner == address(this)) deadOwner = address(0);

//         license.setAuthority(new OutOfOrderAuthority());
//         license.setOwner(deadOwner);
//     }

    

//     // function testLicenseAuthorities() public {
//       // license.setAuthority(Authority(bob));
//       // console.log(bytes4(keccak256(bytes("setPrice"))));
//       // console.log("alice is authorised:",license.isUserAuthorized(bob, bytes4(keccak256(bytes("setPrice")))));

//       // license.setPrice(3);
    
      
//       // assertEq(address(license.authority()), bob);
      
//       // hoax(bob);
//       // console.log("before setting max supply:", license.getMaxSupply());
//       // license.setMaxSupply(100);
//       // console.log("after setting max supply", license.getMaxSupply());
//       // console.log("license is initialized:",license.getInitialized());
//       // license.initialize();
//       // console.log("license is initialized:",license.getInitialized());


//       // console.log("Before minting, alice has license:",license.hasValidLicense(alice));
      
      
//       // // console.log("token 1 is expired:", license.isExpired(1));
//       // console.log("time now is:", block.timestamp);
      
      
//       // license.setExpiryTime(1000000000);
      
//       // uint256 id = license.mint(7);
//       // console.log("tokenId is:", id);
//       // console.log("the expiry date is now:", license.expiryDate(id));
//       // console.log("token 1 is expired:", license.isExpired(1));
//       // console.log("After minting, alice has license:",license.hasValidLicense(alice));
//       // // console.log(address(license));
      
//       // // console.log(license.isUserAuthorized(alice, 0xa0712d68));
//       // console.log("price used to be:", license.getPrice());
//       // license.setPrice(3);
//       // console.log("price is now:", license.getPrice());
//       // console.log("max supply is:", license.getMaxSupply());
      
//       // license.setMaxSupply(100);
//       // 
//       // console.log("max supply is:", license.getMaxSupply());
      
//       // 
//       // license.mint(1);
//       // console.log(license.hasValidLicense(alice));
//       // license.mint(1)
      
//       // console.log(address(this));
//       // assertEq(keccak256(address(this)),keccak256("0x037fc82298142374d974839236d2e2df6b5bdd8f"));
//       // console.log("alice has license:", license.hasValidLicense(alice));
// // 
//       // console.log(alice.balance);
      
      
//       // assertTrue(license.isCallerAuthorized(alice, 0xa0712d68));
//       // license.setAuthority(Authority(alice));
      

//       // license.mint(1);
//       // console.log(balanceOf(alice));
      
      
      
//       // console.log("Alice is authorised", license.isAuthorized(alice, 0xa0712d68));
//       // console.log("Bob is authorised", license.isAuthorized(alice, 0xa0712d68));
    
      
//       // console.log("alice has license:", license.hasValidLicense(alice));
//       // assertTrue(LicenseAuthority(address(license)).canCall(alice, address(license), 0xa0712d68));
//       // license.setMaxSupply(100);
//       // assertEq(license.getMaxSupply(),100);
//       // console.log("license.getMaxSupply() is:", license.getMaxSupply());
//       // license.initialize();
//       // license.mint(1);

//       // Functions of the AccessToken should be only by those with the LicenseToken
//       // assertTrue(Authority(address(accessToken)).canCall(alice, address(accessToken), ""));
    
//     // }



//     // My hypothesis is that the owner and callables of the four contracts are construed as the following (RN) right now: 


    // +------------------+--------------------------------------------------------------------------+----------------------------------------------------------------------------------------+
    // |     Contract     |                                  Owner                                   |                                      Callable by?                                      |
    // +------------------+--------------------------------------------------------------------------+----------------------------------------------------------------------------------------+
    // | Factory          | ALICE (artist)                                                           | Anyone                                                                                 |
    // | License          | Auth(msg.sender).owner()= owner of the factory contract, therefore Alice | those with validLicenses of that license (this has not been verified in the tests yet) |
    // | AuthorityModule | not owned                                                                | Anyone                                                                                 |
    // | AccessToken      | Auth(msg.sender).owner()= owner of the factory contract, therefore Alice | those with validLicenses of that license                                               |
    // +------------------+--------------------------------------------------------------------------+----------------------------------------------------------------------------------------+

//     // In practice, we would like the structure to be (I) - ideal:


    //   +------------------+--------------------------------------+----------------------+
    //   |     Contract     |                Owner                 |     Callable by?     |
    //   +------------------+--------------------------------------+----------------------+
    //   | Factory          | Us                                   | Anyone               |
    //   | License          | Owner of MasterCopy (Artist - Alice) | Owner of MasterCopy  |
    //   | AuthorityModule | Us / Not owned                       | Anyone               |
    //   | AccessToken      | Owner of MasterCopy (Artist - Alice) | validLicense holders |
    //   | MasterCopy       | Artist                               | Artist               |
    //   +------------------+--------------------------------------+----------------------+


// // My initial plan was to verify that these contracts are indeed behaving like (RN), and then I shall modify them to become like (I)

// // Two observations here: 

// (1) the AuthorityModule seems to be controlling the wrong contract
// The license contract requiresAuth modifier calls the canCall function of the AuthorityModule to check if someone could call functions of the license contract
// the AuthorityModule then calls the license contract to see if the user in question has a validLicense 
// This appears wrong to me. validLicense holders should have rights to call the functions of the AccessToken (to mint AccessTokens), not to call the functions of the license itself
// That right is reserved for the MasterCopy holder. 

// // (1) the LicenseAuthority seems to be controlling the wrong contract
// // The license contract requiresAuth modifier calls the canCall function of the LicenseAuthority to check if someone could call functions of the license contract
// // the LicenseAuthority then calls the license contract to see if the user in question has a validLicense 
// // This appears wrong to me. validLicense holders should have rights to call the functions of the AccessToken (to mint AccessTokens), not to call the functions of the license itself
// // That right is reserved for the MasterCopy holder. 


// // (2) To test my hypothesis as to whether the contracts are really behaving like (RN), we need to check who's the contracts callable by. 
// // As per the contract set up, it is not possible to call the contracts 
// // For Alice to call the License contract, she needs to have a validLicense
// // But for her to have a valid license, she needs to be minted one
// // But the mint function is guarded by the requiresAuth modifier - so she can't call the function

// // I suppose this can be done by calling the setAuthority() function on the license contract, but I haven't tried that out yet. 


// Final remark, aside from (1), (correct me if my interpretation is wrong) - the complicated authorities can be set straight not by rewriting the contracts but by calling the apppropriate setAuthority() functions. 
}
