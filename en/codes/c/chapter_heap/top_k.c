/**
 * File: top_k.c
 * Created Time: 2023-10-26
 * Author: krahets (krahets163.com)
 */

#include "my_heap.c"

/* Push the element into heap */
void pushMinHeap(MaxHeap *maxHeap, int val) {
    // Negate elements
    push(maxHeap, -val);
}

/* Element exits heap */
int popMinHeap(MaxHeap *maxHeap) {
    // Negate elements
    return -pop(maxHeap);
}

/* Access heap top element */
int peekMinHeap(MaxHeap *maxHeap) {
    // Negate elements
    return -peek(maxHeap);
}

/* Remove elements from the heap */
int *getMinHeap(MaxHeap *maxHeap) {
    // Negate all elements in the heap and store them in the res array
    int *res = (int *)malloc(maxHeap->size * sizeof(int));
    for (int i = 0; i < maxHeap->size; i++) {
        res[i] = -maxHeap->data[i];
    }
    return res;
}

// Function to find the largest k elements in an array based on heap
int *topKHeap(int *nums, int sizeNums, int k) {
    // Initialize min-heap
    // Please note: We negate all elements in the heap to simulate a min-heap using a max-heap
    int *empty = (int *)malloc(0);
    MaxHeap *maxHeap = newMaxHeap(empty, 0);
    // Enter the first k elements of the array into the heap
    for (int i = 0; i < k; i++) {
        pushMinHeap(maxHeap, nums[i]);
    }
    // From the k+1th element, keep the heap length as k
    for (int i = k; i < sizeNums; i++) {
        // If the current element is larger than the heap top element, remove the heap top element and enter the current element into the heap
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
