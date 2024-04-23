// SPDX-License-Identifier: MIT

pragma solidity 0.8.19;

contract Tracking{

    enum ShipmentStatus {PENDING, IN_TRANSIT, DELIVERED }

    struct Shipment {
        address sender;
        address receiver;
        uint256 pickupTime;
        uint256 deliveryTime;
        uint256 distance;
        uint256 price;
        ShipmentStatus status;
        bool isPaid;
    }

    mapping (address => Shipment []) public shipments;
    uint256 public shipmentCount;

    //  display data
    struct TypeShipment {
         address sender;
        address receiver;
        uint256 pickupTime;
        uint256 deliveryTime;
        uint256 distance;
        uint256 price;
        ShipmentStatus status;
        bool isPaid;
       
    }

    TypeShipment [] typeShipments;

    event ShipmentCreated (address indexed sender, address indexed receiver, uint256 pickupTime,
    uint256 distance, uint256 price);

    event ShipmentInTransit(address indexed sender, address indexed receiver, uint256 pickupTime);

    event ShipmentDelivered(address indexed sender, address indexed receiver, uint256 deliveryTime);

    event ShipmentPaid(address indexed sender, address indexed receiver, uint256 amount);

    constructor() {
        shipmentCount = 0;
    }

    function createShipment (address _receiver, uint256 _pickupTime, uint256 _distance,
    uint256 _price) public payable {
        require(msg.value == _price, "Payment amount must match the price");

        Shipment memory shipment = Shipment(msg.sender, _receiver, _pickupTime, 0,
        _distance, _price, ShipmentStatus.PENDING, false);

        shipments[msg.sender].push(shipment);
        shipmentCount++;

        //update the array of the shipment 
        typeShipments.push(
            TypeShipment(
                msg.sender, 
                _receiver,
                _pickupTime,
                0,
                _distance,
                _price,
                ShipmentStatus.PENDING,
                false
            )
        );

        emit ShipmentCreated(msg.sender, _receiver, _pickupTime, _distance, _price);


    }

  // function to cre
    function startShipment (address _sender, address _receiver, uint256 _index) public {
        // update the status find a particular shipment based on the index
        Shipment storage shipment = shipments[_sender] [_index];
        TypeShipment storage typeShipment = typeShipments[_index];

        require(shipment.receiver == _receiver, "Invalid Receiver");
        require(shipment.status == ShipmentStatus.PENDING, "Shipment already in transit");

        shipment.status = ShipmentStatus.IN_TRANSIT;
        typeShipment.status = ShipmentStatus.IN_TRANSIT;

        emit ShipmentInTransit(_sender, _receiver, shipment.pickupTime);
    }

 
  


}
