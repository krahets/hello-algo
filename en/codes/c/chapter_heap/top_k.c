/**
 * File: top_k.c
 * Created Time: 2023-10-26
 * Author: krahets (krahets163.com)
 */

#include "my_heap.c"

/* Push an element onto the heap */
void pushMinHeap(MaxHeap *maxHeap, int val) {
    // Negate the element
    push(maxHeap, -val);
}

/* Pop an element from the heap */
int popMinHeap(MaxHeap *maxHeap) {
    // Negate the element
    return -pop(maxHeap);
}

/* Access the top element of the heap */
int peekMinHeap(MaxHeap *maxHeap) {
    // Negate the element
    return -peek(maxHeap);
}

/* Get the elements in the heap */
int *getMinHeap(MaxHeap *maxHeap) {
    // Negate every element in the heap and store the results in array res
    int *res = (int *)malloc(maxHeap->size * sizeof(int));
    for (int i = 0; i < maxHeap->size; i++) {
        res[i] = -maxHeap->data[i];
    }
    return res;
}

// Use a heap to find the k largest elements in an array
int *topKHeap(int *nums, int sizeNums, int k) {
    // Initialize a min heap
    // Note: negate every element to simulate a min heap with a max heap
    int *empty = (int *)malloc(0);
    MaxHeap *maxHeap = newMaxHeap(empty, 0);
    // Push the first k array elements onto the heap
    for (int i = 0; i < k; i++) {
        pushMinHeap(maxHeap, nums[i]);
    }
    // Starting with element k+1, keep the heap size at k
    for (int i = k; i < sizeNums; i++) {
        // If the current element is larger than the heap top, pop the top element and push the current element
        if (nums[i] > peekMinHeap(maxHeap)) {
            popMinHeap(maxHeap);
            pushMinHeap(maxHeap, nums[i]);
        }
    }
    int *res = getMinHeap(maxHeap);
    // Free memory
    delMaxHeap(maxHeap);
    return res;
}

/* Driver code */
int main() {
    int nums[] = {1, 7, 6, 3, 2};
    int k = 3;
    int sizeNums = sizeof(nums) / sizeof(nums[0]);

    int *res = topKHeap(nums, sizeNums, k);
    printf("The %d largest elements are: ", k);
    printArray(res, k);

    free(res);
    return 0;
}
