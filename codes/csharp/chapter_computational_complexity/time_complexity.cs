/**
 * File: time_complexity.cs
 * Created Time: 2022-12-23
 * Author: haptear (haptear@hotmail.com)
 */

namespace hello_algo.chapter_computational_complexity;

public class time_complexity {
    void algorithm(int n) {
        int a = 1;  // +0（技巧 1）
        a = a + n;  // +0（技巧 1）
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

    // 算法 A 时间复杂度：常数阶
    void algorithm_A(int n) {
        Console.WriteLine(0);
    }
    // 算法 B 时间复杂度：线性阶
    void algorithm_B(int n) {
        for (int i = 0; i < n; i++) {
            Console.WriteLine(0);
        }
    }
    // 算法 C 时间复杂度：常数阶
    void algorithm_C(int n) {
        for (int i = 0; i < 1000000; i++) {
            Console.WriteLine(0);
        }
    }

    /* 常数阶 */
    static int constant(int n) {
        int count = 0;
        int size = 100000;
        for (int i = 0; i < size; i++)
            count++;
        return count;
    }

    /* 线性阶 */
    static int linear(int n) {
        int count = 0;
        for (int i = 0; i < n; i++)
            count++;
        return count;
    }

    /* 线性阶（遍历数组） */
    static int arrayTraversal(int[] nums) {
        int count = 0;
        // 循环次数与数组长度成正比
        foreach (int num in nums) {
            count++;
        }
        return count;
    }

    /* 平方阶 */
    static int quadratic(int n) {
        int count = 0;
        // 循环次数与数组长度成平方关系
        for (int i = 0; i < n; i++) {
            for (int j = 0; j < n; j++) {
                count++;
            }
        }
        return count;
    }

    /* 平方阶（冒泡排序） */
    static int bubbleSort(int[] nums) {
        int count = 0;  // 计数器
        // 外循环：未排序区间为 [0, i]
        for (int i = nums.Length - 1; i > 0; i--) {
            // 内循环：将未排序区间 [0, i] 中的最大元素交换至该区间的最右端 
            for (int j = 0; j < i; j++) {
                if (nums[j] > nums[j + 1]) {
                    // 交换 nums[j] 与 nums[j + 1]
                    (nums[j + 1], nums[j]) = (nums[j], nums[j + 1]);
                    count += 3;  // 元素交换包含 3 个单元操作
                }
            }
        }
        return count;
    }

    /* 指数阶（循环实现） */
    static int exponential(int n) {
        int count = 0, bas = 1;
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
    static int expRecur(int n) {
        if (n == 1) return 1;
        return expRecur(n - 1) + expRecur(n - 1) + 1;
    }

    /* 对数阶（循环实现） */
    static int logarithmic(float n) {
        int count = 0;
        while (n > 1) {
            n = n / 2;
            count++;
        }
        return count;
    }

    /* 对数阶（递归实现） */
    static int logRecur(float n) {
        if (n <= 1) return 0;
        return logRecur(n / 2) + 1;
    }

    /* 线性对数阶 */
    static int linearLogRecur(float n) {
        if (n <= 1) return 1;
        int count = linearLogRecur(n / 2) +
                    linearLogRecur(n / 2);
        for (int i = 0; i < n; i++) {
            count++;
        }
        return count;
    }

    /* 阶乘阶（递归实现） */
    static int factorialRecur(int n) {
        if (n == 0) return 1;
        int count = 0;
        // 从 1 个分裂出 n 个
        for (int i = 0; i < n; i++) {
            count += factorialRecur(n - 1);
        }
        return count;
    }

    [Test]
    public void Test() {
        // 可以修改 n 运行，体会一下各种复杂度的操作数量变化趋势
        int n = 8;
        Console.WriteLine("输入数据大小 n = " + n);

        int count = constant(n);
        Console.WriteLine("常数阶的计算操作数量 = " + count);

        count = linear(n);
        Console.WriteLine("线性阶的计算操作数量 = " + count);
        count = arrayTraversal(new int[n]);
        Console.WriteLine("线性阶（遍历数组）的计算操作数量 = " + count);

        count = quadratic(n);
        Console.WriteLine("平方阶的计算操作数量 = " + count);
        int[] nums = new int[n];
        for (int i = 0; i < n; i++)
            nums[i] = n - i;  // [n,n-1,...,2,1]
        count = bubbleSort(nums);
        Console.WriteLine("平方阶（冒泡排序）的计算操作数量 = " + count);

        count = exponential(n);
        Console.WriteLine("指数阶（循环实现）的计算操作数量 = " + count);
        count = expRecur(n);
        Console.WriteLine("指数阶（递归实现）的计算操作数量 = " + count);

        count = logarithmic((float)n);
        Console.WriteLine("对数阶（循环实现）的计算操作数量 = " + count);
        count = logRecur((float)n);
        Console.WriteLine("对数阶（递归实现）的计算操作数量 = " + count);

        count = linearLogRecur((float)n);
        Console.WriteLine("线性对数阶（递归实现）的计算操作数量 = " + count);

        count = factorialRecur(n);
        Console.WriteLine("阶乘阶（递归实现）的计算操作数量 = " + count);
    }
}
