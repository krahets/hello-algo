/*
 * File: edit_distance.rs
 * Created Time: 2023-07-09
 * Author: codingonion (coderonion@gmail.com)
 */

/* Edit distance: Brute-force search */
fn edit_distance_dfs(s: &str, t: &str, i: usize, j: usize) -> i32 {
    // If both s and t are empty, return 0
    if i == 0 && j == 0 {
        return 0;
    }
    // If s is empty, return length of t
    if i == 0 {
        return j as i32;
    }
    // If t is empty, return length of s
    if j == 0 {
        return i as i32;
    }
    // If two characters are equal, skip both characters
    if s.chars().nth(i - 1) == t.chars().nth(j - 1) {
        return edit_distance_dfs(s, t, i - 1, j - 1);
    }
    // Minimum edit steps = minimum edit steps of insert, delete, replace + 1
    let insert = edit_distance_dfs(s, t, i, j - 1);
    let delete = edit_distance_dfs(s, t, i - 1, j);
    let replace = edit_distance_dfs(s, t, i - 1, j - 1);
    // Return minimum edit steps
    std::cmp::min(std::cmp::min(insert, delete), replace) + 1
}

/* Edit distance: Memoization search */
fn edit_distance_dfs_mem(s: &str, t: &str, mem: &mut Vec<Vec<i32>>, i: usize, j: usize) -> i32 {
    // If both s and t are empty, return 0
    if i == 0 && j == 0 {
        return 0;
    }
    // If s is empty, return length of t
    if i == 0 {
        return j as i32;
    }
    // If t is empty, return length of s
    if j == 0 {
        return i as i32;
    }
    // If there's a record, return it directly
    if mem[i][j] != -1 {
        return mem[i][j];
    }
    // If two characters are equal, skip both characters
    if s.chars().nth(i - 1) == t.chars().nth(j - 1) {
        return edit_distance_dfs_mem(s, t, mem, i - 1, j - 1);
    }
    // Minimum edit steps = minimum edit steps of insert, delete, replace + 1
    let insert = edit_distance_dfs_mem(s, t, mem, i, j - 1);
    let delete = edit_distance_dfs_mem(s, t, mem, i - 1, j);
    let replace = edit_distance_dfs_mem(s, t, mem, i - 1, j - 1);
    // Record and return minimum edit steps
    mem[i][j] = std::cmp::min(std::cmp::min(insert, delete), replace) + 1;
    mem[i][j]
}

/* Edit distance: Dynamic programming */
fn edit_distance_dp(s: &str, t: &str) -> i32 {
    let (n, m) = (s.len(), t.len());
    let mut dp = vec![vec![0; m + 1]; n + 1];
    // State transition: first row and first column
    for i in 1..=n {
        dp[i][0] = i as i32;
    }
    for j in 1..m {
        dp[0][j] = j as i32;
    }
    // State transition: rest of the rows and columns
    for i in 1..=n {
        for j in 1..=m {
            if s.chars().nth(i - 1) == t.chars().nth(j - 1) {
                // If two characters are equal, skip both characters
                dp[i][j] = dp[i - 1][j - 1];
            } else {
                // Minimum edit steps = minimum edit steps of insert, delete, replace + 1
                dp[i][j] =
                    std::cmp::min(std::cmp::min(dp[i][j - 1], dp[i - 1][j]), dp[i - 1][j - 1]) + 1;
            }
        }
    }
    dp[n][m]
}

/* Edit distance: Space-optimized dynamic programming */
fn edit_distance_dp_comp(s: &str, t: &str) -> i32 {
    let (n, m) = (s.len(), t.len());
    let mut dp = vec![0; m + 1];
    // State transition: first row
    for j in 1..m {
        dp[j] = j as i32;
    }
    // State transition: rest of the rows
    for i in 1..=n {
        // State transition: first column
        let mut leftup = dp[0]; // Temporarily store dp[i-1, j-1]
        dp[0] = i as i32;
        // State transition: rest of the columns
        for j in 1..=m {
            let temp = dp[j];
            if s.chars().nth(i - 1) == t.chars().nth(j - 1) {
                // If two characters are equal, skip both characters
                dp[j] = leftup;
            } else {
                // Minimum edit steps = minimum edit steps of insert, delete, replace + 1
                dp[j] = std::cmp::min(std::cmp::min(dp[j - 1], dp[j]), leftup) + 1;
            }
            leftup = temp; // Update for next round's dp[i-1, j-1]
        }
    }
    dp[m]
}

/* Driver Code */
pub fn main() {
    let s = "bag";
    let t = "pack";
    let (n, m) = (s.len(), t.len());

    // Brute-force search
    let res = edit_distance_dfs(s, t, n, m);
    println!("Changing {s} to {t} requires minimum {res} edits");

    // Memoization search
    let mut mem = vec![vec![0; m + 1]; n + 1];
    for row in mem.iter_mut() {
        row.fill(-1);
    }
    let res = edit_distance_dfs_mem(s, t, &mut mem, n, m);
    println!("Changing {s} to {t} requires minimum {res} edits");

    // Dynamic programming
    let res = edit_distance_dp(s, t);
    println!("Changing {s} to {t} requires minimum {res} edits");

    // Space-optimized dynamic programming
    let res = edit_distance_dp_comp(s, t);
    println!("Changing {s} to {t} requires minimum {res} edits");
}
