/**
 * File: array_queue.c
 * Created Time: 2023-01-28
 * Author: Zero (glj0@outlook.com)
 */

#include "../utils/common.h"

/* Queue implemented with a circular array */
typedef struct {
    int *nums;       // Array that stores the queue elements
    int front;       // Front pointer, pointing to the first element
    int queSize;     // Current number of elements in the queue
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

/* Access the front element */
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
    // Calculate the rear pointer, which points one position past the last element
    // Use modulo to wrap rear to the beginning when it passes the end of the array
    int rear = (queue->front + queue->queSize) % queue->queCapacity;
    // Add num to the rear
    queue->nums[rear] = num;
    queue->queSize++;
}

/* Dequeue */
int pop(ArrayQueue *queue) {
    int num = peek(queue);
    // Advance the front pointer by one position, wrapping to the beginning if it passes the end
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
    printf("Queue queue = ");
    printArray(toArray(queue, &queSize), queSize);

    /* Access the front element */
    int peekNum = peek(queue);
    printf("Front element peek = %d\r\n", peekNum);

    /* Dequeue an element */
    peekNum = pop(queue);
    printf("Dequeued element pop = %d; after dequeuing, queue = ", peekNum);
    printArray(toArray(queue, &queSize), queSize);

    /* Get the queue size */
    int queueSize = size(queue);
    printf("Queue size = %d\r\n", queueSize);

    /* Check whether the queue is empty */
    bool isEmpty = empty(queue);
    printf("Is the queue empty = %s\r\n", isEmpty ? "true" : "false");

    /* Test the circular array */
    for (int i = 0; i < 10; i++) {
        push(queue, i);
        pop(queue);
        printf("After enqueueing and dequeueing in round %d, queue = ", i);
        printArray(toArray(queue, &queSize), queSize);
    }

    // Free memory
    delArrayQueue(queue);

    return 0;
}