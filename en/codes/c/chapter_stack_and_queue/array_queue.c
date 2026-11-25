/**
 * File: array_queue.c
 * Created Time: 2023-01-28
 * Author: Zero (glj0@outlook.com)
 */

#include "../utils/common.h"

/* Queue backed by a circular array */
typedef struct {
    int *nums;       // Array that stores the queue elements
    int front;       // Index of the front element
    int queSize;     // Number of elements currently in the queue
    int queCapacity; // Queue capacity
} ArrayQueue;

/* Constructor */
ArrayQueue *newArrayQueue(int capacity) {
    ArrayQueue *queue = (ArrayQueue *)malloc(sizeof(ArrayQueue));
    // Initialize the array
    queue->queCapacity = capacity;
    queue->nums = (int *)malloc(sizeof(int) * queue->queCapacity);
    queue->front = queue->queSize = 0;
    return queue;
}

/* Destructor */
void delArrayQueue(ArrayQueue *queue) {
    free(queue->nums);
    free(queue);
}

/* Get the queue capacity */
int capacity(ArrayQueue *queue) {
    return queue->queCapacity;
}

/* Get the queue size */
int size(ArrayQueue *queue) {
    return queue->queSize;
}

/* Check whether the queue is empty */
bool empty(ArrayQueue *queue) {
    return queue->queSize == 0;
}

/* Peek at the front element */
int peek(ArrayQueue *queue) {
    assert(size(queue) != 0);
    return queue->nums[queue->front];
}

/* Enqueue an element */
void push(ArrayQueue *queue, int num) {
    if (size(queue) == capacity(queue)) {
        printf("Queue is full\r\n");
        return;
    }
    // Compute the index one slot past the rear element
    // Use the remainder to wrap rear back to the start of the array
    int rear = (queue->front + queue->queSize) % queue->queCapacity;
    // Add num at the rear
    queue->nums[rear] = num;
    queue->queSize++;
}

/* Remove and return the front element */
int pop(ArrayQueue *queue) {
    int num = peek(queue);
    // Advance the front index by one, wrapping to the start if it passes the end
    queue->front = (queue->front + 1) % queue->queCapacity;
    queue->queSize--;
    return num;
}

/* Return an array for printing */
int *toArray(ArrayQueue *queue, int *queSize) {
    *queSize = queue->queSize;
    int *res = (int *)calloc(queue->queSize, sizeof(int));
    int j = queue->front;
    for (int i = 0; i < queue->queSize; i++) {
        res[i] = queue->nums[j % queue->queCapacity];
        j++;
    }
    return res;
}

/* Driver code */
int main() {
    /* Initialize the queue */
    int capacity = 10;
    int queSize;
    ArrayQueue *queue = newArrayQueue(capacity);

    /* Enqueue elements */
    push(queue, 1);
    push(queue, 3);
    push(queue, 2);
    push(queue, 5);
    push(queue, 4);
    printf("queue = ");
    printArray(toArray(queue, &queSize), queSize);

    /* Peek at the front element */
    int peekNum = peek(queue);
    printf("Front element (peek) = %d\r\n", peekNum);

    /* Dequeue an element */
    peekNum = pop(queue);
    printf("Dequeued element (pop) = %d, queue after removal = ", peekNum);
    printArray(toArray(queue, &queSize), queSize);

    /* Get the queue size */
    int queueSize = size(queue);
    printf("Queue size = %d\r\n", queueSize);

    /* Check whether the queue is empty */
    bool isEmpty = empty(queue);
    printf("Queue is empty = %s\r\n", isEmpty ? "true" : "false");

    /* Test the circular array */
    for (int i = 0; i < 10; i++) {
        push(queue, i);
        pop(queue);
        printf("After enqueue/dequeue round %d, queue = ", i);
        printArray(toArray(queue, &queSize), queSize);
    }

    // Free the allocated memory
    delArrayQueue(queue);

    return 0;
}