/**
 * File: array.c
 * Created Time: 2022-12-20
 * Author: MolDuM (moldum@163.com)
 */

#include "../utils/common.h"

/* Access a random element */
int randomAccess(int *nums, int size) {
    // Pick a random index in [0, size)
    int randomIndex = rand() % size;
    // Get and return the element at that index
    int randomNum = nums[randomIndex];
    return randomNum;
}

/* Extend the array */
int *extend(int *nums, int size, int enlarge) {
    // Initialize an array with the new length
    int *res = (int *)malloc(sizeof(int) * (size + enlarge));
    // Copy all elements from the original array into the new array
    for (int i = 0; i < size; i++) {
        res[i] = nums[i];
    }
    // Initialize the extra space
    for (int i = size; i < size + enlarge; i++) {
        res[i] = 0;
    }
    // Return the new, longer array
    return res;
}

/* Insert num at the specified array index */
void insert(int *nums, int size, int num, int index) {
    // Shift the elements from index onward one position to the right
    for (int i = size - 1; i > index; i--) {
        nums[i] = nums[i - 1];
    }
    // Store num at the specified index
    nums[index] = num;
}

/* Remove the element at the specified index */
// Note: stdio.h already uses the name remove
void removeItem(int *nums, int size, int index) {
    // Shift all elements after index one position to the left
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

/* Find a given element in the array */
int find(int *nums, int size, int target) {
    for (int i = 0; i < size; i++) {
        if (nums[i] == target)
            return i;
    }
    return -1;
}

/* Driver Code */
int main() {
    /* Initialize the random seed (only once) */
    srand((unsigned)time(NULL));

    /* Initialize the array */
    int size = 5;
    int arr[5] = {0};
    printf("Array arr = ");
    printArray(arr, size);

    int nums[] = {1, 3, 2, 5, 4};
    printf("Array nums = ");
    printArray(nums, size);

    /* Random access */
    int randomNum = randomAccess(nums, size);
    printf("Random element from nums: %d", randomNum);

    /* Extend the array */
    int enlarge = 3;
    int *res = extend(nums, size, enlarge);
    size += enlarge;
    printf("After extending the array to length 8, nums = ");
    printArray(res, size);

    /* Insert an element */
    insert(res, size, 6, 3);
    printf("After inserting 6 at index 3, nums = ");
    printArray(res, size);

    /* Remove an element */
    removeItem(res, size, 2);
    printf("After removing the element at index 2, nums = ");
    printArray(res, size);

    /* Traverse the array */
    traverse(res, size);

    /* Find an element */
    int index = find(res, size, 3);
    printf("Index of 3 in res = %d\n", index);

    /* Free memory */
    free(res);
    return 0;
}
