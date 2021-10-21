pragma solidity 0.7.5;

contract Deed{
    
    address lawyer;
    address payable recipient;
    uint time;
    
    constructor (address _lawyer, address payable _recipient, uint _time) payable {
        lawyer = _lawyer;
        recipient = _recipient;
        time = block.timestamp + _time;
    }
    
    function withdraw() public {
        require (msg.sender == lawyer, 'Lawyer only');
        require (block.timestamp >= time, 'Too early');
        recipient.transfer(address(this).balance);
    }
}