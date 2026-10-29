/*
 * File: coin_change_greedy.rs
 * Created Time: 2023-07-22
 * Author: night-cruise (2586447362@qq.com)
 */

/* 硬貨の両替：貪欲法 */
fn coin_change_greedy(coins: &[i32], mut amt: i32) -> i32 {
    // coins リストはソート済みと仮定する
    let mut i = coins.len() - 1;
    let mut count = 0;
    // 残額がなくなるまで貪欲な選択を繰り返す
    while amt > 0 {
        // 残額より小さく、残額に最も近い硬貨を探す
        while i > 0 && coins[i] > amt {
            i -= 1;
        }
        // coins[i] を選ぶ
        amt -= coins[i];
        count += 1;
    }
    // 実行可能な方法が見つからなかった場合、-1 を返す
    if amt == 0 {
        count
    } else {
        -1
    }
}

/* 実行用コード */
fn main() {
    // 貪欲法：大域的最適解が得られることを保証できる
    let coins = [1, 5, 10, 20, 50, 100];
    let amt = 186;
    let res = coin_change_greedy(&coins, amt);
    println!("\ncoins = {:?}, amt = {}", coins, amt);
    println!("{} にするために必要な硬貨の最小枚数は {}", amt, res);

    // 貪欲法：大域的最適解が得られることを保証できない
    let coins = [1, 20, 50];
    let amt = 60;
    let res = coin_change_greedy(&coins, amt);
    println!("\ncoins = {:?}, amt = {}", coins, amt);
    println!("{} にするために必要な硬貨の最小枚数は {}", amt, res);
    println!("実際に必要な最小枚数は 3 、すなわち 20 + 20 + 20");

    // 貪欲法：大域的最適解が得られることを保証できない
    let coins = [1, 49, 50];
    let amt = 98;
    let res = coin_change_greedy(&coins, amt);
    println!("\ncoins = {:?}, amt = {}", coins, amt);
    println!("{} にするために必要な硬貨の最小枚数は {}", amt, res);
    println!("実際に必要な最小枚数は 2 、すなわち 49 + 49");
}
