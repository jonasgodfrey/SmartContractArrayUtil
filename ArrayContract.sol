// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// Library for sorting integers
library SortLib {
    function bubbleSort(uint[] memory data) external pure returns(uint[] memory){
        uint[] memory sortedArr = data;
        uint n = data.length;
        bool swapped;
        do {
            swapped = false;
            for (uint i = 0; i < n - 1; i++) {
                if (sortedArr[i] > sortedArr[i + 1]) {
                    (sortedArr[i], sortedArr[i + 1]) = (sortedArr[i + 1], sortedArr[i]);
                    swapped = true;
                }
            }
        } while (swapped);

        return sortedArr;
    }

    function countUnique(uint[] memory array) internal pure returns (uint) {
        uint arrayLength = array.length;
        if (arrayLength <= 1) {
            return arrayLength;
        }

        uint uniqueCount = 0;
        bool[] memory isUnique = new bool[](arrayLength);

        for (uint i = 0; i < arrayLength; i++) {
            if (!isUnique[i]) {
                uniqueCount++;
                for (uint j = i + 1; j < arrayLength; j++) {
                    if (array[i] == array[j]) {
                        isUnique[j] = true;
                    }
                }
            }
        }

        return uniqueCount;
    }

    function getUniqueElements(uint[] memory array) external pure  returns (uint[] memory) {
        uint uniqueCount = countUnique(array);
        uint[] memory uniqueArray = new uint[](uniqueCount);
        uint currentIndex = 0;

        for (uint i = 0; i < array.length; i++) {
            if (!contains(uniqueArray, array[i])) {
                uniqueArray[currentIndex] = array[i];
                currentIndex++;
            }
        }

        return uniqueArray;
    }

    function contains(uint[] memory array, uint element) internal pure returns (bool) {
        for (uint i = 0; i < array.length; i++) {
            if (array[i] == element) {
                return true;
            }
        }
        return false;
    }
}

// Smart contract using the sorting library
contract SortContract {

    function sort(uint[] memory arr) external pure returns(uint[] memory) {
       return SortLib.bubbleSort(arr);
    }

    function getUniqueElements(uint[] memory arr) external pure returns (uint[] memory) {
        return SortLib.getUniqueElements(arr);
    }
}
 
