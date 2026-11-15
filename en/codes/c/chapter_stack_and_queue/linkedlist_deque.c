/**
 * File: linkedlist_deque.c
 * Created Time: 2023-03-13
 * Author: Gonglja (glj0@outlook.com)
 */

#include "../utils/common.h"

/* Doubly linked list node */
typedef struct DoublyListNode {
    int val;                     // Node value
    struct DoublyListNode *next; // Next node
    struct DoublyListNode *prev; // Previous node
} DoublyListNode;

/* Constructor */
DoublyListNode *newDoublyListNode(int num) {
    DoublyListNode *new = (DoublyListNode *)malloc(sizeof(DoublyListNode));
    new->val = num;
    new->next = NULL;
    new->prev = NULL;
    return new;
}

/* Destructor */
void delDoublyListNode(DoublyListNode *node) {
    free(node);
}

/* Deque implemented with a doubly linked list */
typedef struct {
    DoublyListNode *front, *rear; // Head node front and tail node rear
    int queSize;                  // Deque size
} LinkedListDeque;

/* Constructor */
LinkedListDeque *newLinkedListDeque() {
    LinkedListDeque *deque = (LinkedListDeque *)malloc(sizeof(LinkedListDeque));
    deque->front = NULL;
    deque->rear = NULL;
    deque->queSize = 0;
    return deque;
}

/* Destructor */
void delLinkedListdeque(LinkedListDeque *deque) {
    // Free all nodes
    for (int i = 0; i < deque->queSize && deque->front != NULL; i++) {
        DoublyListNode *tmp = deque->front;
        deque->front = deque->front->next;
        free(tmp);
    }
    // Free the deque structure
    free(deque);
}

/* Get the queue size */
int size(LinkedListDeque *deque) {
    return deque->queSize;
}

/* Check whether the queue is empty */
bool empty(LinkedListDeque *deque) {
    return (size(deque) == 0);
}

/* Enqueue */
void push(LinkedListDeque *deque, int num, bool isFront) {
    DoublyListNode *node = newDoublyListNode(num);
    // If the list is empty, make both front and rear point to node
    if (empty(deque)) {
        deque->front = deque->rear = node;
    }
    // Enqueue at the front
    else if (isFront) {
        // Add node to the head of the linked list
        deque->front->prev = node;
        node->next = deque->front;
        deque->front = node; // Update the head node
    }
    // Enqueue at the rear
    else {
        // Add node to the tail of the linked list
        deque->rear->next = node;
        node->prev = deque->rear;
        deque->rear = node;
    }
    deque->queSize++; // Update the queue size
}

/* Enqueue at the front */
void pushFirst(LinkedListDeque *deque, int num) {
    push(deque, num, true);
}

/* Enqueue at the rear */
void pushLast(LinkedListDeque *deque, int num) {
    push(deque, num, false);
}

/* Access the front element */
int peekFirst(LinkedListDeque *deque) {
    assert(size(deque) && deque->front);
    return deque->front->val;
}

/* Access the rear element */
int peekLast(LinkedListDeque *deque) {
    assert(size(deque) && deque->rear);
    return deque->rear->val;
}

/* Dequeue */
int pop(LinkedListDeque *deque, bool isFront) {
    if (empty(deque))
        return -1;
    int val;
    // When the queue size is 1, the head and tail point to the same node
    if (deque->queSize == 1) {
        val = deque->front->val;
        delDoublyListNode(deque->front); // Both point to the same node, so free it only once
        deque->front = NULL;
        deque->rear = NULL;
    }
    // Dequeue from the front
    else if (isFront) {
        val = peekFirst(deque); // Save the head node value
        DoublyListNode *fNext = deque->front->next;
        fNext->prev = NULL;
        deque->front->next = NULL;
        delDoublyListNode(deque->front);
        deque->front = fNext; // Update the head node
    }
    // Dequeue from the rear
    else {
        val = peekLast(deque); // Save the tail node value
        DoublyListNode *rPrev = deque->rear->prev;
        rPrev->next = NULL;
        deque->rear->prev = NULL;
        delDoublyListNode(deque->rear);
        deque->rear = rPrev; // Update the tail node
    }
    deque->queSize--; // Update the queue size
    return val;
}

/* Dequeue from the front */
int popFirst(LinkedListDeque *deque) {
    return pop(deque, true);
}

/* Dequeue from the rear */
int popLast(LinkedListDeque *deque) {
    return pop(deque, false);
}

/* Print the queue */
void printLinkedListDeque(LinkedListDeque *deque) {
    int *arr = malloc(sizeof(int) * deque->queSize);
    // Copy the linked list data into an array
    int i;
    DoublyListNode *node;
    for (i = 0, node = deque->front; i < deque->queSize; i++) {
        arr[i] = node->val;
        node = node->next;
    }
    printArray(arr, deque->queSize);
    free(arr);
}

/* Driver code */
int main() {
    /* Initialize the deque */
    LinkedListDeque *deque = newLinkedListDeque();
    pushLast(deque, 3);
    pushLast(deque, 2);
    pushLast(deque, 5);
    printf("Deque deque = ");
    printLinkedListDeque(deque);

    /* Access an element */
    int peekFirstNum = peekFirst(deque);
    printf("Front element peekFirst = %d\r\n", peekFirstNum);
    int peekLastNum = peekLast(deque);
    printf("Rear element peekLast = %d\r\n", peekLastNum);

    /* Enqueue elements */
    pushLast(deque, 4);
    printf("After enqueuing element 4 at the rear, deque =");
    printLinkedListDeque(deque);
    pushFirst(deque, 1);
    printf("After enqueuing element 1 at the front, deque =");
    printLinkedListDeque(deque);

    /* Dequeue an element */
    int popLastNum = popLast(deque);
    printf("Element removed from the rear, popLast = %d; after removal, deque = ", popLastNum);
    printLinkedListDeque(deque);
    int popFirstNum = popFirst(deque);
    printf("Element removed from the front, popFirst = %d; after removal, deque = ", popFirstNum);
    printLinkedListDeque(deque);

    /* Get the queue size */
    int dequeSize = size(deque);
    printf("Deque size = %d\r\n", dequeSize);

    /* Check whether the queue is empty */
    bool isEmpty = empty(deque);
    printf("Is the deque empty = %s\r\n", isEmpty ? "true" : "false");

    // Free memory
    delLinkedListdeque(deque);

    return 0;
}
