pragma solidity ^0.8.19;

import "lib/openzeppelin-contracts/contracts/utils/cryptography/MerkleProof.sol";
import {Test, console} from "../../../lib/openzeppelin-contracts/lib/forge-std/src/Test.sol";

contract MerkleTreeDemo{
    bytes32 public merkleRoot = 0xb990956beffcbf13ed9fcc2dbdaff0d94e4cb35076aea8531877a25079e4b551;
                                // b990956beffcbf13ed9fcc2dbdaff0d94e4cb35076aea8531877a25079e4b551
                                
                                
    mapping(address => bool) public whitelistClaimed;

    function whitelistMint(bytes32[] calldata _merkleProof) public {
        require(!whitelistClaimed[msg.sender], "Address has already claimed.");
        bytes32 leaf = keccak256(abi.encode(msg.sender));
        // bytes32 leaf = keccak256(msg.sender);
        console.log("msg.sender:", msg.sender);
        require(MerkleProof.verify(_merkleProof, merkleRoot, leaf),"Invilid proof.");
        whitelistClaimed[msg.sender] = true;
    }


}