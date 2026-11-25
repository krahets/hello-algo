/**
 * File: array.c
 * Created Time: 2022-12-20
 * Author: MolDuM (moldum@163.com)
 */

#include "../utils/common.h"

/* 隨機存取元素 */
int randomAccess(int *nums, int size) {
    // 從區間 [0, size) 隨機選取一個數
    int randomIndex = rand() % size;
    // 取得並回傳隨機選出的元素
    int randomNum = nums[randomIndex];
    return randomNum;
}

/* 增加陣列長度 */
int *extend(int *nums, int size, int enlarge) {
    // 初始化加長後的陣列
    int *res = (int *)malloc(sizeof(int) * (size + enlarge));
    // 將原陣列的所有元素複製到新陣列
    for (int i = 0; i < size; i++) {
        res[i] = nums[i];
    }
    // 初始化新增的空間
    for (int i = size; i < size + enlarge; i++) {
        res[i] = 0;
    }
    // 回傳加長後的新陣列
    return res;
}

/* 在陣列的索引 index 處插入元素 num */
void insert(int *nums, int size, int num, int index) {
    // 將索引 index 起的所有元素往後移一格
    for (int i = size - 1; i > index; i--) {
        nums[i] = nums[i - 1];
    }
    // 將 num 指派給索引 index 處的元素
    nums[index] = num;
}

/* 刪除索引 index 處的元素 */
// 注意：stdio.h 已使用 remove 這個名稱
void removeItem(int *nums, int size, int index) {
    // 將索引 index 之後的所有元素往前移一格
    for (int i = index; i < size - 1; i++) {
        nums[i] = nums[i + 1];
    }
}

/* 走訪陣列 */
void traverse(int *nums, int size) {
    int count = 0;
    // 依索引走訪陣列
    for (int i = 0; i < size; i++) {
        count += nums[i];
    }
}

/* 在陣列中尋找指定元素 */
int find(int *nums, int size, int target) {
    for (int i = 0; i < size; i++) {
        if (nums[i] == target)
            return i;
    }
    return -1;
}

/* 範例主程式 */
int main() {
    /* 初始化亂數種子（只須執行一次） */
    srand((unsigned)time(NULL));

    /* 初始化陣列 */
    int size = 5;
    int arr[5] = {0};
    printf("陣列 arr = ");
    printArray(arr, size);

    int nums[] = {1, 3, 2, 5, 4};
    printf("陣列 nums = ");
    printArray(nums, size);

    /* 隨機存取 */
    int randomNum = randomAccess(nums, size);
    printf("從 nums 隨機取得的元素為 %d", randomNum);

    /* 增加長度 */
    int enlarge = 3;
    int *res = extend(nums, size, enlarge);
    size += enlarge;
    printf("將陣列長度增加至 8，得到 nums = ");
    printArray(res, size);

    /* 插入元素 */
    insert(res, size, 6, 3);
    printf("在索引 3 處插入數字 6，得到 nums = ");
    printArray(res, size);

    /* 刪除元素 */
    removeItem(res, size, 2);
    printf("刪除索引 2 處的元素，得到 nums = ");
    printArray(res, size);

    /* 走訪陣列 */
    traverse(res, size);

    /* 尋找元素 */
    int index = find(res, size, 3);
    printf("在 res 中尋找元素 3，得到索引 = %d\n", index);

    /* 釋放記憶體 */
    free(res);
    return 0;
}
