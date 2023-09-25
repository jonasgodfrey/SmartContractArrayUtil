// SPDX-License-Identifier: MIT
pragma solidity 0.8.18;


    library ArrayLib {

        function push(uint[] storage myArray, uint _value) public {
            myArray.push(_value);
        }  

      
    } 

contract ArrayContract{
    
    using ArrayLib for uint;    
    uint[]  myArray;
    
    //To add elements to the array
    function addElement(uint newElement) public {
        myArray.push(newElement);
    }  

    //Function to view the array element
     function viewArray() public view returns (uint[] memory) {
        return myArray;
    }

    //To Sort the Array - Got stuck

    
    //To remove duplicate element in the array - Got stuck
    
   

}