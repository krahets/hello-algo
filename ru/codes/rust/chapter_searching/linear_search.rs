/*
 * File: linear_search.rs
 * Created Time: 2023-07-09
 * Author: codingonion (coderonion@gmail.com)
 */

use hello_algo_rust::include::ListNode;
use std::cell::RefCell;
use std::rc::Rc;

/* Линейный поиск (массив) */
fn linear_search_array(nums: &[i32], target: i32) -> i32 {
    // Обход массива
    for (i, num) in nums.iter().enumerate() {
        // Целевой элемент найден, вернуть его индекс
        if num == &target {
            return i as i32;
        }
    }
    // Целевой элемент не найден, вернуть -1
    return -1;
}

/* Линейный поиск (связный список) */
fn linear_search_linked_list(
    head: Rc<RefCell<ListNode<i32>>>,
    target: i32,
) -> Option<Rc<RefCell<ListNode<i32>>>> {
    // Найти целевой узел и вернуть его
    if head.borrow().val == target {
        return Some(head);
    };
    // Найти целевой узел и вернуть его
    if let Some(node) = &head.borrow_mut().next {
        return linear_search_linked_list(node.clone(), target);
    }
    // Целевой узел не найден, вернуть None
    return None;
}

/* Driver Code */
pub fn main() {
    let target = 3;

    /* Выполнить линейный поиск в массиве */
    let nums = [1, 5, 3, 2, 4, 7, 5, 9, 10, 8];
    let index = linear_search_array(&nums, target);
    println!("Индекс целевого элемента 3 = {}", index);

    /* Выполнить линейный поиск в связном списке */
    let head = ListNode::arr_to_linked_list(&nums);
    let node = linear_search_linked_list(head.unwrap(), target);
    println!("Объект узла со значением 3 = {:?}", node);
}
