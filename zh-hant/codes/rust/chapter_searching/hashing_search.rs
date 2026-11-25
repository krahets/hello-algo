/*
 * File: hashing_search.rs
 * Created Time: 2023-07-09
 * Author: codingonion (coderonion@gmail.com)
 */

use hello_algo_rust::include::ListNode;
use std::cell::RefCell;
use std::collections::HashMap;
use std::rc::Rc;

/* 雜湊搜尋（陣列） */
fn hashing_search_array<'a>(map: &'a HashMap<i32, usize>, target: i32) -> Option<&'a usize> {
    // 雜湊表的 key 為目標元素，value 為索引
    // 若雜湊表中沒有這個 key，則回傳 None
    map.get(&target)
}

/* 雜湊搜尋（鏈結串列） */
fn hashing_search_linked_list(
    map: &HashMap<i32, Rc<RefCell<ListNode<i32>>>>,
    target: i32,
) -> Option<&Rc<RefCell<ListNode<i32>>>> {
    // 雜湊表的 key 為目標節點的值，value 為節點物件
    // 若雜湊表中沒有這個 key，則回傳 None
    map.get(&target)
}

/* 主程式 */
pub fn main() {
    let target = 3;

    /* 雜湊搜尋（陣列） */
    let nums = [1, 5, 3, 2, 4, 7, 5, 9, 10, 8];
    // 初始化雜湊表
    let mut map = HashMap::new();
    for (i, num) in nums.iter().enumerate() {
        map.insert(*num, i); // key 為元素，value 為索引
    }
    let index = hashing_search_array(&map, target);
    println!("目標元素 3 的索引 = {}", index.unwrap());

    /* 雜湊搜尋（鏈結串列） */
    let head = ListNode::arr_to_linked_list(&nums);
    // 初始化雜湊表
    // let mut map1 = HashMap::new();
    let map1 = ListNode::linked_list_to_hashmap(head);
    let node = hashing_search_linked_list(&map1, target);
    println!("目標值 3 對應的節點物件為 {:?}", node);
}
