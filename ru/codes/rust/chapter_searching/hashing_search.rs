/*
 * File: hashing_search.rs
 * Created Time: 2023-07-09
 * Author: codingonion (coderonion@gmail.com)
 */

use hello_algo_rust::include::ListNode;
use std::cell::RefCell;
use std::collections::HashMap;
use std::rc::Rc;

/* Поиск по хеш-таблице в массиве */
fn hashing_search_array<'a>(map: &'a HashMap<i32, usize>, target: i32) -> Option<&'a usize> {
    // Ключ хеш-таблицы — искомый элемент, значение — его индекс
    // Если ключа в хеш-таблице нет, возвращаем None
    map.get(&target)
}

/* Поиск по хеш-таблице в связном списке */
fn hashing_search_linked_list(
    map: &HashMap<i32, Rc<RefCell<ListNode<i32>>>>,
    target: i32,
) -> Option<&Rc<RefCell<ListNode<i32>>>> {
    // Ключ хеш-таблицы — искомое значение узла, значение таблицы — сам узел
    // Если ключа в хеш-таблице нет, возвращаем None
    map.get(&target)
}

/* Пример использования */
pub fn main() {
    let target = 3;

    /* Поиск по хеш-таблице в массиве */
    let nums = [1, 5, 3, 2, 4, 7, 5, 9, 10, 8];
    // Создаём хеш-таблицу
    let mut map = HashMap::new();
    for (i, num) in nums.iter().enumerate() {
        map.insert(*num, i); // Ключ — элемент, значение — индекс
    }
    let index = hashing_search_array(&map, target);
    println!("Индекс элемента 3 = {}", index.unwrap());

    /* Поиск по хеш-таблице в связном списке */
    let head = ListNode::arr_to_linked_list(&nums);
    // Создаём хеш-таблицу
    // let mut map1 = HashMap::new();
    let map1 = ListNode::linked_list_to_hashmap(head);
    let node = hashing_search_linked_list(&map1, target);
    println!("Узел со значением 3: {:?}", node);
}
