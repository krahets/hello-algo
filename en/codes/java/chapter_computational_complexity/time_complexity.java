/**
 * File: time_complexity.java
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

package chapter_computational_complexity;

public class time_complexity {
    /* Constant complexity */
    static int constant(int n) {
        int count = 0;
        int size = 100000;
        for (int i = 0; i < size; i++)
            count++;
        return count;
    }

    /* Linear complexity */
    static int linear(int n) {
        int count = 0;
        for (int i = 0; i < n; i++)
            count++;
        return count;
    }

    /* Linear complexity (array traversal) */
    static int arrayTraversal(int[] nums) {
        int count = 0;
        // The number of iterations is proportional to the array length
        for (int num : nums) {
            count++;
        }
        return count;
    }

    /* Quadratic complexity */
    static int quadratic(int n) {
        int count = 0;
        // The number of iterations is proportional to the square of the input size n
        for (int i = 0; i < n; i++) {
            for (int j = 0; j < n; j++) {
                count++;
            }
        }
        return count;
    }

    /* Quadratic complexity (bubble sort) */
    static int bubbleSort(int[] nums) {
        int count = 0; // Counter
        // Outer loop: the unsorted range is [0, i]
        for (int i = nums.length - 1; i > 0; i--) {
            // Inner loop: move the largest element in the unsorted range [0, i] to its right end through swaps
            for (int j = 0; j < i; j++) {
                if (nums[j] > nums[j + 1]) {
                    // Swap nums[j] and nums[j + 1]
                    int tmp = nums[j];
                    nums[j] = nums[j + 1];
                    nums[j + 1] = tmp;
                    count += 3; // Swapping two elements takes 3 elementary operations
                }
            }
        }
        return count;
    }

    /* Exponential complexity (iterative implementation) */
    static int exponential(int n) {
        int count = 0, base = 1;
        // Each cell divides into two per round, giving the sequence 1, 2, 4, 8, ..., 2^(n-1)
        for (int i = 0; i < n; i++) {
            for (int j = 0; j < base; j++) {
                count++;
            }
            base *= 2;
        }
        // count = 1 + 2 + 4 + 8 + .. + 2^(n-1) = 2^n - 1
        return count;
    }

    /* Exponential complexity (recursive implementation) */
    static int expRecur(int n) {
        if (n == 1)
            return 1;
        return expRecur(n - 1) + expRecur(n - 1) + 1;
    }

    /* Logarithmic complexity (iterative implementation) */
    static int logarithmic(int n) {
        int count = 0;
        while (n > 1) {
            n = n / 2;
            count++;
        }
        return count;
    }

    /* Logarithmic complexity (recursive implementation) */
    static int logRecur(int n) {
        if (n <= 1)
            return 0;
        return logRecur(n / 2) + 1;
    }

    /* Linearithmic complexity */
    static int linearLogRecur(int n) {
        if (n <= 1)
            return 1;
        int count = linearLogRecur(n / 2) + linearLogRecur(n / 2);
        for (int i = 0; i < n; i++) {
            count++;
        }
        return count;
    }

    /* Factorial complexity (recursive implementation) */
    static int factorialRecur(int n) {
        if (n == 0)
            return 1;
        int count = 0;
        // Split one problem into n subproblems
        for (int i = 0; i < n; i++) {
            count += factorialRecur(n - 1);
        }
        return count;
    }

    /* Driver code */
    public static void main(String[] args) {
        // Try different values of n to see how the operation count grows for each complexity
        int n = 8;
        System.out.println("Input size n = " + n);

        int count = constant(n);
        System.out.println("Operation count for constant complexity = " + count);

        count = linear(n);
        System.out.println("Operation count for linear complexity = " + count);
        count = arrayTraversal(new int[n]);
        System.out.println("Operation count for linear complexity (array traversal) = " + count);

        count = quadratic(n);
        System.out.println("Operation count for quadratic complexity = " + count);
        int[] nums = new int[n];
        for (int i = 0; i < n; i++)
            nums[i] = n - i; // [n,n-1,...,2,1]
        count = bubbleSort(nums);
        System.out.println("Operation count for quadratic complexity (bubble sort) = " + count);

        count = exponential(n);
        System.out.println("Operation count for exponential complexity (iterative implementation) = " + count);
        count = expRecur(n);
        System.out.println("Operation count for exponential complexity (recursive implementation) = " + count);

        count = logarithmic(n);
        System.out.println("Operation count for logarithmic complexity (iterative implementation) = " + count);
        count = logRecur(n);
        System.out.println("Operation count for logarithmic complexity (recursive implementation) = " + count);

        count = linearLogRecur(n);
        System.out.println("Operation count for linearithmic complexity (recursive implementation) = " + count);

        count = factorialRecur(n);
        System.out.println("Operation count for factorial complexity (recursive implementation) = " + count);
    }
}
