pragma solidity 0.5.0;
  import "./EthPriceOracleInterface.sol";
  import "openzeppelin-solidity/contracts/ownership/Ownable.sol";
  contract CallerContract is Ownable {
      // 1. Declare ethPrice
      uint256 private ethPrice;
      EthPriceOracleInterface private oracleInstance;
      address private oracleAddress;
      mapping(uint256=>bool) myRequests;
      event newOracleAddressEvent(address oracleAddress);
      event ReceivedNewRequestIdEvent(uint256 id);
      // 2. Declare PriceUpdatedEvent
      event PriceUpdatedEvent(uint256 ethPrice, uint256 id);
      function setOracleInstanceAddress (address _oracleInstanceAddress) public onlyOwner {
        oracleAddress = _oracleInstanceAddress;
        oracleInstance = EthPriceOracleInterface(oracleAddress);
        emit newOracleAddressEvent(oracleAddress);
      }
      function updateEthPrice() public {
        uint256 id = oracleInstance.getLatestEthPrice();
        myRequests[id] = true;
        emit ReceivedNewRequestIdEvent(id);
      }
      function callback(uint256 _ethPrice, uint256 _id) public {
        // 3. Continue here
        require(myRequests[_id], "This request is not in my pending list.");
        ethPrice = _ethPrice;
        delete myRequests[_id];
        emit PriceUpdatedEvent(_ethPrice, _id);
      }
  }
