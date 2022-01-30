pragma solidity >=0.7.0 <0.9.0;

contract NGO {

    address public owner;
    constructor (address owner) {
        owner = msg.sender;
    }

    struct Donor {
        string name;
        uint donation;
        address donorAddress;
    }

    mapping (address => uint) ngoWallet;

    //ngo maintains a list of donors
    Donor[] public Donors;
    Donor[] public singleTxDonors;

    function donate(string memory _name) external payable {
        //increment money in ngo wallet
        ngoWallet[owner] += msg.value;

        //create an instance of the current donor
        Donor memory currentDonor = Donor(_name, msg.value, msg.sender);
        //add this donors details in the transaction log
        Donors.push(currentDonor);

        //add donor in List of Donors
        //if already present, increment the contributed value
        uint256 i;
        for (i = 0; i < Donors.length; i++) {
            // if this donor already has done a donation
            if(currentDonor.donorAddress == Donors[i].donorAddress) {
                currentDonor.donation += msg.value;
                continue;
            }
        }
        if(i == Donors.length) {
            singleTxDonors.push(currentDonor);
        }
    }

    //Transaction Log
    function transactionLog() public view returns(Donor[] memory) {
        return singleTxDonors;
    }
    
}
