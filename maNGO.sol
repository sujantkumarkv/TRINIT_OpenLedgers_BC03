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

    Donor[] uniqueDonors;   //list of unique donors
    Donor[] allTransactions;   //list of all transactions

    function donate(string memory _name) external payable {
        //increment money in ngo wallet
        ngoWallet[owner] += msg.value;

        //create an instance of the current donor
        Donor memory currDonor = Donor(_name, msg.value, msg.sender);
        //add this donors details in the transaction log
        allTransactions.push(currDonor);

        //add donor in unique donors
        //if already present, increment the contributed value
        uint256 i;
        for (i = 0; i < uniqueDonors.length; i++) {
            // if this donor already has done a donation
            if(currDonor.donorAddress == uniqueDonors[i].donorAddress) {
                uniqueDonors[i].donatedAmount += msg.value;
                break;
            }
        }
        if(i == uniqueDonors.length) {
            uniqueDonors.push(currDonor);
        }
    }

    //Transaction Log
    // prints all the donations recieved to the NGO
    function transactionLog() public view returns(Donor[] memory) {
        return allTransactions;
    }  
}
