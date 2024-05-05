/*
 * File: linked_list.rs
 * Created Time: 2023-03-05
 * Author: codingonion (coderonion@gmail.com)
 */

include!("../include/include.rs");

use list_node::ListNode;
use std::cell::RefCell;
use std::rc::Rc;

/* Insert node P after node n0 in the linked list */
#[allow(non_snake_case)]
pub fn insert<T>(n0: &Rc<RefCell<ListNode<T>>>, P: Rc<RefCell<ListNode<T>>>) {
    let n1 = n0.borrow_mut().next.take();
    P.borrow_mut().next = n1;
    n0.borrow_mut().next = Some(P);
}

/* Remove the first node after node n0 in the linked list */
#[allow(non_snake_case)]
pub fn remove<T>(n0: &Rc<RefCell<ListNode<T>>>) {
    if n0.borrow().next.is_none() {
        return;
    };
    // n0 -> P -> n1
    let P = n0.borrow_mut().next.take();
    if let Some(node) = P {
        let n1 = node.borrow_mut().next.take();
        n0.borrow_mut().next = n1;
    }
}

/* Access the node at `index` in the linked list */
pub fn access<T>(head: Rc<RefCell<ListNode<T>>>, index: i32) -> Rc<RefCell<ListNode<T>>> {
    if index <= 0 {
        return head;
    };
    if let Some(node) = &head.borrow().next {
        return access(node.clone(), index - 1);
    }

    return head;
}

/* Search for the first node with value target in the linked list */
pub fn find<T: PartialEq>(head: Rc<RefCell<ListNode<T>>>, target: T, index: i32) -> i32 {
    if head.borrow().val == target {
        return index;
    };
    if let Some(node) = &head.borrow_mut().next {
        return find(node.clone(), target, index + 1);
    }
    return -1;
}

/* Driver Code */
fn main() {
    /* Initialize linked list */
    // Initialize each node
    let n0 = ListNode::new(1);
    let n1 = ListNode::new(3);
    let n2 = ListNode::new(2);
    let n3 = ListNode::new(5);
    let n4 = ListNode::new(4);
    // Build references between nodes
    n0.borrow_mut().next = Some(n1.clone());
    n1.borrow_mut().next = Some(n2.clone());
    n2.borrow_mut().next = Some(n3.clone());
    n3.borrow_mut().next = Some(n4.clone());
    print!("Initial linked list");
    print_util::print_linked_list(&n0);

    /* Insert node */
    insert(&n0, ListNode::new(0));
    print!("Linked list after node insertion");
    print_util::print_linked_list(&n0);

    /* Remove node */
    remove(&n0);
    print!("Linked list after node removal");
    print_util::print_linked_list(&n0);

    /* Access node */
    let node = access(n0.clone(), 3);
    println!("The value of the node at index 3 in the linked list = {}", node.borrow().val);

    /* Search node */
    let index = find(n0.clone(), 2, 0);
    println!("The index of the node with value 2 in the linked list = {}", index);
}
