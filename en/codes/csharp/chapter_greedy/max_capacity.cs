/**
* File: max_capacity.cs
* Created Time: 2023-07-21
* Author: hpstory (hpstory1024@163.com)
*/

namespace hello_algo.chapter_greedy;

public class max_capacity {
    /* Maximum capacity: Greedy */
    int MaxCapacity(int[] ht) {
        // Initialize i, j, making them split the array at both ends
        int i = 0, j = ht.Length - 1;
        // Initial maximum capacity is 0
        int res = 0;
        // Loop for greedy selection until the two boards meet
        while (i < j) {
            // Update maximum capacity
            int cap = Math.Min(ht[i], ht[j]) * (j - i);
            res = Math.Max(res, cap);
            // Move the shorter board inward
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
        Console.WriteLine("The maximum capacity is" + res);
    }
}