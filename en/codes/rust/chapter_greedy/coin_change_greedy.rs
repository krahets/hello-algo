/*
 * File: coin_change_greedy.rs
 * Created Time: 2023-07-22
 * Author: night-cruise (2586447362@qq.com)
 */

/* Coin change: Greedy */
fn coin_change_greedy(coins: &[i32], mut amt: i32) -> i32 {
    // Assume coins list is ordered
    let mut i = coins.len() - 1;
    let mut count = 0;
    // Loop for greedy selection until no remaining amount
    while amt > 0 {
        // Find the smallest coin close to and less than the remaining amount
        while i > 0 && coins[i] > amt {
            i -= 1;
        }
        // Choose coins[i]
        amt -= coins[i];
        count += 1;
    }
    // If no feasible solution is found, return -1
    if amt == 0 {
        count
    } else {
        -1
    }
}

/* Driver Code */
fn main() {
    // Greedy: can ensure finding a global optimal solution
    let coins = [1, 5, 10, 20, 50, 100];
    let amt = 186;
    let res = coin_change_greedy(&coins, amt);
    println!("\ncoins = {:?}, amt = {}", coins, amt);
    println!("The minimum number of coins required to make up {} is {}", amt, res);

    // Greedy: cannot ensure finding a global optimal solution
    let coins = [1, 20, 50];
    let amt = 60;
    let res = coin_change_greedy(&coins, amt);
    println!("\ncoins = {:?}, amt = {}", coins, amt);
    println!("The minimum number of coins required to make up {} is {}", amt, res);
    println!("In reality, the minimum number needed is 3, i.e., 20 + 20 + 20");

    // Greedy: cannot ensure finding a global optimal solution
    let coins = [1, 49, 50];
    let amt = 98;
    let res = coin_change_greedy(&coins, amt);
    println!("\ncoins = {:?}, amt = {}", coins, amt);
    println!("The minimum number of coins required to make up {} is {}", amt, res);
    println!("In reality, the minimum number needed is 2, i.e., 49 + 49");
}
