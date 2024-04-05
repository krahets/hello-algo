/*
 * File: coin_change_greedy.rs
 * Created Time: 2023-07-22
 * Author: night-cruise (2586447362@qq.com)
 */

/* 零錢兌換：貪婪 */
fn coin_change_greedy(coins: &[i32], mut amt: i32) -> i32 {
    // 假設 coins 串列有序
    let mut i = coins.len() - 1;
    let mut count = 0;
    // 迴圈進行貪婪選擇，直到無剩餘金額
    while amt > 0 {
        // 找到小於且最接近剩餘金額的硬幣
        while i > 0 && coins[i] > amt {
            i -= 1;
        }
        // 選擇 coins[i]
        amt -= coins[i];
        count += 1;
    }
    // 若未找到可行方案，則返回 -1
    if amt == 0 {
        count
    } else {
        -1
    }
}

/* Driver Code */
fn main() {
    // 貪婪：能夠保證找到全域性最優解
    let coins = [1, 5, 10, 20, 50, 100];
    let amt = 186;
    let res = coin_change_greedy(&coins, amt);
    println!("\ncoins = {:?}, amt = {}", coins, amt);
    println!("湊到 {} 所需的最少硬幣數量為 {}", amt, res);

    // 貪婪：無法保證找到全域性最優解
    let coins = [1, 20, 50];
    let amt = 60;
    let res = coin_change_greedy(&coins, amt);
    println!("\ncoins = {:?}, amt = {}", coins, amt);
    println!("湊到 {} 所需的最少硬幣數量為 {}", amt, res);
    println!("實際上需要的最少數量為 3 ，即 20 + 20 + 20");

    // 貪婪：無法保證找到全域性最優解
    let coins = [1, 49, 50];
    let amt = 98;
    let res = coin_change_greedy(&coins, amt);
    println!("\ncoins = {:?}, amt = {}", coins, amt);
    println!("湊到 {} 所需的最少硬幣數量為 {}", amt, res);
    println!("實際上需要的最少數量為 2 ，即 49 + 49");
}
