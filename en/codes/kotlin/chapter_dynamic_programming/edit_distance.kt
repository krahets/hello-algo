/**
 * File: edit_distance.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_dynamic_programming

import kotlin.math.min

/* Edit distance: Brute-force search */
fun editDistanceDFS(
    s: String,
    t: String,
    i: Int,
    j: Int
): Int {
    // If both s and t are empty, return 0
    if (i == 0 && j == 0) return 0
    // If s is empty, return length of t
    if (i == 0) return j
    // If t is empty, return length of s
    if (j == 0) return i
    // If two characters are equal, skip both characters
    if (s[i - 1] == t[j - 1]) return editDistanceDFS(s, t, i - 1, j - 1)
    // Minimum edit steps = minimum edit steps of insert, delete, replace + 1
    val insert = editDistanceDFS(s, t, i, j - 1)
    val delete = editDistanceDFS(s, t, i - 1, j)
    val replace = editDistanceDFS(s, t, i - 1, j - 1)
    // Return minimum edit steps
    return min(min(insert, delete), replace) + 1
}

/* Edit distance: Memoization search */
fun editDistanceDFSMem(
    s: String,
    t: String,
    mem: Array<IntArray>,
    i: Int,
    j: Int
): Int {
    // If both s and t are empty, return 0
    if (i == 0 && j == 0) return 0
    // If s is empty, return length of t
    if (i == 0) return j
    // If t is empty, return length of s
    if (j == 0) return i
    // If there's a record, return it directly
    if (mem[i][j] != -1) return mem[i][j]
    // If two characters are equal, skip both characters
    if (s[i - 1] == t[j - 1]) return editDistanceDFSMem(s, t, mem, i - 1, j - 1)
    // Minimum edit steps = minimum edit steps of insert, delete, replace + 1
    val insert = editDistanceDFSMem(s, t, mem, i, j - 1)
    val delete = editDistanceDFSMem(s, t, mem, i - 1, j)
    val replace = editDistanceDFSMem(s, t, mem, i - 1, j - 1)
    // Record and return minimum edit steps
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
    // State transition: rest of the rows and columns
    for (i in 1..n) {
        for (j in 1..m) {
            if (s[i - 1] == t[j - 1]) {
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
fun editDistanceDPComp(s: String, t: String): Int {
    val n = s.length
    val m = t.length
    val dp = IntArray(m + 1)
    // State transition: first row
    for (j in 1..m) {
        dp[j] = j
    }
    // State transition: rest of the rows
    for (i in 1..n) {
        // State transition: first column
        var leftup = dp[0] // Temporarily store dp[i-1, j-1]
        dp[0] = i
        // State transition: rest of the columns
        for (j in 1..m) {
            val temp = dp[j]
            if (s[i - 1] == t[j - 1]) {
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

/* Driver Code */
fun main() {
    val s = "bag"
    val t = "pack"
    val n = s.length
    val m = t.length

    // Brute-force search
    var res = editDistanceDFS(s, t, n, m)
    println("Changing $s to $t requires minimum $res edits")

    // Memoization search
    val mem = Array(n + 1) { IntArray(m + 1) }
    for (row in mem)
        row.fill(-1)
    res = editDistanceDFSMem(s, t, mem, n, m)
    println("Changing $s to $t requires minimum $res edits")

    // Dynamic programming
    res = editDistanceDP(s, t)
    println("Changing $s to $t requires minimum $res edits")

    // Space-optimized dynamic programming
    res = editDistanceDPComp(s, t)
    println("Changing $s to $t requires minimum $res edits")
}