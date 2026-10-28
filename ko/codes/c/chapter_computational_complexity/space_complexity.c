/**
 * File: space_complexity.c
 * Created Time: 2023-04-15
 * Author: Gonglja (glj0@outlook.com)
 */

#include "../utils/common.h"

/* 함수 */
int func() {
    // 몇 가지 연산을 수행한다
    return 0;
}

/* 상수 차수 */
void constant(int n) {
    // 상수, 변수, 객체는 O(1) 공간을 차지한다
    const int a = 0;
    int b = 0;
    int nums[1000];
    ListNode *node = newListNode(0);
    free(node);
    // 반복문 안의 변수는 O(1) 공간을 차지한다
    for (int i = 0; i < n; i++) {
        int c = 0;
    }
    // 반복문 안의 함수는 O(1) 공간을 차지한다
    for (int i = 0; i < n; i++) {
        func();
    }
}

/* 해시 테이블 */
typedef struct {
    int key;
    int val;
    UT_hash_handle hh; // uthash.h를 기반으로 구현한다
} HashTable;

/* 선형 차수 */
void linear(int n) {
    // 길이가 n인 배열은 O(n) 공간을 차지한다
    int *nums = malloc(sizeof(int) * n);
    free(nums);

    // 길이가 n인 리스트는 O(n) 공간을 차지한다
    ListNode **nodes = malloc(sizeof(ListNode *) * n);
    for (int i = 0; i < n; i++) {
        nodes[i] = newListNode(i);
    }
    // 메모리 해제
    for (int i = 0; i < n; i++) {
        free(nodes[i]);
    }
    free(nodes);

    // 길이가 n인 해시 테이블은 O(n) 공간을 차지한다
    HashTable *h = NULL;
    for (int i = 0; i < n; i++) {
        HashTable *tmp = malloc(sizeof(HashTable));
        tmp->key = i;
        tmp->val = i;
        HASH_ADD_INT(h, key, tmp);
    }

    // 메모리 해제
    HashTable *curr, *tmp;
    HASH_ITER(hh, h, curr, tmp) {
        HASH_DEL(h, curr);
        free(curr);
    }
}

/* 선형 차수(재귀 구현) */
void linearRecur(int n) {
    printf("재귀 n = %d\r\n", n);
    if (n == 1)
        return;
    linearRecur(n - 1);
}

/* 제곱 차수 */
void quadratic(int n) {
    // 이차원 리스트는 O(n^2) 공간을 차지한다
    int **numMatrix = malloc(sizeof(int *) * n);
    for (int i = 0; i < n; i++) {
        int *tmp = malloc(sizeof(int) * n);
        for (int j = 0; j < n; j++) {
            tmp[j] = 0;
        }
        numMatrix[i] = tmp;
    }

    // 메모리 해제
    for (int i = 0; i < n; i++) {
        free(numMatrix[i]);
    }
    free(numMatrix);
}

/* 제곱 차수(재귀 구현) */
int quadraticRecur(int n) {
    if (n <= 0)
        return 0;
    int *nums = malloc(sizeof(int) * n);
    printf("재귀 n = %d에서 nums의 길이 = %d\r\n", n, n);
    int res = quadraticRecur(n - 1);
    free(nums);
    return res;
}

/* 지수 차수(포화 이진 트리 구성) */
TreeNode *buildTree(int n) {
    if (n == 0)
        return NULL;
    TreeNode *root = newTreeNode(0);
    root->left = buildTree(n - 1);
    root->right = buildTree(n - 1);
    return root;
}

/* 실행 코드 */
int main() {
    int n = 5;
    // 상수 차수
    constant(n);
    // 선형 차수
    linear(n);
    linearRecur(n);
    // 제곱 차수
    quadratic(n);
    quadraticRecur(n);
    // 지수 차수
    TreeNode *root = buildTree(n);
    printTree(root);

    // 메모리 해제
    freeMemoryTree(root);

    return 0;
}
