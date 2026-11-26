/*
 * File: coin_change_greedy.rs
 * Created Time: 2023-07-22
 * Author: night-cruise (2586447362@qq.com)
 */

/* 零錢兌換：貪婪法 */
fn coin_change_greedy(coins: &[i32], mut amt: i32) -> i32 {
    // 假設硬幣清單 coins 已依面額遞增排序
    let mut i = coins.len() - 1;
    let mut count = 0;
    // 反覆依貪婪策略選取硬幣，直到剩餘金額為零
    while amt > 0 {
        // 找出不超過剩餘金額的最大面額
        while i > 0 && coins[i] > amt {
            i -= 1;
        }
        // 選取 coins[i]
        amt -= coins[i];
        count += 1;
    }
    // 若找不到可行解，則回傳 -1
    if amt == 0 {
        count
    } else {
        -1
    }
}

/* 主程式 */
fn main() {
    // 貪婪法：保證能找到全域最佳解
    let coins = [1, 5, 10, 20, 50, 100];
    let amt = 186;
    let res = coin_change_greedy(&coins, amt);
    println!("\ncoins = {:?}, amt = {}", coins, amt);
    println!("湊出 {} 所需的最少硬幣數為 {}", amt, res);

    // 貪婪法：無法保證找到全域最佳解
    let coins = [1, 20, 50];
    let amt = 60;
    let res = coin_change_greedy(&coins, amt);
    println!("\ncoins = {:?}, amt = {}", coins, amt);
    println!("湊出 {} 所需的最少硬幣數為 {}", amt, res);
    println!("實際上最少只需 3 枚，即 20 + 20 + 20");

    // 貪婪法：無法保證找到全域最佳解
    let coins = [1, 49, 50];
    let amt = 98;
    let res = coin_change_greedy(&coins, amt);
    println!("\ncoins = {:?}, amt = {}", coins, amt);
    println!("湊出 {} 所需的最少硬幣數為 {}", amt, res);
    println!("實際上最少只需 2 枚，即 49 + 49");
}
