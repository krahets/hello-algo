/*
 * File: coin_change_greedy.rs
 * Created Time: 2023-07-22
 * Author: night-cruise (2586447362@qq.com)
 */

/* 硬貨の両替（貪欲法） */
fn coin_change_greedy(coins: &[i32], mut amt: i32) -> i32 {
    // リスト coins はソート済みとする
    let mut i = coins.len() - 1;
    let mut count = 0;
    // 残額がなくなるまで貪欲選択を繰り返す
    while amt > 0 {
        // 残額より小さく、最も近い額面の硬貨を探す
        while i > 0 && coins[i] > amt {
            i -= 1;
        }
        // coins[i] を選ぶ
        amt -= coins[i];
        count += 1;
    }
    // 解が見つからなければ -1 を返す
    if amt == 0 {
        count
    } else {
        -1
    }
}

/* 実行例 */
fn main() {
    // 貪欲法で大域的最適解が必ず求まる例
    let coins = [1, 5, 10, 20, 50, 100];
    let amt = 186;
    let res = coin_change_greedy(&coins, amt);
    println!("\ncoins = {:?}, amt = {}", coins, amt);
    println!("金額 {} を作るのに必要な硬貨の最少枚数は {}", amt, res);

    // 貪欲法では大域的最適解を保証できない例
    let coins = [1, 20, 50];
    let amt = 60;
    let res = coin_change_greedy(&coins, amt);
    println!("\ncoins = {:?}, amt = {}", coins, amt);
    println!("金額 {} を作るのに必要な硬貨の最少枚数は {}", amt, res);
    println!("実際の最少枚数は 3 枚（20 + 20 + 20）");

    // 貪欲法では大域的最適解を保証できない例
    let coins = [1, 49, 50];
    let amt = 98;
    let res = coin_change_greedy(&coins, amt);
    println!("\ncoins = {:?}, amt = {}", coins, amt);
    println!("金額 {} を作るのに必要な硬貨の最少枚数は {}", amt, res);
    println!("実際の最少枚数は 2 枚（49 + 49）");
}
