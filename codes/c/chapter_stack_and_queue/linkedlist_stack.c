/**
 * File: linkedlist_stack.c
 * Created Time: 2022-01-12
 * Author: Zero (glj0@outlook.com)
 */

#include "../include/include.h"

struct LinkedListStack {
    ListNode* stkTop;
    size_t stkSize;
};

typedef struct LinkedListStack LinkedListStack;

void new(LinkedListStack* stk) {
    // 创建头结点
    stk->stkTop = (ListNode *)malloc(sizeof(ListNode));
    stk->stkTop->next = NULL;
    stk->stkTop->val = 0;

    // 初始化栈大小
    stk->stkSize = 0;
}

size_t size(LinkedListStack* stk) {
    assert(stk);
    return stk->stkSize;
}

bool empty(LinkedListStack* stk) {
    assert(stk);
    return size(stk) == 0;
}

void push(LinkedListStack* stk, int num) {
    assert(stk);

    // 创建一个新结点
    ListNode *n = (ListNode *)malloc(sizeof(ListNode));
    ListNode *h;
    n->next = NULL;
    n->val = num;

    // 遍历链表，将新结点挂在最后面
    h = stk->stkTop;
    while(h && h->next) {
         h = h->next;
    }
    h->next = n;

    // 栈大小自增
    stk->stkSize++;
}

void pop(LinkedListStack* stk) {
    assert(stk);
    ListNode *h = stk->stkTop;
    ListNode *n;
    // 找到倒数第一个结点 h -> (h->next) -> (h->next->next)
    while(h && h->next && h->next->next) {
         h = h->next;
    }

    // 先保存倒数个结点，断开
    n = h->next;
    h->next = NULL;

    // 删除保存的结点
    free(n);
}

int top(LinkedListStack* stk) {
    assert(stk);
}

int main() {
    return 0;
}
