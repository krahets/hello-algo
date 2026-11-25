/**
 * File: time_complexity.java
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

package chapter_computational_complexity;

public class time_complexity {
    /* 常數階 */
    static int constant(int n) {
        int count = 0;
        int size = 100000;
        for (int i = 0; i < size; i++)
            count++;
        return count;
    }

    /* 線性階 */
    static int linear(int n) {
        int count = 0;
        for (int i = 0; i < n; i++)
            count++;
        return count;
    }

    /* 線性階（走訪陣列） */
    static int arrayTraversal(int[] nums) {
        int count = 0;
        // 迴圈次數與陣列長度成正比
        for (int num : nums) {
            count++;
        }
        return count;
    }

    /* 平方階 */
    static int quadratic(int n) {
        int count = 0;
        // 迴圈次數正比於資料大小 n 的平方
        for (int i = 0; i < n; i++) {
            for (int j = 0; j < n; j++) {
                count++;
            }
        }
        return count;
    }

    /* 平方階（氣泡排序） */
    static int bubbleSort(int[] nums) {
        int count = 0; // 計數器
        // 外層迴圈：未排序區間為 [0, i]
        for (int i = nums.length - 1; i > 0; i--) {
            // 內層迴圈：藉由交換，將未排序區間 [0, i] 的最大元素移至最右端
            for (int j = 0; j < i; j++) {
                if (nums[j] > nums[j + 1]) {
                    // 交換 nums[j] 與 nums[j + 1]
                    int tmp = nums[j];
                    nums[j] = nums[j + 1];
                    nums[j + 1] = tmp;
                    count += 3; // 交換元素需 3 個基本操作
                }
            }
        }
        return count;
    }

    /* 指數階（迴圈實作） */
    static int exponential(int n) {
        int count = 0, base = 1;
        // 細胞每輪一分為二，形成數列 1, 2, 4, 8, ..., 2^(n-1)
        for (int i = 0; i < n; i++) {
            for (int j = 0; j < base; j++) {
                count++;
            }
            base *= 2;
        }
        // count = 1 + 2 + 4 + 8 + .. + 2^(n-1) = 2^n - 1
        return count;
    }

    /* 指數階（遞迴實作） */
    static int expRecur(int n) {
        if (n == 1)
            return 1;
        return expRecur(n - 1) + expRecur(n - 1) + 1;
    }

    /* 對數階（迴圈實作） */
    static int logarithmic(int n) {
        int count = 0;
        while (n > 1) {
            n = n / 2;
            count++;
        }
        return count;
    }

    /* 對數階（遞迴實作） */
    static int logRecur(int n) {
        if (n <= 1)
            return 0;
        return logRecur(n / 2) + 1;
    }

    /* 線性對數階 */
    static int linearLogRecur(int n) {
        if (n <= 1)
            return 1;
        int count = linearLogRecur(n / 2) + linearLogRecur(n / 2);
        for (int i = 0; i < n; i++) {
            count++;
        }
        return count;
    }

    /* 階乘階（遞迴實作） */
    static int factorialRecur(int n) {
        if (n == 0)
            return 1;
        int count = 0;
        // 1 個呼叫分為 n 個
        for (int i = 0; i < n; i++) {
            count += factorialRecur(n - 1);
        }
        return count;
    }

    /* 主程式 */
    public static void main(String[] args) {
        // 試著修改 n 再執行，觀察各種複雜度的操作次數如何變化
        int n = 8;
        System.out.println("輸入規模 n = " + n);

        int count = constant(n);
        System.out.println("常數階的操作次數 = " + count);

        count = linear(n);
        System.out.println("線性階的操作次數 = " + count);
        count = arrayTraversal(new int[n]);
        System.out.println("線性階（走訪陣列）的操作次數 = " + count);

        count = quadratic(n);
        System.out.println("平方階的操作次數 = " + count);
        int[] nums = new int[n];
        for (int i = 0; i < n; i++)
            nums[i] = n - i; // [n,n-1,...,2,1]
        count = bubbleSort(nums);
        System.out.println("平方階（氣泡排序）的操作次數 = " + count);

        count = exponential(n);
        System.out.println("指數階（迴圈實作）的操作次數 = " + count);
        count = expRecur(n);
        System.out.println("指數階（遞迴實作）的操作次數 = " + count);

        count = logarithmic(n);
        System.out.println("對數階（迴圈實作）的操作次數 = " + count);
        count = logRecur(n);
        System.out.println("對數階（遞迴實作）的操作次數 = " + count);

        count = linearLogRecur(n);
        System.out.println("線性對數階（遞迴實作）的操作次數 = " + count);

        count = factorialRecur(n);
        System.out.println("階乘階（遞迴實作）的操作次數 = " + count);
    }
}
