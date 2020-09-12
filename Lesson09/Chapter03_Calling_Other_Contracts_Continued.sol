pragma solidity 0.5.0;
//1. Import from the "./EthPriceOracleInterface.sol" file
import "./EthPriceOracleInterface.sol";
contract CallerContract {
  EthPriceOracleInterface private oracleInstance;
  address private oracleAddress;
  function setOracleInstanceAddress (address _oracleInstanceAddress) public {
    oracleAddress = _oracleInstanceAddress;
    //3. Instantiate `EthPriceOracleInterface`
    oracleInstance = EthPriceOracleInterface(oracleAddress);
  }
}
