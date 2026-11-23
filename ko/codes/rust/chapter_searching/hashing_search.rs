/*
 * File: hashing_search.rs
 * Created Time: 2023-07-09
 * Author: codingonion (coderonion@gmail.com)
 */

use hello_algo_rust::include::ListNode;
use std::cell::RefCell;
use std::collections::HashMap;
use std::rc::Rc;

/* 해시 탐색(배열) */
fn hashing_search_array<'a>(map: &'a HashMap<i32, usize>, target: i32) -> Option<&'a usize> {
    // 해시 테이블의 key: 목표 원소, value: 인덱스
    // 해시 테이블에 해당 key가 없으면 None을 반환한다
    map.get(&target)
}

/* 해시 탐색(연결 리스트) */
fn hashing_search_linked_list(
    map: &HashMap<i32, Rc<RefCell<ListNode<i32>>>>,
    target: i32,
) -> Option<&Rc<RefCell<ListNode<i32>>>> {
    // 해시 테이블의 key: 목표 노드의 값, value: 노드 객체
    // 해시 테이블에 해당 key가 없으면 None을 반환한다
    map.get(&target)
}

/* 실행 코드 */
pub fn main() {
    let target = 3;

    /* 해시 탐색(배열) */
    let nums = [1, 5, 3, 2, 4, 7, 5, 9, 10, 8];
    // 해시 테이블 초기화
    let mut map = HashMap::new();
    for (i, num) in nums.iter().enumerate() {
        map.insert(*num, i); // key: 원소, value: 인덱스
    }
    let index = hashing_search_array(&map, target);
    println!("목표 원소 3의 인덱스 = {}", index.unwrap());

    /* 해시 탐색(연결 리스트) */
    let head = ListNode::arr_to_linked_list(&nums);
    // 해시 테이블 초기화
    // let mut map1 = HashMap::new();
    let map1 = ListNode::linked_list_to_hashmap(head);
    let node = hashing_search_linked_list(&map1, target);
    println!("목표 노드 값 3에 해당하는 노드 객체: {:?}", node);
}
