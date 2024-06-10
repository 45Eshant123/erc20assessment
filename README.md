# Hello solidity compiler 

Experience the simplicity and power of Solidity with this straightforward "Hello Solidity compiler" program. This program serves as an ideal introduction to Solidity, offering beginners the perfect opportunity to grasp the language's basic syntax and functionality. Jumpstart your Solidity journey with this essential starting point.

## Description

This Solidity program features a straightforward contract designed for creating smart contracts on the Ethereum blockchain. With a single function that returns the string "Hello World!", this program provides an accessible entry point into Solidity programming. It can serve as a launchpad for more complex and ambitious projects in the future.

## Getting Started

### Executing program

To run this program, you can use Remix, an online Solidity IDE. To get started, go to the Remix website at https://remix.ethereum.org/.

Once you are on the Remix website, create a new file by clicking on the "+" icon in the left-hand sidebar. Save the file with a .sol extension (e.g., Hellosolidity.sol) or by some other name which you want to add.

```javascript
pragma solidity ^0.8.0;
contract MiSto {
    function display() public view returns (string memory) {
        return "Hello solidity compiler";
    }
}
```
This contract includes only the essential elements:

A uint256 variable named data to store an unsigned integer.

A set function to update the value of data.

A get function to retrieve the current value of data.

Make sure to compile the code by navigating to the "Solidity Compiler" tab in the left-hand sidebar. Once there, verify that the "Compiler" option is set to "^0.8.0" or a compatible version, and simply click on the "Compile Hellosolidity.sol" button.

Once the code is compiled, you can deploy the contract by clicking on the "Deploy & Run Transactions" tab in the left-hand sidebar. Select the "MiSto" contract from the dropdown menu, and then click on the "Deploy" button.

Once the contract is deployed, you can interact with it by calling the display function. Click on the "MiSto" contract in the left-hand sidebar, and then click on the "display" function. Finally, click on the "transact" button to execute the function and retrieve the "Hello solidity compiler" message.

## Authors
ESHANT

## License

This project is licensed under the MIT License - see the LICENSE.md file for details
