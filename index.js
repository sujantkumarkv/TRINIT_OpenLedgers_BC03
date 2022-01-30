const ethers= require('ethers');

const provider= new ethers.provider.Web3Provider(window.Ethereum);
const signer= provider.getSigner();

abi= ""
const contract= ethers.Contract(address, abi, signer);
