/*
 * File: list.rs
 * Created Time: 2023-01-18
 * Author: xBLACICEx (xBLACKICEx@outlook.com), codingonion (coderonion@gmail.com)
 */
use hello_algo_rust::include::print_util;

/* 実行用コード */
fn main() {
    // [region]{init_list}
    // リストを初期化する
    // 初期値なし
    let empty_nums: Vec<i32> = Vec::new();
    // 初期値あり
    let mut nums: Vec<i32> = vec![1, 3, 2, 5, 4];
    // [endregion]{init_list}
    print!("リスト nums = ");
    print_util::print_array(&nums);
    print!("\nリスト empty_nums = ");
    print_util::print_array(&empty_nums);

    // [region]{access_element}
    // 要素にアクセスする
    let num = nums[1]; // インデックス 1 の要素にアクセスする
    // [endregion]{access_element}
    println!("\nインデックス 1 の要素にアクセスした結果 num = {num}");

    // [region]{update_element}
    // 要素を更新する
    nums[1] = 0; // インデックス 1 の要素を 0 に更新する
    // [endregion]{update_element}
    print!("インデックス 1 の要素を 0 に更新した結果 nums = ");
    print_util::print_array(&nums);

    // [region]{clear_list}
    // リストを空にする
    nums.clear();
    // [endregion]{clear_list}
    print!("\nリストを空にした後 nums = ");
    print_util::print_array(&nums);

    // [region]{append_element}
    // 末尾に要素を追加する
    nums.push(1);
    nums.push(3);
    nums.push(2);
    nums.push(5);
    nums.push(4);
    // [endregion]{append_element}
    print!("\n要素を追加した後 nums = ");
    print_util::print_array(&nums);

    // [region]{insert_element}
    // 途中に要素を挿入する
    nums.insert(3, 6); // インデックス 3 に数値 6 を挿入する
    // [endregion]{insert_element}
    print!("\nインデックス 3 に数値 6 を挿入した結果 nums = ");
    print_util::print_array(&nums);

    // [region]{remove_element}
    // 要素を削除する
    nums.remove(3); // インデックス 3 の要素を削除する
    // [endregion]{remove_element}
    print!("\nインデックス 3 の要素を削除した結果 nums = ");
    print_util::print_array(&nums);

    // [region]{iterate_list}
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
    // [endregion]{iterate_list}

    // [region]{concat_list}
    // 2 つのリストを連結する
    let mut nums1 = vec![6, 8, 7, 10, 9];
    nums.append(&mut nums1); // append は nums1 の要素をムーブするため、その後 nums1 は空になる
    // [endregion]{concat_list}

    // nums.extend(&nums1);   // extend は nums1 を借用するだけなので、その後も nums1 を引き続き使える
    print!("\nリスト nums の後ろに nums1 を連結した結果 nums = ");
    print_util::print_array(&nums);

    // [region]{sort_list}
    // リストをソートする
    nums.sort(); // ソート後、リストの要素は昇順に並ぶ
    // [endregion]{sort_list}
    print!("\nリストをソートした後 nums = ");
    print_util::print_array(&nums);
}
