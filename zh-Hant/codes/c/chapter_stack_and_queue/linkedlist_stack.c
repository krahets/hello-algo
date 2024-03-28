/**
 * File: linkedlist_stack.c
 * Created Time: 2023-01-12
 * Author: Zero (glj0@outlook.com)
 */

#include "../utils/common.h"

/* 基於鏈結串列實現的堆疊 */
typedef struct {
    ListNode *top; // 將頭節點作為堆疊頂
    int size;      // 堆疊的長度
} LinkedListStack;

/* 建構子 */
LinkedListStack *newLinkedListStack() {
    LinkedListStack *s = malloc(sizeof(LinkedListStack));
    s->top = NULL;
    s->size = 0;
    return s;
}

/* 析構函式 */
void delLinkedListStack(LinkedListStack *s) {
    while (s->top) {
        ListNode *n = s->top->next;
        free(s->top);
        s->top = n;
    }
    free(s);
}

/* 獲取堆疊的長度 */
int size(LinkedListStack *s) {
    return s->size;
}

/* 判斷堆疊是否為空 */
bool isEmpty(LinkedListStack *s) {
    return size(s) == 0;
}

/* 入堆疊 */
void push(LinkedListStack *s, int num) {
    ListNode *node = (ListNode *)malloc(sizeof(ListNode));
    node->next = s->top; // 更新新加節點指標域
    node->val = num;     // 更新新加節點資料域
    s->top = node;       // 更新堆疊頂
    s->size++;           // 更新堆疊大小
}

/* 訪問堆疊頂元素 */
int peek(LinkedListStack *s) {
    if (s->size == 0) {
        printf("堆疊為空\n");
        return INT_MAX;
    }
    return s->top->val;
}

/* 出堆疊 */
int pop(LinkedListStack *s) {
    int val = peek(s);
    ListNode *tmp = s->top;
    s->top = s->top->next;
    // 釋放記憶體
    free(tmp);
    s->size--;
    return val;
}

/* Driver Code */
int main() {
    /* 初始化堆疊 */
    LinkedListStack *stack = newLinkedListStack();

    /* 元素入堆疊 */
    push(stack, 1);
    push(stack, 3);
    push(stack, 2);
    push(stack, 5);
    push(stack, 4);

    printf("堆疊 stack = ");
    printLinkedList(stack->top);

    /* 訪問堆疊頂元素 */
    int val = peek(stack);
    printf("堆疊頂元素 top = %d\r\n", val);

    /* 元素出堆疊 */
    val = pop(stack);
    printf("出堆疊元素 pop = %d, 出堆疊後 stack =  ", val);
    printLinkedList(stack->top);

    /* 獲取堆疊的長度 */
    printf("堆疊的長度 size = %d\n", size(stack));

    /* 判斷是否為空 */
    bool empty = isEmpty(stack);
    printf("堆疊是否為空 = %s\n", empty ? "true" : "false");

    // 釋放記憶體
    delLinkedListStack(stack);

    return 0;
}
