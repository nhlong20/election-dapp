pragma solidity >=0.4.22 <0.8.0;

contract Election {
  // Model candidate
  struct Candidate{
    uint id;
    string name;
    uint voteCount;
  }
  // Store candidates

  // Fetch candidate, like hashmap int C++
  mapping(uint => Candidate) public candidates;
  // Store candidates count
  uint public candidatesCount;

  // Constructor
  constructor() public {
    addCandidate("Candidate 1");
    addCandidate("Candidate 2");
  } 

  function addCandidate(string memory _name) private{
    candidatesCount++;
    candidates[candidatesCount] = Candidate(candidatesCount, _name, 0);
  }
}