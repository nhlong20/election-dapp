pragma solidity >=0.4.22 <0.8.0;

contract Election {
    // Model candidate
    struct Candidate {
        uint256 id;
        string name;
        uint256 voteCount;
    }

    // store accounts that have voted
    mapping(address => bool) public voters;
    // Store candidates

    // Fetch candidate, like hashmap int C++
    mapping(uint256 => Candidate) public candidates;
    // Store candidates count
    uint256 public candidatesCount;

    // Constructor
    constructor() public {
        addCandidate("Candidate 1");
        addCandidate("Candidate 2");
    }

    function addCandidate(string memory _name) private {
        candidatesCount++;
        candidates[candidatesCount] = Candidate(candidatesCount, _name, 0);
    }

    function vote(uint256 _candidateId) public {
        // require that they haven't voted before
        require(!voters[msg.sender]);

        // require a valid candidate
        require(_candidateId > 0 && _candidateId <= candidatesCount);

        // record that voter has voted
        voters[msg.sender] = true;

        // update candidate vote Count
        candidates[_candidateId].voteCount++;
    }
}
