/**
 * File: array.cpp
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* Random access to elements */
int randomAccess(int *nums, int size) {
    // Randomly select a number in the range [0, size)
    int randomIndex = rand() % size;
    // Retrieve and return a random element
    int randomNum = nums[randomIndex];
    return randomNum;
}

/* Extend array length */
int *extend(int *nums, int size, int enlarge) {
    // Initialize an extended length array
    int *res = new int[size + enlarge];
    // Copy all elements from the original array to the new array
    for (int i = 0; i < size; i++) {
        res[i] = nums[i];
    }
    // Free memory
    delete[] nums;
    // Return the new array after expansion
    return res;
}

/* Insert element num at `index` */
void insert(int *nums, int size, int num, int index) {
    // Move all elements after `index` one position backward
    for (int i = size - 1; i > index; i--) {
        nums[i] = nums[i - 1];
    }
    // Assign num to the element at index
    nums[index] = num;
}

/* Remove the element at `index` */
void remove(int *nums, int size, int index) {
    // Move all elements after `index` one position forward
    for (int i = index; i < size - 1; i++) {
        nums[i] = nums[i + 1];
    }
}

/* Traverse array */
void traverse(int *nums, int size) {
    int count = 0;
    // Traverse array by index
    for (int i = 0; i < size; i++) {
        count += nums[i];
    }
}

/* Search for a specified element in the array */
int find(int *nums, int size, int target) {
    for (int i = 0; i < size; i++) {
        if (nums[i] == target)
            return i;
    }
    return -1;
}

/* Driver Code */
int main() {
    /* Initialize an array */
    int size = 5;
    int *arr = new int[size];
    cout << "Array arr = ";
    printArray(arr, size);

    int *nums = new int[size]{1, 3, 2, 5, 4};
    cout << "Array nums = ";
    printArray(nums, size);

    /* Random access */
    int randomNum = randomAccess(nums, size);
    cout << "Get a random element from nums = " << randomNum << endl;

    /* Length extension */
    int enlarge = 3;
    nums = extend(nums, size, enlarge);
    size += enlarge;
    cout << "Extend the array length to 8, resulting in nums = ";
    printArray(nums, size);

    /* Insert element */
    insert(nums, size, 6, 3);
    cout << "Insert the number 6 at index 3, resulting in nums = ";
    printArray(nums, size);

    /* Remove element */
    remove(nums, size, 2);
    cout << "Remove the element at index 2, resulting in nums = ";
    printArray(nums, size);

    /* Traverse array */
    traverse(nums, size);

    /* Search for elements */
    int index = find(nums, size, 3);
    cout << "Find element 3 in nums, index = " << index << endl;

    // Free memory
    delete[] arr;
    delete[] nums;

    return 0;
}
