/*
 * File: hashing_search.rs
 * Created Time: 2023-07-09
 * Author: codingonion (coderonion@gmail.com)
 */

use hello_algo_rust::include::ListNode;
use std::cell::RefCell;
use std::collections::HashMap;
use std::rc::Rc;

/* ハッシュ探索（配列） */
fn hashing_search_array<'a>(map: &'a HashMap<i32, usize>, target: i32) -> Option<&'a usize> {
    // ハッシュテーブルの key: 対象要素、value: インデックス
    // ハッシュテーブルにその key がなければ None を返す
    map.get(&target)
}

/* ハッシュ探索（連結リスト） */
fn hashing_search_linked_list(
    map: &HashMap<i32, Rc<RefCell<ListNode<i32>>>>,
    target: i32,
) -> Option<&Rc<RefCell<ListNode<i32>>>> {
    // ハッシュテーブルの key: 対象ノードの値、value: ノードオブジェクト
    // ハッシュテーブルにその key がなければ None を返す
    map.get(&target)
}

/* Driver Code */
pub fn main() {
    let target = 3;

    /* ハッシュ探索（配列） */
    let nums = [1, 5, 3, 2, 4, 7, 5, 9, 10, 8];
    // ハッシュテーブルを初期化
    let mut map = HashMap::new();
    for (i, num) in nums.iter().enumerate() {
        map.insert(*num, i); // key: 要素、value: インデックス
    }
    let index = hashing_search_array(&map, target);
    println!("対象要素 3 のインデックス = {}", index.unwrap());

    /* ハッシュ探索（連結リスト） */
    let head = ListNode::arr_to_linked_list(&nums);
    // ハッシュテーブルを初期化する
    // let mut map1 = HashMap::new();
    let map1 = ListNode::linked_list_to_hashmap(head);
    let node = hashing_search_linked_list(&map1, target);
    println!("対象ノード値 3 に対応するノードオブジェクトは {:?}", node);
}
