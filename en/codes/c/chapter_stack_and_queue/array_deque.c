/**
 * File: array_deque.c
 * Created Time: 2023-03-13
 * Author: Gonglja (glj0@outlook.com)
 */

#include "../utils/common.h"

/* Double-ended queue class based on circular array */
typedef struct {
    int *nums;       // Array for storing queue elements
    int front;       // Front pointer, pointing to the front element
    int queSize;     // Tail pointer, pointing to queue end + 1
    int queCapacity; // Queue capacity
} ArrayDeque;

/* Constructor */
ArrayDeque *newArrayDeque(int capacity) {
    ArrayDeque *deque = (ArrayDeque *)malloc(sizeof(ArrayDeque));
    // Initialize an array
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

/* Determine if the double-ended queue is empty */
bool empty(ArrayDeque *deque) {
    return deque->queSize == 0;
}

/* Calculate circular array index */
int dequeIndex(ArrayDeque *deque, int i) {
    // Implement circular array by modulo operation
    // When i passes the end of the array, return to the beginning
    // When i exceeds the head of the array, return to the tail
    return ((i + capacity(deque)) % capacity(deque));
}

/* Front enqueue */
void pushFirst(ArrayDeque *deque, int num) {
    if (deque->queSize == capacity(deque)) {
        printf("Double-ended queue is full\r\n");
        return;
    }
    // Move the front pointer one position to the left
    // Use modulo operation to make front pass the head of the array back to the tail
    deque->front = dequeIndex(deque, deque->front - 1);
    // Add num to the front of the queue
    deque->nums[deque->front] = num;
    deque->queSize++;
}

/* Rear enqueue */
void pushLast(ArrayDeque *deque, int num) {
    if (deque->queSize == capacity(deque)) {
        printf("Double-ended queue is full\r\n");
        return;
    }
    // Calculate rear pointer, pointing to rear index + 1
    int rear = dequeIndex(deque, deque->front + deque->queSize);
    // Add num to the rear
    deque->nums[rear] = num;
    deque->queSize++;
}

/* Access front element */
int peekFirst(ArrayDeque *deque) {
    // Access exception: Double-ended queue is empty
    assert(empty(deque) == 0);
    return deque->nums[deque->front];
}

/* Access rear element */
int peekLast(ArrayDeque *deque) {
    // Access exception: Double-ended queue is empty
    assert(empty(deque) == 0);
    int last = dequeIndex(deque, deque->front + deque->queSize - 1);
    return deque->nums[last];
}

/* Front dequeue */
int popFirst(ArrayDeque *deque) {
    int num = peekFirst(deque);
    // Move front pointer one position backward
    deque->front = dequeIndex(deque, deque->front + 1);
    deque->queSize--;
    return num;
}

/* Rear dequeue */
int popLast(ArrayDeque *deque) {
    int num = peekLast(deque);
    deque->queSize--;
    return num;
}

/* Driver Code */
int main() {
    /* Initialize queue */
    int capacity = 10;
    ArrayDeque *deque = newArrayDeque(capacity);
    pushLast(deque, 3);
    pushLast(deque, 2);
    pushLast(deque, 5);
    printf("Double-ended queue deque =");
    printArray(deque->nums, deque->queSize);

    /* Access element */
    int peekFirstNum = peekFirst(deque);
    printf("Front element peekFirst = %d\r\n", peekFirstNum);
    int peekLastNum = peekLast(deque);
    printf("Back element peekLast = %d\r\n", peekLastNum);

    /* Element enqueue */
    pushLast(deque, 4);
    printf("Element 4 enqueued at the tail, deque =");
    printArray(deque->nums, deque->queSize);
    pushFirst(deque, 1);
    printf("Element 1 enqueued at the head, deque =");
    printArray(deque->nums, deque->queSize);

    /* Element dequeue */
    int popLastNum = popLast(deque);
    printf("Back dequeue element = %d, deque after back dequeue= ", popLastNum);
    printArray(deque->nums, deque->queSize);
    int popFirstNum = popFirst(deque);
    printf("Front dequeue element = %d, deque after front dequeue= ", popFirstNum);
    printArray(deque->nums, deque->queSize);

    /* Get the length of the queue */
    int dequeSize = size(deque);
    printf("Double-ended queue length size = %d\r\n", dequeSize);

    /* Determine if the queue is empty */
    bool isEmpty = empty(deque);
    printf("Is the queue empty = %s\r\n", isEmpty ? "true" : "false");

    // Free memory
    delArrayDeque(deque);

    return 0;
}
