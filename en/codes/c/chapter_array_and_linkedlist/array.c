/**
 * File: array.c
 * Created Time: 2022-12-20
 * Author: MolDuM (moldum@163.com)
 */

#include "../utils/common.h"

/* Random access to element */
int randomAccess(int *nums, int size) {
    // Randomly select a number from interval [0, size)
    int randomIndex = rand() % size;
    // Retrieve and return the random element
    int randomNum = nums[randomIndex];
    return randomNum;
}

/* Extend array length */
int *extend(int *nums, int size, int enlarge) {
    // Initialize an array with extended length
    int *res = (int *)malloc(sizeof(int) * (size + enlarge));
    // Copy all elements from the original array to the new array
    for (int i = 0; i < size; i++) {
        res[i] = nums[i];
    }
    // Initialize expanded space
    for (int i = size; i < size + enlarge; i++) {
        res[i] = 0;
    }
    // Return the extended new array
    return res;
}

/* Insert element num at index index in the array */
void insert(int *nums, int size, int num, int index) {
    // Move all elements at and after index index backward by one position
    for (int i = size - 1; i > index; i--) {
        nums[i] = nums[i - 1];
    }
    // Assign num to the element at index index
    nums[index] = num;
}

/* Remove the element at index index */
// Note: stdio.h occupies the remove keyword
void removeItem(int *nums, int size, int index) {
    // Move all elements after index index forward by one position
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

/* Find the specified element in the array */
int find(int *nums, int size, int target) {
    for (int i = 0; i < size; i++) {
        if (nums[i] == target)
            return i;
    }
    return -1;
}

/* Driver Code */
int main() {
    /* Initialize array */
    int size = 5;
    int arr[5];
    printf("Array arr = ");
    printArray(arr, size);

    int nums[] = {1, 3, 2, 5, 4};
    printf("Array nums = ");
    printArray(nums, size);

    /* Insert element */
    int randomNum = randomAccess(nums, size);
    printf("Get random element %d from nums", randomNum);

    /* Traverse array */
    int enlarge = 3;
    int *res = extend(nums, size, enlarge);
    size += enlarge;
    printf("Extend array length to 8, resulting in nums = ");
    printArray(res, size);

    /* Insert element */
    insert(res, size, 6, 3);
    printf("Insert number 6 at index 3, resulting in nums = ");
    printArray(res, size);

    /* Remove element */
    removeItem(res, size, 2);
    printf("Remove element at index 2, resulting in nums = ");
    printArray(res, size);

    /* Traverse array */
    traverse(res, size);

    /* Find element */
    int index = find(res, size, 3);
    printf("Find element 3 in res, index = %d\n", index);

    /* Free memory */
    free(res);
    return 0;
}
