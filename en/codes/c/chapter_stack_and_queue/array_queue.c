/**
 * File: array_queue.c
 * Created Time: 2023-01-28
 * Author: Zero (glj0@outlook.com)
 */

#include "../utils/common.h"

/* Queue class based on circular array */
typedef struct {
    int *nums;       // Array for storing queue elements
    int front;       // Front pointer, pointing to the front element
    int queSize;     // Tail pointer, pointing to queue end + 1
    int queCapacity; // Queue capacity
} ArrayQueue;

/* Constructor */
ArrayQueue *newArrayQueue(int capacity) {
    ArrayQueue *queue = (ArrayQueue *)malloc(sizeof(ArrayQueue));
    // Initialize an array
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

/* Determine if the queue is empty */
bool empty(ArrayQueue *queue) {
    return queue->queSize == 0;
}

/* Access front element */
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
    // Calculate rear pointer, pointing to rear index + 1
    // Use modulo operation to wrap the rear pointer from the end of the array back to the start
    int rear = (queue->front + queue->queSize) % queue->queCapacity;
    // Add num to the rear
    queue->nums[rear] = num;
    queue->queSize++;
}

/* Dequeue */
int pop(ArrayQueue *queue) {
    int num = peek(queue);
    // Move front pointer one position backward, returning to the head of the array if it exceeds the tail
    queue->front = (queue->front + 1) % queue->queCapacity;
    queue->queSize--;
    return num;
}

/* Driver Code */
int main() {
    /* Initialize queue */
    int capacity = 10;
    ArrayQueue *queue = newArrayQueue(capacity);

    /* Element enqueue */
    push(queue, 1);
    push(queue, 3);
    push(queue, 2);
    push(queue, 5);
    push(queue, 4);
    printf("Queue queue =");
    printArray(queue->nums, queue->queSize);

    /* Access front element */
    int peekNum = peek(queue);
    printf("Front element peek = %d\r\n", peekNum);

    /* Element dequeue */
    peekNum = pop(queue);
    printf("Dequeue element pop = %d, queue after dequeue = ", peekNum);
    printArray(queue->nums, queue->queSize);

    /* Get the length of the queue */
    int queueSize = size(queue);
    printf("Queue length size = %d\r\n", queueSize);

    /* Determine if the queue is empty */
    bool isEmpty = empty(queue);
    printf("Is the queue empty = %s\r\n", isEmpty ? "true" : "false");

    /* Test circular array */
    for (int i = 0; i < 10; i++) {
        push(queue, i);
        pop(queue);
        printf("After the %d round of enqueue + dequeue, queue = ", i);
        printArray(queue->nums, queue->queSize);
    }

    // Free memory
    delArrayQueue(queue);

    return 0;
}
