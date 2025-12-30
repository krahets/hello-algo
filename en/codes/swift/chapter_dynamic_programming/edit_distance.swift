/**
 * File: edit_distance.swift
 * Created Time: 2023-07-16
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* Edit distance: Brute-force search */
func editDistanceDFS(s: String, t: String, i: Int, j: Int) -> Int {
    // If both s and t are empty, return 0
    if i == 0, j == 0 {
        return 0
    }
    // If s is empty, return length of t
    if i == 0 {
        return j
    }
    // If t is empty, return length of s
    if j == 0 {
        return i
    }
    // If two characters are equal, skip both characters
    if s.utf8CString[i - 1] == t.utf8CString[j - 1] {
        return editDistanceDFS(s: s, t: t, i: i - 1, j: j - 1)
    }
    // Minimum edit steps = minimum edit steps of insert, delete, replace + 1
    let insert = editDistanceDFS(s: s, t: t, i: i, j: j - 1)
    let delete = editDistanceDFS(s: s, t: t, i: i - 1, j: j)
    let replace = editDistanceDFS(s: s, t: t, i: i - 1, j: j - 1)
    // Return minimum edit steps
    return min(min(insert, delete), replace) + 1
}

/* Edit distance: Memoization search */
func editDistanceDFSMem(s: String, t: String, mem: inout [[Int]], i: Int, j: Int) -> Int {
    // If both s and t are empty, return 0
    if i == 0, j == 0 {
        return 0
    }
    // If s is empty, return length of t
    if i == 0 {
        return j
    }
    // If t is empty, return length of s
    if j == 0 {
        return i
    }
    // If there's a record, return it directly
    if mem[i][j] != -1 {
        return mem[i][j]
    }
    // If two characters are equal, skip both characters
    if s.utf8CString[i - 1] == t.utf8CString[j - 1] {
        return editDistanceDFS(s: s, t: t, i: i - 1, j: j - 1)
    }
    // Minimum edit steps = minimum edit steps of insert, delete, replace + 1
    let insert = editDistanceDFS(s: s, t: t, i: i, j: j - 1)
    let delete = editDistanceDFS(s: s, t: t, i: i - 1, j: j)
    let replace = editDistanceDFS(s: s, t: t, i: i - 1, j: j - 1)
    // Record and return minimum edit steps
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
    // State transition: rest of the rows and columns
    for i in 1 ... n {
        for j in 1 ... m {
            if s.utf8CString[i - 1] == t.utf8CString[j - 1] {
                // If two characters are equal, skip both characters
                dp[i][j] = dp[i - 1][j - 1]
            } else {
                // Minimum edit steps = minimum edit steps of insert, delete, replace + 1
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
    // State transition: rest of the rows
    for i in 1 ... n {
        // State transition: first column
        var leftup = dp[0] // Temporarily store dp[i-1, j-1]
        dp[0] = i
        // State transition: rest of the columns
        for j in 1 ... m {
            let temp = dp[j]
            if s.utf8CString[i - 1] == t.utf8CString[j - 1] {
                // If two characters are equal, skip both characters
                dp[j] = leftup
            } else {
                // Minimum edit steps = minimum edit steps of insert, delete, replace + 1
                dp[j] = min(min(dp[j - 1], dp[j]), leftup) + 1
            }
            leftup = temp // Update for next round's dp[i-1, j-1]
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

        // Brute-force search
        var res = editDistanceDFS(s: s, t: t, i: n, j: m)
        print("Changing \(s) to \(t) requires minimum \(res) edits")

        // Memoization search
        var mem = Array(repeating: Array(repeating: -1, count: m + 1), count: n + 1)
        res = editDistanceDFSMem(s: s, t: t, mem: &mem, i: n, j: m)
        print("Changing \(s) to \(t) requires minimum \(res) edits")

        // Dynamic programming
        res = editDistanceDP(s: s, t: t)
        print("Changing \(s) to \(t) requires minimum \(res) edits")

        // Space-optimized dynamic programming
        res = editDistanceDPComp(s: s, t: t)
        print("Changing \(s) to \(t) requires minimum \(res) edits")
    }
}
