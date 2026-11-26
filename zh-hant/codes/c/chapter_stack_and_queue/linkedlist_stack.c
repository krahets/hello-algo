/**
 * File: linkedlist_stack.c
 * Created Time: 2023-01-12
 * Author: Zero (glj0@outlook.com)
 */

#include "../utils/common.h"

/* 以鏈結串列實作堆疊 */
typedef struct {
    ListNode *top; // 以首節點作為堆疊頂端
    int size;      // 堆疊長度
} LinkedListStack;

/* 建立堆疊 */
LinkedListStack *newLinkedListStack() {
    LinkedListStack *s = malloc(sizeof(LinkedListStack));
    s->top = NULL;
    s->size = 0;
    return s;
}

/* 釋放堆疊的記憶體 */
void delLinkedListStack(LinkedListStack *s) {
    while (s->top) {
        ListNode *n = s->top->next;
        free(s->top);
        s->top = n;
    }
    free(s);
}

/* 取得堆疊長度 */
int size(LinkedListStack *s) {
    return s->size;
}

/* 判斷堆疊是否為空 */
bool isEmpty(LinkedListStack *s) {
    return size(s) == 0;
}

/* 推入堆疊 */
void push(LinkedListStack *s, int num) {
    ListNode *node = (ListNode *)malloc(sizeof(ListNode));
    node->next = s->top; // 將新節點的 next 指標設為原本的堆疊頂端
    node->val = num;     // 將 num 存入新節點的資料欄位
    s->top = node;       // 更新堆疊頂端
    s->size++;           // 更新堆疊的元素個數
}

/* 讀取堆疊頂端的元素 */
int peek(LinkedListStack *s) {
    if (s->size == 0) {
        printf("堆疊為空\n");
        return INT_MAX;
    }
    return s->top->val;
}

/* 彈出堆疊頂端的元素 */
int pop(LinkedListStack *s) {
    int val = peek(s);
    ListNode *tmp = s->top;
    s->top = s->top->next;
    // 釋放已移除節點的記憶體
    free(tmp);
    s->size--;
    return val;
}

/* 範例程式 */
int main() {
    /* 初始化堆疊 */
    LinkedListStack *stack = newLinkedListStack();

    /* 將元素推入堆疊 */
    push(stack, 1);
    push(stack, 3);
    push(stack, 2);
    push(stack, 5);
    push(stack, 4);

    printf("堆疊 stack = ");
    printLinkedList(stack->top);

    /* 讀取堆疊頂端的元素 */
    int val = peek(stack);
    printf("堆疊頂端元素 top = %d\r\n", val);

    /* 從堆疊彈出元素 */
    val = pop(stack);
    printf("彈出的元素 pop = %d， 彈出後 stack =  ", val);
    printLinkedList(stack->top);

    /* 取得堆疊長度 */
    printf("堆疊長度 size = %d\n", size(stack));

    /* 判斷堆疊是否為空 */
    bool empty = isEmpty(stack);
    printf("堆疊是否為空 = %s\n", empty ? "true" : "false");

    // 釋放記憶體
    delLinkedListStack(stack);

    return 0;
}
