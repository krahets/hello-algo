/**
 * File: max_capacity.java
 * Created Time: 2023-07-21
 * Author: krahets (krahets@163.com)
 */

package chapter_greedy;

public class max_capacity {
    /* Greedy maximum capacity algorithm */
    static int maxCapacity(int[] ht) {
        // Start i and j at opposite ends of the array
        int i = 0, j = ht.length - 1;
        // The initial maximum capacity is 0
        int res = 0;
        // Make greedy choices until the two pointers meet
        while (i < j) {
            // Update the maximum capacity
            int cap = Math.min(ht[i], ht[j]) * (j - i);
            res = Math.max(res, cap);
            // Move the pointer at the shorter board inward
            if (ht[i] < ht[j]) {
                i++;
            } else {
                j--;
            }
        }
        return res;
    }

    public static void main(String[] args) {
        int[] ht = { 3, 8, 5, 2, 7, 7, 3, 4 };

        // Greedy algorithm
        int res = maxCapacity(ht);
        System.out.println("The maximum capacity is " + res);
    }
}
