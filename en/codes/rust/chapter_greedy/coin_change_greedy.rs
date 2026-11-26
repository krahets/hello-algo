/*
 * File: coin_change_greedy.rs
 * Created Time: 2023-07-22
 * Author: night-cruise (2586447362@qq.com)
 */

/* Greedy coin change */
fn coin_change_greedy(coins: &[i32], mut amt: i32) -> i32 {
    // Assume the coins list is sorted
    let mut i = coins.len() - 1;
    let mut count = 0;
    // Make greedy choices until no amount remains
    while amt > 0 {
        // Find the largest denomination that does not exceed the remaining amount
        while i > 0 && coins[i] > amt {
            i -= 1;
        }
        // Choose coins[i]
        amt -= coins[i];
        count += 1;
    }
    // Return -1 if no feasible solution was found
    if amt == 0 {
        count
    } else {
        -1
    }
}

/* Driver code */
fn main() {
    // Greedy choices are guaranteed to give a global optimum here
    let coins = [1, 5, 10, 20, 50, 100];
    let amt = 186;
    let res = coin_change_greedy(&coins, amt);
    println!("\ncoins = {:?}, amt = {}", coins, amt);
    println!("The minimum number of coins needed to make {} is {}", amt, res);

    // Greedy choices do not guarantee a global optimum here
    let coins = [1, 20, 50];
    let amt = 60;
    let res = coin_change_greedy(&coins, amt);
    println!("\ncoins = {:?}, amt = {}", coins, amt);
    println!("The minimum number of coins needed to make {} is {}", amt, res);
    println!("The actual minimum is 3 coins: 20 + 20 + 20");

    // Greedy choices do not guarantee a global optimum here
    let coins = [1, 49, 50];
    let amt = 98;
    let res = coin_change_greedy(&coins, amt);
    println!("\ncoins = {:?}, amt = {}", coins, amt);
    println!("The minimum number of coins needed to make {} is {}", amt, res);
    println!("The actual minimum is 2 coins: 49 + 49");
}
