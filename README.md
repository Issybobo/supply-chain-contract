
# Supply Chain Contract

## Description

This Solidity contract, named `Tracking`, facilitates supply chain management by tracking shipments through various stages from creation to delivery. It includes functionality for creating shipments, starting and completing shipments, and retrieving shipment information.

## Features

- **Shipment Creation**: Allows users to create new shipments by specifying the receiver, pickup time, distance, and price.
- **Shipment Tracking**: Provides functions to start and complete shipments, updating their status accordingly.
- **Shipment Information Retrieval**: Enables users to retrieve information about specific shipments and the total number of shipments.

## Contract Structure

The contract is structured into several key components:

- **Enums**: Defines an enumeration for shipment statuses (`ShipmentStatus`).
- **Structs**: Defines structures for shipments (`Shipment`) and type shipments (`TypeShipment`).
- **Mappings**: Maps sender addresses to arrays of shipments (`shipments`).
- **Events**: Defines events for shipment creation, transit, delivery, and payment.
- **Functions**: Implements functions for creating shipments, starting shipments, completing shipments, and retrieving shipment information.

## Installation

1. Clone the repository:

   ```bash
   git clone <repository-url>
   ```

2. Navigate to the project directory:

   ```bash
   cd supply-chain-contract
   ```

3. Install dependencies:

   ```bash
   npm install
   ```

## Usage

1. Deploy the contract to a compatible Ethereum network.

2. Interact with the contract using a suitable Ethereum wallet or client, such as MetaMask or a custom script.

## Examples

```solidity
// Solidity code examples can be added here.
```

## License

This project is licensed under the [MIT License](LICENSE).

---

Feel free to customize the README further with additional information, examples, or usage instructions specific to your project.