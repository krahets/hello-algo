/**
 * File: my_heap_test.c
 * Created Time: 2023-01-15
 * Author: Reanon (793584285@qq.com)
 */

#include "my_heap.c"

/* 実行用コード */
int main() {
    /* ヒープを初期化する */
    // 最大ヒープを初期化する
    int nums[] = {9, 8, 6, 6, 7, 5, 2, 1, 4, 3, 6, 2};
    MaxHeap *maxHeap = newMaxHeap(nums, sizeof(nums) / sizeof(int));
    printf("配列を入力してヒープを構築した後\n");
    printHeap(maxHeap->data, maxHeap->size);

    /* ヒープの先頭要素を取得する */
    printf("\nヒープの先頭要素は %d\n", peek(maxHeap));

    /* ヒープに要素を挿入する */
    push(maxHeap, 7);
    printf("\n要素 7 をヒープに挿入した後\n");
    printHeap(maxHeap->data, maxHeap->size);

    /* ヒープの先頭要素を取り出す */
    int top = pop(maxHeap);
    printf("\nヒープの先頭要素 %d を取り出した後\n", top);
    printHeap(maxHeap->data, maxHeap->size);

    /* ヒープのサイズを取得する */
    printf("\nヒープの要素数は %d\n", size(maxHeap));

    /* ヒープが空か判定 */
    printf("\nヒープは空か %d\n", isEmpty(maxHeap));

    // メモリを解放する
    delMaxHeap(maxHeap);

    return 0;
}
