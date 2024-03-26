/**
 * File: time_complexity.c
 * Created Time: 2023-01-03
 * Author: codingonion (coderonion@gmail.com)
 */

#include "../utils/common.h"

/* 常数阶 */
int constant(int n) {
    int count = 0;
    int size = 100000;
    int i = 0;
    for (int i = 0; i < size; i++) {
        count++;
    }
    return count;
}

/* 线性阶 */
int linear(int n) {
    int count = 0;
    for (int i = 0; i < n; i++) {
        count++;
    }
    return count;
}

/* 线性阶（遍历数组） */
int arrayTraversal(int *nums, int n) {
    int count = 0;
    // 循环次数与数组长度成正比
    for (int i = 0; i < n; i++) {
        count++;
    }
    return count;
}

/* 平方阶 */
int quadratic(int n) {
    int count = 0;
    // 循环次数与数据大小 n 成平方关系
    for (int i = 0; i < n; i++) {
        for (int j = 0; j < n; j++) {
            count++;
        }
    }
    return count;
}

/* 平方阶（冒泡排序） */
int bubbleSort(int *nums, int n) {
    int count = 0; // 计数器
    // 外循环：未排序区间为 [0, i]
    for (int i = n - 1; i > 0; i--) {
        // 内循环：将未排序区间 [0, i] 中的最大元素交换至该区间的最右端
        for (int j = 0; j < i; j++) {
            if (nums[j] > nums[j + 1]) {
                // 交换 nums[j] 与 nums[j + 1]
                int tmp = nums[j];
                nums[j] = nums[j + 1];
                nums[j + 1] = tmp;
                count += 3; // 元素交换包含 3 个单元操作
            }
        }
    }
    return count;
}

/* 指数阶（循环实现） */
int exponential(int n) {
    int count = 0;
    int bas = 1;
    // 细胞每轮一分为二，形成数列 1, 2, 4, 8, ..., 2^(n-1)
    for (int i = 0; i < n; i++) {
        for (int j = 0; j < bas; j++) {
            count++;
        }
        bas *= 2;
    }
    // count = 1 + 2 + 4 + 8 + .. + 2^(n-1) = 2^n - 1
    return count;
}

/* 指数阶（递归实现） */
int expRecur(int n) {
    if (n == 1)
        return 1;
    return expRecur(n - 1) + expRecur(n - 1) + 1;
}

/* 对数阶（循环实现） */
int logarithmic(int n) {
    int count = 0;
    while (n > 1) {
        n = n / 2;
        count++;
    }
    return count;
}

/* 对数阶（递归实现） */
int logRecur(int n) {
    if (n <= 1)
        return 0;
    return logRecur(n / 2) + 1;
}

/* 线性对数阶 */
int linearLogRecur(int n) {
    if (n <= 1)
        return 1;
    int count = linearLogRecur(n / 2) + linearLogRecur(n / 2);
    for (int i = 0; i < n; i++) {
        count++;
    }
    return count;
}

/* 阶乘阶（递归实现） */
int factorialRecur(int n) {
    if (n == 0)
        return 1;
    int count = 0;
    for (int i = 0; i < n; i++) {
        count += factorialRecur(n - 1);
    }
    return count;
}

/* Driver Code */
int main(int argc, char *argv[]) {
    // 可以修改 n 运行，体会一下各种复杂度的操作数量变化趋势
    int n = 8;
    printf("输入数据大小 n = %d\n", n);

    int count = constant(n);
    printf("常数阶的操作数量 = %d\n", count);

    count = linear(n);
    printf("线性阶的操作数量 = %d\n", count);
    // 分配堆区内存（创建一维可变长数组：数组中元素数量为 n ，元素类型为 int ）
    int *nums = (int *)malloc(n * sizeof(int));
    count = arrayTraversal(nums, n);
    printf("线性阶（遍历数组）的操作数量 = %d\n", count);

    count = quadratic(n);
    printf("平方阶的操作数量 = %d\n", count);
    for (int i = 0; i < n; i++) {
        nums[i] = n - i; // [n,n-1,...,2,1]
    }
    count = bubbleSort(nums, n);
    printf("平方阶（冒泡排序）的操作数量 = %d\n", count);

    count = exponential(n);
    printf("指数阶（循环实现）的操作数量 = %d\n", count);
    count = expRecur(n);
    printf("指数阶（递归实现）的操作数量 = %d\n", count);

    count = logarithmic(n);
    printf("对数阶（循环实现）的操作数量 = %d\n", count);
    count = logRecur(n);
    printf("对数阶（递归实现）的操作数量 = %d\n", count);

    count = linearLogRecur(n);
    printf("线性对数阶（递归实现）的操作数量 = %d\n", count);

    count = factorialRecur(n);
    printf("阶乘阶（递归实现）的操作数量 = %d\n", count);

    // 释放堆区内存
    if (nums != NULL) {
        free(nums);
        nums = NULL;
    }
    getchar();

    return 0;
}
