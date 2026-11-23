/**
 * File: array_binary_tree.c
 * Created Time: 2023-07-29
 * Author: Gonglja (glj0@outlook.com)
 */

#include "../utils/common.h"

/* 配列で表した二分木の構造体 */
typedef struct {
    int *tree;
    int size;
} ArrayBinaryTree;

/* コンストラクタ */
ArrayBinaryTree *newArrayBinaryTree(int *arr, int arrSize) {
    ArrayBinaryTree *abt = (ArrayBinaryTree *)malloc(sizeof(ArrayBinaryTree));
    abt->tree = malloc(sizeof(int) * arrSize);
    memcpy(abt->tree, arr, sizeof(int) * arrSize);
    abt->size = arrSize;
    return abt;
}

/* デストラクタ */
void delArrayBinaryTree(ArrayBinaryTree *abt) {
    free(abt->tree);
    free(abt);
}

/* リストの容量 */
int size(ArrayBinaryTree *abt) {
    return abt->size;
}

/* インデックス i のノードの値を取得する */
int val(ArrayBinaryTree *abt, int i) {
    // インデックスが範囲外の場合、空きを表す INT_MAX を返す
    if (i < 0 || i >= size(abt))
        return INT_MAX;
    return abt->tree[i];
}

/* インデックス i のノードの左の子ノードのインデックスを取得する */
int left(int i) {
    return 2 * i + 1;
}

/* インデックス i のノードの右の子ノードのインデックスを取得する */
int right(int i) {
    return 2 * i + 2;
}

/* インデックス i のノードの親ノードのインデックスを取得する */
int parent(int i) {
    return (i - 1) / 2;
}

/* レベル順走査 */
int *levelOrder(ArrayBinaryTree *abt, int *returnSize) {
    int *res = (int *)malloc(sizeof(int) * size(abt));
    int index = 0;
    // 配列をそのまま走査する
    for (int i = 0; i < size(abt); i++) {
        if (val(abt, i) != INT_MAX)
            res[index++] = val(abt, i);
    }
    *returnSize = index;
    return res;
}

/* 深さ優先走査 */
void dfs(ArrayBinaryTree *abt, int i, char *order, int *res, int *index) {
    // 空きの場合、戻る
    if (val(abt, i) == INT_MAX)
        return;
    // 行きがけ順走査
    if (strcmp(order, "pre") == 0)
        res[(*index)++] = val(abt, i);
    dfs(abt, left(i), order, res, index);
    // 通りがけ順走査
    if (strcmp(order, "in") == 0)
        res[(*index)++] = val(abt, i);
    dfs(abt, right(i), order, res, index);
    // 帰りがけ順走査
    if (strcmp(order, "post") == 0)
        res[(*index)++] = val(abt, i);
}

/* 行きがけ順走査 */
int *preOrder(ArrayBinaryTree *abt, int *returnSize) {
    int *res = (int *)malloc(sizeof(int) * size(abt));
    int index = 0;
    dfs(abt, 0, "pre", res, &index);
    *returnSize = index;
    return res;
}

/* 通りがけ順走査 */
int *inOrder(ArrayBinaryTree *abt, int *returnSize) {
    int *res = (int *)malloc(sizeof(int) * size(abt));
    int index = 0;
    dfs(abt, 0, "in", res, &index);
    *returnSize = index;
    return res;
}

/* 帰りがけ順走査 */
int *postOrder(ArrayBinaryTree *abt, int *returnSize) {
    int *res = (int *)malloc(sizeof(int) * size(abt));
    int index = 0;
    dfs(abt, 0, "post", res, &index);
    *returnSize = index;
    return res;
}

/* 実行用コード */
int main() {
    // 二分木を初期化する
    // INT_MAX で空き NULL を表す
    int arr[] = {1, 2, 3, 4, INT_MAX, 6, 7, 8, 9, INT_MAX, INT_MAX, 12, INT_MAX, INT_MAX, 15};
    int arrSize = sizeof(arr) / sizeof(arr[0]);
    TreeNode *root = arrayToTree(arr, arrSize);
    printf("\n二分木を初期化する\n");
    printf("二分木の配列表現：\n");
    printArray(arr, arrSize);
    printf("二分木の連結リスト表現：\n");
    printTree(root);

    ArrayBinaryTree *abt = newArrayBinaryTree(arr, arrSize);

    // ノードにアクセスする
    int i = 1;
    int l = left(i), r = right(i), p = parent(i);
    printf("\n現在のノードのインデックスは %d、値は %d\n", i, val(abt, i));
    printf("左の子ノードのインデックスは %d、値は %d\n", l, l < arrSize ? val(abt, l) : INT_MAX);
    printf("右の子ノードのインデックスは %d、値は %d\n", r, r < arrSize ? val(abt, r) : INT_MAX);
    printf("親ノードのインデックスは %d、値は %d\n", p, p < arrSize ? val(abt, p) : INT_MAX);

    // 木を走査する
    int returnSize;
    int *res;

    res = levelOrder(abt, &returnSize);
    printf("\nレベル順走査： ");
    printArray(res, returnSize);
    free(res);

    res = preOrder(abt, &returnSize);
    printf("行きがけ順走査： ");
    printArray(res, returnSize);
    free(res);

    res = inOrder(abt, &returnSize);
    printf("通りがけ順走査： ");
    printArray(res, returnSize);
    free(res);

    res = postOrder(abt, &returnSize);
    printf("帰りがけ順走査： ");
    printArray(res, returnSize);
    free(res);

    // メモリを解放する
    delArrayBinaryTree(abt);
    return 0;
}
