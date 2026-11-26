/**
 * File: array_deque.c
 * Created Time: 2023-03-13
 * Author: Gonglja (glj0@outlook.com)
 */

#include "../utils/common.h"

/* Deque backed by a circular array */
typedef struct {
    int *nums;       // Array that stores the deque elements
    int front;       // Index of the front element
    int queSize;     // Number of elements in the deque
    int queCapacity; // Deque capacity
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

/* Compute the circular array index */
int dequeIndex(ArrayDeque *deque, int i) {
    // Use the remainder to wrap indices around the array
    // When i goes past the end, wrap it back to the start
    // When i goes before the start, wrap it around to the end
    return ((i + capacity(deque)) % capacity(deque));
}

/* Add an element at the front */
void pushFirst(ArrayDeque *deque, int num) {
    if (deque->queSize == capacity(deque)) {
        printf("Deque is full\r\n");
        return;
    }
    // Move the front index one slot to the left
    // Use the remainder to wrap front to the end if it goes before the start
    deque->front = dequeIndex(deque, deque->front - 1);
    // Add num at the front
    deque->nums[deque->front] = num;
    deque->queSize++;
}

/* Add an element at the rear */
void pushLast(ArrayDeque *deque, int num) {
    if (deque->queSize == capacity(deque)) {
        printf("Deque is full\r\n");
        return;
    }
    // Compute the index one slot past the rear element
    int rear = dequeIndex(deque, deque->front + deque->queSize);
    // Add num at the rear
    deque->nums[rear] = num;
    deque->queSize++;
}

/* Peek at the front element */
int peekFirst(ArrayDeque *deque) {
    // Cannot access an element in an empty deque
    assert(empty(deque) == 0);
    return deque->nums[deque->front];
}

/* Peek at the rear element */
int peekLast(ArrayDeque *deque) {
    // Cannot access an element in an empty deque
    assert(empty(deque) == 0);
    int last = dequeIndex(deque, deque->front + deque->queSize - 1);
    return deque->nums[last];
}

/* Remove and return the front element */
int popFirst(ArrayDeque *deque) {
    int num = peekFirst(deque);
    // Advance the front index by one
    deque->front = dequeIndex(deque, deque->front + 1);
    deque->queSize--;
    return num;
}

/* Remove and return the rear element */
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
    /* Initialize the deque */
    int capacity = 10;
    int queSize;
    ArrayDeque *deque = newArrayDeque(capacity);
    pushLast(deque, 3);
    pushLast(deque, 2);
    pushLast(deque, 5);
    printf("deque = ");
    printArray(toArray(deque, &queSize), queSize);

    /* Peek at the front and rear elements */
    int peekFirstNum = peekFirst(deque);
    printf("Front element (peekFirst) = %d\r\n", peekFirstNum);
    int peekLastNum = peekLast(deque);
    printf("Rear element (peekLast) = %d\r\n", peekLastNum);

    /* Add elements to the deque */
    pushLast(deque, 4);
    printf("After adding 4 at the rear, deque = ");
    printArray(toArray(deque, &queSize), queSize);
    pushFirst(deque, 1);
    printf("After adding 1 at the front, deque = ");
    printArray(toArray(deque, &queSize), queSize);

    /* Remove elements from both ends */
    int popLastNum = popLast(deque);
    printf("Removed from the rear = %d, deque after removal = ", popLastNum);
    printArray(toArray(deque, &queSize), queSize);
    int popFirstNum = popFirst(deque);
    printf("Removed from the front = %d, deque after removal = ", popFirstNum);
    printArray(toArray(deque, &queSize), queSize);

    /* Get the deque size */
    int dequeSize = size(deque);
    printf("Deque size = %d\r\n", dequeSize);

    /* Check whether the deque is empty */
    bool isEmpty = empty(deque);
    printf("Deque is empty = %s\r\n", isEmpty ? "true" : "false");

    // Free the allocated memory
    delArrayDeque(deque);

    return 0;
}