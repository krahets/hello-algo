/**
 * File: time_complexity.cs
 * Created Time: 2022-12-23
 * Author: haptear (haptear@hotmail.com)
 */

namespace hello_algo.chapter_computational_complexity;

public class time_complexity {
    void Algorithm(int n) {
        int a = 1;  // +0 (rule 1)
        a += n;  // +0 (rule 1)
        // +n (rule 2)
        for (int i = 0; i < 5 * n + 1; i++) {
            Console.WriteLine(0);
        }
        // +n*n (rule 3)
        for (int i = 0; i < 2 * n; i++) {
            for (int j = 0; j < n + 1; j++) {
                Console.WriteLine(0);
            }
        }
    }

    // Time complexity of algorithm A: constant
    void AlgorithmA(int n) {
        Console.WriteLine(0);
    }

    // Time complexity of algorithm B: linear
    void AlgorithmB(int n) {
        for (int i = 0; i < n; i++) {
            Console.WriteLine(0);
        }
    }

    // Time complexity of algorithm C: constant
    void AlgorithmC(int n) {
        for (int i = 0; i < 1000000; i++) {
            Console.WriteLine(0);
        }
    }

    /* Constant time */
    int Constant(int n) {
        int count = 0;
        int size = 100000;
        for (int i = 0; i < size; i++)
            count++;
        return count;
    }

    /* Linear time */
    int Linear(int n) {
        int count = 0;
        for (int i = 0; i < n; i++)
            count++;
        return count;
    }

    /* Linear time (array traversal) */
    int ArrayTraversal(int[] nums) {
        int count = 0;
        // The iteration count is proportional to the array length
        foreach (int num in nums) {
            count++;
        }
        return count;
    }

    /* Quadratic time */
    int Quadratic(int n) {
        int count = 0;
        // The iteration count grows quadratically with input size n
        for (int i = 0; i < n; i++) {
            for (int j = 0; j < n; j++) {
                count++;
            }
        }
        return count;
    }

    /* Quadratic time (bubble sort) */
    int BubbleSort(int[] nums) {
        int count = 0;  // Counter
        // Outer loop: the unsorted range is the closed interval [0, i]
        for (int i = nums.Length - 1; i > 0; i--) {
            // Inner loop: swap adjacent elements to move the largest in [0, i] to index i
            for (int j = 0; j < i; j++) {
                if (nums[j] > nums[j + 1]) {
                    // Swap nums[j] and nums[j + 1]
                    (nums[j + 1], nums[j]) = (nums[j], nums[j + 1]);
                    count += 3;  // Swapping two elements takes 3 elementary operations
                }
            }
        }
        return count;
    }

    /* Exponential time (iterative) */
    int Exponential(int n) {
        int count = 0, bas = 1;
        // Each cell divides in two per round, giving 1, 2, 4, 8, ..., 2^(n-1)
        for (int i = 0; i < n; i++) {
            for (int j = 0; j < bas; j++) {
                count++;
            }
            bas *= 2;
        }
        // count = 1 + 2 + 4 + 8 + .. + 2^(n-1) = 2^n - 1
        return count;
    }

    /* Exponential time (recursive) */
    int ExpRecur(int n) {
        if (n == 1) return 1;
        return ExpRecur(n - 1) + ExpRecur(n - 1) + 1;
    }

    /* Logarithmic time (iterative) */
    int Logarithmic(int n) {
        int count = 0;
        while (n > 1) {
            n /= 2;
            count++;
        }
        return count;
    }

    /* Logarithmic time (recursive) */
    int LogRecur(int n) {
        if (n <= 1) return 0;
        return LogRecur(n / 2) + 1;
    }

    /* Linearithmic time */
    int LinearLogRecur(int n) {
        if (n <= 1) return 1;
        int count = LinearLogRecur(n / 2) + LinearLogRecur(n / 2);
        for (int i = 0; i < n; i++) {
            count++;
        }
        return count;
    }

    /* Factorial time (recursive) */
    int FactorialRecur(int n) {
        if (n == 0) return 1;
        int count = 0;
        // Split one problem into n subproblems
        for (int i = 0; i < n; i++) {
            count += FactorialRecur(n - 1);
        }
        return count;
    }

    [Test]
    public void Test() {
        // Try different values of n to see how the operation count grows for each complexity
        int n = 8;
        Console.WriteLine("Input size n = " + n);

        int count = Constant(n);
        Console.WriteLine("Constant operation count = " + count);

        count = Linear(n);
        Console.WriteLine("Linear operation count = " + count);
        count = ArrayTraversal(new int[n]);
        Console.WriteLine("Linear operation count (array traversal) = " + count);

        count = Quadratic(n);
        Console.WriteLine("Quadratic operation count = " + count);
        int[] nums = new int[n];
        for (int i = 0; i < n; i++)
            nums[i] = n - i;  // [n,n-1,...,2,1]
        count = BubbleSort(nums);
        Console.WriteLine("Quadratic operation count (bubble sort) = " + count);

        count = Exponential(n);
        Console.WriteLine("Exponential operation count (iterative) = " + count);
        count = ExpRecur(n);
        Console.WriteLine("Exponential operation count (recursive) = " + count);

        count = Logarithmic(n);
        Console.WriteLine("Logarithmic operation count (iterative) = " + count);
        count = LogRecur(n);
        Console.WriteLine("Logarithmic operation count (recursive) = " + count);

        count = LinearLogRecur(n);
        Console.WriteLine("Linearithmic operation count (recursive) = " + count);

        count = FactorialRecur(n);
        Console.WriteLine("Factorial operation count (recursive) = " + count);
    }
}
