/*
 * File: linear_search.rs
 * Created Time: 2023-07-09
 * Author: codingonion (coderonion@gmail.com)
 */

use hello_algo_rust::include::ListNode;
use std::cell::RefCell;
use std::rc::Rc;

/* Линейный поиск в массиве */
fn linear_search_array(nums: &[i32], target: i32) -> i32 {
    // Обходим массив
    for (i, num) in nums.iter().enumerate() {
        // Элемент найден, возвращаем его индекс
        if num == &target {
            return i as i32;
        }
    }
    // Элемент не найден, возвращаем -1
    return -1;
}

/* Линейный поиск в связном списке */
fn linear_search_linked_list(
    head: Rc<RefCell<ListNode<i32>>>,
    target: i32,
) -> Option<Rc<RefCell<ListNode<i32>>>> {
    // Нужный узел найден, возвращаем его
    if head.borrow().val == target {
        return Some(head);
    };
    // Нужный узел найден, возвращаем его
    if let Some(node) = &head.borrow_mut().next {
        return linear_search_linked_list(node.clone(), target);
    }
    // Нужный узел не найден, возвращаем None
    return None;
}

/* Пример использования */
pub fn main() {
    let target = 3;

    /* Выполняем линейный поиск в массиве */
    let nums = [1, 5, 3, 2, 4, 7, 5, 9, 10, 8];
    let index = linear_search_array(&nums, target);
    println!("Индекс элемента 3 = {}", index);

    /* Выполняем линейный поиск в связном списке */
    let head = ListNode::arr_to_linked_list(&nums);
    let node = linear_search_linked_list(head.unwrap(), target);
    println!("Узел со значением 3: {:?}", node);
}
