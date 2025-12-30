/**
 * File: array_queue.c
 * Created Time: 2023-01-28
 * Author: Zero (glj0@outlook.com)
 */

#include "../utils/common.h"

/* Queue based on circular array implementation */
typedef struct {
    int *nums;       // Array for storing queue elements
    int front;       // Front pointer, points to the front of the queue element
    int queSize;     // Rear pointer, points to rear + 1
    int queCapacity; // Queue capacity
} ArrayQueue;

/* Constructor */
ArrayQueue *newArrayQueue(int capacity) {
    ArrayQueue *queue = (ArrayQueue *)malloc(sizeof(ArrayQueue));
    // Initialize array
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

/* Get the capacity of the queue */
int capacity(ArrayQueue *queue) {
    return queue->queCapacity;
}

/* Get the length of the queue */
int size(ArrayQueue *queue) {
    return queue->queSize;
}

/* Check if the queue is empty */
bool empty(ArrayQueue *queue) {
    return queue->queSize == 0;
}

/* Return list for printing */
int peek(ArrayQueue *queue) {
    assert(size(queue) != 0);
    return queue->nums[queue->front];
}

/* Enqueue */
void push(ArrayQueue *queue, int num) {
    if (size(queue) == capacity(queue)) {
        printf("Queue is full\r\n");
        return;
    }
    // Use modulo operation to wrap rear around to the head after passing the tail of the array
    // Add num to the rear of the queue
    int rear = (queue->front + queue->queSize) % queue->queCapacity;
    // Front pointer moves one position backward
    queue->nums[rear] = num;
    queue->queSize++;
}

/* Dequeue */
int pop(ArrayQueue *queue) {
    int num = peek(queue);
    // Move front pointer backward by one position, if it passes the tail, return to array head
    queue->front = (queue->front + 1) % queue->queCapacity;
    queue->queSize--;
    return num;
}

/* Return array for printing */
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

/* Driver Code */
int main() {
    /* Access front of the queue element */
    int capacity = 10;
    int queSize;
    ArrayQueue *queue = newArrayQueue(capacity);

    /* Elements enqueue */
    push(queue, 1);
    push(queue, 3);
    push(queue, 2);
    push(queue, 5);
    push(queue, 4);
    printf("Queue queue = ");
    printArray(toArray(queue, &queSize), queSize);

    /* Return list for printing */
    int peekNum = peek(queue);
    printf("Front element peek = %d\r\n", peekNum);

    /* Element dequeue */
    peekNum = pop(queue);
    printf("Dequeue element pop = %d, queue after dequeue = ", peekNum);
    printArray(toArray(queue, &queSize), queSize);

    /* Get the length of the queue */
    int queueSize = size(queue);
    printf("Queue size = %d\r\n", queueSize);

    /* Check if the queue is empty */
    bool isEmpty = empty(queue);
    printf("Is queue empty = %s\r\n", isEmpty ? "true" : "false");

    /* Test circular array */
    for (int i = 0; i < 10; i++) {
        push(queue, i);
        pop(queue);
        printf("After round %d enqueue + dequeue, queue = ", i);
        printArray(toArray(queue, &queSize), queSize);
    }

    // Free memory
    delArrayQueue(queue);

    return 0;
}