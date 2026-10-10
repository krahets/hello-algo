/**
 * File: time_complexity.java
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

package chapter_computational_complexity;

public class time_complexity {
    /* 定数階 */
    static int constant(int n) {
        int count = 0;
        int size = 100000;
        for (int i = 0; i < size; i++)
            count++;
        return count;
    }

    /* 線形階 */
    static int linear(int n) {
        int count = 0;
        for (int i = 0; i < n; i++)
            count++;
        return count;
    }

    /* 線形時間（配列を走査） */
    static int arrayTraversal(int[] nums) {
        int count = 0;
        // ループ回数は配列長に比例する
        for (int num : nums) {
            count++;
        }
        return count;
    }

    /* 二乗階 */
    static int quadratic(int n) {
        int count = 0;
        // ループ回数はデータサイズ n の二乗に比例する
        for (int i = 0; i < n; i++) {
            for (int j = 0; j < n; j++) {
                count++;
            }
        }
        return count;
    }

    /* 二次時間（バブルソート） */
    static int bubbleSort(int[] nums) {
        int count = 0; // カウンタ
        // 外側のループ：未ソート区間は [0, i]
        for (int i = nums.length - 1; i > 0; i--) {
            // 内側のループ：未ソート区間 [0, i] の最大要素をその区間の最右端へ交換
            for (int j = 0; j < i; j++) {
                if (nums[j] > nums[j + 1]) {
                    // nums[j] と nums[j + 1] を交換
                    int tmp = nums[j];
                    nums[j] = nums[j + 1];
                    nums[j + 1] = tmp;
                    count += 3; // 要素交換には 3 回の単位操作が含まれる
                }
            }
        }
        return count;
    }

    /* 指数時間（ループ実装） */
    static int exponential(int n) {
        int count = 0, base = 1;
        // 細胞は各ラウンドで 2 つに分裂し、数列 1, 2, 4, 8, ..., 2^(n-1) を形成する
        for (int i = 0; i < n; i++) {
            for (int j = 0; j < base; j++) {
                count++;
            }
            base *= 2;
        }
        // count = 1 + 2 + 4 + 8 + .. + 2^(n-1) = 2^n - 1
        return count;
    }

    /* 指数時間（再帰実装） */
    static int expRecur(int n) {
        if (n == 1)
            return 1;
        return expRecur(n - 1) + expRecur(n - 1) + 1;
    }

    /* 対数時間（ループ実装） */
    static int logarithmic(int n) {
        int count = 0;
        while (n > 1) {
            n = n / 2;
            count++;
        }
        return count;
    }

    /* 対数時間（再帰実装） */
    static int logRecur(int n) {
        if (n <= 1)
            return 0;
        return logRecur(n / 2) + 1;
    }

    /* 線形対数時間 */
    static int linearLogRecur(int n) {
        if (n <= 1)
            return 1;
        int count = linearLogRecur(n / 2) + linearLogRecur(n / 2);
        for (int i = 0; i < n; i++) {
            count++;
        }
        return count;
    }

    /* 階乗時間（再帰実装） */
    static int factorialRecur(int n) {
        if (n == 0)
            return 1;
        int count = 0;
        // 1個から n 個に分裂
        for (int i = 0; i < n; i++) {
            count += factorialRecur(n - 1);
        }
        return count;
    }

    /* Driver Code */
    public static void main(String[] args) {
        // n を変えて実行し、各計算量で操作回数がどう変化するかを確認できる
        int n = 8;
        System.out.println("入力データサイズ n = " + n);

        int count = constant(n);
        System.out.println("定数時間の操作回数 = " + count);

        count = linear(n);
        System.out.println("線形時間の操作回数 = " + count);
        count = arrayTraversal(new int[n]);
        System.out.println("線形時間（配列走査）の操作回数 = " + count);

        count = quadratic(n);
        System.out.println("2 次時間の操作回数 = " + count);
        int[] nums = new int[n];
        for (int i = 0; i < n; i++)
            nums[i] = n - i; // [n,n-1,...,2,1]
        count = bubbleSort(nums);
        System.out.println("2 次時間（バブルソート）の操作回数 = " + count);

        count = exponential(n);
        System.out.println("指数時間（ループ実装）の操作回数 = " + count);
        count = expRecur(n);
        System.out.println("指数時間（再帰実装）の操作回数 = " + count);

        count = logarithmic(n);
        System.out.println("対数時間（ループ実装）の操作回数 = " + count);
        count = logRecur(n);
        System.out.println("対数時間（再帰実装）の操作回数 = " + count);

        count = linearLogRecur(n);
        System.out.println("線形対数時間（再帰実装）の操作回数 = " + count);

        count = factorialRecur(n);
        System.out.println("階乗時間（再帰実装）の操作回数 = " + count);
    }
}
