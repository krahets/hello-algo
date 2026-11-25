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

/* Deque backed by a doubly linked list */
typedef struct {
    DoublyListNode *front, *rear; // front points to the head node and rear to the tail node
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
    // Free all the nodes
    for (int i = 0; i < deque->queSize && deque->front != NULL; i++) {
        DoublyListNode *tmp = deque->front;
        deque->front = deque->front->next;
        free(tmp);
    }
    // Free the deque structure
    free(deque);
}

/* Get the deque size */
int size(LinkedListDeque *deque) {
    return deque->queSize;
}

/* Check whether the deque is empty */
bool empty(LinkedListDeque *deque) {
    return (size(deque) == 0);
}

/* Enqueue an element */
void push(LinkedListDeque *deque, int num, bool isFront) {
    DoublyListNode *node = newDoublyListNode(num);
    // If the list is empty, point both front and rear at node
    if (empty(deque)) {
        deque->front = deque->rear = node;
    }
    // Add at the front
    else if (isFront) {
        // Link node at the head of the list
        deque->front->prev = node;
        node->next = deque->front;
        deque->front = node; // Update the head
    }
    // Add at the rear
    else {
        // Link node at the tail of the list
        deque->rear->next = node;
        node->prev = deque->rear;
        deque->rear = node;
    }
    deque->queSize++; // Update the deque size
}

/* Add an element at the front */
void pushFirst(LinkedListDeque *deque, int num) {
    push(deque, num, true);
}

/* Add an element at the rear */
void pushLast(LinkedListDeque *deque, int num) {
    push(deque, num, false);
}

/* Peek at the front element */
int peekFirst(LinkedListDeque *deque) {
    assert(size(deque) && deque->front);
    return deque->front->val;
}

/* Peek at the rear element */
int peekLast(LinkedListDeque *deque) {
    assert(size(deque) && deque->rear);
    return deque->rear->val;
}

/* Remove and return an element from either end of the deque */
int pop(LinkedListDeque *deque, bool isFront) {
    if (empty(deque))
        return -1;
    int val;
    // When the deque contains one element, the head and tail point to the same node
    if (deque->queSize == 1) {
        val = deque->front->val;
        delDoublyListNode(deque->front); // Both point to the same node, so free it only once
        deque->front = NULL;
        deque->rear = NULL;
    }
    // Remove from the front
    else if (isFront) {
        val = peekFirst(deque); // Save the head node's value
        DoublyListNode *fNext = deque->front->next;
        fNext->prev = NULL;
        deque->front->next = NULL;
        delDoublyListNode(deque->front);
        deque->front = fNext; // Update the head
    }
    // Remove from the rear
    else {
        val = peekLast(deque); // Save the tail node's value
        DoublyListNode *rPrev = deque->rear->prev;
        rPrev->next = NULL;
        deque->rear->prev = NULL;
        delDoublyListNode(deque->rear);
        deque->rear = rPrev; // Update the tail
    }
    deque->queSize--; // Update the deque size
    return val;
}

/* Remove and return the front element */
int popFirst(LinkedListDeque *deque) {
    return pop(deque, true);
}

/* Remove and return the rear element */
int popLast(LinkedListDeque *deque) {
    return pop(deque, false);
}

/* Print the deque */
void printLinkedListDeque(LinkedListDeque *deque) {
    int *arr = malloc(sizeof(int) * deque->queSize);
    // Copy the values from the linked list into an array
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
    printf("deque = ");
    printLinkedListDeque(deque);

    /* Peek at the front and rear elements */
    int peekFirstNum = peekFirst(deque);
    printf("Front element (peekFirst) = %d\r\n", peekFirstNum);
    int peekLastNum = peekLast(deque);
    printf("Rear element (peekLast) = %d\r\n", peekLastNum);

    /* Add elements to the deque */
    pushLast(deque, 4);
    printf("After adding 4 at the rear, deque = ");
    printLinkedListDeque(deque);
    pushFirst(deque, 1);
    printf("After adding 1 at the front, deque = ");
    printLinkedListDeque(deque);

    /* Remove elements from both ends */
    int popLastNum = popLast(deque);
    printf("Removed from the rear (popLast) = %d, deque after removal = ", popLastNum);
    printLinkedListDeque(deque);
    int popFirstNum = popFirst(deque);
    printf("Removed from the front (popFirst) = %d, deque after removal = ", popFirstNum);
    printLinkedListDeque(deque);

    /* Get the deque size */
    int dequeSize = size(deque);
    printf("Deque size = %d\r\n", dequeSize);

    /* Check whether the deque is empty */
    bool isEmpty = empty(deque);
    printf("Deque is empty = %s\r\n", isEmpty ? "true" : "false");

    // Free the allocated memory
    delLinkedListdeque(deque);

    return 0;
}
