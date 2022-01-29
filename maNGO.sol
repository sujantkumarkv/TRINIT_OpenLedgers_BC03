pragma solidity >=0.7.0 <0.9.0;

contract NGO {

    address public owner;

    struct Donor {
        string name;
        uint donatedAmount;
        address donorAddress;
    }

    constructor(address owner) public {
        owner = msg.sender;
    }

    mapping (address => uint) ngoWallet;

    //ngo maintains a list of donors
    Donor[] listOfDonors;

    function donate(string memory _name) external payable {
        ngoWallet[owner] += msg.value;
        listOfDonors.push(Donor(_name, msg.value, msg.sender))
    }
}
