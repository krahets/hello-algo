/*
 * File: coin_change_greedy.rs
 * Created Time: 2023-07-22
 * Author: night-cruise (2586447362@qq.com)
 */

/* Coin change: Greedy algorithm */
fn coin_change_greedy(coins: &[i32], mut amt: i32) -> i32 {
    // Assume coins list is sorted
    let mut i = coins.len() - 1;
    let mut count = 0;
    // Loop to make greedy choices until no remaining amount
    while amt > 0 {
        // Find the coin that is less than and closest to the remaining amount
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
    // Greedy algorithm: Can guarantee finding the global optimal solution
    let coins = [1, 5, 10, 20, 50, 100];
    let amt = 186;
    let res = coin_change_greedy(&coins, amt);
    println!("\ncoins = {:?}, amt = {}", coins, amt);
    println!("Minimum coins needed to make {} is {}", amt, res);

    // Greedy algorithm: Cannot guarantee finding the global optimal solution
    let coins = [1, 20, 50];
    let amt = 60;
    let res = coin_change_greedy(&coins, amt);
    println!("\ncoins = {:?}, amt = {}", coins, amt);
    println!("Minimum coins needed to make {} is {}", amt, res);
    println!("Actually the minimum number needed is 3, i.e., 20 + 20 + 20");

    // Greedy algorithm: Cannot guarantee finding the global optimal solution
    let coins = [1, 49, 50];
    let amt = 98;
    let res = coin_change_greedy(&coins, amt);
    println!("\ncoins = {:?}, amt = {}", coins, amt);
    println!("Minimum coins needed to make {} is {}", amt, res);
    println!("Actually the minimum number needed is 2, i.e., 49 + 49");
}
