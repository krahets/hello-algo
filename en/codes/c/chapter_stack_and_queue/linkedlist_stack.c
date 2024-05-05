/**
 * File: linkedlist_stack.c
 * Created Time: 2023-01-12
 * Author: Zero (glj0@outlook.com)
 */

#include "../utils/common.h"

/* Stack class based on linked list */
typedef struct {
    ListNode *top; // Use the head node as the top of the stack
    int size;      // Length of the stack
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

/* Determine if the stack is empty */
bool isEmpty(LinkedListStack *s) {
    return size(s) == 0;
}

/* Push */
void push(LinkedListStack *s, int num) {
    ListNode *node = (ListNode *)malloc(sizeof(ListNode));
    node->next = s->top; // Update new node pointer field
    node->val = num;     // Update new node data field
    s->top = node;       // Update stack top
    s->size++;           // Update stack size
}

/* Access stack top element */
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
    /* Initialize stack */
    LinkedListStack *stack = newLinkedListStack();

    /* Element push */
    push(stack, 1);
    push(stack, 3);
    push(stack, 2);
    push(stack, 5);
    push(stack, 4);

    printf("Stack stack =");
    printLinkedList(stack->top);

    /* Access stack top element */
    int val = peek(stack);
    printf("Top element of the stack top = %d\r\n", val);

    /* Element pop */
    val = pop(stack);
    printf("Pop element pop = %d, stack after pop =  ", val);
    printLinkedList(stack->top);

    /* Get the length of the stack */
    printf("Stack length size = %d\n", size(stack));

    /* Determine if it's empty */
    bool empty = isEmpty(stack);
    printf("Is the stack empty = %s\n", empty ? "true" : "false");

    // Free memory
    delLinkedListStack(stack);

    return 0;
}
