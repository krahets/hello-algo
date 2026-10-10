/**
* File: max_capacity.cs
* Created Time: 2023-07-21
* Author: hpstory (hpstory1024@163.com)
*/

namespace hello_algo.chapter_greedy;

public class max_capacity {
    /* Max capacity: Greedy algorithm */
    int MaxCapacity(int[] ht) {
        // Initialize i, j to be at both ends of the array
        int i = 0, j = ht.Length - 1;
        // Initial max capacity is 0
        int res = 0;
        // Loop for greedy selection until the two boards meet
        while (i < j) {
            // Update max capacity
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
        Console.WriteLine("Maximum capacity is " + res);
    }
}