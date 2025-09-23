/**
 * File: time_complexity.cpp
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* 定数計算量 */
int constant(int n) {
    int count = 0;
    int size = 100000;
    for (int i = 0; i < size; i++)
        count++;
    return count;
}

/* 線形計算量 */
int linear(int n) {
    int count = 0;
    for (int i = 0; i < n; i++)
        count++;
    return count;
}

/* 線形計算量（配列の走査） */
int arrayTraversal(vector<int> &nums) {
    int count = 0;
    // ループ回数は配列の長さに比例
    for (int num : nums) {
        count++;
    }
    return count;
}

/* 二次計算量 */
int quadratic(int n) {
    int count = 0;
    // ループ回数はデータサイズ n の二乗に比例
    for (int i = 0; i < n; i++) {
        for (int j = 0; j < n; j++) {
            count++;
        }
    }
    return count;
}

/* 二次計算量（バブルソート） */
int bubbleSort(vector<int> &nums) {
    int count = 0; // カウンター
    // 外側ループ：未ソート範囲は [0, i]
    for (int i = nums.size() - 1; i > 0; i--) {
        // 内側ループ：未ソート範囲 [0, i] の最大要素を範囲の右端にスワップ
        for (int j = 0; j < i; j++) {
            if (nums[j] > nums[j + 1]) {
                // nums[j] と nums[j + 1] をスワップ
                int tmp = nums[j];
                nums[j] = nums[j + 1];
                nums[j + 1] = tmp;
                count += 3; // 要素のスワップには3つの個別操作が含まれる
            }
        }
    }
    return count;
}

/* 指数計算量（ループ実装） */
int exponential(int n) {
    int count = 0, base = 1;
    // セルは毎ラウンド2つに分裂し、数列 1, 2, 4, 8, ..., 2^(n-1) を形成
    for (int i = 0; i < n; i++) {
        for (int j = 0; j < base; j++) {
            count++;
        }
        base *= 2;
    }
    // count = 1 + 2 + 4 + 8 + .. + 2^(n-1) = 2^n - 1
    return count;
}

/* 指数計算量（再帰実装） */
int expRecur(int n) {
    if (n == 1)
        return 1;
    return expRecur(n - 1) + expRecur(n - 1) + 1;
}

/* 対数計算量（ループ実装） */
int logarithmic(int n) {
    int count = 0;
    while (n > 1) {
        n = n / 2;
        count++;
    }
    return count;
}

/* 対数計算量（再帰実装） */
int logRecur(int n) {
    if (n <= 1)
        return 0;
    return logRecur(n / 2) + 1;
}

/* 線形対数計算量 */
int linearLogRecur(int n) {
    if (n <= 1)
        return 1;
    int count = linearLogRecur(n / 2) + linearLogRecur(n / 2);
    for (int i = 0; i < n; i++) {
        count++;
    }
    return count;
}

/* 階乗計算量（再帰実装） */
int factorialRecur(int n) {
    if (n == 0)
        return 1;
    int count = 0;
    // 1から n に分裂
    for (int i = 0; i < n; i++) {
        count += factorialRecur(n - 1);
    }
    return count;
}

/* ドライバーコード */
int main() {
    // n を変更して、さまざまな計算量での操作回数の変化傾向を体験可能
    int n = 8;
    cout << "入力データサイズ n = " << n << endl;

    int count = constant(n);
    cout << "定数計算量の操作回数 = " << count << endl;

    count = linear(n);
    cout << "線形計算量の操作回数 = " << count << endl;
    vector<int> arr(n);
    count = arrayTraversal(arr);
    cout << "線形計算量の操作回数（配列走査） = " << count << endl;

    count = quadratic(n);
    cout << "二次計算量の操作回数 = " << count << endl;
    vector<int> nums(n);
    for (int i = 0; i < n; i++)
        nums[i] = n - i; // [n,n-1,...,2,1]
    count = bubbleSort(nums);
    cout << "二次計算量の操作回数（バブルソート） = " << count << endl;

    count = exponential(n);
    cout << "指数計算量の操作回数（ループ実装） = " << count << endl;
    count = expRecur(n);
    cout << "指数計算量の操作回数（再帰実装） = " << count << endl;

    count = logarithmic(n);
    cout << "対数計算量の操作回数（ループ実装） = " << count << endl;
    count = logRecur(n);
    cout << "対数計算量の操作回数（再帰実装） = " << count << endl;

    count = linearLogRecur(n);
    cout << "線形対数計算量の操作回数（再帰実装） = " << count << endl;

    count = factorialRecur(n);
    cout << "階乗計算量の操作回数（再帰実装） = " << count << endl;

    return 0;
}