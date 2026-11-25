/**
 * File: linkedlist_queue.c
 * Created Time: 2023-03-13
 * Author: Gonglja (glj0@outlook.com)
 */

#include "../utils/common.h"

/* Queue backed by a linked list */
typedef struct {
    ListNode *front, *rear;
    int queSize;
} LinkedListQueue;

/* Constructor */
LinkedListQueue *newLinkedListQueue() {
    LinkedListQueue *queue = (LinkedListQueue *)malloc(sizeof(LinkedListQueue));
    queue->front = NULL;
    queue->rear = NULL;
    queue->queSize = 0;
    return queue;
}

/* Destructor */
void delLinkedListQueue(LinkedListQueue *queue) {
    // Free all the nodes
    while (queue->front != NULL) {
        ListNode *tmp = queue->front;
        queue->front = queue->front->next;
        free(tmp);
    }
    // Free the queue structure
    free(queue);
}

/* Get the queue size */
int size(LinkedListQueue *queue) {
    return queue->queSize;
}

/* Check whether the queue is empty */
bool empty(LinkedListQueue *queue) {
    return (size(queue) == 0);
}

/* Enqueue an element */
void push(LinkedListQueue *queue, int num) {
    // Add node at the tail
    ListNode *node = newListNode(num);
    // If the queue is empty, point both the head and tail at the new node
    if (queue->front == NULL) {
        queue->front = node;
        queue->rear = node;
    }
    // If the queue has elements, link the new node after the tail
    else {
        queue->rear->next = node;
        queue->rear = node;
    }
    queue->queSize++;
}

/* Peek at the front element */
int peek(LinkedListQueue *queue) {
    assert(size(queue) && queue->front);
    return queue->front->val;
}

/* Remove and return the front element */
int pop(LinkedListQueue *queue) {
    int num = peek(queue);
    ListNode *tmp = queue->front;
    queue->front = queue->front->next;
    free(tmp);
    queue->queSize--;
    return num;
}

/* Print the queue */
void printLinkedListQueue(LinkedListQueue *queue) {
    int *arr = malloc(sizeof(int) * queue->queSize);
    // Copy the values from the linked list into an array
    int i;
    ListNode *node;
    for (i = 0, node = queue->front; i < queue->queSize; i++) {
        arr[i] = node->val;
        node = node->next;
    }
    printArray(arr, queue->queSize);
    free(arr);
}

/* Driver code */
int main() {
    /* Initialize the queue */
    LinkedListQueue *queue = newLinkedListQueue();

    /* Enqueue elements */
    push(queue, 1);
    push(queue, 3);
    push(queue, 2);
    push(queue, 5);
    push(queue, 4);
    printf("queue = ");
    printLinkedListQueue(queue);

    /* Peek at the front element */
    int peekNum = peek(queue);
    printf("Front element (peek) = %d\r\n", peekNum);

    /* Dequeue an element */
    peekNum = pop(queue);
    printf("Dequeued element (pop) = %d, queue after removal = ", peekNum);
    printLinkedListQueue(queue);

    /* Get the queue size */
    int queueSize = size(queue);
    printf("Queue size = %d\r\n", queueSize);

    /* Check whether the queue is empty */
    bool isEmpty = empty(queue);
    printf("Queue is empty = %s\r\n", isEmpty ? "true" : "false");

    // Free the allocated memory
    delLinkedListQueue(queue);

    return 0;
}
