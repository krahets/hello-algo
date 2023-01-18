/**
 * File: linkedlist_stack.c
 * Created Time: 2022-01-12
 * Author: Zero (glj0@outlook.com)
 */

#include "../include/include.h"

/* 基于链表实现的栈 */
struct LinkedListStack {
    ListNode* stackTop; // 将头结点作为栈顶
    int size;           // 栈的长度
};

typedef struct LinkedListStack LinkedListStack;

/* 构造函数 */
void newLinkedListStack(LinkedListStack* stk) {
    stk->stackTop = NULL;
    stk->size = 0;
}

/* 析构函数 */
void delLinkedListStack(LinkedListStack* stk) {
    while(stk->stackTop) {
        ListNode *n = stk->stackTop->next;
        free(stk->stackTop);
        stk->stackTop = n;
    }
    stk->size = 0;
}

/* 获取栈的长度 */
int size(LinkedListStack* stk) {
    assert(stk);
    return stk->size;
}

/* 判断栈是否为空 */
bool empty(LinkedListStack* stk) {
    assert(stk);
    return size(stk) == 0;
}

/* 访问栈顶元素 */
int top(LinkedListStack* stk) {
    assert(stk);
    assert(size(stk) != 0); 
    return stk->stackTop->val;
}

/* 入栈 */
void push(LinkedListStack* stk, int num) {
    assert(stk);
    ListNode *node = (ListNode *)malloc(sizeof(ListNode));
    node->next = stk->stackTop; // 更新新加结点指针域
    node->val = num;            // 更新新加结点数据域
    stk->stackTop = node;       // 更新栈顶
    stk->size++;             // 更新栈大小
}

/* 出栈 */
void pop(LinkedListStack* stk) {
    assert(stk);
    int num = top(stk);
    ListNode *tmp = stk->stackTop;
    stk->stackTop = stk->stackTop->next;
    // 释放内存
    free(tmp);
    stk->size--;
}

/* Driver Code */
int main() {
    /* 初始化栈 */
    LinkedListStack stack;
    /* 构造函数 */
    newLinkedListStack(&stack);

    /* 元素入栈 */
    push(&stack, 1);
    push(&stack, 3);
    push(&stack, 2);
    push(&stack, 5);
    push(&stack, 4);

    printf("栈 stack = ");
    printLinkedList(stack.stackTop);

    /* 访问栈顶元素 */
    int stackTop = top(&stack);
    printf("栈顶元素 top = %d\r\n", stackTop);

    /* 元素出栈 */
    pop(&stack);
    printf("出栈元素 pop = %d, 出栈后 stack =  ", stackTop);
    printLinkedList(stack.stackTop);

    /* 获取栈的长度 */
    int stackSize = size(&stack);
    printf("栈的长度 size = %d\r\n", stackSize);

    /* 判断是否为空 */
    bool isEmpty = empty(&stack);
    printf("栈是否为空 = %s\r\n", isEmpty ? "yes" : "no");

    /* 析构函数 */
    delLinkedListStack(&stack);
    return 0;
}
