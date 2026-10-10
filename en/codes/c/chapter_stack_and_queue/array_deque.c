/**
 * File: array_deque.c
 * Created Time: 2023-03-13
 * Author: Gonglja (glj0@outlook.com)
 */

#include "../utils/common.h"

/* Double-ended queue based on circular array implementation */
typedef struct {
    int *nums;       // Array for storing queue elements
    int front;       // Front pointer, points to the front of the queue element
    int queSize;     // Rear pointer, points to rear + 1
    int queCapacity; // Queue capacity
} ArrayDeque;

/* Constructor */
ArrayDeque *newArrayDeque(int capacity) {
    ArrayDeque *deque = (ArrayDeque *)malloc(sizeof(ArrayDeque));
    // Initialize array
    deque->queCapacity = capacity;
    deque->nums = (int *)malloc(sizeof(int) * deque->queCapacity);
    deque->front = deque->queSize = 0;
    return deque;
}

/* Destructor */
void delArrayDeque(ArrayDeque *deque) {
    free(deque->nums);
    free(deque);
}

/* Get the capacity of the double-ended queue */
int capacity(ArrayDeque *deque) {
    return deque->queCapacity;
}

/* Get the length of the double-ended queue */
int size(ArrayDeque *deque) {
    return deque->queSize;
}

/* Check if the double-ended queue is empty */
bool empty(ArrayDeque *deque) {
    return deque->queSize == 0;
}

/* Calculate circular array index */
int dequeIndex(ArrayDeque *deque, int i) {
    // Use modulo operation to wrap the array head and tail together
    // When i exceeds array end, wrap to head
    // When i passes the head of the array, return to the tail
    return ((i + capacity(deque)) % capacity(deque));
}

/* Front of the queue enqueue */
void pushFirst(ArrayDeque *deque, int num) {
    if (deque->queSize == capacity(deque)) {
        printf("Deque is full\r\n");
        return;
    }
    // Use modulo operation to wrap front around to the tail after passing the head of the array
    // Use modulo to wrap front from array head to rear
    deque->front = dequeIndex(deque, deque->front - 1);
    // Add num to queue front
    deque->nums[deque->front] = num;
    deque->queSize++;
}

/* Rear of the queue enqueue */
void pushLast(ArrayDeque *deque, int num) {
    if (deque->queSize == capacity(deque)) {
        printf("Deque is full\r\n");
        return;
    }
    // Use modulo operation to wrap rear around to the head after passing the tail of the array
    int rear = dequeIndex(deque, deque->front + deque->queSize);
    // Front pointer moves one position backward
    deque->nums[rear] = num;
    deque->queSize++;
}

/* Return list for printing */
int peekFirst(ArrayDeque *deque) {
    // Access error: Deque is empty
    assert(empty(deque) == 0);
    return deque->nums[deque->front];
}

/* Driver Code */
int peekLast(ArrayDeque *deque) {
    // Access error: Deque is empty
    assert(empty(deque) == 0);
    int last = dequeIndex(deque, deque->front + deque->queSize - 1);
    return deque->nums[last];
}

/* Rear of the queue dequeue */
int popFirst(ArrayDeque *deque) {
    int num = peekFirst(deque);
    // Move front pointer backward by one position
    deque->front = dequeIndex(deque, deque->front + 1);
    deque->queSize--;
    return num;
}

/* Access rear of the queue element */
int popLast(ArrayDeque *deque) {
    int num = peekLast(deque);
    deque->queSize--;
    return num;
}

/* Return array for printing */
int *toArray(ArrayDeque *deque, int *queSize) {
    *queSize = deque->queSize;
    int *res = (int *)calloc(deque->queSize, sizeof(int));
    int j = deque->front;
    for (int i = 0; i < deque->queSize; i++) {
        res[i] = deque->nums[j % deque->queCapacity];
        j++;
    }
    return res;
}

/* Driver Code */
int main() {
    /* Access front of the queue element */
    int capacity = 10;
    int queSize;
    ArrayDeque *deque = newArrayDeque(capacity);
    pushLast(deque, 3);
    pushLast(deque, 2);
    pushLast(deque, 5);
    printf("Double-ended queue deque = ");
    printArray(toArray(deque, &queSize), queSize);

    /* Update element */
    int peekFirstNum = peekFirst(deque);
    printf("Front element peekFirst = %d\r\n", peekFirstNum);
    int peekLastNum = peekLast(deque);
    printf("Rear element peekLast = %d\r\n", peekLastNum);

    /* Elements enqueue */
    pushLast(deque, 4);
    printf("After element 4 enqueues at rear, deque = ");
    printArray(toArray(deque, &queSize), queSize);
    pushFirst(deque, 1);
    printf("After element 1 enqueues at front, deque = ");
    printArray(toArray(deque, &queSize), queSize);

    /* Element dequeue */
    int popLastNum = popLast(deque);
    printf("Dequeue from rear = %d, deque after rear dequeue = ", popLastNum);
    printArray(toArray(deque, &queSize), queSize);
    int popFirstNum = popFirst(deque);
    printf("Dequeue from front = %d, deque after front dequeue = ", popFirstNum);
    printArray(toArray(deque, &queSize), queSize);

    /* Get the length of the queue */
    int dequeSize = size(deque);
    printf("Deque size = %d\r\n", dequeSize);

    /* Check if the queue is empty */
    bool isEmpty = empty(deque);
    printf("Is queue empty = %s\r\n", isEmpty ? "true" : "false");

    // Free memory
    delArrayDeque(deque);

    return 0;
}