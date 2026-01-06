/**
 * File: top_k.c
 * Created Time: 2023-10-26
 * Author: krahets (krahets163.com)
 */

#include "my_heap.c"

/* Element enters heap */
void pushMinHeap(MaxHeap *maxHeap, int val) {
    // Negate element
    push(maxHeap, -val);
}

/* Element exits heap */
int popMinHeap(MaxHeap *maxHeap) {
    // Negate element
    return -pop(maxHeap);
}

/* Access top element */
int peekMinHeap(MaxHeap *maxHeap) {
    // Negate element
    return -peek(maxHeap);
}

/* Extract elements from heap */
int *getMinHeap(MaxHeap *maxHeap) {
    // Negate all heap elements and store in res array
    int *res = (int *)malloc(maxHeap->size * sizeof(int));
    for (int i = 0; i < maxHeap->size; i++) {
        res[i] = -maxHeap->data[i];
    }
    return res;
}

// Function to find k largest elements in array using heap
int *topKHeap(int *nums, int sizeNums, int k) {
    // Python's heapq module implements min heap by default
    // Note: We negate all heap elements to simulate min heap using max heap
    int *empty = (int *)malloc(0);
    MaxHeap *maxHeap = newMaxHeap(empty, 0);
    // Enter the first k elements of array into heap
    for (int i = 0; i < k; i++) {
        pushMinHeap(maxHeap, nums[i]);
    }
    // Starting from the (k+1)th element, maintain heap length as k
    for (int i = k; i < sizeNums; i++) {
        // If current element is greater than top element, top element exits heap, current element enters heap
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

/* Driver Code */
int main() {
    int nums[] = {1, 7, 6, 3, 2};
    int k = 3;
    int sizeNums = sizeof(nums) / sizeof(nums[0]);

    int *res = topKHeap(nums, sizeNums, k);
    printf("The largest %d elements are: ", k);
    printArray(res, k);

    free(res);
    return 0;
}
