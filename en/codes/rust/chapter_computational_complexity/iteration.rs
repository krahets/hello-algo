/*
 * File: iteration.rs
 * Created Time: 2023-09-02
 * Author: night-cruise (2586447362@qq.com)
 */

/* for loop */
fn for_loop(n: i32) -> i32 {
    let mut res = 0;
    // Sum 1, 2, ..., n-1, n in a loop
    for i in 1..=n {
        res += i;
    }
    res
}

/* while loop */
fn while_loop(n: i32) -> i32 {
    let mut res = 0;
    let mut i = 1; // Initialize the loop control variable

    // Sum 1, 2, ..., n-1, n in a loop
    while i <= n {
        res += i;
        i += 1; // Update the loop control variable
    }
    res
}

/* while loop (two updates) */
fn while_loop_ii(n: i32) -> i32 {
    let mut res = 0;
    let mut i = 1; // Initialize the loop control variable

    // Sum 1, 4, 10, ... in a loop
    while i <= n {
        res += i;
        // Update the loop control variable
        i += 1;
        i *= 2;
    }
    res
}

/* Nested for loops */
fn nested_for_loop(n: i32) -> String {
    let mut res = vec![];
    // Loop over i = 1, 2, ..., n-1, n
    for i in 1..=n {
        // Loop over j = 1, 2, ..., n-1, n
        for j in 1..=n {
            res.push(format!("({}, {}), ", i, j));
        }
    }
    res.join("")
}

/* Driver code */
fn main() {
    let n = 5;
    let mut res;

    res = for_loop(n);
    println!("\nSum from the for loop: res = {res}");

    res = while_loop(n);
    println!("\nSum from the while loop: res = {res}");

    res = while_loop_ii(n);
    println!("\nSum from the while loop with two updates, res = {}", res);

    let res = nested_for_loop(n);
    println!("\nTraversal from the nested for loops: {res}");
}
