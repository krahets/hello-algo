/**
 * File: array.c
 * Created Time: 2022-12-20
 * Author: MolDuM (moldum@163.com)
 */

#include "../utils/common.h"

/* 隨機訪問元素 */
int randomAccess(int *nums, int size) {
    // 在區間 [0, size) 中隨機抽取一個數字
    int randomIndex = rand() % size;
    // 獲取並返回隨機元素
    int randomNum = nums[randomIndex];
    return randomNum;
}

/* 擴展陣列長度 */
int *extend(int *nums, int size, int enlarge) {
    // 初始化一個擴展長度後的陣列
    int *res = (int *)malloc(sizeof(int) * (size + enlarge));
    // 將原陣列中的所有元素複製到新陣列
    for (int i = 0; i < size; i++) {
        res[i] = nums[i];
    }
    // 初始化擴展後的空間
    for (int i = size; i < size + enlarge; i++) {
        res[i] = 0;
    }
    // 返回擴展後的新陣列
    return res;
}

/* 在陣列的索引 index 處插入元素 num */
void insert(int *nums, int size, int num, int index) {
    // 把索引 index 以及之後的所有元素向後移動一位
    for (int i = size - 1; i > index; i--) {
        nums[i] = nums[i - 1];
    }
    // 將 num 賦給 index 處的元素
    nums[index] = num;
}

/* 刪除索引 index 處的元素 */
// 注意：stdio.h 佔用了 remove 關鍵詞
void removeItem(int *nums, int size, int index) {
    // 把索引 index 之後的所有元素向前移動一位
    for (int i = index; i < size - 1; i++) {
        nums[i] = nums[i + 1];
    }
}

/* 走訪陣列 */
void traverse(int *nums, int size) {
    int count = 0;
    // 透過索引走訪陣列
    for (int i = 0; i < size; i++) {
        count += nums[i];
    }
}

/* 在陣列中查詢指定元素 */
int find(int *nums, int size, int target) {
    for (int i = 0; i < size; i++) {
        if (nums[i] == target)
            return i;
    }
    return -1;
}

/* Driver Code */
int main() {
    /* 初始化陣列 */
    int size = 5;
    int arr[5];
    printf("陣列 arr = ");
    printArray(arr, size);

    int nums[] = {1, 3, 2, 5, 4};
    printf("陣列 nums = ");
    printArray(nums, size);

    /* 隨機訪問 */
    int randomNum = randomAccess(nums, size);
    printf("在 nums 中獲取隨機元素 %d", randomNum);

    /* 長度擴展 */
    int enlarge = 3;
    int *res = extend(nums, size, enlarge);
    size += enlarge;
    printf("將陣列長度擴展至 8 ，得到 nums = ");
    printArray(res, size);

    /* 插入元素 */
    insert(res, size, 6, 3);
    printf("在索引 3 處插入數字 6 ，得到 nums = ");
    printArray(res, size);

    /* 刪除元素 */
    removeItem(res, size, 2);
    printf("刪除索引 2 處的元素，得到 nums = ");
    printArray(res, size);

    /* 走訪陣列 */
    traverse(res, size);

    /* 查詢元素 */
    int index = find(res, size, 3);
    printf("在 res 中查詢元素 3 ，得到索引 = %d\n", index);

    /* 釋放記憶體 */
    free(res);
    return 0;
}
