/**
 * File: linkedlist_stack.c
 * Created Time: 2023-01-12
 * Author: Zero (glj0@outlook.com)
 */

#include "../utils/common.h"

/* 連結リストを使ったスタック */
typedef struct {
    ListNode *top; // 先頭ノードをスタックのトップとする
    int size;      // スタックの要素数
} LinkedListStack;

/* 生成関数 */
LinkedListStack *newLinkedListStack() {
    LinkedListStack *s = malloc(sizeof(LinkedListStack));
    s->top = NULL;
    s->size = 0;
    return s;
}

/* 解放関数 */
void delLinkedListStack(LinkedListStack *s) {
    while (s->top) {
        ListNode *n = s->top->next;
        free(s->top);
        s->top = n;
    }
    free(s);
}

/* スタックの要素数を取得する */
int size(LinkedListStack *s) {
    return s->size;
}

/* スタックが空かどうかを判定する */
bool isEmpty(LinkedListStack *s) {
    return size(s) == 0;
}

/* プッシュする */
void push(LinkedListStack *s, int num) {
    ListNode *node = (ListNode *)malloc(sizeof(ListNode));
    node->next = s->top; // 新しいノードのポインタフィールドを更新する
    node->val = num;     // 新しいノードのデータフィールドを更新する
    s->top = node;       // スタックのトップを更新する
    s->size++;           // スタックの要素数を更新する
}

/* スタックのトップを参照する */
int peek(LinkedListStack *s) {
    if (s->size == 0) {
        printf("スタックが空です\n");
        return INT_MAX;
    }
    return s->top->val;
}

/* ポップする */
int pop(LinkedListStack *s) {
    int val = peek(s);
    ListNode *tmp = s->top;
    s->top = s->top->next;
    // メモリを解放する
    free(tmp);
    s->size--;
    return val;
}

/* 実行例 */
int main() {
    /* スタックを初期化する */
    LinkedListStack *stack = newLinkedListStack();

    /* 要素をプッシュする */
    push(stack, 1);
    push(stack, 3);
    push(stack, 2);
    push(stack, 5);
    push(stack, 4);

    printf("スタック stack = ");
    printLinkedList(stack->top);

    /* スタックのトップを参照する */
    int val = peek(stack);
    printf("スタックのトップの要素 top = %d\r\n", val);

    /* 要素をポップする */
    val = pop(stack);
    printf("ポップした要素 pop = %d、 ポップ後の stack =  ", val);
    printLinkedList(stack->top);

    /* スタックの要素数を取得する */
    printf("スタックの要素数 size = %d\n", size(stack));

    /* 空かどうかを判定する */
    bool empty = isEmpty(stack);
    printf("スタックは空か = %s\n", empty ? "true" : "false");

    // メモリを解放する
    delLinkedListStack(stack);

    return 0;
}
