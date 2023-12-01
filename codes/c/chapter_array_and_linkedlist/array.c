/**
 * File: array.c
 * Created Time: 2022-12-20
 * Author: MolDuM (moldum@163.com)
 */

#include "../utils/common.h"

/* 随机访问元素 */
int randomAccess(int *nums, int size) {
    // 在区间 [0, size) 中随机抽取一个数字
    int randomIndex = rand() % size;
    // 获取并返回随机元素
    int randomNum = nums[randomIndex];
    return randomNum;
}

/* 扩展数组长度 */
int *extend(int *nums, int size, int enlarge) {
    // 初始化一个扩展长度后的数组
    int *res = (int *)malloc(sizeof(int) * (size + enlarge));
    // 将原数组中的所有元素复制到新数组
    for (int i = 0; i < size; i++) {
        res[i] = nums[i];
    }
    // 初始化扩展后的空间
    for (int i = size; i < size + enlarge; i++) {
        res[i] = 0;
    }
    // 返回扩展后的新数组
    return res;
}

/* 在数组的索引 index 处插入元素 num */
void insert(int *nums, int size, int num, int index) {
    // 把索引 index 以及之后的所有元素向后移动一位
    for (int i = size - 1; i > index; i--) {
        nums[i] = nums[i - 1];
    }
    // 将 num 赋给 index 处的元素
    nums[index] = num;
}

/* 删除索引 index 处的元素 */
// 注意：stdio.h 占用了 remove 关键词
void removeItem(int *nums, int size, int index) {
    // 把索引 index 之后的所有元素向前移动一位
    for (int i = index; i < size - 1; i++) {
        nums[i] = nums[i + 1];
    }
}

/* 遍历数组 */
void traverse(int *nums, int size) {
    int count = 0;
    // 通过索引遍历数组
    for (int i = 0; i < size; i++) {
        count += nums[i];
    }
}

/* 在数组中查找指定元素 */
int find(int *nums, int size, int target) {
    for (int i = 0; i < size; i++) {
        if (nums[i] == target)
            return i;
    }
    return -1;
}

/* Driver Code */
int main() {
    /* 初始化数组 */
    int size = 5;
    int arr[5];
    printf("数组 arr = ");
    printArray(arr, size);

    int nums[] = {1, 3, 2, 5, 4};
    printf("数组 nums = ");
    printArray(nums, size);

    /* 随机访问 */
    int randomNum = randomAccess(nums, size);
    printf("在 nums 中获取随机元素 %d", randomNum);

    /* 长度扩展 */
    int enlarge = 3;
    int *res = extend(nums, size, enlarge);
    size += enlarge;
    printf("将数组长度扩展至 8 ，得到 nums = ");
    printArray(res, size);

    /* 插入元素 */
    insert(res, size, 6, 3);
    printf("在索引 3 处插入数字 6 ，得到 nums = ");
    printArray(res, size);

    /* 删除元素 */
    removeItem(res, size, 2);
    printf("删除索引 2 处的元素，得到 nums = ");
    printArray(res, size);

    /* 遍历数组 */
    traverse(res, size);

    /* 查找元素 */
    int index = find(res, size, 3);
    printf("在 res 中查找元素 3 ，得到索引 = %d\n", index);

    /* 释放内存 */
    free(res);
    return 0;
}
