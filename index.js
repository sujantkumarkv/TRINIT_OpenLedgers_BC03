const ethers= require('ethers');

const provider= new ethers.provider.Web3Provider(window.Ethereum);
const signer= provider.getSigner();

const abi= [
	{
		"inputs": [
			{
				"internalType": "address",
				"name": "owner",
				"type": "address"
			}
		],
		"stateMutability": "nonpayable",
		"type": "constructor"
	},
	{
		"inputs": [
			{
				"internalType": "string",
				"name": "_name",
				"type": "string"
			}
		],
		"name": "donate",
		"outputs": [],
		"stateMutability": "payable",
		"type": "function"
	},
	{
		"inputs": [],
		"name": "owner",
		"outputs": [
			{
				"internalType": "address",
				"name": "",
				"type": "address"
			}
		],
		"stateMutability": "view",
		"type": "function"
	},
	{
		"inputs": [],
		"name": "transactionLog",
		"outputs": [
			{
				"components": [
					{
						"internalType": "string",
						"name": "name",
						"type": "string"
					},
					{
						"internalType": "uint256",
						"name": "donatedAmount",
						"type": "uint256"
					},
					{
						"internalType": "address",
						"name": "donorAddress",
						"type": "address"
					}
				],
				"internalType": "struct NGO.Donor[]",
				"name": "",
				"type": "tuple[]"
			}
		],
		"stateMutability": "view",
		"type": "function"
	}
]

const address= "0x99CF4c4CAE3bA61754Abd22A8de7e8c7ba3C196d";
const contract= ethers.Contract(address, abi, signer);

function walletConnect(){
    const walletConnectBtn= $("#connectWallet");
    
}
