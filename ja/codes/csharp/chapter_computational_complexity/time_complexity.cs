/**
 * File: time_complexity.cs
 * Created Time: 2022-12-23
 * Author: haptear (haptear@hotmail.com)
 */

namespace hello_algo.chapter_computational_complexity;

public class time_complexity {
    void Algorithm(int n) {
        int a = 1;  // +0（テクニック 1）
        a += n;  // +0（テクニック 1）
        // +n（テクニック 2）
        for (int i = 0; i < 5 * n + 1; i++) {
            Console.WriteLine(0);
        }
        // +n*n（テクニック 3）
        for (int i = 0; i < 2 * n; i++) {
            for (int j = 0; j < n + 1; j++) {
                Console.WriteLine(0);
            }
        }
    }

    // アルゴリズム A の時間計算量: 定数時間
    void AlgorithmA(int n) {
        Console.WriteLine(0);
    }

    // アルゴリズム B の時間計算量: 線形時間
    void AlgorithmB(int n) {
        for (int i = 0; i < n; i++) {
            Console.WriteLine(0);
        }
    }

    // アルゴリズム C の時間計算量: 定数時間
    void AlgorithmC(int n) {
        for (int i = 0; i < 1000000; i++) {
            Console.WriteLine(0);
        }
    }

    /* 定数階 */
    int Constant(int n) {
        int count = 0;
        int size = 100000;
        for (int i = 0; i < size; i++)
            count++;
        return count;
    }

    /* 線形階 */
    int Linear(int n) {
        int count = 0;
        for (int i = 0; i < n; i++)
            count++;
        return count;
    }

    /* 線形時間（配列を走査） */
    int ArrayTraversal(int[] nums) {
        int count = 0;
        // ループ回数は配列長に比例する
        foreach (int num in nums) {
            count++;
        }
        return count;
    }

    /* 二乗階 */
    int Quadratic(int n) {
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
    int BubbleSort(int[] nums) {
        int count = 0;  // カウンタ
        // 外側のループ：未ソート区間は [0, i]
        for (int i = nums.Length - 1; i > 0; i--) {
            // 内側のループ：未ソート区間 [0, i] の最大要素をその区間の最右端へ交換
            for (int j = 0; j < i; j++) {
                if (nums[j] > nums[j + 1]) {
                    // nums[j] と nums[j + 1] を交換
                    (nums[j + 1], nums[j]) = (nums[j], nums[j + 1]);
                    count += 3;  // 要素交換には 3 回の単位操作が含まれる
                }
            }
        }
        return count;
    }

    /* 指数時間（ループ実装） */
    int Exponential(int n) {
        int count = 0, bas = 1;
        // 細胞は各ラウンドで 2 つに分裂し、数列 1, 2, 4, 8, ..., 2^(n-1) を形成する
        for (int i = 0; i < n; i++) {
            for (int j = 0; j < bas; j++) {
                count++;
            }
            bas *= 2;
        }
        // count = 1 + 2 + 4 + 8 + .. + 2^(n-1) = 2^n - 1
        return count;
    }

    /* 指数時間（再帰実装） */
    int ExpRecur(int n) {
        if (n == 1) return 1;
        return ExpRecur(n - 1) + ExpRecur(n - 1) + 1;
    }

    /* 対数時間（ループ実装） */
    int Logarithmic(int n) {
        int count = 0;
        while (n > 1) {
            n /= 2;
            count++;
        }
        return count;
    }

    /* 対数時間（再帰実装） */
    int LogRecur(int n) {
        if (n <= 1) return 0;
        return LogRecur(n / 2) + 1;
    }

    /* 線形対数時間 */
    int LinearLogRecur(int n) {
        if (n <= 1) return 1;
        int count = LinearLogRecur(n / 2) + LinearLogRecur(n / 2);
        for (int i = 0; i < n; i++) {
            count++;
        }
        return count;
    }

    /* 階乗時間（再帰実装） */
    int FactorialRecur(int n) {
        if (n == 0) return 1;
        int count = 0;
        // 1個から n 個に分裂
        for (int i = 0; i < n; i++) {
            count += FactorialRecur(n - 1);
        }
        return count;
    }

    [Test]
    public void Test() {
        // n を変えて実行し、各計算量で操作回数がどう変化するかを確認できる
        int n = 8;
        Console.WriteLine("入力データサイズ n = " + n);

        int count = Constant(n);
        Console.WriteLine("定数時間の操作回数 = " + count);

        count = Linear(n);
        Console.WriteLine("線形時間の操作回数 = " + count);
        count = ArrayTraversal(new int[n]);
        Console.WriteLine("線形時間（配列の走査）の操作回数 = " + count);

        count = Quadratic(n);
        Console.WriteLine("二乗時間の操作回数 = " + count);
        int[] nums = new int[n];
        for (int i = 0; i < n; i++)
            nums[i] = n - i;  // [n,n-1,...,2,1]
        count = BubbleSort(nums);
        Console.WriteLine("二乗時間（バブルソート）の操作回数 = " + count);

        count = Exponential(n);
        Console.WriteLine("指数時間（ループ実装）の操作回数 = " + count);
        count = ExpRecur(n);
        Console.WriteLine("指数時間（再帰実装）の操作回数 = " + count);

        count = Logarithmic(n);
        Console.WriteLine("対数時間（ループ実装）の操作回数 = " + count);
        count = LogRecur(n);
        Console.WriteLine("対数時間（再帰実装）の操作回数 = " + count);

        count = LinearLogRecur(n);
        Console.WriteLine("線形対数時間（再帰実装）の操作回数 = " + count);

        count = FactorialRecur(n);
        Console.WriteLine("階乗時間（再帰実装）の操作回数 = " + count);
    }
}
