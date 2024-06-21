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
        // 迴圈次數與資料大小 n 成平方關係
        for (int i = 0; i < n; i++) {
            for (int j = 0; j < n; j++) {
                count++;
            }
        }
        return count;
    }

    /* 平方階（泡沫排序） */
    static int bubbleSort(int[] nums) {
        int count = 0; // 計數器
        // 外迴圈：未排序區間為 [0, i]
        for (int i = nums.length - 1; i > 0; i--) {
            // 內迴圈：將未排序區間 [0, i] 中的最大元素交換至該區間的最右端
            for (int j = 0; j < i; j++) {
                if (nums[j] > nums[j + 1]) {
                    // 交換 nums[j] 與 nums[j + 1]
                    int tmp = nums[j];
                    nums[j] = nums[j + 1];
                    nums[j + 1] = tmp;
                    count += 3; // 元素交換包含 3 個單元操作
                }
            }
        }
        return count;
    }

    /* 指數階（迴圈實現） */
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

    /* 指數階（遞迴實現） */
    static int expRecur(int n) {
        if (n == 1)
            return 1;
        return expRecur(n - 1) + expRecur(n - 1) + 1;
    }

    /* 對數階（迴圈實現） */
    static int logarithmic(int n) {
        int count = 0;
        while (n > 1) {
            n = n / 2;
            count++;
        }
        return count;
    }

    /* 對數階（遞迴實現） */
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

    /* 階乘階（遞迴實現） */
    static int factorialRecur(int n) {
        if (n == 0)
            return 1;
        int count = 0;
        // 從 1 個分裂出 n 個
        for (int i = 0; i < n; i++) {
            count += factorialRecur(n - 1);
        }
        return count;
    }

    /* Driver Code */
    public static void main(String[] args) {
        // 可以修改 n 執行，體會一下各種複雜度的操作數量變化趨勢
        int n = 8;
        System.out.println("輸入資料大小 n = " + n);

        int count = constant(n);
        System.out.println("常數階的操作數量 = " + count);

        count = linear(n);
        System.out.println("線性階的操作數量 = " + count);
        count = arrayTraversal(new int[n]);
        System.out.println("線性階（走訪陣列）的操作數量 = " + count);

        count = quadratic(n);
        System.out.println("平方階的操作數量 = " + count);
        int[] nums = new int[n];
        for (int i = 0; i < n; i++)
            nums[i] = n - i; // [n,n-1,...,2,1]
        count = bubbleSort(nums);
        System.out.println("平方階（泡沫排序）的操作數量 = " + count);

        count = exponential(n);
        System.out.println("指數階（迴圈實現）的操作數量 = " + count);
        count = expRecur(n);
        System.out.println("指數階（遞迴實現）的操作數量 = " + count);

        count = logarithmic(n);
        System.out.println("對數階（迴圈實現）的操作數量 = " + count);
        count = logRecur(n);
        System.out.println("對數階（遞迴實現）的操作數量 = " + count);

        count = linearLogRecur(n);
        System.out.println("線性對數階（遞迴實現）的操作數量 = " + count);

        count = factorialRecur(n);
        System.out.println("階乘階（遞迴實現）的操作數量 = " + count);
    }
}
