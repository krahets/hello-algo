/**
 * File: time_complexity.cs
 * Created Time: 2022-12-23
 * Author: haptear (haptear@hotmail.com)
 */

namespace hello_algo.chapter_computational_complexity;

public class time_complexity {
    void Algorithm(int n) {
        int a = 1;  // +0 (technique 1)
        a += n;  // +0 (technique 1)
        // +n (technique 2)
        for (int i = 0; i < 5 * n + 1; i++) {
            Console.WriteLine(0);
        }
        // +n*n (technique 3)
        for (int i = 0; i < 2 * n; i++) {
            for (int j = 0; j < n + 1; j++) {
                Console.WriteLine(0);
            }
        }
    }

    // Algorithm A time complexity: constant
    void AlgorithmA(int n) {
        Console.WriteLine(0);
    }

    // Algorithm B time complexity: linear
    void AlgorithmB(int n) {
        for (int i = 0; i < n; i++) {
            Console.WriteLine(0);
        }
    }

    // Algorithm C time complexity: constant
    void AlgorithmC(int n) {
        for (int i = 0; i < 1000000; i++) {
            Console.WriteLine(0);
        }
    }

    /* Constant order */
    int Constant(int n) {
        int count = 0;
        int size = 100000;
        for (int i = 0; i < size; i++)
            count++;
        return count;
    }

    /* Linear order */
    int Linear(int n) {
        int count = 0;
        for (int i = 0; i < n; i++)
            count++;
        return count;
    }

    /* Linear order (traversing array) */
    int ArrayTraversal(int[] nums) {
        int count = 0;
        // Number of iterations is proportional to the array length
        foreach (int num in nums) {
            count++;
        }
        return count;
    }

    /* Exponential order */
    int Quadratic(int n) {
        int count = 0;
        // Number of iterations is quadratically related to the data size n
        for (int i = 0; i < n; i++) {
            for (int j = 0; j < n; j++) {
                count++;
            }
        }
        return count;
    }

    /* Quadratic order (bubble sort) */
    int BubbleSort(int[] nums) {
        int count = 0;  // Counter
        // Outer loop: unsorted range is [0, i]
        for (int i = nums.Length - 1; i > 0; i--) {
            // Inner loop: swap the largest element in the unsorted range [0, i] to the rightmost end of that range
            for (int j = 0; j < i; j++) {
                if (nums[j] > nums[j + 1]) {
                    // Swap nums[j] and nums[j + 1]
                    (nums[j + 1], nums[j]) = (nums[j], nums[j + 1]);
                    count += 3;  // Element swap includes 3 unit operations
                }
            }
        }
        return count;
    }

    /* Exponential order (loop implementation) */
    int Exponential(int n) {
        int count = 0, bas = 1;
        // Cells divide into two every round, forming sequence 1, 2, 4, 8, ..., 2^(n-1)
        for (int i = 0; i < n; i++) {
            for (int j = 0; j < bas; j++) {
                count++;
            }
            bas *= 2;
        }
        // count = 1 + 2 + 4 + 8 + .. + 2^(n-1) = 2^n - 1
        return count;
    }

    /* Exponential order (recursive implementation) */
    int ExpRecur(int n) {
        if (n == 1) return 1;
        return ExpRecur(n - 1) + ExpRecur(n - 1) + 1;
    }

    /* Logarithmic order (loop implementation) */
    int Logarithmic(int n) {
        int count = 0;
        while (n > 1) {
            n /= 2;
            count++;
        }
        return count;
    }

    /* Logarithmic order (recursive implementation) */
    int LogRecur(int n) {
        if (n <= 1) return 0;
        return LogRecur(n / 2) + 1;
    }

    /* Linearithmic order */
    int LinearLogRecur(int n) {
        if (n <= 1) return 1;
        int count = LinearLogRecur(n / 2) + LinearLogRecur(n / 2);
        for (int i = 0; i < n; i++) {
            count++;
        }
        return count;
    }

    /* Factorial order (recursive implementation) */
    int FactorialRecur(int n) {
        if (n == 0) return 1;
        int count = 0;
        // Split from 1 into n
        for (int i = 0; i < n; i++) {
            count += FactorialRecur(n - 1);
        }
        return count;
    }

    [Test]
    public void Test() {
        // You can modify n to run and observe the trend of the number of operations for various complexities
        int n = 8;
        Console.WriteLine("Input data size n = " + n);

        int count = Constant(n);
        Console.WriteLine("Constant order operation count = " + count);

        count = Linear(n);
        Console.WriteLine("Linear order operation count = " + count);
        count = ArrayTraversal(new int[n]);
        Console.WriteLine("Linear order (array traversal) operation count = " + count);

        count = Quadratic(n);
        Console.WriteLine("Quadratic order operation count = " + count);
        int[] nums = new int[n];
        for (int i = 0; i < n; i++)
            nums[i] = n - i;  // [n,n-1,...,2,1]
        count = BubbleSort(nums);
        Console.WriteLine("Quadratic order (bubble sort) operation count = " + count);

        count = Exponential(n);
        Console.WriteLine("Exponential order (loop implementation) operation count = " + count);
        count = ExpRecur(n);
        Console.WriteLine("Exponential order (recursive implementation) operation count = " + count);

        count = Logarithmic(n);
        Console.WriteLine("Logarithmic order (loop implementation) operation count = " + count);
        count = LogRecur(n);
        Console.WriteLine("Logarithmic order (recursive implementation) operation count = " + count);

        count = LinearLogRecur(n);
        Console.WriteLine("Linearithmic order (recursive implementation) operation count = " + count);

        count = FactorialRecur(n);
        Console.WriteLine("Factorial order (recursive implementation) operation count = " + count);
    }
}
