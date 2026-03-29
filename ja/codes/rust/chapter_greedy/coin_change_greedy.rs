/*
 * File: coin_change_greedy.rs
 * Created Time: 2023-07-22
 * Author: night-cruise (2586447362@qq.com)
 */

/* コイン交換：貪欲法 */
fn coin_change_greedy(coins: &[i32], mut amt: i32) -> i32 {
    // coins リストはソート済みと仮定する
    let mut i = coins.len() - 1;
    let mut count = 0;
    // 残額がなくなるまで貪欲選択を繰り返す
    while amt > 0 {
        // 残額以下で最も近い硬貨を見つける
        while i > 0 && coins[i] > amt {
            i -= 1;
        }
        // coins[i] を選択する
        amt -= coins[i];
        count += 1;
    }
    // 実行可能な解が見つからなければ -1 を返す
    if amt == 0 {
        count
    } else {
        -1
    }
}

/* Driver Code */
fn main() {
    // 貪欲法：大域最適解を保証できる
    let coins = [1, 5, 10, 20, 50, 100];
    let amt = 186;
    let res = coin_change_greedy(&coins, amt);
    println!("\ncoins = {:?}, amt = {}", coins, amt);
    println!("{} にするために必要な最小硬貨枚数は {}", amt, res);

    // 貪欲法：大域最適解を保証できない
    let coins = [1, 20, 50];
    let amt = 60;
    let res = coin_change_greedy(&coins, amt);
    println!("\ncoins = {:?}, amt = {}", coins, amt);
    println!("{} にするために必要な最小硬貨枚数は {}", amt, res);
    println!("実際に必要な最小枚数は 3、つまり 20 + 20 + 20");

    // 貪欲法：大域最適解を保証できない
    let coins = [1, 49, 50];
    let amt = 98;
    let res = coin_change_greedy(&coins, amt);
    println!("\ncoins = {:?}, amt = {}", coins, amt);
    println!("{} にするために必要な最小硬貨枚数は {}", amt, res);
    println!("実際に必要な最小枚数は 2、つまり 49 + 49");
}
