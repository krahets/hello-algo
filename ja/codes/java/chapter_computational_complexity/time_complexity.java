/**
 * File: time_complexity.java
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

package chapter_computational_complexity;

public class time_complexity {
    /* 定数計算量 */
    static int constant(int n) {
        int count = 0;
        int size = 100000;
        for (int i = 0; i < size; i++)
            count++;
        return count;
    }

    /* 線形計算量 */
    static int linear(int n) {
        int count = 0;
        for (int i = 0; i < n; i++)
            count++;
        return count;
    }

    /* 線形計算量（配列の走査） */
    static int arrayTraversal(int[] nums) {
        int count = 0;
        // ループ回数は配列の長さに比例
        for (int num : nums) {
            count++;
        }
        return count;
    }

    /* 二次計算量 */
    static int quadratic(int n) {
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
    static int bubbleSort(int[] nums) {
        int count = 0; // カウンター
        // 外側ループ：未ソート範囲は [0, i]
        for (int i = nums.length - 1; i > 0; i--) {
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
    static int exponential(int n) {
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
    static int expRecur(int n) {
        if (n == 1)
            return 1;
        return expRecur(n - 1) + expRecur(n - 1) + 1;
    }

    /* 対数計算量（ループ実装） */
    static int logarithmic(int n) {
        int count = 0;
        while (n > 1) {
            n = n / 2;
            count++;
        }
        return count;
    }

    /* 対数計算量（再帰実装） */
    static int logRecur(int n) {
        if (n <= 1)
            return 0;
        return logRecur(n / 2) + 1;
    }

    /* 線形対数計算量 */
    static int linearLogRecur(int n) {
        if (n <= 1)
            return 1;
        int count = linearLogRecur(n / 2) + linearLogRecur(n / 2);
        for (int i = 0; i < n; i++) {
            count++;
        }
        return count;
    }

    /* 階乗計算量（再帰実装） */
    static int factorialRecur(int n) {
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
    public static void main(String[] args) {
        // n を変更して、さまざまな計算量での操作回数の変化傾向を体験可能
        int n = 8;
        System.out.println("入力データサイズ n = " + n);

        int count = constant(n);
        System.out.println("定数計算量の操作回数 = " + count);

        count = linear(n);
        System.out.println("線形計算量の操作回数 = " + count);
        count = arrayTraversal(new int[n]);
        System.out.println("線形計算量の操作回数（配列走査） = " + count);

        count = quadratic(n);
        System.out.println("二次計算量の操作回数 = " + count);
        int[] nums = new int[n];
        for (int i = 0; i < n; i++)
            nums[i] = n - i; // [n,n-1,...,2,1]
        count = bubbleSort(nums);
        System.out.println("二次計算量の操作回数（バブルソート） = " + count);

        count = exponential(n);
        System.out.println("指数計算量の操作回数（ループ実装） = " + count);
        count = expRecur(n);
        System.out.println("指数計算量の操作回数（再帰実装） = " + count);

        count = logarithmic(n);
        System.out.println("対数計算量の操作回数（ループ実装） = " + count);
        count = logRecur(n);
        System.out.println("対数計算量の操作回数（再帰実装） = " + count);

        count = linearLogRecur(n);
        System.out.println("線形対数計算量の操作回数（再帰実装） = " + count);

        count = factorialRecur(n);
        System.out.println("階乗計算量の操作回数（再帰実装） = " + count);
    }
}