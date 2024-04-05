/**
 * File: time_complexity.cs
 * Created Time: 2022-12-23
 * Author: haptear (haptear@hotmail.com)
 */

namespace hello_algo.chapter_computational_complexity;

public class time_complexity {
    void Algorithm(int n) {
        int a = 1;  // +0（技巧 1）
        a += n;  // +0（技巧 1）
        // +n（技巧 2）
        for (int i = 0; i < 5 * n + 1; i++) {
            Console.WriteLine(0);
        }
        // +n*n（技巧 3）
        for (int i = 0; i < 2 * n; i++) {
            for (int j = 0; j < n + 1; j++) {
                Console.WriteLine(0);
            }
        }
    }

    // 演算法 A 時間複雜度：常數階
    void AlgorithmA(int n) {
        Console.WriteLine(0);
    }

    // 演算法 B 時間複雜度：線性階
    void AlgorithmB(int n) {
        for (int i = 0; i < n; i++) {
            Console.WriteLine(0);
        }
    }

    // 演算法 C 時間複雜度：常數階
    void AlgorithmC(int n) {
        for (int i = 0; i < 1000000; i++) {
            Console.WriteLine(0);
        }
    }

    /* 常數階 */
    int Constant(int n) {
        int count = 0;
        int size = 100000;
        for (int i = 0; i < size; i++)
            count++;
        return count;
    }

    /* 線性階 */
    int Linear(int n) {
        int count = 0;
        for (int i = 0; i < n; i++)
            count++;
        return count;
    }

    /* 線性階（走訪陣列） */
    int ArrayTraversal(int[] nums) {
        int count = 0;
        // 迴圈次數與陣列長度成正比
        foreach (int num in nums) {
            count++;
        }
        return count;
    }

    /* 平方階 */
    int Quadratic(int n) {
        int count = 0;
        // 迴圈次數與資料大小 n 成平方關係
        for (int i = 0; i < n; i++) {
            for (int j = 0; j < n; j++) {
                count++;
            }
        }
        return count;
    }

    /* 平方階（泡沫排序） */
    int BubbleSort(int[] nums) {
        int count = 0;  // 計數器
        // 外迴圈：未排序區間為 [0, i]
        for (int i = nums.Length - 1; i > 0; i--) {
            // 內迴圈：將未排序區間 [0, i] 中的最大元素交換至該區間的最右端
            for (int j = 0; j < i; j++) {
                if (nums[j] > nums[j + 1]) {
                    // 交換 nums[j] 與 nums[j + 1]
                    (nums[j + 1], nums[j]) = (nums[j], nums[j + 1]);
                    count += 3;  // 元素交換包含 3 個單元操作
                }
            }
        }
        return count;
    }

    /* 指數階（迴圈實現） */
    int Exponential(int n) {
        int count = 0, bas = 1;
        // 細胞每輪一分為二，形成數列 1, 2, 4, 8, ..., 2^(n-1)
        for (int i = 0; i < n; i++) {
            for (int j = 0; j < bas; j++) {
                count++;
            }
            bas *= 2;
        }
        // count = 1 + 2 + 4 + 8 + .. + 2^(n-1) = 2^n - 1
        return count;
    }

    /* 指數階（遞迴實現） */
    int ExpRecur(int n) {
        if (n == 1) return 1;
        return ExpRecur(n - 1) + ExpRecur(n - 1) + 1;
    }

    /* 對數階（迴圈實現） */
    int Logarithmic(int n) {
        int count = 0;
        while (n > 1) {
            n /= 2;
            count++;
        }
        return count;
    }

    /* 對數階（遞迴實現） */
    int LogRecur(int n) {
        if (n <= 1) return 0;
        return LogRecur(n / 2) + 1;
    }

    /* 線性對數階 */
    int LinearLogRecur(int n) {
        if (n <= 1) return 1;
        int count = LinearLogRecur(n / 2) + LinearLogRecur(n / 2);
        for (int i = 0; i < n; i++) {
            count++;
        }
        return count;
    }

    /* 階乘階（遞迴實現） */
    int FactorialRecur(int n) {
        if (n == 0) return 1;
        int count = 0;
        // 從 1 個分裂出 n 個
        for (int i = 0; i < n; i++) {
            count += FactorialRecur(n - 1);
        }
        return count;
    }

    [Test]
    public void Test() {
        // 可以修改 n 執行，體會一下各種複雜度的操作數量變化趨勢
        int n = 8;
        Console.WriteLine("輸入資料大小 n = " + n);

        int count = Constant(n);
        Console.WriteLine("常數階的操作數量 = " + count);

        count = Linear(n);
        Console.WriteLine("線性階的操作數量 = " + count);
        count = ArrayTraversal(new int[n]);
        Console.WriteLine("線性階（走訪陣列）的操作數量 = " + count);

        count = Quadratic(n);
        Console.WriteLine("平方階的操作數量 = " + count);
        int[] nums = new int[n];
        for (int i = 0; i < n; i++)
            nums[i] = n - i;  // [n,n-1,...,2,1]
        count = BubbleSort(nums);
        Console.WriteLine("平方階（泡沫排序）的操作數量 = " + count);

        count = Exponential(n);
        Console.WriteLine("指數階（迴圈實現）的操作數量 = " + count);
        count = ExpRecur(n);
        Console.WriteLine("指數階（遞迴實現）的操作數量 = " + count);

        count = Logarithmic(n);
        Console.WriteLine("對數階（迴圈實現）的操作數量 = " + count);
        count = LogRecur(n);
        Console.WriteLine("對數階（遞迴實現）的操作數量 = " + count);

        count = LinearLogRecur(n);
        Console.WriteLine("線性對數階（遞迴實現）的操作數量 = " + count);

        count = FactorialRecur(n);
        Console.WriteLine("階乘階（遞迴實現）的操作數量 = " + count);
    }
}
