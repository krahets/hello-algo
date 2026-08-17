/**
 * File: linkedlist_stack.c
 * Created Time: 2023-01-12
 * Author: Zero (glj0@outlook.com)
 */

#include "../utils/common.h"

/* Stack based on linked list implementation */
typedef struct {
    ListNode *top; // Use head node as stack top
    int size;      // Stack length
} LinkedListStack;

/* Constructor */
LinkedListStack *newLinkedListStack() {
    LinkedListStack *s = malloc(sizeof(LinkedListStack));
    s->top = NULL;
    s->size = 0;
    return s;
}

/* Destructor */
void delLinkedListStack(LinkedListStack *s) {
    while (s->top) {
        ListNode *n = s->top->next;
        free(s->top);
        s->top = n;
    }
    free(s);
}

/* Get the length of the stack */
int size(LinkedListStack *s) {
    return s->size;
}

/* Check if the stack is empty */
bool isEmpty(LinkedListStack *s) {
    return size(s) == 0;
}

/* Push */
void push(LinkedListStack *s, int num) {
    ListNode *node = (ListNode *)malloc(sizeof(ListNode));
    node->next = s->top; // Update new node's pointer field
    node->val = num;     // Update new node's data field
    s->top = node;       // Update stack top
    s->size++;           // Update stack size
}

/* Return list for printing */
int peek(LinkedListStack *s) {
    if (s->size == 0) {
        printf("Stack is empty\n");
        return INT_MAX;
    }
    return s->top->val;
}

/* Pop */
int pop(LinkedListStack *s) {
    int val = peek(s);
    ListNode *tmp = s->top;
    s->top = s->top->next;
    // Free memory
    free(tmp);
    s->size--;
    return val;
}

/* Driver Code */
int main() {
    /* Access top of the stack element */
    LinkedListStack *stack = newLinkedListStack();

    /* Elements push onto stack */
    push(stack, 1);
    push(stack, 3);
    push(stack, 2);
    push(stack, 5);
    push(stack, 4);

    printf("Stack stack = ");
    printLinkedList(stack->top);

    /* Return list for printing */
    int val = peek(stack);
    printf("Top element top = %d\r\n", val);

    /* Element pop from stack */
    val = pop(stack);
    printf("Pop element pop = %d, stack after pop = ", val);
    printLinkedList(stack->top);

    /* Get the length of the stack */
    printf("Stack size = %d\n", size(stack));

    /* Check if empty */
    bool empty = isEmpty(stack);
    printf("Is stack empty = %s\n", empty ? "true" : "false");

    // Free memory
    delLinkedListStack(stack);

    return 0;
}
