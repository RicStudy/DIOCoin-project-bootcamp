// SPDX-License-Identifier: MIT
pragma solidity >=0.6.0 <0.9.0;

contract DIOVoting {
    mapping (string => uint256) public votesReceived;

    string[] public candidatesList;

    constructor(string[] memory candidatesNames){
        candidatesList = candidatesNames;
    }

    function totalVotesFor(string memory candidate) view public returns (uint256){
        require(validCandidate(candidate));

        return votesReceived[candidate];
    }

    function voteForCandidate(string memory candidate) public {
        require(validCandidate(candidate));
        votesReceived[candidate] += 1;
    }

    function validCandidate(string memory candidate) view public returns (bool){
        for (uint i = 0; i < candidatesList.length; i++) 
        {
            if (keccak256(abi.encodePacked(candidatesList[i])) == keccak256(abi.encodePacked(candidate))) {
                return true;
            }
        }
        return false;
    }
}