/*
 * File: coin_change_greedy.rs
 * Created Time: 2023-07-22
 * Author: night-cruise (2586447362@qq.com)
 */

/* 零钱兑换：贪心 */
pub fn coin_change_greedy(coins: &[u32], mut amt: u32) -> Option<u32> {
    // coins 列表必须有序
    assert!(coins.is_sorted());

    // 若硬币列表为空，无法凑出目标金额，直接返回 None
    if coins.is_empty() {
        return None;
    }

    // coins 非空，此处不会发生减法溢出
    let mut i = coins.len() - 1;
    let mut count = 0;

    // 循环进行贪心选择，直到无剩余金额
    while amt > 0 {
        // 找到小于且最接近剩余金额的硬币
        while coins[i] > amt {
            // 若最小面值的硬币仍然大于剩余金额，则无法凑出目标金额，直接返回 None
            i = i.checked_sub(1)?;
        }
        // 选择 coins[i]
        amt -= coins[i];
        count += 1;
    }

    Some(count)
}

/* Driver Code */
fn main() {
    // 贪心：能够保证找到全局最优解
    let coins = [1, 5, 10, 20, 50, 100];
    let amt = 186;
    let res = coin_change_greedy(&coins, amt);
    println!("coins = {coins:?}, amt = {amt}");
    println!("凑到 {amt} 所需的最少硬币数量为 {res:?}");

    println!();

    // 贪心：无法保证找到全局最优解
    let coins = [1, 20, 50];
    let amt = 60;
    let res = coin_change_greedy(&coins, amt);
    println!("coins = {coins:?}, amt = {amt}");
    println!("凑到 {amt} 所需的最少硬币数量为 {res:?}");
    println!("实际上需要的最少数量为 3 ，即 20 + 20 + 20");

    println!();

    // 贪心：无法保证找到全局最优解
    let coins = [1, 49, 50];
    let amt = 98;
    let res = coin_change_greedy(&coins, amt);
    println!("coins = {coins:?}, amt = {amt}");
    println!("凑到 {amt} 所需的最少硬币数量为 {res:?}");
    println!("实际上需要的最少数量为 2 ，即 49 + 49");
}
