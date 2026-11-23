/**
* File: max_capacity.cs
* Created Time: 2023-07-21
* Author: hpstory (hpstory1024@163.com)
*/

namespace hello_algo.chapter_greedy;

public class max_capacity {
    /* Maximum container capacity: greedy algorithm */
    int MaxCapacity(int[] ht) {
        // Initialize i and j at opposite ends of the array
        int i = 0, j = ht.Length - 1;
        // The initial maximum capacity is 0
        int res = 0;
        // Repeatedly make greedy choices until the two sides meet
        while (i < j) {
            // Update the maximum capacity
            int cap = Math.Min(ht[i], ht[j]) * (j - i);
            res = Math.Max(res, cap);
            // Move the shorter side inward
            if (ht[i] < ht[j]) {
                i++;
            } else {
                j--;
            }
        }
        return res;
    }

    [Test]
    public void Test() {
        int[] ht = [3, 8, 5, 2, 7, 7, 3, 4];

        // Greedy algorithm
        int res = MaxCapacity(ht);
        Console.WriteLine("Maximum container capacity: " + res);
    }
}