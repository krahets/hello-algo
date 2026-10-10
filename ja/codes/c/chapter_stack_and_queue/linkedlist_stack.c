/**
 * File: linkedlist_stack.c
 * Created Time: 2023-01-12
 * Author: Zero (glj0@outlook.com)
 */

#include "../utils/common.h"

/* 連結リストベースのスタック */
typedef struct {
    ListNode *top; // 先頭ノードをスタックトップとする
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

/* スタックの長さを取得 */
int size(LinkedListStack *s) {
    return s->size;
}

/* スタックが空かどうかを判定 */
bool isEmpty(LinkedListStack *s) {
    return size(s) == 0;
}

/* プッシュ */
void push(LinkedListStack *s, int num) {
    ListNode *node = (ListNode *)malloc(sizeof(ListNode));
    node->next = s->top; // 新しく追加したノードのポインタフィールドを更新
    node->val = num;     // 新しく追加したノードのデータフィールドを更新
    s->top = node;       // スタックトップを更新
    s->size++;           // スタックサイズを更新
}

/* スタックトップの要素にアクセス */
int peek(LinkedListStack *s) {
    if (s->size == 0) {
        printf("スタックは空です\n");
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

/* Driver Code */
int main() {
    /* スタックを初期化 */
    LinkedListStack *stack = newLinkedListStack();

    /* 要素をプッシュ */
    push(stack, 1);
    push(stack, 3);
    push(stack, 2);
    push(stack, 5);
    push(stack, 4);

    printf("スタック stack = ");
    printLinkedList(stack->top);

    /* スタックトップの要素にアクセス */
    int val = peek(stack);
    printf("スタックトップ要素 top = %d\r\n", val);

    /* 要素をポップ */
    val = pop(stack);
    printf("ポップした要素 pop = %d, ポップ後 stack =  ", val);
    printLinkedList(stack->top);

    /* スタックの長さを取得 */
    printf("スタックの長さ size = %d\n", size(stack));

    /* 空かどうかを判定 */
    bool empty = isEmpty(stack);
    printf("スタックが空かどうか = %s\n", empty ? "true" : "false");

    // メモリを解放する
    delLinkedListStack(stack);

    return 0;
}
