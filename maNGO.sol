pragma solidity >=0.7.0 <0.9.0;

contract NGO {

    address public owner;

    struct Donor {
        string name;
        uint totalDonatedAmount;
        address donorAddress;
    }

    constructor(address owner) public {
        owner = msg.sender;
    }

    mapping (address => uint) ngoWallet;

    //ngo maintains a list of donors
    Donor[] listOfDonors;
    Donor[] listOfDonorsWithIndividualTx;

    function donate(string memory _name) external payable {
        //increment money in ngo wallet
        ngoWallet[owner] += msg.value;

        //create an instance of the current donor
        Donor memory currDonor = Donor(_name, msg.value, msg.sender);
        //add this donors details in the transaction log
        listOfDonorsWithIndividualTx.push(currDonor);

        //add donor in List of Donors
        //if already present, increment the contributed value
        uint256 i;
        for (i = 0; i < listOfDonors.length; i++) {
            // if this donor already has done a donation
            if(currDonor.donorAddress == listOfDonors[i].donorAddress) {
                currDonor.totalDonatedAmount += msg.value;
                break;
            }
        }
        if(i == listOfDonors.length) {
            listOfDonors.push(currDonor);
        }
    }

    //Transaction Log
    function transactionLog() public view returns(Donor[] memory) {
        return listOfDonorsWithIndividualTx;
    }
    
}
