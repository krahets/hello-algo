/*
 * File: edit_distance.rs
 * Created Time: 2023-07-09
 * Author: codingonion (coderonion@gmail.com)
 */

use std::cmp;

/* 编辑距离：暴力搜索 */
pub fn edit_distance_dfs(s: &str, t: &str) -> usize {
    fn dfs(s: &[char], t: &[char], i: usize, j: usize) -> usize {
        // 若 s 和 t 都为空，则返回 0
        if i == 0 && j == 0 {
            return 0;
        }
        // 若 s 为空，则返回 t 长度
        if i == 0 {
            return j;
        }
        // 若 t 为空，则返回 s 长度
        if j == 0 {
            return i;
        }
        // 若两字符相等，则直接跳过此两字符
        if s[i - 1] == t[j - 1] {
            return dfs(s, t, i - 1, j - 1);
        }
        // 最少编辑步数 = 插入、删除、替换这三种操作的最少编辑步数 + 1
        let insert = dfs(s, t, i, j - 1);
        let delete = dfs(s, t, i - 1, j);
        let replace = dfs(s, t, i - 1, j - 1);
        // 返回最少编辑步数
        // 可用 insert.min(delete).min(replace) + 1，但中缀运算符求最小值似乎不够直观。
        cmp::min(cmp::min(insert, delete), replace) + 1
    }

    // 注意：Rust 字符串是不定长的 UTF-8 序列，无法实现 O(1) 时间内的随机访问；
    // 可先将字符串转换为字符数组来优化访问。
    let s: Vec<char> = s.chars().collect();
    let t: Vec<char> = t.chars().collect();

    // 注意：不可使用 str::len 获取字符串长度，因为其返回的是字节数而非字符数。
    let n = s.len();
    let m = t.len();

    dfs(&s, &t, n, m)
}

/* 编辑距离：记忆化搜索 */
pub fn edit_distance_dfs_mem(s: &str, t: &str) -> usize {
    fn dfs(s: &[char], t: &[char], mem: &mut [Vec<Option<usize>>], i: usize, j: usize) -> usize {
        // 若 s 和 t 都为空，则返回 0
        if i == 0 && j == 0 {
            return 0;
        }
        // 若 s 为空，则返回 t 长度
        if i == 0 {
            return j;
        }
        // 若 t 为空，则返回 s 长度
        if j == 0 {
            return i;
        }
        // 若已有记录，则直接返回之
        if let Some(distance) = mem[i][j] {
            return distance;
        }
        // 若两字符相等，则直接跳过此两字符
        if s[i - 1] == t[j - 1] {
            return dfs(s, t, mem, i - 1, j - 1);
        }
        // 最少编辑步数 = 插入、删除、替换这三种操作的最少编辑步数 + 1
        let insert = dfs(s, t, mem, i, j - 1);
        let delete = dfs(s, t, mem, i - 1, j);
        let replace = dfs(s, t, mem, i - 1, j - 1);
        // 记录并返回最少编辑步数
        let distance = cmp::min(cmp::min(insert, delete), replace) + 1;
        mem[i][j] = Some(distance);
        distance
    }

    // 注意：Rust 字符串是不定长的 UTF-8 序列，无法实现 O(1) 时间内的随机访问；
    // 可先将字符串转换为字符数组来优化访问。
    let s: Vec<char> = s.chars().collect();
    let t: Vec<char> = t.chars().collect();

    // 注意：不可使用 str::len 获取字符串长度，因为其返回的是字节数而非字符数。
    let n = s.len();
    let m = t.len();

    let mut mem = vec![vec![None; m + 1]; n + 1];

    dfs(&s, &t, &mut mem, n, m)
}

/* 编辑距离：动态规划 */
#[allow(clippy::needless_range_loop)]
pub fn edit_distance_dp(s: &str, t: &str) -> usize {
    // 注意：Rust 字符串是不定长的 UTF-8 序列，无法实现 O(1) 时间内的随机访问；
    // 可先将字符串转换为字符数组来优化访问。
    let s: Vec<char> = s.chars().collect();
    let t: Vec<char> = t.chars().collect();

    // 注意：不可使用 str::len 获取字符串长度，因为其返回的是字节数而非字符数。
    let n = s.len();
    let m = t.len();

    let mut dp = vec![vec![0; m + 1]; n + 1];

    // 状态转移：首行首列
    for i in 1..=n {
        dp[i][0] = i;
    }
    for j in 1..=m {
        dp[0][j] = j;
    }

    // 状态转移：其余行和列
    for i in 1..=n {
        for j in 1..=m {
            if s[i - 1] == t[j - 1] {
                // 若两字符相等，则直接跳过此两字符
                dp[i][j] = dp[i - 1][j - 1];
                continue;
            }
            // 最少编辑步数 = 插入、删除、替换这三种操作的最少编辑步数 + 1
            let insert = dp[i][j - 1];
            let delete = dp[i - 1][j];
            let replace = dp[i - 1][j - 1];
            dp[i][j] = cmp::min(cmp::min(insert, delete), replace) + 1;
        }
    }

    dp[n][m]
}

/* 编辑距离：空间优化后的动态规划 */
pub fn edit_distance_dp_comp(s: &str, t: &str) -> usize {
    // 注意：Rust 字符串是不定长的 UTF-8 序列，无法实现 O(1) 时间内的随机访问；
    // 可先将字符串转换为字符数组来优化访问。
    let s: Vec<char> = s.chars().collect();
    let t: Vec<char> = t.chars().collect();

    // 注意：不可使用 str::len 获取字符串长度，因为其返回的是字节数而非字符数。
    let n = s.len();
    let m = t.len();

    // 状态转移：首行
    let mut dp: Vec<usize> = (0..=m).collect();

    // 状态转移：其余行
    for i in 1..=n {
        // 状态转移：首列
        // 暂存 dp[i - 1, j - 1]
        let mut leftup = dp[0];
        dp[0] = i;
        // 状态转移：其余列
        for j in 1..=m {
            let temp = dp[j];
            if s[i - 1] == t[j - 1] {
                // 若两字符相等，则直接跳过此两字符
                dp[j] = leftup;
            } else {
                // 最少编辑步数 = 插入、删除、替换这三种操作的最少编辑步数 + 1
                let insert = dp[j - 1];
                let delete = dp[j];
                let replace = leftup;
                dp[j] = cmp::min(cmp::min(insert, delete), replace) + 1;
            }
            // 更新为下一轮的 dp[i - 1, j - 1]
            leftup = temp;
        }
    }

    dp[m]
}

/* Driver Code */
fn main() {
    let s = "bag";
    let t = "pack";

    // 暴力搜索
    let res = edit_distance_dfs(s, t);
    println!("将 {s} 更改为 {t} 最少需要编辑 {res} 步");

    // 记忆搜索
    let res = edit_distance_dfs_mem(s, t);
    println!("将 {s} 更改为 {t} 最少需要编辑 {res} 步");

    // 动态规划
    let res = edit_distance_dp(s, t);
    println!("将 {s} 更改为 {t} 最少需要编辑 {res} 步");

    // 空间优化后的动态规划
    let res = edit_distance_dp_comp(s, t);
    println!("将 {s} 更改为 {t} 最少需要编辑 {res} 步");
}
