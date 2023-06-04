/**
 * File: permutations_i.c
 * Created Time: 2023-06-04
 * Author: Gonglja (glj0@outlook.com)
 */

#include "../utils/common.h"

/* 定义向量类型 */
typedef struct Vector {
    int size;     // 当前向量的大小
    int capacity; // 当前向量的容量
    void **data;  // 指向数据的指针数组
} Vector;

/* 初始化向量 */
void vectorInit(Vector *v) {
    v->size = 0;
    v->capacity = 4;
    v->data = malloc(v->capacity * sizeof(void *));
}

/*  添加元素到向量尾部 */
void vectorPushback(Vector *v, void *elem) {
    if (v->size == v->capacity) {
        v->capacity *= 2;
        v->data = realloc(v->data, v->capacity * sizeof(void *));
    }
    v->data[v->size++] = elem;
}

/* 从向量尾部弹出元素 */
void vectorPopback(Vector *v) {
    if (v->size != 0) {
        v->size--;
    }
}

/* 清空向量 */
void vectorClear(Vector *v) {
    for (int i = 0; i < v->size; i++) {
        free(v->data[i]);
    }
    free(v->data);
    v->size = 0;
    v->capacity = 4;
    v->data = malloc(v->capacity * sizeof(void *));
}

/* 回溯算法：全排列 I */
void backtrack(Vector *state, Vector *choices, Vector *selected, Vector *res) {
    // 当状态长度等于元素数量时，记录解
    if (state->size == choices->size) {
        Vector *newState = malloc(sizeof(Vector));
        vectorInit(newState);
        for (int i = 0; i < state->size; i++) {
            vectorPushback(newState, state->data[i]);
        }
        vectorPushback(res, newState);
        return;
    }
    // 遍历所有选择
    for (int i = 0; i < choices->size; i++) {
        int *choice = malloc(sizeof(int));
        *choice = *((int *)(choices->data[i]));
        // 剪枝：不允许重复选择元素 且 不允许重复选择相等元素
        bool select = *((bool *)(selected->data[i]));
        if (!select) {
            // 尝试：做出选择，更新状态
            *((bool *)selected->data[i]) = true;
            vectorPushback(state, choice);
            // 进行下一轮选择
            backtrack(state, choices, selected, res);
            // 回退：撤销选择，恢复到之前的状态
            *((bool *)selected->data[i]) = false;
            vectorPopback(state);
        }
    }
}

// 打印二维向量中的元素
void printVectorMatrix(Vector *vv) {
    printf("[\n");
    for (int i = 0; i < vv->size; i++) {
        Vector *v = (Vector *)vv->data[i];
        printf("[");
        for (int j = 0; j < v->size; j++) {
            int *val = (int *)v->data[j];
            if (j == v->size - 1)
                printf("%d", *val);
            else
                printf("%d, ", *val);
        }
        printf("],");
        printf("\n");
    }
    printf("]\n");
}

/* 全排列 I */
Vector *permutationsI(Vector *nums) {
    Vector iState;
    vectorInit(&iState);

    int select[3] = {false, false, false};
    Vector bSelected;
    vectorInit(&bSelected);
    for (int i = 0; i < nums->size; i++) {
        vectorPushback(&bSelected, &select[i]);
    }

    Vector *res = malloc(sizeof(Vector));
    vectorInit(res);

    // 前序遍历
    backtrack(&iState, nums, &bSelected, res);
    return res;
}

int main() {

    int nums[] = {1, 2, 3};
    Vector iNums; // int
    vectorInit(&iNums);
    for (int i = 0; i < sizeof(nums) / sizeof(nums[0]); i++) {
        vectorPushback(&iNums, &nums[i]);
    }

    Vector *res = permutationsI(&iNums);

    // 输出结果
    printf("输入数组 nums = ");
    printArray(nums, sizeof(nums) / sizeof(nums[0]));
    printf("所有排列 res = ");
    printVectorMatrix(res);

    // 释放内存

    return 0;
}
