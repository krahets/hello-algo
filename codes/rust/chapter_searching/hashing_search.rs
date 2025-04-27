/*
 * File: hashing_search.rs
 * Created Time: 2023-07-09
 * Author: codingonion (coderonion@gmail.com)
 */

use hello_algo_rust::include::ListNode;
use std::cell::RefCell;
use std::collections::HashMap;
use std::rc::Rc;

/* 哈希查找（数组） */
fn hashing_search_array<'a>(map: &'a HashMap<i32, usize>, target: i32) -> Option<&'a usize> {
    // 哈希表的 key: 目标元素，value: 索引
    // 若哈希表中无此 key ，返回 None
    map.get(&target)
}

/* 哈希查找（链表） */
fn hashing_search_linked_list(
    map: &HashMap<i32, Rc<RefCell<ListNode<i32>>>>,
    target: i32,
) -> Option<&Rc<RefCell<ListNode<i32>>>> {
    // 哈希表的 key: 目标节点值，value: 节点对象
    // 若哈希表中无此 key ，返回 None
    map.get(&target)
}

/* Driver Code */
pub fn main() {
    let target = 3;

    /* 哈希查找（数组） */
    let nums = [1, 5, 3, 2, 4, 7, 5, 9, 10, 8];
    // 初始化哈希表
    let mut map = HashMap::new();
    for (i, num) in nums.iter().enumerate() {
        map.insert(*num, i); // key: 元素，value: 索引
    }
    let index = hashing_search_array(&map, target);
    println!("目标元素 3 的索引 = {}", index.unwrap());

    /* 哈希查找（链表） */
    let head = ListNode::arr_to_linked_list(&nums);
    // 初始化哈希表
    // let mut map1 = HashMap::new();
    let map1 = ListNode::linked_list_to_hashmap(head);
    let node = hashing_search_linked_list(&map1, target);
    println!("目标节点值 3 的对应节点对象为 {:?}", node);
}
