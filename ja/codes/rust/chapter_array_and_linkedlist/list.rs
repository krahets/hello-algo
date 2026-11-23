/*
 * File: list.rs
 * Created Time: 2023-01-18
 * Author: xBLACICEx (xBLACKICEx@outlook.com), codingonion (coderonion@gmail.com)
 */
use hello_algo_rust::include::print_util;

/* 実行用コード */
fn main() {
    // リストを初期化する
    let mut nums: Vec<i32> = vec![1, 3, 2, 5, 4];
    print!("リスト nums = ");
    print_util::print_array(&nums);

    // 要素にアクセスする
    let num = nums[1];
    println!("\nインデックス 1 の要素にアクセスした結果 num = {num}");

    // 要素を更新する
    nums[1] = 0;
    print!("インデックス 1 の要素を 0 に更新した結果 nums = ");
    print_util::print_array(&nums);

    // リストを空にする
    nums.clear();
    print!("\nリストを空にした後 nums = ");
    print_util::print_array(&nums);

    // 末尾に要素を追加する
    nums.push(1);
    nums.push(3);
    nums.push(2);
    nums.push(5);
    nums.push(4);
    print!("\n要素を追加した後 nums = ");
    print_util::print_array(&nums);

    // 途中に要素を挿入する
    nums.insert(3, 6);
    print!("\nインデックス 3 に数値 6 を挿入した結果 nums = ");
    print_util::print_array(&nums);

    // 要素を削除する
    nums.remove(3);
    print!("\nインデックス 3 の要素を削除した結果 nums = ");
    print_util::print_array(&nums);

    // インデックスを使ってリストを走査する
    let mut _count = 0;
    for i in 0..nums.len() {
        _count += nums[i];
    }
    // リストの要素を直接走査する
    _count = 0;
    for x in &nums {
        _count += x;
    }

    // 2 つのリストを連結する
    let mut nums1 = vec![6, 8, 7, 10, 9];
    nums.append(&mut nums1); // append（ムーブ）後、nums1 は空になる！

    // nums.extend(&nums1);   // extend（借用）なら nums1 を引き続き使える
    print!("\nリスト nums の後ろに nums1 を連結した結果 nums = ");
    print_util::print_array(&nums);

    // リストをソートする
    nums.sort();
    print!("\nリストをソートした後 nums = ");
    print_util::print_array(&nums);
}
