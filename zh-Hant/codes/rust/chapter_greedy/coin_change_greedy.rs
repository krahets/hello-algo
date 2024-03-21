/*
 * File: coin_change_greedy.rs
 * Created Time: 2023-07-22
 * Author: night-cruise (2586447362@qq.com)
 */

/* 零钱兑换：贪心 */
fn coin_change_greedy(coins: &[i32], mut amt: i32) -> i32 {
    // 假设 coins 列表有序
    let mut i = coins.len() - 1;
    let mut count = 0;
    // 循环进行贪心选择，直到无剩余金额
    while amt > 0 {
        // 找到小于且最接近剩余金额的硬币
        while i > 0 && coins[i] > amt {
            i -= 1;
        }
        // 选择 coins[i]
        amt -= coins[i];
        count += 1;
    }
    // 若未找到可行方案，则返回 -1
    if amt == 0 {
        count
    } else {
        -1
    }
}

/* Driver Code */
fn main() {
    // 贪心：能够保证找到全局最优解
    let coins = [1, 5, 10, 20, 50, 100];
    let amt = 186;
    let res = coin_change_greedy(&coins, amt);
    println!("\ncoins = {:?}, amt = {}", coins, amt);
    println!("凑到 {} 所需的最少硬币数量为 {}", amt, res);

    // 贪心：无法保证找到全局最优解
    let coins = [1, 20, 50];
    let amt = 60;
    let res = coin_change_greedy(&coins, amt);
    println!("\ncoins = {:?}, amt = {}", coins, amt);
    println!("凑到 {} 所需的最少硬币数量为 {}", amt, res);
    println!("实际上需要的最少数量为 3 ，即 20 + 20 + 20");

    // 贪心：无法保证找到全局最优解
    let coins = [1, 49, 50];
    let amt = 98;
    let res = coin_change_greedy(&coins, amt);
    println!("\ncoins = {:?}, amt = {}", coins, amt);
    println!("凑到 {} 所需的最少硬币数量为 {}", amt, res);
    println!("实际上需要的最少数量为 2 ，即 49 + 49");
}
