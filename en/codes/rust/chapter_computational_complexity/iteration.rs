/*
 * File: iteration.rs
 * Created Time: 2023-09-02
 * Author: night-cruise (2586447362@qq.com)
 */

/* for loop */
fn for_loop(n: i32) -> i32 {
    let mut res = 0;
    // Sum 1, 2, ..., n-1, n
    for i in 1..=n {
        res += i;
    }
    res
}

/* while loop */
fn while_loop(n: i32) -> i32 {
    let mut res = 0;
    let mut i = 1; // Initialize condition variable

    // Sum 1, 2, ..., n-1, n
    while i <= n {
        res += i;
        i += 1; // Update condition variable
    }
    res
}

/* while loop (two updates) */
fn while_loop_ii(n: i32) -> i32 {
    let mut res = 0;
    let mut i = 1; // Initialize condition variable

    // Sum 1, 4, 10, ...
    while i <= n {
        res += i;
        // Update condition variable
        i += 1;
        i *= 2;
    }
    res
}

/* Nested for loop */
fn nested_for_loop(n: i32) -> String {
    let mut res = vec![];
    // Loop i = 1, 2, ..., n-1, n
    for i in 1..=n {
        // Loop j = 1, 2, ..., n-1, n
        for j in 1..=n {
            res.push(format!("({}, {}), ", i, j));
        }
    }
    res.join("")
}

/* Driver Code */
fn main() {
    let n = 5;
    let mut res;

    res = for_loop(n);
    println!("\nFor loop sum result res = {res}");

    res = while_loop(n);
    println!("\nWhile loop sum result res = {res}");

    res = while_loop_ii(n);
    println!("\nWhile loop (two updates) sum result res = {}", res);

    let res = nested_for_loop(n);
    println!("\nNested for loop traversal result {res}");
}
