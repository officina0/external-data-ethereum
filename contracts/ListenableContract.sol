pragma solidity 0.4.24;
import './CallableBack.sol';

contract ListenableContract {
     event ListenEvent(string message,CallableBack emitter);

     function engage(string message) public  {
         emit ListenEvent(message,CallableBack(msg.sender));
     }

     function callBack(CallableBack callableBack,string message) public {
         callableBack._callBack(message);
     }



    

}


