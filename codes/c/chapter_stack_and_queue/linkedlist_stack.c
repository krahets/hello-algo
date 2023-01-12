/**
 * File: linkedlist_stack.c
 * Created Time: 2022-01-12
 * Author: Zero (glj0@outlook.com)
 */

#include "../include/include.h"

/* 基于链表实现的栈 */
struct LinkedListStack {
    ListNode* stackTop; // 将头结点作为栈顶
    size_t stkSize;     // 栈的长度
};

typedef struct LinkedListStack LinkedListStack;

void constructor(LinkedListStack* stk) {
    stk->stackTop = NULL;
    stk->stkSize = 0;
}
/* 获取栈的长度 */
size_t size(LinkedListStack* stk) {
    assert(stk);
    return stk->stkSize;
}
/* 判断栈是否为空 */
bool empty(LinkedListStack* stk) {
    assert(stk);
    return size(stk) == 0;
}
/* 访问栈顶元素 */
int top(LinkedListStack* stk) {
    assert(stk);
    if (size(stk) == 0 ) 
        // 抛出异常
    return stk->stackTop->val;
}
/* 入栈 */
void push(LinkedListStack* stk, int num) {
    assert(stk);
    ListNode *node = (ListNode *)malloc(sizeof(ListNode));
    node->next = stk->stackTop;
    node->val = num;
    stk->stackTop = node;
    stk->stkSize++;
}
/* 出栈 */
void pop(LinkedListStack* stk) {
    assert(stk);
    int num = top(stk);
    ListNode *tmp = stk->stackTop;
    stk->stackTop = stk->stackTop->next;
    // 释放内存
    free(tmp);
    stk->stkSize--;
}


/* Driver Code */
int main() {
    /* 初始化栈 */
    LinkedListStack stack;

    /* 元素入栈 */
    push(&stack, 1);
    push(&stack, 3);
    push(&stack, 2);
    push(&stack, 5);
    push(&stack, 4);

    printf("栈 stack = ");
    printStack(&stack);

    /* 访问栈顶元素 */
    int stackTop = top(&stack);
    printf("栈顶元素 top = %d\r\n", stackTop);

    /* 元素出栈 */
    pop(&stack);
    printf("出栈元素 pop = %d, 出栈后 stack =  ", stackTop);
    printStack(&stack);

    /* 获取栈的长度 */
    size_t stackSize = size(&stack);
    printf("栈的长度 size = %ld\r\n", stackSize);

    /* 判断是否为空 */
    bool isEmpty = empty(&stack);
    printf("栈是否为空 = %d", isEmpty);

    return 0;
}
