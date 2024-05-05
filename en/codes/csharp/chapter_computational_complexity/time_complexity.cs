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

    // Algorithm A time complexity: constant complexity
    void AlgorithmA(int n) {
        Console.WriteLine(0);
    }

    // Algorithm B time complexity: linear complexity
    void AlgorithmB(int n) {
        for (int i = 0; i < n; i++) {
            Console.WriteLine(0);
        }
    }

    // Algorithm C time complexity: constant complexity
    void AlgorithmC(int n) {
        for (int i = 0; i < 1000000; i++) {
            Console.WriteLine(0);
        }
    }

    /* Constant complexity */
    int Constant(int n) {
        int count = 0;
        int size = 100000;
        for (int i = 0; i < size; i++)
            count++;
        return count;
    }

    /* Linear complexity */
    int Linear(int n) {
        int count = 0;
        for (int i = 0; i < n; i++)
            count++;
        return count;
    }

    /* Linear complexity (traversing an array) */
    int ArrayTraversal(int[] nums) {
        int count = 0;
        // Loop count is proportional to the length of the array
        foreach (int num in nums) {
            count++;
        }
        return count;
    }

    /* Quadratic complexity */
    int Quadratic(int n) {
        int count = 0;
        // Loop count is squared in relation to the data size n
        for (int i = 0; i < n; i++) {
            for (int j = 0; j < n; j++) {
                count++;
            }
        }
        return count;
    }

    /* Quadratic complexity (bubble sort) */
    int BubbleSort(int[] nums) {
        int count = 0;  // Counter
        // Outer loop: unsorted range is [0, i]
        for (int i = nums.Length - 1; i > 0; i--) {
            // Inner loop: swap the largest element in the unsorted range [0, i] to the right end of the range
            for (int j = 0; j < i; j++) {
                if (nums[j] > nums[j + 1]) {
                    // Swap nums[j] and nums[j + 1]
                    (nums[j + 1], nums[j]) = (nums[j], nums[j + 1]);
                    count += 3;  // Element swap includes 3 individual operations
                }
            }
        }
        return count;
    }

    /* Exponential complexity (loop implementation) */
    int Exponential(int n) {
        int count = 0, bas = 1;
        // Cells split into two every round, forming the sequence 1, 2, 4, 8, ..., 2^(n-1)
        for (int i = 0; i < n; i++) {
            for (int j = 0; j < bas; j++) {
                count++;
            }
            bas *= 2;
        }
        // count = 1 + 2 + 4 + 8 + .. + 2^(n-1) = 2^n - 1
        return count;
    }

    /* Exponential complexity (recursive implementation) */
    int ExpRecur(int n) {
        if (n == 1) return 1;
        return ExpRecur(n - 1) + ExpRecur(n - 1) + 1;
    }

    /* Logarithmic complexity (loop implementation) */
    int Logarithmic(int n) {
        int count = 0;
        while (n > 1) {
            n /= 2;
            count++;
        }
        return count;
    }

    /* Logarithmic complexity (recursive implementation) */
    int LogRecur(int n) {
        if (n <= 1) return 0;
        return LogRecur(n / 2) + 1;
    }

    /* Linear logarithmic complexity */
    int LinearLogRecur(int n) {
        if (n <= 1) return 1;
        int count = LinearLogRecur(n / 2) + LinearLogRecur(n / 2);
        for (int i = 0; i < n; i++) {
            count++;
        }
        return count;
    }

    /* Factorial complexity (recursive implementation) */
    int FactorialRecur(int n) {
        if (n == 0) return 1;
        int count = 0;
        // From 1 split into n
        for (int i = 0; i < n; i++) {
            count += FactorialRecur(n - 1);
        }
        return count;
    }

    [Test]
    public void Test() {
        // Can modify n to experience the trend of operation count changes under various complexities
        int n = 8;
        Console.WriteLine("Input data size n =" + n);

        int count = Constant(n);
        Console.WriteLine("Number of constant complexity operations =" + count);

        count = Linear(n);
        Console.WriteLine("Number of linear complexity operations =" + count);
        count = ArrayTraversal(new int[n]);
        Console.WriteLine("Number of linear complexity operations (traversing the array) =" + count);

        count = Quadratic(n);
        Console.WriteLine("Number of quadratic order operations =" + count);
        int[] nums = new int[n];
        for (int i = 0; i < n; i++)
            nums[i] = n - i;  // [n,n-1,...,2,1]
        count = BubbleSort(nums);
        Console.WriteLine("Number of quadratic order operations (bubble sort) =" + count);

        count = Exponential(n);
        Console.WriteLine("Number of exponential complexity operations (implemented by loop) =" + count);
        count = ExpRecur(n);
        Console.WriteLine("Number of exponential complexity operations (implemented by recursion) =" + count);

        count = Logarithmic(n);
        Console.WriteLine("Number of logarithmic complexity operations (implemented by loop) =" + count);
        count = LogRecur(n);
        Console.WriteLine("Number of logarithmic complexity operations (implemented by recursion) =" + count);

        count = LinearLogRecur(n);
        Console.WriteLine("Number of linear logarithmic complexity operations (implemented by recursion) =" + count);

        count = FactorialRecur(n);
        Console.WriteLine("Number of factorial complexity operations (implemented by recursion) =" + count);
    }
}
