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
    int *res = new int[size + enlarge]{};
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
    // [region]{init_array}
    /* Initialize the array */
    // Stored on the stack
    int arr[5] = {};
    int nums[5] = {1, 3, 2, 5, 4};
    // Stored on the heap (memory must be freed manually)
    int *arr1 = new int[5]{};
    int *nums1 = new int[5]{1, 3, 2, 5, 4};
    // [endregion]{init_array}
    int size = 5;
    cout << "Array arr = ";
    printArray(arr, size);
    cout << "Array nums = ";
    printArray(nums, size);
    cout << "Array arr1 = ";
    printArray(arr1, size);
    cout << "Array nums1 = ";
    printArray(nums1, size);

    /* Random access */
    int randomNum = randomAccess(nums, size);
    cout << "Randomly selected element from nums: " << randomNum << endl;

    /* Extend the length */
    int enlarge = 3;
    nums1 = extend(nums1, size, enlarge);
    size += enlarge;
    cout << "Extend the array length to 8, giving nums = ";
    printArray(nums1, size);

    /* Insert an element */
    insert(nums1, size, 6, 3);
    cout << "Insert the number 6 at index 3, giving nums = ";
    printArray(nums1, size);

    /* Remove an element */
    remove(nums1, size, 2);
    cout << "Remove the element at index 2, giving nums = ";
    printArray(nums1, size);

    /* Traverse the array */
    traverse(nums1, size);

    /* Find an element */
    int index = find(nums1, size, 3);
    cout << "Find element 3 in nums, giving index = " << index << endl;

    // Free memory
    delete[] arr1;
    delete[] nums1;

    return 0;
}
