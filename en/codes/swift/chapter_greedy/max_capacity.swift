/**
 * File: max_capacity.swift
 * Created Time: 2023-09-03
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* Greedy maximum capacity algorithm */
func maxCapacity(ht: [Int]) -> Int {
    // Start i and j at opposite ends of the array
    var i = ht.startIndex, j = ht.endIndex - 1
    // The initial maximum capacity is 0
    var res = 0
    // Make greedy choices until the two pointers meet
    while i < j {
        // Update the maximum capacity
        let cap = min(ht[i], ht[j]) * (j - i)
        res = max(res, cap)
        // Move the pointer at the shorter board inward
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
    /* Driver code */
    static func main() {
        let ht = [3, 8, 5, 2, 7, 7, 3, 4]

        // Greedy algorithm
        let res = maxCapacity(ht: ht)
        print("The maximum capacity is \(res)")
    }
}
