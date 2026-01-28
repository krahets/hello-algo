/**
 * File: max_capacity.swift
 * Created Time: 2023-09-03
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* Max capacity: Greedy algorithm */
func maxCapacity(ht: [Int]) -> Int {
    // Initialize i, j to be at both ends of the array
    var i = ht.startIndex, j = ht.endIndex - 1
    // Initial max capacity is 0
    var res = 0
    // Loop for greedy selection until the two boards meet
    while i < j {
        // Update max capacity
        let cap = min(ht[i], ht[j]) * (j - i)
        res = max(res, cap)
        // Move the shorter board inward
        if ht[i] < ht[j] {
            i += 1
        } else {
            j -= 1
        }
    }
    return res
}

@main
enum MaxCapacity {
    /* Driver Code */
    static func main() {
        let ht = [3, 8, 5, 2, 7, 7, 3, 4]

        // Greedy algorithm
        let res = maxCapacity(ht: ht)
        print("Maximum capacity is \(res)")
    }
}
