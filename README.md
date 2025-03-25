# Payment Splitter Move Smart Contract

## Description

This project is a simple Payment Splitter smart contract written in Move for the Aptos blockchain. It is designed to receive an incoming payment and distribute the funds equally among multiple recipient addresses. The contract ensures that the last recipient receives any remainder to guarantee that all funds are fully distributed.

## Vision

Our vision is to create a secure, efficient, and easy-to-use mechanism for handling group payments on the blockchain. We aim to demonstrate the strengths of the Move language—particularly its resource-oriented programming model and strong safety guarantees—in managing digital assets. By leveraging these features, we intend to build trust and reliability in financial operations executed through smart contracts.

## Future Scope

- **Dynamic Recipient Management:** Enable adding, removing, or updating recipients after the initial contract deployment.
- **Support for Multiple Coin Types:** Extend the contract to handle various coin types beyond a single generic type.
- **Enhanced Security Audits:** Regularly audit and improve the contract for additional security measures.
- **Optimized Gas Consumption:** Implement optimizations to reduce transaction costs while maintaining robust security.
- **Integration with Other Protocols:** Explore interoperability with other DeFi protocols and blockchain ecosystems to broaden the use cases.

## Contract Details

- **Language:** Move  
- **Platform:** Aptos Blockchain  
- **Functions:**  
  - **initialize:**  
    Sets up the contract by registering a vector of recipient addresses. This function must be called once during contract deployment.
  - **split_payment:**  
    Receives a coin payment and divides it equally among the stored recipients. The function calculates each share and deposits it accordingly, ensuring that any remainder is allocated to the final recipient.
- **Key Features:**  
  - **Resource Safety:** Utilizes Move's resource-oriented programming to ensure secure handling of assets.
  - **Simplicity:** Contains only two core functions to keep the implementation lean and focused.
  - **Equal Distribution:** Automatically handles division and remainder distribution to prevent fund loss.

This README provides an overview of the project's purpose, vision, potential enhancements, and technical details of the smart contract. Enjoy exploring and contributing to a more secure and reliable blockchain payment solution!
