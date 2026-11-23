/**
 * File: array_deque.c
 * Created Time: 2023-03-13
 * Author: Gonglja (glj0@outlook.com)
 */

#include "../utils/common.h"

/* Deque implemented with a circular array */
typedef struct {
    int *nums;       // Array that stores the queue elements
    int front;       // Front pointer, pointing to the first element
    int queSize;     // Current number of elements in the deque
    int queCapacity; // Queue capacity
} ArrayDeque;

/* Constructor */
ArrayDeque *newArrayDeque(int capacity) {
    ArrayDeque *deque = (ArrayDeque *)malloc(sizeof(ArrayDeque));
    // Initialize the array
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

/* Get the deque capacity */
int capacity(ArrayDeque *deque) {
    return deque->queCapacity;
}

/* Get the deque size */
int size(ArrayDeque *deque) {
    return deque->queSize;
}

/* Check whether the deque is empty */
bool empty(ArrayDeque *deque) {
    return deque->queSize == 0;
}

/* Calculate an index in the circular array */
int dequeIndex(ArrayDeque *deque, int i) {
    // Use modulo to connect the end of the array to its beginning
    // When i passes the end of the array, wrap to the beginning
    // When i passes the beginning of the array, wrap around to the end
    return ((i + capacity(deque)) % capacity(deque));
}

/* Enqueue at the front */
void pushFirst(ArrayDeque *deque, int num) {
    if (deque->queSize == capacity(deque)) {
        printf("Deque is full\r\n");
        return;
    }
    // Move the front pointer one position to the left
    // Use modulo to wrap front to the end when it passes the beginning
    deque->front = dequeIndex(deque, deque->front - 1);
    // Add num to the front
    deque->nums[deque->front] = num;
    deque->queSize++;
}

/* Enqueue at the rear */
void pushLast(ArrayDeque *deque, int num) {
    if (deque->queSize == capacity(deque)) {
        printf("Deque is full\r\n");
        return;
    }
    // Calculate the rear pointer, which points one position past the last element
    int rear = dequeIndex(deque, deque->front + deque->queSize);
    // Add num to the rear
    deque->nums[rear] = num;
    deque->queSize++;
}

/* Access the front element */
int peekFirst(ArrayDeque *deque) {
    // Access error: the deque is empty
    assert(empty(deque) == 0);
    return deque->nums[deque->front];
}

/* Access the rear element */
int peekLast(ArrayDeque *deque) {
    // Access error: the deque is empty
    assert(empty(deque) == 0);
    int last = dequeIndex(deque, deque->front + deque->queSize - 1);
    return deque->nums[last];
}

/* Dequeue from the front */
int popFirst(ArrayDeque *deque) {
    int num = peekFirst(deque);
    // Advance the front pointer by one position
    deque->front = dequeIndex(deque, deque->front + 1);
    deque->queSize--;
    return num;
}

/* Dequeue from the rear */
int popLast(ArrayDeque *deque) {
    int num = peekLast(deque);
    deque->queSize--;
    return num;
}

/* Return an array for printing */
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

/* Driver code */
int main() {
    /* Initialize the queue */
    int capacity = 10;
    int queSize;
    ArrayDeque *deque = newArrayDeque(capacity);
    pushLast(deque, 3);
    pushLast(deque, 2);
    pushLast(deque, 5);
    printf("Deque deque = ");
    printArray(toArray(deque, &queSize), queSize);

    /* Access an element */
    int peekFirstNum = peekFirst(deque);
    printf("Front element peekFirst = %d\r\n", peekFirstNum);
    int peekLastNum = peekLast(deque);
    printf("Rear element peekLast = %d\r\n", peekLastNum);

    /* Enqueue elements */
    pushLast(deque, 4);
    printf("After enqueuing element 4 at the rear, deque = ");
    printArray(toArray(deque, &queSize), queSize);
    pushFirst(deque, 1);
    printf("After enqueuing element 1 at the front, deque = ");
    printArray(toArray(deque, &queSize), queSize);

    /* Dequeue an element */
    int popLastNum = popLast(deque);
    printf("Element removed from the rear = %d; after removal, deque= ", popLastNum);
    printArray(toArray(deque, &queSize), queSize);
    int popFirstNum = popFirst(deque);
    printf("Element removed from the front = %d; after removal, deque= ", popFirstNum);
    printArray(toArray(deque, &queSize), queSize);

    /* Get the queue size */
    int dequeSize = size(deque);
    printf("Deque size = %d\r\n", dequeSize);

    /* Check whether the queue is empty */
    bool isEmpty = empty(deque);
    printf("Is the queue empty = %s\r\n", isEmpty ? "true" : "false");

    // Free memory
    delArrayDeque(deque);

    return 0;
}