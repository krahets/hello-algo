/*
 * File: linear_search.rs
 * Created Time: 2023-07-09
 * Author: codingonion (coderonion@gmail.com)
 */

use hello_algo_rust::include::ListNode;
use std::cell::RefCell;
use std::rc::Rc;

/* 배열에서의 선형 탐색 */
fn linear_search_array(nums: &[i32], target: i32) -> i32 {
    // 배열을 순회한다.
    for (i, num) in nums.iter().enumerate() {
        // 목표 원소를 찾았으므로 그 인덱스를 반환한다.
        if num == &target {
            return i as i32;
        }
    }
    // 목표 원소를 찾지 못했으므로 -1을 반환한다.
    return -1;
}

/* 연결 리스트에서의 선형 탐색 */
fn linear_search_linked_list(
    head: Rc<RefCell<ListNode<i32>>>,
    target: i32,
) -> Option<Rc<RefCell<ListNode<i32>>>> {
    // 목표 노드를 찾았으므로 해당 노드를 반환한다.
    if head.borrow().val == target {
        return Some(head);
    };
    // 목표 노드를 찾았으므로 해당 노드를 반환한다.
    if let Some(node) = &head.borrow_mut().next {
        return linear_search_linked_list(node.clone(), target);
    }
    // 목표 노드를 찾지 못했으므로 None을 반환한다.
    return None;
}

/* 실행 예제 */
pub fn main() {
    let target = 3;

    /* 배열에서 선형 탐색 수행 */
    let nums = [1, 5, 3, 2, 4, 7, 5, 9, 10, 8];
    let index = linear_search_array(&nums, target);
    println!("목표 원소 3의 인덱스 = {}", index);

    /* 연결 리스트에서 선형 탐색 수행 */
    let head = ListNode::arr_to_linked_list(&nums);
    let node = linear_search_linked_list(head.unwrap(), target);
    println!("값이 3인 목표 노드의 객체 = {:?}", node);
}
