/*
 * File: hashing_search.rs
 * Created Time: 2023-07-09
 * Author: codingonion (coderonion@gmail.com)
 */

use hello_algo_rust::include::ListNode;
use std::cell::RefCell;
use std::collections::HashMap;
use std::rc::Rc;

/* Хеш-поиск (массив) */
fn hashing_search_array<'a>(map: &'a HashMap<i32, usize>, target: i32) -> Option<&'a usize> {
    // key хеш-таблицы: целевой элемент, value: индекс
    // Если такого key нет в хеш-таблице, вернуть None
    map.get(&target)
}

/* Хеш-поиск (связный список) */
fn hashing_search_linked_list(
    map: &HashMap<i32, Rc<RefCell<ListNode<i32>>>>,
    target: i32,
) -> Option<&Rc<RefCell<ListNode<i32>>>> {
    // key хеш-таблицы: значение целевого узла, value: объект узла
    // Если такого key нет в хеш-таблице, вернуть None
    map.get(&target)
}

/* Driver Code */
pub fn main() {
    let target = 3;

    /* Хеш-поиск (массив) */
    let nums = [1, 5, 3, 2, 4, 7, 5, 9, 10, 8];
    // Инициализация хеш-таблицы
    let mut map = HashMap::new();
    for (i, num) in nums.iter().enumerate() {
        map.insert(*num, i); // key: элемент, value: индекс
    }
    let index = hashing_search_array(&map, target);
    println!("Индекс целевого элемента 3 = {}", index.unwrap());

    /* Хеш-поиск (связный список) */
    let head = ListNode::arr_to_linked_list(&nums);
    // Инициализировать хеш-таблицу
    // let mut map1 = HashMap::new();
    let map1 = ListNode::linked_list_to_hashmap(head);
    let node = hashing_search_linked_list(&map1, target);
    println!("Объект узла со значением 3 = {:?}", node);
}
