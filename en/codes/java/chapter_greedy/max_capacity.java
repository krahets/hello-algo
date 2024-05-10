/**
 * File: max_capacity.java
 * Created Time: 2023-07-21
 * Author: krahets (krahets@163.com)
 */

package chapter_greedy;

public class max_capacity {
    /* Maximum capacity: Greedy */
    static int maxCapacity(int[] ht) {
        // Initialize i, j, making them split the array at both ends
        int i = 0, j = ht.length - 1;
        // Initial maximum capacity is 0
        int res = 0;
        // Loop for greedy selection until the two boards meet
        while (i < j) {
            // Update maximum capacity
            int cap = Math.min(ht[i], ht[j]) * (j - i);
            res = Math.max(res, cap);
            // Move the shorter board inward
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
