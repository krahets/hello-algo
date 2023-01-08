/**
 * File: worst_best_time_complexity.c
 * Created Time: 2023-01-03
 * Author: sjinzh (sjinzh@gmail.com)
 */

#include "../include/include.h"

/* 生成一个数组，元素为 { 1, 2, ..., n }，顺序被打乱 */
int *randomNumbers(int n) {
    // 分配堆区内存（创建一维可变长数组：数组中元素数量为n，元素类型为int）
    int *nums = (int *)malloc(n * sizeof(int));
    // 生成数组 nums = { 1, 2, 3, ..., n }
    for (int i = 0; i < n; i++) {
        nums[i] = i + 1;
    }
    // 随机打乱数组元素 
    for (int i = n - 1; i > 0; i--) {
        int j = rand() % (i + 1);
        int temp = nums[i];
        nums[i] = nums[j];
        nums[j] = temp;
    }
    return nums;
}

/* 查找数组 nums 中数字 1 所在索引 */
int findOne(int *nums, int n) {
    for (int i = 0; i < n; i++) {
        if (nums[i] == 1) return i;
    }
    return -1;
}

/* Driver Code */
int main(int argc, char *argv[]) {
    // 初始化随机数种子
    srand((unsigned int)time(NULL));
    for (int i = 0; i < 10; i++) {
        int n = 100;
        int *nums = randomNumbers(n);
        int index = findOne(nums, n);
        printf("\n数组 [ 1, 2, ..., n ] 被打乱后 = ");
        printArray(nums, n);
        printf("数字 1 的索引为 %d\n", index);
        // 释放堆区内存
        if (nums != NULL) {
            free(nums);
            nums = NULL;
        }
    }
    getchar();
    return 0;
}
