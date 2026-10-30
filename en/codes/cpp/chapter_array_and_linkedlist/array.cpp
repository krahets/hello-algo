/**
 * File: array.cpp
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* Access an element at a random index */
int randomAccess(int *nums, int size) {
    // Choose a random number in [0, size)
    int randomIndex = rand() % size;
    // Get and return the randomly selected element
    int randomNum = nums[randomIndex];
    return randomNum;
}

/* Extend the array length */
int *extend(int *nums, int size, int enlarge) {
    // Initialize an array with the extended length
    int *res = new int[size + enlarge];
    // Copy all elements from the original array to the new array
    for (int i = 0; i < size; i++) {
        res[i] = nums[i];
    }
    // Free memory
    delete[] nums;
    // Return the new, extended array
    return res;
}

/* Insert element num at index `index` in the array */
void insert(int *nums, int size, int num, int index) {
    // Shift all elements at and after index `index` one position to the right
    for (int i = size - 1; i > index; i--) {
        nums[i] = nums[i - 1];
    }
    // Assign num to the element at index `index`
    nums[index] = num;
}

/* Remove the element at index `index` */
void remove(int *nums, int size, int index) {
    // Shift all elements after index `index` one position to the left
    for (int i = index; i < size - 1; i++) {
        nums[i] = nums[i + 1];
    }
}

/* Traverse the array */
void traverse(int *nums, int size) {
    int count = 0;
    // Traverse the array by index
    for (int i = 0; i < size; i++) {
        count += nums[i];
    }
}

/* Find a specified element in the array */
int find(int *nums, int size, int target) {
    for (int i = 0; i < size; i++) {
        if (nums[i] == target)
            return i;
    }
    return -1;
}

/* Driver code */
int main() {
    /* Initialize the array */
    int size = 5;
    int *arr = new int[size];
    cout << "Array arr = ";
    printArray(arr, size);

    int *nums = new int[size]{1, 3, 2, 5, 4};
    cout << "Array nums = ";
    printArray(nums, size);

    /* Random access */
    int randomNum = randomAccess(nums, size);
    cout << "Randomly selected element from nums: " << randomNum << endl;

    /* Extend the length */
    int enlarge = 3;
    nums = extend(nums, size, enlarge);
    size += enlarge;
    cout << "Extend the array length to 8, giving nums = ";
    printArray(nums, size);

    /* Insert an element */
    insert(nums, size, 6, 3);
    cout << "Insert the number 6 at index 3, giving nums = ";
    printArray(nums, size);

    /* Remove an element */
    remove(nums, size, 2);
    cout << "Remove the element at index 2, giving nums = ";
    printArray(nums, size);

    /* Traverse the array */
    traverse(nums, size);

    /* Find an element */
    int index = find(nums, size, 3);
    cout << "Find element 3 in nums, giving index = " << index << endl;

    // Free memory
    delete[] arr;
    delete[] nums;

    return 0;
}
