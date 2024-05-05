/**
 * File: my_heap.c
 * Created Time: 2023-01-15
 * Author: Reanon (793584285@qq.com)
 */

#include "../utils/common.h"

#define MAX_SIZE 5000

/* Max-heap */
typedef struct {
    // size represents the actual number of elements
    int size;
    // Use pre-allocated memory array to avoid resizing
    int data[MAX_SIZE];
} MaxHeap;

// Function declaration
void siftDown(MaxHeap *maxHeap, int i);
void siftUp(MaxHeap *maxHeap, int i);
int parent(MaxHeap *maxHeap, int i);

/* Constructor, build a heap based on slice */
MaxHeap *newMaxHeap(int nums[], int size) {
    // All elements entered into heap
    MaxHeap *maxHeap = (MaxHeap *)malloc(sizeof(MaxHeap));
    maxHeap->size = size;
    memcpy(maxHeap->data, nums, size * sizeof(int));
    for (int i = parent(maxHeap, size - 1); i >= 0; i--) {
        // Heapify all nodes except leaves
        siftDown(maxHeap, i);
    }
    return maxHeap;
}

/* Destructor */
void delMaxHeap(MaxHeap *maxHeap) {
    // Free memory
    free(maxHeap);
}

/* Get index of left child node */
int left(MaxHeap *maxHeap, int i) {
    return 2 * i + 1;
}

/* Get index of right child node */
int right(MaxHeap *maxHeap, int i) {
    return 2 * i + 2;
}

/* Get index of parent node */
int parent(MaxHeap *maxHeap, int i) {
    return (i - 1) / 2; // Round down
}

/* Swap elements */
void swap(MaxHeap *maxHeap, int i, int j) {
    int temp = maxHeap->data[i];
    maxHeap->data[i] = maxHeap->data[j];
    maxHeap->data[j] = temp;
}

/* Get heap size */
int size(MaxHeap *maxHeap) {
    return maxHeap->size;
}

/* Determine if heap is empty */
int isEmpty(MaxHeap *maxHeap) {
    return maxHeap->size == 0;
}

/* Access heap top element */
int peek(MaxHeap *maxHeap) {
    return maxHeap->data[0];
}

/* Push the element into heap */
void push(MaxHeap *maxHeap, int val) {
    // Normally, should not add so many nodes
    if (maxHeap->size == MAX_SIZE) {
        printf("heap is full!");
        return;
    }
    // Add node
    maxHeap->data[maxHeap->size] = val;
    maxHeap->size++;

    // Heapify from bottom to top
    siftUp(maxHeap, maxHeap->size - 1);
}

/* Element exits heap */
int pop(MaxHeap *maxHeap) {
    // Empty handling
    if (isEmpty(maxHeap)) {
        printf("heap is empty!");
        return INT_MAX;
    }
    // Swap the root node with the rightmost leaf node (swap the first element with the last element)
    swap(maxHeap, 0, size(maxHeap) - 1);
    // Remove node
    int val = maxHeap->data[maxHeap->size - 1];
    maxHeap->size--;
    // Heapify from top to bottom
    siftDown(maxHeap, 0);

    // Return heap top element
    return val;
}

/* Start heapifying node i, from top to bottom */
void siftDown(MaxHeap *maxHeap, int i) {
    while (true) {
        // Determine the node with the maximum value among nodes i, l, r, denoted as max
        int l = left(maxHeap, i);
        int r = right(maxHeap, i);
        int max = i;
        if (l < size(maxHeap) && maxHeap->data[l] > maxHeap->data[max]) {
            max = l;
        }
        if (r < size(maxHeap) && maxHeap->data[r] > maxHeap->data[max]) {
            max = r;
        }
        // If node i is the largest or indices l, r are out of bounds, no further heapification needed, break
        if (max == i) {
            break;
        }
        // Swap two nodes
        swap(maxHeap, i, max);
        // Loop downwards heapification
        i = max;
    }
}

/* Start heapifying node i, from bottom to top */
void siftUp(MaxHeap *maxHeap, int i) {
    while (true) {
        // Get parent node of node i
        int p = parent(maxHeap, i);
        // When "crossing the root node" or "node does not need repair", end heapification
        if (p < 0 || maxHeap->data[i] <= maxHeap->data[p]) {
            break;
        }
        // Swap two nodes
        swap(maxHeap, i, p);
        // Loop upwards heapification
        i = p;
    }
}
