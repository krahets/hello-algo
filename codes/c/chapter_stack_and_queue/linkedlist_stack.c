/**
 * File: linkedlist_stack.c
 * Created Time: 2023-01-12
 * Author: Zero (glj0@outlook.com)
 */

#include "../utils/common.h"

/* 基于链表实现的栈 */
struct linkedListStack {
    ListNode *top; // 将头节点作为栈顶
    int size;      // 栈的长度
};

typedef struct linkedListStack linkedListStack;

/* 构造函数 */
linkedListStack *newLinkedListStack() {
    linkedListStack *s = malloc(sizeof(linkedListStack));
    s->top = NULL;
    s->size = 0;
    return s;
}

/* 析构函数 */
void delLinkedListStack(linkedListStack *s) {
    while (s->top) {
        ListNode *n = s->top->next;
        free(s->top);
        s->top = n;
    }
    free(s);
}

/* 获取栈的长度 */
int size(linkedListStack *s) {
    assert(s);
    return s->size;
}

/* 判断栈是否为空 */
bool isEmpty(linkedListStack *s) {
    assert(s);
    return size(s) == 0;
}

/* 访问栈顶元素 */
int peek(linkedListStack *s) {
    assert(s);
    assert(size(s) != 0);
    return s->top->val;
}

/* 入栈 */
void push(linkedListStack *s, int num) {
    assert(s);
    ListNode *node = (ListNode *)malloc(sizeof(ListNode));
    node->next = s->top; // 更新新加节点指针域
    node->val = num;     // 更新新加节点数据域
    s->top = node;       // 更新栈顶
    s->size++;           // 更新栈大小
}

/* 出栈 */
int pop(linkedListStack *s) {
    if (s->size == 0) {
        printf("stack is empty.\n");
        return INT_MAX;
    }
    assert(s);
    int val = peek(s);
    ListNode *tmp = s->top;
    s->top = s->top->next;
    // 释放内存
    free(tmp);
    s->size--;
    return val;
}

/* Driver Code */
int main() {
    /* 初始化栈 */
    linkedListStack *stack = newLinkedListStack();

    /* 元素入栈 */
    push(stack, 1);
    push(stack, 3);
    push(stack, 2);
    push(stack, 5);
    push(stack, 4);

    printf("栈 stack = ");
    printLinkedList(stack->top);

    /* 访问栈顶元素 */
    int val = peek(stack);
    printf("栈顶元素 top = %d\r\n", val);

    /* 元素出栈 */
    val = pop(stack);
    printf("出栈元素 pop = %d, 出栈后 stack =  ", val);
    printLinkedList(stack->top);

    /* 获取栈的长度 */
    printf("栈的长度 size = %d\n", size(stack));

    /* 判断是否为空 */
    bool empty = isEmpty(stack);
    printf("栈是否为空 = %s\n", empty ? "true" : "false");

    // 释放内存
    delLinkedListStack(stack);

    return 0;
}
