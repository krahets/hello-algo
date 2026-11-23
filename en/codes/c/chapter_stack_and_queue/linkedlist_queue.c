/**
 * File: linkedlist_queue.c
 * Created Time: 2023-03-13
 * Author: Gonglja (glj0@outlook.com)
 */

#include "../utils/common.h"

/* Queue implemented with a linked list */
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
    // Free all nodes
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

/* Enqueue */
void push(LinkedListQueue *queue, int num) {
    // Add node at the tail
    ListNode *node = newListNode(num);
    // If the queue is empty, make both the head and tail point to this node
    if (queue->front == NULL) {
        queue->front = node;
        queue->rear = node;
    }
    // If the queue is not empty, add this node after the tail node
    else {
        queue->rear->next = node;
        queue->rear = node;
    }
    queue->queSize++;
}

/* Access the front element */
int peek(LinkedListQueue *queue) {
    assert(size(queue) && queue->front);
    return queue->front->val;
}

/* Dequeue */
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
    // Copy the linked list data into an array
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
    printf("Queue queue = ");
    printLinkedListQueue(queue);

    /* Access the front element */
    int peekNum = peek(queue);
    printf("Front element peek = %d\r\n", peekNum);

    /* Dequeue an element */
    peekNum = pop(queue);
    printf("Dequeued element pop = %d; after dequeuing, queue = ", peekNum);
    printLinkedListQueue(queue);

    /* Get the queue size */
    int queueSize = size(queue);
    printf("Queue size = %d\r\n", queueSize);

    /* Check whether the queue is empty */
    bool isEmpty = empty(queue);
    printf("Is the queue empty = %s\r\n", isEmpty ? "true" : "false");

    // Free memory
    delLinkedListQueue(queue);

    return 0;
}
