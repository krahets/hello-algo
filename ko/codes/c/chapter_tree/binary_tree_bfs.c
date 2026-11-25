/**
 * File: binary_tree_bfs.c
 * Created Time: 2023-01-11
 * Author: Reanon (793584285@qq.com)
 */

#include "../utils/common.h"

#define MAX_SIZE 100

/* 레벨 순회 */
int *levelOrder(TreeNode *root, int *size) {
    /* 보조 큐 */
    int front, rear;
    int index, *arr;
    TreeNode *node;
    TreeNode **queue;

    /* 보조 큐 */
    queue = (TreeNode **)malloc(sizeof(TreeNode *) * MAX_SIZE);
    // 큐 포인터
    front = 0, rear = 0;
    // 루트 노드를 넣는다
    queue[rear++] = root;
    // 순회 결과를 저장할 리스트를 초기화한다
    /* 보조 배열 */
    arr = (int *)malloc(sizeof(int) * MAX_SIZE);
    // 배열 포인터
    index = 0;
    while (front < rear) {
        // 큐에서 노드를 꺼낸다
        node = queue[front++];
        // 노드 값을 저장한다
        arr[index++] = node->val;
        if (node->left != NULL) {
            // 왼쪽 자식을 큐에 넣는다
            queue[rear++] = node->left;
        }
        if (node->right != NULL) {
            // 오른쪽 자식을 큐에 넣는다
            queue[rear++] = node->right;
        }
    }
    // 배열 길이를 갱신한다
    *size = index;
    arr = realloc(arr, sizeof(int) * (*size));

    // 보조 배열의 메모리를 해제한다
    free(queue);
    return arr;
}

/* 실행 코드 */
int main() {
    /* 이진 트리 초기화 */
    // 배열에서 바로 이진 트리를 만드는 함수를 사용한다
    int nums[] = {1, 2, 3, 4, 5, 6, 7};
    int size = sizeof(nums) / sizeof(int);
    TreeNode *root = arrayToTree(nums, size);
    printf("이진 트리 초기화\n");
    printTree(root);

    /* 레벨 순회 */
    // 배열 길이를 전달해야 한다
    int *arr = levelOrder(root, &size);
    printf("레벨 순회로 출력한 노드 순서 = ");
    printArray(arr, size);

    // 메모리 해제
    freeMemoryTree(root);
    free(arr);
    return 0;
}
