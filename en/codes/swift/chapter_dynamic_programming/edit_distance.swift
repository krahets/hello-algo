/**
 * File: edit_distance.swift
 * Created Time: 2023-07-16
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* Edit distance: Brute force search */
func editDistanceDFS(s: String, t: String, i: Int, j: Int) -> Int {
    // If both s and t are empty, return 0
    if i == 0, j == 0 {
        return 0
    }
    // If s is empty, return the length of t
    if i == 0 {
        return j
    }
    // If t is empty, return the length of s
    if j == 0 {
        return i
    }
    // If the two characters are equal, skip these two characters
    if s.utf8CString[i - 1] == t.utf8CString[j - 1] {
        return editDistanceDFS(s: s, t: t, i: i - 1, j: j - 1)
    }
    // The minimum number of edits = the minimum number of edits from three operations (insert, remove, replace) + 1
    let insert = editDistanceDFS(s: s, t: t, i: i, j: j - 1)
    let delete = editDistanceDFS(s: s, t: t, i: i - 1, j: j)
    let replace = editDistanceDFS(s: s, t: t, i: i - 1, j: j - 1)
    // Return the minimum number of edits
    return min(min(insert, delete), replace) + 1
}

/* Edit distance: Memoized search */
func editDistanceDFSMem(s: String, t: String, mem: inout [[Int]], i: Int, j: Int) -> Int {
    // If both s and t are empty, return 0
    if i == 0, j == 0 {
        return 0
    }
    // If s is empty, return the length of t
    if i == 0 {
        return j
    }
    // If t is empty, return the length of s
    if j == 0 {
        return i
    }
    // If there is a record, return it
    if mem[i][j] != -1 {
        return mem[i][j]
    }
    // If the two characters are equal, skip these two characters
    if s.utf8CString[i - 1] == t.utf8CString[j - 1] {
        return editDistanceDFS(s: s, t: t, i: i - 1, j: j - 1)
    }
    // The minimum number of edits = the minimum number of edits from three operations (insert, remove, replace) + 1
    let insert = editDistanceDFS(s: s, t: t, i: i, j: j - 1)
    let delete = editDistanceDFS(s: s, t: t, i: i - 1, j: j)
    let replace = editDistanceDFS(s: s, t: t, i: i - 1, j: j - 1)
    // Record and return the minimum number of edits
    mem[i][j] = min(min(insert, delete), replace) + 1
    return mem[i][j]
}

/* Edit distance: Dynamic programming */
func editDistanceDP(s: String, t: String) -> Int {
    let n = s.utf8CString.count
    let m = t.utf8CString.count
    var dp = Array(repeating: Array(repeating: 0, count: m + 1), count: n + 1)
    // State transition: first row and first column
    for i in 1 ... n {
        dp[i][0] = i
    }
    for j in 1 ... m {
        dp[0][j] = j
    }
    // State transition: the rest of the rows and columns
    for i in 1 ... n {
        for j in 1 ... m {
            if s.utf8CString[i - 1] == t.utf8CString[j - 1] {
                // If the two characters are equal, skip these two characters
                dp[i][j] = dp[i - 1][j - 1]
            } else {
                // The minimum number of edits = the minimum number of edits from three operations (insert, remove, replace) + 1
                dp[i][j] = min(min(dp[i][j - 1], dp[i - 1][j]), dp[i - 1][j - 1]) + 1
            }
        }
    }
    return dp[n][m]
}

/* Edit distance: Space-optimized dynamic programming */
func editDistanceDPComp(s: String, t: String) -> Int {
    let n = s.utf8CString.count
    let m = t.utf8CString.count
    var dp = Array(repeating: 0, count: m + 1)
    // State transition: first row
    for j in 1 ... m {
        dp[j] = j
    }
    // State transition: the rest of the rows
    for i in 1 ... n {
        // State transition: first column
        var leftup = dp[0] // Temporarily store dp[i-1, j-1]
        dp[0] = i
        // State transition: the rest of the columns
        for j in 1 ... m {
            let temp = dp[j]
            if s.utf8CString[i - 1] == t.utf8CString[j - 1] {
                // If the two characters are equal, skip these two characters
                dp[j] = leftup
            } else {
                // The minimum number of edits = the minimum number of edits from three operations (insert, remove, replace) + 1
                dp[j] = min(min(dp[j - 1], dp[j]), leftup) + 1
            }
            leftup = temp // Update for the next round of dp[i-1, j-1]
        }
    }
    return dp[m]
}

@main
enum EditDistance {
    /* Driver Code */
    static func main() {
        let s = "bag"
        let t = "pack"
        let n = s.utf8CString.count
        let m = t.utf8CString.count

        // Brute force search
        var res = editDistanceDFS(s: s, t: t, i: n, j: m)
        print("Minimum number of edits required to change \(s) to \(t) = \(res)")

        // Memoized search
        var mem = Array(repeating: Array(repeating: -1, count: m + 1), count: n + 1)
        res = editDistanceDFSMem(s: s, t: t, mem: &mem, i: n, j: m)
        print("Minimum number of edits required to change \(s) to \(t) = \(res)")

        // Dynamic programming
        res = editDistanceDP(s: s, t: t)
        print("Minimum number of edits required to change \(s) to \(t) = \(res)")

        // Space-optimized dynamic programming
        res = editDistanceDPComp(s: s, t: t)
        print("Minimum number of edits required to change \(s) to \(t) = \(res)")
    }
}
