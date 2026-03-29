/*
 * File: array.rs
 * Created Time: 2023-01-15
 * Author: xBLACICEx (xBLACKICEx@outlook.com), codingonion (coderonion@gmail.com)
 */

use hello_algo_rust::include::print_util;
use rand::Rng;

/* 要素へランダムアクセス */
fn random_access(nums: &[i32]) -> i32 {
    // 区間 [0, nums.len()) からランダムに数字を 1 つ選ぶ
    let random_index = rand::thread_rng().gen_range(0..nums.len());
    // ランダムな要素を取得して返す
    let random_num = nums[random_index];
    random_num
}

/* 配列長を拡張する */
fn extend(nums: &[i32], enlarge: usize) -> Vec<i32> {
    // 拡張後の長さを持つ配列を初期化する
    let mut res: Vec<i32> = vec![0; nums.len() + enlarge];
    // 元の配列の全要素を新しい配列にコピー
    res[0..nums.len()].copy_from_slice(nums);

    // 拡張後の新しい配列を返す
    res
}

/* 配列の index 番目に要素 num を挿入 */
fn insert(nums: &mut [i32], num: i32, index: usize) {
    // インデックス index 以降の全要素を 1 つ後ろへ移動する
    for i in (index + 1..nums.len()).rev() {
        nums[i] = nums[i - 1];
    }
    // index の要素に num を代入する
    nums[index] = num;
}

/* index の要素を削除する */
fn remove(nums: &mut [i32], index: usize) {
    // インデックス index より後ろの全要素を 1 つ前へ移動する
    for i in index..nums.len() - 1 {
        nums[i] = nums[i + 1];
    }
}

/* 配列を走査 */
fn traverse(nums: &[i32]) {
    let mut _count = 0;
    // インデックスで配列を走査
    for i in 0..nums.len() {
        _count += nums[i];
    }
    // 配列要素を直接走査
    _count = 0;
    for &num in nums {
        _count += num;
    }
}

/* 配列内で指定要素を探す */
fn find(nums: &[i32], target: i32) -> Option<usize> {
    for i in 0..nums.len() {
        if nums[i] == target {
            return Some(i);
        }
    }
    None
}

/* Driver Code */
fn main() {
    /* 配列を初期化 */
    let arr: [i32; 5] = [0; 5];
    print!("配列 arr = ");
    print_util::print_array(&arr);
    // Rust では、長さを指定する場合（[i32; 5]）は配列、指定しない場合（&[i32]）はスライスである
    // Rust の配列はコンパイル時に長さが確定するよう設計されているため、長さには定数しか使えない
    // Vector は Rust で通常動的配列として使われる型である
    // extend() メソッドを実装しやすくするため、以下では vector を配列（array）として扱う
    let nums: Vec<i32> = vec![1, 3, 2, 5, 4];
    print!("\n配列 nums = ");
    print_util::print_array(&nums);

    // ランダムアクセス
    let random_num = random_access(&nums);
    println!("\nnums からランダムな要素 {} を取得", random_num);

    // 長さを拡張
    let mut nums: Vec<i32> = extend(&nums, 3);
    print!("配列の長さを 8 に拡張すると、nums = ");
    print_util::print_array(&nums);

    // 要素を挿入する
    insert(&mut nums, 6, 3);
    print!("\nインデックス 3 に数値 6 を挿入すると、nums = ");
    print_util::print_array(&nums);

    // 要素を削除
    remove(&mut nums, 2);
    print!("\nインデックス 2 の要素を削除すると、nums = ");
    print_util::print_array(&nums);

    // 配列を走査
    traverse(&nums);

    // 要素を探索する
    let index = find(&nums, 3).unwrap();
    println!("\nnums 内で要素 3 を検索すると、インデックス = {}", index);
}
