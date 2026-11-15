/**
 * File: array.c
 * Created Time: 2022-12-20
 * Author: MolDuM (moldum@163.com)
 */

#include "../utils/common.h"

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
    int *res = (int *)malloc(sizeof(int) * (size + enlarge));
    // Copy all elements from the original array to the new array
    for (int i = 0; i < size; i++) {
        res[i] = nums[i];
    }
    // Initialize the newly added space
    for (int i = size; i < size + enlarge; i++) {
        res[i] = 0;
    }
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
// Note: stdio.h already declares a function named remove
void removeItem(int *nums, int size, int index) {
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
    /* Initialize the random seed (only once) */
    srand((unsigned)time(NULL));

    /* Initialize the array */
    int size = 5;
    int arr[5];
    printf("Array arr = ");
    printArray(arr, size);

    int nums[] = {1, 3, 2, 5, 4};
    printf("Array nums = ");
    printArray(nums, size);

    /* Random access */
    int randomNum = randomAccess(nums, size);
    printf("Random element selected from nums: %d", randomNum);

    /* Extend the length */
    int enlarge = 3;
    int *res = extend(nums, size, enlarge);
    size += enlarge;
    printf("Extend the array length to 8, giving nums = ");
    printArray(res, size);

    /* Insert an element */
    insert(res, size, 6, 3);
    printf("Insert the number 6 at index 3, giving nums = ");
    printArray(res, size);

    /* Remove an element */
    removeItem(res, size, 2);
    printf("Remove the element at index 2, giving nums = ");
    printArray(res, size);

    /* Traverse the array */
    traverse(res, size);

    /* Find an element */
    int index = find(res, size, 3);
    printf("Find element 3 in res; its index = %d\n", index);

    /* Free memory */
    free(res);
    return 0;
}
