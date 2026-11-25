/**
 * File: time_complexity.java
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

package chapter_computational_complexity;

public class time_complexity {
    /* Constant time */
    static int constant(int n) {
        int count = 0;
        int size = 100000;
        for (int i = 0; i < size; i++)
            count++;
        return count;
    }

    /* Linear time */
    static int linear(int n) {
        int count = 0;
        for (int i = 0; i < n; i++)
            count++;
        return count;
    }

    /* Linear time (array traversal) */
    static int arrayTraversal(int[] nums) {
        int count = 0;
        // The iteration count is proportional to the array length
        for (int num : nums) {
            count++;
        }
        return count;
    }

    /* Quadratic time */
    static int quadratic(int n) {
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
    static int bubbleSort(int[] nums) {
        int count = 0; // Counter
        // Outer loop: the unsorted range is the closed interval [0, i]
        for (int i = nums.length - 1; i > 0; i--) {
            // Inner loop: swap adjacent elements to move the largest in [0, i] to index i
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

    /* Exponential time (iterative) */
    static int exponential(int n) {
        int count = 0, base = 1;
        // Each cell divides in two per round, giving 1, 2, 4, 8, ..., 2^(n-1)
        for (int i = 0; i < n; i++) {
            for (int j = 0; j < base; j++) {
                count++;
            }
            base *= 2;
        }
        // count = 1 + 2 + 4 + 8 + .. + 2^(n-1) = 2^n - 1
        return count;
    }

    /* Exponential time (recursive) */
    static int expRecur(int n) {
        if (n == 1)
            return 1;
        return expRecur(n - 1) + expRecur(n - 1) + 1;
    }

    /* Logarithmic time (iterative) */
    static int logarithmic(int n) {
        int count = 0;
        while (n > 1) {
            n = n / 2;
            count++;
        }
        return count;
    }

    /* Logarithmic time (recursive) */
    static int logRecur(int n) {
        if (n <= 1)
            return 0;
        return logRecur(n / 2) + 1;
    }

    /* Linearithmic time */
    static int linearLogRecur(int n) {
        if (n <= 1)
            return 1;
        int count = linearLogRecur(n / 2) + linearLogRecur(n / 2);
        for (int i = 0; i < n; i++) {
            count++;
        }
        return count;
    }

    /* Factorial time (recursive) */
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

    /* Driver Code */
    public static void main(String[] args) {
        // Try different values of n to see how the operation count grows for each complexity
        int n = 8;
        System.out.println("Input size n = " + n);

        int count = constant(n);
        System.out.println("Constant operation count = " + count);

        count = linear(n);
        System.out.println("Linear operation count = " + count);
        count = arrayTraversal(new int[n]);
        System.out.println("Linear operation count (array traversal) = " + count);

        count = quadratic(n);
        System.out.println("Quadratic operation count = " + count);
        int[] nums = new int[n];
        for (int i = 0; i < n; i++)
            nums[i] = n - i; // [n,n-1,...,2,1]
        count = bubbleSort(nums);
        System.out.println("Quadratic operation count (bubble sort) = " + count);

        count = exponential(n);
        System.out.println("Exponential operation count (iterative) = " + count);
        count = expRecur(n);
        System.out.println("Exponential operation count (recursive) = " + count);

        count = logarithmic(n);
        System.out.println("Logarithmic operation count (iterative) = " + count);
        count = logRecur(n);
        System.out.println("Logarithmic operation count (recursive) = " + count);

        count = linearLogRecur(n);
        System.out.println("Linearithmic operation count (recursive) = " + count);

        count = factorialRecur(n);
        System.out.println("Factorial operation count (recursive) = " + count);
    }
}
