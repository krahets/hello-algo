/**
 * File: my_heap_test.c
 * Created Time: 2023-01-15
 * Author: Reanon (793584285@qq.com)
 */

#include "my_heap.c"

/* 実行例 */
int main() {
    /* ヒープを初期化する */
    // 最大ヒープを初期化する
    int nums[] = {9, 8, 6, 6, 7, 5, 2, 1, 4, 3, 6, 2};
    MaxHeap *maxHeap = newMaxHeap(nums, sizeof(nums) / sizeof(int));
    printf("入力配列から構築したヒープ：\n");
    printHeap(maxHeap->data, maxHeap->size);

    /* ヒープの根の要素を取得する */
    printf("\nヒープの根の要素：%d\n", peek(maxHeap));

    /* 要素をヒープに挿入する */
    push(maxHeap, 7);
    printf("\n要素 7 の挿入後：\n");
    printHeap(maxHeap->data, maxHeap->size);

    /* 根の要素を取り出す */
    int top = pop(maxHeap);
    printf("\n根の要素 %d を取り出した後：\n", top);
    printHeap(maxHeap->data, maxHeap->size);

    /* ヒープのサイズを取得する */
    printf("\nヒープの要素数：%d\n", size(maxHeap));

    /* ヒープが空か判定する */
    printf("\nヒープは空か：%d\n", isEmpty(maxHeap));

    // メモリを解放する
    delMaxHeap(maxHeap);

    return 0;
}
