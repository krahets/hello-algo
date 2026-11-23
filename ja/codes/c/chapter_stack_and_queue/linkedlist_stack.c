/**
 * File: linkedlist_stack.c
 * Created Time: 2023-01-12
 * Author: Zero (glj0@outlook.com)
 */

#include "../utils/common.h"

/* 連結リストで実装したスタック */
typedef struct {
    ListNode *top; // 先頭ノードをスタックの先頭とする
    int size;      // スタックの長さ
} LinkedListStack;

/* コンストラクタ */
LinkedListStack *newLinkedListStack() {
    LinkedListStack *s = malloc(sizeof(LinkedListStack));
    s->top = NULL;
    s->size = 0;
    return s;
}

/* デストラクタ */
void delLinkedListStack(LinkedListStack *s) {
    while (s->top) {
        ListNode *n = s->top->next;
        free(s->top);
        s->top = n;
    }
    free(s);
}

/* スタックの長さを取得する */
int size(LinkedListStack *s) {
    return s->size;
}

/* スタックが空かどうかを判定する */
bool isEmpty(LinkedListStack *s) {
    return size(s) == 0;
}

/* プッシュ */
void push(LinkedListStack *s, int num) {
    ListNode *node = (ListNode *)malloc(sizeof(ListNode));
    node->next = s->top; // 追加するノードのポインタ領域を更新する
    node->val = num;     // 追加するノードのデータ領域を更新する
    s->top = node;       // スタックの先頭を更新する
    s->size++;           // スタックのサイズを更新する
}

/* スタックの先頭要素にアクセスする */
int peek(LinkedListStack *s) {
    if (s->size == 0) {
        printf("スタックが空です\n");
        return INT_MAX;
    }
    return s->top->val;
}

/* ポップ */
int pop(LinkedListStack *s) {
    int val = peek(s);
    ListNode *tmp = s->top;
    s->top = s->top->next;
    // メモリを解放する
    free(tmp);
    s->size--;
    return val;
}

/* 実行用コード */
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

    /* スタックの先頭要素にアクセスする */
    int val = peek(stack);
    printf("スタックの先頭要素 top = %d\r\n", val);

    /* 要素をポップする */
    val = pop(stack);
    printf("ポップした要素 pop = %d, ポップ後 stack =  ", val);
    printLinkedList(stack->top);

    /* スタックの長さを取得する */
    printf("スタックの長さ size = %d\n", size(stack));

    /* 空かどうかを判定する */
    bool empty = isEmpty(stack);
    printf("スタックは空か = %s\n", empty ? "true" : "false");

    // メモリを解放する
    delLinkedListStack(stack);

    return 0;
}
