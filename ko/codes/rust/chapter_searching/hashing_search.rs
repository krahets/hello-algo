/*
 * File: hashing_search.rs
 * Created Time: 2023-07-09
 * Author: codingonion (coderonion@gmail.com)
 */

use hello_algo_rust::include::ListNode;
use std::cell::RefCell;
use std::collections::HashMap;
use std::rc::Rc;

/* 배열에서의 해시 탐색 */
fn hashing_search_array<'a>(map: &'a HashMap<i32, usize>, target: i32) -> Option<&'a usize> {
    // 해시 테이블의 key는 목표 원소, value는 인덱스다.
    // 해시 테이블에 해당 키가 없으면 None을 반환한다.
    map.get(&target)
}

/* 연결 리스트에서의 해시 탐색 */
fn hashing_search_linked_list(
    map: &HashMap<i32, Rc<RefCell<ListNode<i32>>>>,
    target: i32,
) -> Option<&Rc<RefCell<ListNode<i32>>>> {
    // 해시 테이블의 key는 찾을 노드의 값, value는 노드 객체다.
    // 해시 테이블에 해당 키가 없으면 None을 반환한다.
    map.get(&target)
}

/* 실행 예제 */
pub fn main() {
    let target = 3;

    /* 배열에서의 해시 탐색 */
    let nums = [1, 5, 3, 2, 4, 7, 5, 9, 10, 8];
    // 해시 테이블 초기화
    let mut map = HashMap::new();
    for (i, num) in nums.iter().enumerate() {
        map.insert(*num, i); // key는 원소, value는 인덱스다.
    }
    let index = hashing_search_array(&map, target);
    println!("목표 원소 3의 인덱스 = {}", index.unwrap());

    /* 연결 리스트에서의 해시 탐색 */
    let head = ListNode::arr_to_linked_list(&nums);
    // 해시 테이블 초기화
    // let mut map1 = HashMap::new();
    let map1 = ListNode::linked_list_to_hashmap(head);
    let node = hashing_search_linked_list(&map1, target);
    println!("값이 3인 목표 노드의 객체 = {:?}", node);
}
