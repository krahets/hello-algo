/*
 * File: list_node.rs
 * Created Time: 2023-03-05
 * Author: codingonion (coderonion@gmail.com), rongyi (hiarongyi@gmail.com)
 */

// [region]{import_cell}
use std::cell::RefCell;
// [endregion]{import_cell}
use std::collections::HashMap;
// [region]{import_rc}
use std::rc::Rc;
// [endregion]{import_rc}

// [region]{list_node}
#[derive(Debug)]
pub struct ListNode<T> {
    pub val: T, // 节点值
    pub next: Option<Rc<RefCell<ListNode<T>>>>, // 后继节点指针
}

impl<T> ListNode<T> {
    pub fn new(val: T) -> Rc<RefCell<ListNode<T>>> {
        Rc::new(RefCell::new(ListNode { val, next: None }))
    }
// [endregion]{list_node}

    /* 将数组反序列化为链表 */
    pub fn arr_to_linked_list(array: &[T]) -> Option<Rc<RefCell<ListNode<T>>>>
    where
        T: Copy + Clone,
    {
        let mut head = None;
        // insert in reverse order
        for item in array.iter().rev() {
            let node = Rc::new(RefCell::new(ListNode {
                val: *item,
                next: head.take(),
            }));
            head = Some(node);
        }
        head
    }

    /* 将链表转化为哈希表 */
    pub fn linked_list_to_hashmap(
        linked_list: Option<Rc<RefCell<ListNode<T>>>>,
    ) -> HashMap<T, Rc<RefCell<ListNode<T>>>>
    where
        T: std::hash::Hash + Eq + Copy + Clone,
    {
        let mut hashmap = HashMap::new();
        let mut node = linked_list;

        while let Some(cur) = node {
            let borrow = cur.borrow();
            hashmap.insert(borrow.val.clone(), cur.clone());
            node = borrow.next.clone();
        }

        hashmap
    }
// [region]{list_node_end}
}
// [endregion]{list_node_end}
