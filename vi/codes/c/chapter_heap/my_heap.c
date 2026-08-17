/**
 * File: my_heap.c
 * Created Time: 2023-01-15
 * Author: Reanon (793584285@qq.com)
 */

#include "../utils/common.h"

#define MAX_SIZE 5000

/* Max heap */
typedef struct {
    // size represents the actual number of elements
    int size;
    // Use pre-allocated array to avoid expansion
    int data[MAX_SIZE];
} MaxHeap;

// Function declaration
void siftDown(MaxHeap *maxHeap, int i);
void siftUp(MaxHeap *maxHeap, int i);
int parent(MaxHeap *maxHeap, int i);

/* Constructor, build heap from slice */
MaxHeap *newMaxHeap(int nums[], int size) {
    // Push all elements to heap
    MaxHeap *maxHeap = (MaxHeap *)malloc(sizeof(MaxHeap));
    maxHeap->size = size;
    memcpy(maxHeap->data, nums, size * sizeof(int));
    for (int i = parent(maxHeap, size - 1); i >= 0; i--) {
        // Heapify all nodes except leaf nodes
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

/* Check if heap is empty */
int isEmpty(MaxHeap *maxHeap) {
    return maxHeap->size == 0;
}

/* Access top element */
int peek(MaxHeap *maxHeap) {
    return maxHeap->data[0];
}

/* Element enters heap */
void push(MaxHeap *maxHeap, int val) {
    // By default, should not add this many nodes
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
    // Handle empty case
    if (isEmpty(maxHeap)) {
        printf("heap is empty!");
        return INT_MAX;
    }
    // Delete node
    swap(maxHeap, 0, size(maxHeap) - 1);
    // Remove node
    int val = maxHeap->data[maxHeap->size - 1];
    maxHeap->size--;
    // Return top element
    siftDown(maxHeap, 0);

    // Return heap top element
    return val;
}

/* Starting from node i, heapify from top to bottom */
void siftDown(MaxHeap *maxHeap, int i) {
    while (true) {
        // Find node with maximum value among nodes i, l, r, denoted as max
        int l = left(maxHeap, i);
        int r = right(maxHeap, i);
        int max = i;
        if (l < size(maxHeap) && maxHeap->data[l] > maxHeap->data[max]) {
            max = l;
        }
        if (r < size(maxHeap) && maxHeap->data[r] > maxHeap->data[max]) {
            max = r;
        }
        // Swap two nodes
        if (max == i) {
            break;
        }
        // Swap two nodes
        swap(maxHeap, i, max);
        // Loop downwards heapification
        i = max;
    }
}

/* Starting from node i, heapify from bottom to top */
void siftUp(MaxHeap *maxHeap, int i) {
    while (true) {
        // Get parent node of node i
        int p = parent(maxHeap, i);
        // When "crossing root node" or "node needs no repair", end heapify
        if (p < 0 || maxHeap->data[i] <= maxHeap->data[p]) {
            break;
        }
        // Swap two nodes
        swap(maxHeap, i, p);
        // Loop upward heapify
        i = p;
    }
}
