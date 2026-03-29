/**
 * File: my_heap_test.c
 * Created Time: 2023-01-15
 * Author: Reanon (793584285@qq.com)
 */

#include "my_heap.c"

/* Driver Code */
int main() {
    /* ヒープを初期化 */
    // 最大ヒープを初期化
    int nums[] = {9, 8, 6, 6, 7, 5, 2, 1, 4, 3, 6, 2};
    MaxHeap *maxHeap = newMaxHeap(nums, sizeof(nums) / sizeof(int));
    printf("配列を入力してヒープ化した後\n");
    printHeap(maxHeap->data, maxHeap->size);

    /* ヒープ頂点の要素を取得 */
    printf("\nヒープの先頭要素は %d\n", peek(maxHeap));

    /* 要素をヒープに追加 */
    push(maxHeap, 7);
    printf("\n要素 7 をヒープに追加した後\n");
    printHeap(maxHeap->data, maxHeap->size);

    /* ヒープ頂点の要素を取り出す */
    int top = pop(maxHeap);
    printf("\nヒープの先頭要素 %d を取り出した後\n", top);
    printHeap(maxHeap->data, maxHeap->size);

    /* ヒープのサイズを取得 */
    printf("\nヒープの要素数は %d\n", size(maxHeap));

    /* ヒープが空かどうかを判定 */
    printf("\nヒープが空かどうか %d\n", isEmpty(maxHeap));

    // メモリを解放する
    delMaxHeap(maxHeap);

    return 0;
}
