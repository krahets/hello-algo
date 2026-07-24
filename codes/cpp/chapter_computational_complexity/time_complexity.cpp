/**
 * File: time_complexity.cpp
 * Created Time: 2026-05-20
 * Author: miaochengyou1119(https://github.com/miaochengyou1119)
 */

#include <iostream>
#include <vector>
using namespace std;

/* 常数阶 O(1) */
int constant(int n) {
    int count = 0;
    int size = 100000;
    for (int i = 0; i < size; i++)
        count++;
    return count;
}

/* 线性阶 O(n) */
int linear(int n) {
    int count = 0;
    for (int i = 0; i < n; i++)
        count++;
    return count;
}

/* 线性阶（遍历数组）O(n) */
int arrayTraversal(vector<int> &nums) {
    int count = 0;
    for (int num : nums) {
        count++;
    }
    return count;
}

/* 平方阶 O(n²) */
int quadratic(int n) {
    int count = 0;
    for (int i = 0; i < n; i++) {
        for (int j = 0; j < n; j++) {
            count++;
        }
    }
    return count;
}

/* 平方阶（冒泡排序）O(n²) */
int bubbleSort(vector<int> &nums) {
    int count = 0;
    for (int i = nums.size() - 1; i > 0; i--) {
        for (int j = 0; j < i; j++) {
            if (nums[j] > nums[j + 1]) {
                int tmp = nums[j];
                nums[j] = nums[j + 1];
                nums[j + 1] = tmp;
                count += 3;
            }
        }
    }
    return count;
}

/* 指数阶 O(2ⁿ) */
int exponential(int n) {
    int count = 0, base = 1;
    for (int i = 0; i < n; i++) {
        for (int j = 0; j < base; j++) {
            count++;
        }
        base *= 2;
    }
    return count;
}

/* 指数阶（递归）O(2ⁿ) */
int expRecur(int n) {
    if (n == 1)
        return 1;
    return expRecur(n - 1) + expRecur(n - 1) + 1;
}

/* 对数阶 O(log n) */
int logarithmic(int n) {
    int count = 0;
    while (n > 1) {
        n = n / 2;
        count++;
    }
    return count;
}

/* 对数阶（递归）O(log n) */
int logRecur(int n) {
    if (n <= 1)
        return 0;
    return logRecur(n / 2) + 1;
}

/* 线性对数阶 O(n log n) */
int linearLogRecur(int n) {
    if (n <= 1)
        return 1;
    int count = linearLogRecur(n / 2) + linearLogRecur(n / 2);
    for (int i = 0; i < n; i++) {
        count++;
    }
    return count;
}

/* 阶乘阶 O(n!) */
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
int main() {
    int n = 8;
    cout << "输入数据大小 n = " << n << endl << endl;

    int count = constant(n);
    cout << "常数阶 O(1) 操作数量 = " << count << endl;

    count = linear(n);
    cout << "线性阶 O(n) 操作数量 = " << count << endl;
    vector<int> arr(n);
    count = arrayTraversal(arr);
    cout << "线性阶（遍历数组）操作数量 = " << count << endl;

    count = quadratic(n);
    cout << "平方阶 O(n²) 操作数量 = " << count << endl;
    vector<int> nums(n);
    for (int i = 0; i < n; i++)
        nums[i] = n - i;
    count = bubbleSort(nums);
    cout << "平方阶（冒泡排序）操作数量 = " << count << endl;

    count = exponential(n);
    cout << "指数阶 O(2ⁿ) 操作数量 = " << count << endl;
    count = expRecur(n);
    cout << "指数阶（递归）操作数量 = " << count << endl;

    count = logarithmic(n);
    cout << "对数阶 O(log n) 操作数量 = " << count << endl;
    count = logRecur(n);
    cout << "对数阶（递归）操作数量 = " << count << endl;

    count = linearLogRecur(n);
    cout << "线性对数阶 O(n log n) 操作数量 = " << count << endl;

    count = factorialRecur(n);
    cout << "阶乘阶 O(n!) 操作数量 = " << count << endl;

    return 0;
}
