/**
 * File: edit_distance.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_dynamic_programming

import kotlin.math.min

/* Edit distance with brute-force search */
fun editDistanceDFS(
    s: String,
    t: String,
    i: Int,
    j: Int
): Int {
    // Return 0 if both s and t are empty
    if (i == 0 && j == 0) return 0
    // Return the length of t if s is empty
    if (i == 0) return j
    // Return the length of s if t is empty
    if (j == 0) return i
    // Skip both characters if they match
    if (s[i - 1] == t[j - 1]) return editDistanceDFS(s, t, i - 1, j - 1)
    // Minimum edits = 1 + the smallest remaining edit count after an insertion, deletion, or replacement
    val insert = editDistanceDFS(s, t, i, j - 1)
    val delete = editDistanceDFS(s, t, i - 1, j)
    val replace = editDistanceDFS(s, t, i - 1, j - 1)
    // Return the minimum number of edits
    return min(min(insert, delete), replace) + 1
}

/* Edit distance with memoized search */
fun editDistanceDFSMem(
    s: String,
    t: String,
    mem: Array<IntArray>,
    i: Int,
    j: Int
): Int {
    // Return 0 if both s and t are empty
    if (i == 0 && j == 0) return 0
    // Return the length of t if s is empty
    if (i == 0) return j
    // Return the length of s if t is empty
    if (j == 0) return i
    // Return the cached result if available
    if (mem[i][j] != -1) return mem[i][j]
    // Skip both characters if they match
    if (s[i - 1] == t[j - 1]) return editDistanceDFSMem(s, t, mem, i - 1, j - 1)
    // Minimum edits = 1 + the smallest remaining edit count after an insertion, deletion, or replacement
    val insert = editDistanceDFSMem(s, t, mem, i, j - 1)
    val delete = editDistanceDFSMem(s, t, mem, i - 1, j)
    val replace = editDistanceDFSMem(s, t, mem, i - 1, j - 1)
    // Cache and return the minimum number of edits
    mem[i][j] = min(min(insert, delete), replace) + 1
    return mem[i][j]
}

/* Edit distance with dynamic programming */
fun editDistanceDP(s: String, t: String): Int {
    val n = s.length
    val m = t.length
    val dp = Array(n + 1) { IntArray(m + 1) }
    // State transitions for the first row and column
    for (i in 1..n) {
        dp[i][0] = i
    }
    for (j in 1..m) {
        dp[0][j] = j
    }
    // State transitions for the remaining rows and columns
    for (i in 1..n) {
        for (j in 1..m) {
            if (s[i - 1] == t[j - 1]) {
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
fun editDistanceDPComp(s: String, t: String): Int {
    val n = s.length
    val m = t.length
    val dp = IntArray(m + 1)
    // State transitions for the first row
    for (j in 1..m) {
        dp[j] = j
    }
    // State transitions for the remaining rows
    for (i in 1..n) {
        // State transitions for the first column
        var leftup = dp[0] // Save dp[i-1, j-1] temporarily
        dp[0] = i
        // State transitions for the remaining columns
        for (j in 1..m) {
            val temp = dp[j]
            if (s[i - 1] == t[j - 1]) {
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

/* Driver code */
fun main() {
    val s = "bag"
    val t = "pack"
    val n = s.length
    val m = t.length

    // Brute-force search
    var res = editDistanceDFS(s, t, n, m)
    println("Changing $s to $t requires at least $res edits")

    // Memoized search
    val mem = Array(n + 1) { IntArray(m + 1) }
    for (row in mem)
        row.fill(-1)
    res = editDistanceDFSMem(s, t, mem, n, m)
    println("Changing $s to $t requires at least $res edits")

    // Dynamic programming
    res = editDistanceDP(s, t)
    println("Changing $s to $t requires at least $res edits")

    // Space-optimized dynamic programming
    res = editDistanceDPComp(s, t)
    println("Changing $s to $t requires at least $res edits")
}