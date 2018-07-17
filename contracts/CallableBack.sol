
pragma solidity 0.4.24;
import './ListenableContract.sol'; 
contract CallableBack {


    ListenableContract  listenable;
    function _callBack(string message) public {}

    constructor(ListenableContract listenableContract) {
        listenable = listenableContract;
    }

    

}