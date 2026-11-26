/**
 * File: edit_distance.swift
 * Created Time: 2023-07-16
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* Edit distance with brute-force search */
func editDistanceDFS(s: String, t: String, i: Int, j: Int) -> Int {
    // Return 0 if both s and t are empty
    if i == 0, j == 0 {
        return 0
    }
    // Return the length of t if s is empty
    if i == 0 {
        return j
    }
    // Return the length of s if t is empty
    if j == 0 {
        return i
    }
    // Skip both characters if they match
    if s.utf8CString[i - 1] == t.utf8CString[j - 1] {
        return editDistanceDFS(s: s, t: t, i: i - 1, j: j - 1)
    }
    // Minimum edits = 1 + the smallest remaining edit count after an insertion, deletion, or replacement
    let insert = editDistanceDFS(s: s, t: t, i: i, j: j - 1)
    let delete = editDistanceDFS(s: s, t: t, i: i - 1, j: j)
    let replace = editDistanceDFS(s: s, t: t, i: i - 1, j: j - 1)
    // Return the minimum number of edits
    return min(min(insert, delete), replace) + 1
}

/* Edit distance with memoized search */
func editDistanceDFSMem(s: String, t: String, mem: inout [[Int]], i: Int, j: Int) -> Int {
    // Return 0 if both s and t are empty
    if i == 0, j == 0 {
        return 0
    }
    // Return the length of t if s is empty
    if i == 0 {
        return j
    }
    // Return the length of s if t is empty
    if j == 0 {
        return i
    }
    // Return the cached result if available
    if mem[i][j] != -1 {
        return mem[i][j]
    }
    // Skip both characters if they match
    if s.utf8CString[i - 1] == t.utf8CString[j - 1] {
        return editDistanceDFS(s: s, t: t, i: i - 1, j: j - 1)
    }
    // Minimum edits = 1 + the smallest remaining edit count after an insertion, deletion, or replacement
    let insert = editDistanceDFS(s: s, t: t, i: i, j: j - 1)
    let delete = editDistanceDFS(s: s, t: t, i: i - 1, j: j)
    let replace = editDistanceDFS(s: s, t: t, i: i - 1, j: j - 1)
    // Cache and return the minimum number of edits
    mem[i][j] = min(min(insert, delete), replace) + 1
    return mem[i][j]
}

/* Edit distance with dynamic programming */
func editDistanceDP(s: String, t: String) -> Int {
    let n = s.utf8CString.count
    let m = t.utf8CString.count
    var dp = Array(repeating: Array(repeating: 0, count: m + 1), count: n + 1)
    // State transitions for the first row and column
    for i in 1 ... n {
        dp[i][0] = i
    }
    for j in 1 ... m {
        dp[0][j] = j
    }
    // State transitions for the remaining rows and columns
    for i in 1 ... n {
        for j in 1 ... m {
            if s.utf8CString[i - 1] == t.utf8CString[j - 1] {
                // Skip both characters if they match
                dp[i][j] = dp[i - 1][j - 1]
            } else {
                // Minimum edits = 1 + the smallest remaining edit count after an insertion, deletion, or replacement
                dp[i][j] = min(min(dp[i][j - 1], dp[i - 1][j]), dp[i - 1][j - 1]) + 1
            }
        }
    }
    return dp[n][m]
}

/* Edit distance with space-optimized dynamic programming */
func editDistanceDPComp(s: String, t: String) -> Int {
    let n = s.utf8CString.count
    let m = t.utf8CString.count
    var dp = Array(repeating: 0, count: m + 1)
    // State transitions for the first row
    for j in 1 ... m {
        dp[j] = j
    }
    // State transitions for the remaining rows
    for i in 1 ... n {
        // State transitions for the first column
        var leftup = dp[0] // Save dp[i-1, j-1] temporarily
        dp[0] = i
        // State transitions for the remaining columns
        for j in 1 ... m {
            let temp = dp[j]
            if s.utf8CString[i - 1] == t.utf8CString[j - 1] {
                // Skip both characters if they match
                dp[j] = leftup
            } else {
                // Minimum edits = 1 + the smallest remaining edit count after an insertion, deletion, or replacement
                dp[j] = min(min(dp[j - 1], dp[j]), leftup) + 1
            }
            leftup = temp // Update the saved value to hold dp[i-1, j-1] for the next iteration
        }
    }
    return dp[m]
}

@main
enum EditDistance {
    /* Driver code */
    static func main() {
        let s = "bag"
        let t = "pack"
        let n = s.utf8CString.count
        let m = t.utf8CString.count

        // Brute-force search
        var res = editDistanceDFS(s: s, t: t, i: n, j: m)
        print("Changing \(s) to \(t) requires at least \(res) edits")

        // Memoized search
        var mem = Array(repeating: Array(repeating: -1, count: m + 1), count: n + 1)
        res = editDistanceDFSMem(s: s, t: t, mem: &mem, i: n, j: m)
        print("Changing \(s) to \(t) requires at least \(res) edits")

        // Dynamic programming
        res = editDistanceDP(s: s, t: t)
        print("Changing \(s) to \(t) requires at least \(res) edits")

        // Space-optimized dynamic programming
        res = editDistanceDPComp(s: s, t: t)
        print("Changing \(s) to \(t) requires at least \(res) edits")
    }
}
