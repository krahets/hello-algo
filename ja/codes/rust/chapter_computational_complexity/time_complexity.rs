/*
 * File: time_complexity.rs
 * Created Time: 2023-01-10
 * Author: xBLACICEx (xBLACKICEx@outlook.com), codingonion (coderonion@gmail.com)
 */

/* 定数階 */
fn constant(n: i32) -> i32 {
    _ = n;
    let mut count = 0;
    let size = 100_000;
    for _ in 0..size {
        count += 1;
    }
    count
}

/* 線形階 */
fn linear(n: i32) -> i32 {
    let mut count = 0;
    for _ in 0..n {
        count += 1;
    }
    count
}

/* 線形時間（配列を走査） */
fn array_traversal(nums: &[i32]) -> i32 {
    let mut count = 0;
    // ループ回数は配列長に比例する
    for _ in nums {
        count += 1;
    }
    count
}

/* 二乗階 */
fn quadratic(n: i32) -> i32 {
    let mut count = 0;
    // ループ回数はデータサイズ n の二乗に比例する
    for _ in 0..n {
        for _ in 0..n {
            count += 1;
        }
    }
    count
}

/* 二次時間（バブルソート） */
fn bubble_sort(nums: &mut [i32]) -> i32 {
    let mut count = 0; // カウンタ

    // 外側のループ：未ソート区間は [0, i]
    for i in (1..nums.len()).rev() {
        // 内側のループ：未ソート区間 [0, i] の最大要素をその区間の最右端へ交換
        for j in 0..i {
            if nums[j] > nums[j + 1] {
                // nums[j] と nums[j + 1] を交換
                let tmp = nums[j];
                nums[j] = nums[j + 1];
                nums[j + 1] = tmp;
                count += 3; // 要素交換には 3 回の単位操作が含まれる
            }
        }
    }
    count
}

/* 指数時間（ループ実装） */
fn exponential(n: i32) -> i32 {
    let mut count = 0;
    let mut base = 1;
    // 細胞は各ラウンドで 2 つに分裂し、数列 1, 2, 4, 8, ..., 2^(n-1) を形成する
    for _ in 0..n {
        for _ in 0..base {
            count += 1
        }
        base *= 2;
    }
    // count = 1 + 2 + 4 + 8 + .. + 2^(n-1) = 2^n - 1
    count
}

/* 指数時間（再帰実装） */
fn exp_recur(n: i32) -> i32 {
    if n == 1 {
        return 1;
    }
    exp_recur(n - 1) + exp_recur(n - 1) + 1
}

/* 対数時間（ループ実装） */
fn logarithmic(mut n: i32) -> i32 {
    let mut count = 0;
    while n > 1 {
        n = n / 2;
        count += 1;
    }
    count
}

/* 対数時間（再帰実装） */
fn log_recur(n: i32) -> i32 {
    if n <= 1 {
        return 0;
    }
    log_recur(n / 2) + 1
}

/* 線形対数時間 */
fn linear_log_recur(n: i32) -> i32 {
    if n <= 1 {
        return 1;
    }
    let mut count = linear_log_recur(n / 2) + linear_log_recur(n / 2);
    for _ in 0..n {
        count += 1;
    }
    return count;
}

/* 階乗時間（再帰実装） */
fn factorial_recur(n: i32) -> i32 {
    if n == 0 {
        return 1;
    }
    let mut count = 0;
    // 1個から n 個に分裂
    for _ in 0..n {
        count += factorial_recur(n - 1);
    }
    count
}

/* Driver Code */
fn main() {
    // n を変えて実行し、各計算量で操作回数がどう変化するかを確認できる
    let n: i32 = 8;
    println!("入力データサイズ n = {}", n);

    let mut count = constant(n);
    println!("定数時間の操作回数 = {}", count);

    count = linear(n);
    println!("線形時間の操作回数 = {}", count);
    count = array_traversal(&vec![0; n as usize]);
    println!("線形時間（配列の走査）の操作回数 = {}", count);

    count = quadratic(n);
    println!("二乗時間の操作回数 = {}", count);
    let mut nums = (1..=n).rev().collect::<Vec<_>>(); // [n,n-1,...,2,1]
    count = bubble_sort(&mut nums);
    println!("二乗時間（バブルソート）の操作回数 = {}", count);

    count = exponential(n);
    println!("指数時間（ループ実装）の操作回数 = {}", count);
    count = exp_recur(n);
    println!("指数時間（再帰実装）の操作回数 = {}", count);

    count = logarithmic(n);
    println!("対数時間（ループ実装）の操作回数 = {}", count);
    count = log_recur(n);
    println!("対数時間（再帰実装）の操作回数 = {}", count);

    count = linear_log_recur(n);
    println!("線形対数時間（再帰実装）の操作回数 = {}", count);

    count = factorial_recur(n);
    println!("階乗時間（再帰実装）の操作回数 = {}", count);
}
