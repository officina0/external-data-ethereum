pragma solidity 0.4.24;
import './ListenableContract.sol';
import './CallableBack.sol';

contract ListenableDemo is CallableBack{

        uint callBackCalls = 0;
        string[] messages;

       constructor
        (
            ListenableContract listenable
        )
        public
        CallableBack(listenable)
        {

        }


        function listened(string message) public returns(string){
            listenable.engage(message);
            return message;
        }

        function _callBack(string message) public {
            callBackCalls += 1;
            messages.push(message);
        }

        function getCallBackCalls() public view returns (uint callbacks) {
            return callBackCalls;
        }

        function getLastMessage() public view returns(string message) {
            return messages[messages.length-1];
        }

}


