/**
 * File: edit_distance.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_dynamic_programming

import kotlin.math.min

/* Edit distance: Brute force search */
fun editDistanceDFS(
    s: String,
    t: String,
    i: Int,
    j: Int
): Int {
    // If both s and t are empty, return 0
    if (i == 0 && j == 0) return 0
    // If s is empty, return the length of t
    if (i == 0) return j
    // If t is empty, return the length of s
    if (j == 0) return i
    // If the two characters are equal, skip these two characters
    if (s[i - 1] == t[j - 1]) return editDistanceDFS(s, t, i - 1, j - 1)
    // The minimum number of edits = the minimum number of edits from three operations (insert, remove, replace) + 1
    val insert = editDistanceDFS(s, t, i, j - 1)
    val delete = editDistanceDFS(s, t, i - 1, j)
    val replace = editDistanceDFS(s, t, i - 1, j - 1)
    // Return the minimum number of edits
    return min(min(insert, delete), replace) + 1
}

/* Edit distance: Memoized search */
fun editDistanceDFSMem(
    s: String,
    t: String,
    mem: Array<IntArray>,
    i: Int,
    j: Int
): Int {
    // If both s and t are empty, return 0
    if (i == 0 && j == 0) return 0
    // If s is empty, return the length of t
    if (i == 0) return j
    // If t is empty, return the length of s
    if (j == 0) return i
    // If there is a record, return it
    if (mem[i][j] != -1) return mem[i][j]
    // If the two characters are equal, skip these two characters
    if (s[i - 1] == t[j - 1]) return editDistanceDFSMem(s, t, mem, i - 1, j - 1)
    // The minimum number of edits = the minimum number of edits from three operations (insert, remove, replace) + 1
    val insert = editDistanceDFSMem(s, t, mem, i, j - 1)
    val delete = editDistanceDFSMem(s, t, mem, i - 1, j)
    val replace = editDistanceDFSMem(s, t, mem, i - 1, j - 1)
    // Record and return the minimum number of edits
    mem[i][j] = min(min(insert, delete), replace) + 1
    return mem[i][j]
}

/* Edit distance: Dynamic programming */
fun editDistanceDP(s: String, t: String): Int {
    val n = s.length
    val m = t.length
    val dp = Array(n + 1) { IntArray(m + 1) }
    // State transition: first row and first column
    for (i in 1..n) {
        dp[i][0] = i
    }
    for (j in 1..m) {
        dp[0][j] = j
    }
    // State transition: the rest of the rows and columns
    for (i in 1..n) {
        for (j in 1..m) {
            if (s[i - 1] == t[j - 1]) {
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
fun editDistanceDPComp(s: String, t: String): Int {
    val n = s.length
    val m = t.length
    val dp = IntArray(m + 1)
    // State transition: first row
    for (j in 1..m) {
        dp[j] = j
    }
    // State transition: the rest of the rows
    for (i in 1..n) {
        // State transition: first column
        var leftup = dp[0] // Temporarily store dp[i-1, j-1]
        dp[0] = i
        // State transition: the rest of the columns
        for (j in 1..m) {
            val temp = dp[j]
            if (s[i - 1] == t[j - 1]) {
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

/* Driver Code */
fun main() {
    val s = "bag"
    val t = "pack"
    val n = s.length
    val m = t.length

    // Brute force search
    var res = editDistanceDFS(s, t, n, m)
    println("Minimum edits required to change $s to $t = $res")

    // Memoized search
    val mem = Array(n + 1) { IntArray(m + 1) }
    for (row in mem)
        row.fill(-1)
    res = editDistanceDFSMem(s, t, mem, n, m)
    println("Minimum edits required to change $s to $t = $res")

    // Dynamic programming
    res = editDistanceDP(s, t)
    println("Minimum edits required to change $s to $t = $res")

    // Space-optimized dynamic programming
    res = editDistanceDPComp(s, t)
    println("Minimum edits required to change $s to $t = $res")
}