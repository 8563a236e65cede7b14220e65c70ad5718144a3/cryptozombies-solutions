pragma solidity 0.5.0;
import "./EthPriceOracleInterface.sol";
// 1. import the contents of "openzeppelin-solidity/contracts/ownership/Ownable.sol"
import "openzeppelin-solidity/contracts/ownership/Ownable.sol";

contract CallerContract is Ownable { // 2. Make the contract inherit from `Ownable`
    EthPriceOracleInterface private oracleInstance;
    address private oracleAddress;
    event newOracleAddressEvent(address oracleAddress);
    // 3. On the next line, add the `onlyOwner` modifier to the `setOracleInstanceAddress` function definition
    function setOracleInstanceAddress (address _oracleInstanceAddress) public onlyOwner {
      oracleAddress = _oracleInstanceAddress;
      oracleInstance = EthPriceOracleInterface(oracleAddress);
      // 4. Fire `newOracleAddressEvent`
      emit newOracleAddressEvent(oracleAddress);
    }
}
