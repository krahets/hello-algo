/**
 * File: array_binary_tree.c
 * Created Time: 2023-07-29
 * Author: Gonglja (glj0@outlook.com)
 */

#include "../utils/common.h"

/* 배열로 표현한 이진 트리 구조체 */
typedef struct {
    int *tree;
    int size;
} ArrayBinaryTree;

/* 생성자 */
ArrayBinaryTree *newArrayBinaryTree(int *arr, int arrSize) {
    ArrayBinaryTree *abt = (ArrayBinaryTree *)malloc(sizeof(ArrayBinaryTree));
    abt->tree = malloc(sizeof(int) * arrSize);
    memcpy(abt->tree, arr, sizeof(int) * arrSize);
    abt->size = arrSize;
    return abt;
}

/* 소멸자 */
void delArrayBinaryTree(ArrayBinaryTree *abt) {
    free(abt->tree);
    free(abt);
}

/* 리스트 용량 */
int size(ArrayBinaryTree *abt) {
    return abt->size;
}

/* 인덱스가 i인 노드의 값 반환 */
int val(ArrayBinaryTree *abt, int i) {
    // 인덱스가 범위를 벗어나면 빈자리를 나타내는 INT_MAX를 반환한다
    if (i < 0 || i >= size(abt))
        return INT_MAX;
    return abt->tree[i];
}

/* 인덱스가 i인 노드의 왼쪽 자식 노드 인덱스 반환 */
int left(int i) {
    return 2 * i + 1;
}

/* 인덱스가 i인 노드의 오른쪽 자식 노드 인덱스 반환 */
int right(int i) {
    return 2 * i + 2;
}

/* 인덱스가 i인 노드의 부모 노드 인덱스 반환 */
int parent(int i) {
    return (i - 1) / 2;
}

/* 레벨 순서 순회 */
int *levelOrder(ArrayBinaryTree *abt, int *returnSize) {
    int *res = (int *)malloc(sizeof(int) * size(abt));
    int index = 0;
    // 배열을 직접 순회한다
    for (int i = 0; i < size(abt); i++) {
        if (val(abt, i) != INT_MAX)
            res[index++] = val(abt, i);
    }
    *returnSize = index;
    return res;
}

/* 깊이 우선 순회 */
void dfs(ArrayBinaryTree *abt, int i, char *order, int *res, int *index) {
    // 빈칸이면 반환한다
    if (val(abt, i) == INT_MAX)
        return;
    // 전위 순회
    if (strcmp(order, "pre") == 0)
        res[(*index)++] = val(abt, i);
    dfs(abt, left(i), order, res, index);
    // 중위 순회
    if (strcmp(order, "in") == 0)
        res[(*index)++] = val(abt, i);
    dfs(abt, right(i), order, res, index);
    // 후위 순회
    if (strcmp(order, "post") == 0)
        res[(*index)++] = val(abt, i);
}

/* 전위 순회 */
int *preOrder(ArrayBinaryTree *abt, int *returnSize) {
    int *res = (int *)malloc(sizeof(int) * size(abt));
    int index = 0;
    dfs(abt, 0, "pre", res, &index);
    *returnSize = index;
    return res;
}

/* 중위 순회 */
int *inOrder(ArrayBinaryTree *abt, int *returnSize) {
    int *res = (int *)malloc(sizeof(int) * size(abt));
    int index = 0;
    dfs(abt, 0, "in", res, &index);
    *returnSize = index;
    return res;
}

/* 후위 순회 */
int *postOrder(ArrayBinaryTree *abt, int *returnSize) {
    int *res = (int *)malloc(sizeof(int) * size(abt));
    int index = 0;
    dfs(abt, 0, "post", res, &index);
    *returnSize = index;
    return res;
}

/* 실행 코드 */
int main() {
    // 이진 트리 초기화
    // INT_MAX로 빈자리 NULL을 나타낸다
    int arr[] = {1, 2, 3, 4, INT_MAX, 6, 7, 8, 9, INT_MAX, INT_MAX, 12, INT_MAX, INT_MAX, 15};
    int arrSize = sizeof(arr) / sizeof(arr[0]);
    TreeNode *root = arrayToTree(arr, arrSize);
    printf("\n이진 트리 초기화\n");
    printf("이진 트리의 배열 표현:\n");
    printArray(arr, arrSize);
    printf("이진 트리의 연결 리스트 표현:\n");
    printTree(root);

    ArrayBinaryTree *abt = newArrayBinaryTree(arr, arrSize);

    // 노드 접근
    int i = 1;
    int l = left(i), r = right(i), p = parent(i);
    printf("\n현재 노드의 인덱스는 %d, 값은 %d이다\n", i, val(abt, i));
    printf("왼쪽 자식 노드의 인덱스는 %d, 값은 %d이다\n", l, l < arrSize ? val(abt, l) : INT_MAX);
    printf("오른쪽 자식 노드의 인덱스는 %d, 값은 %d이다\n", r, r < arrSize ? val(abt, r) : INT_MAX);
    printf("부모 노드의 인덱스는 %d, 값은 %d이다\n", p, p < arrSize ? val(abt, p) : INT_MAX);

    // 트리 순회
    int returnSize;
    int *res;

    res = levelOrder(abt, &returnSize);
    printf("\n레벨 순서 순회: ");
    printArray(res, returnSize);
    free(res);

    res = preOrder(abt, &returnSize);
    printf("전위 순회: ");
    printArray(res, returnSize);
    free(res);

    res = inOrder(abt, &returnSize);
    printf("중위 순회: ");
    printArray(res, returnSize);
    free(res);

    res = postOrder(abt, &returnSize);
    printf("후위 순회: ");
    printArray(res, returnSize);
    free(res);

    // 메모리 해제
    delArrayBinaryTree(abt);
    return 0;
}
