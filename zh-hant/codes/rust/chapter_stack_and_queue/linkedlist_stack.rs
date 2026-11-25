/*
 * File: linkedlist_stack.rs
 * Created Time: 2023-03-11
 * Author: codingonion (coderonion@gmail.com)
 */

use hello_algo_rust::include::{print_util, ListNode};

use std::cell::RefCell;
use std::rc::Rc;

/* 以鏈結串列實作堆疊 */
#[allow(dead_code)]
pub struct LinkedListStack<T> {
    stack_peek: Option<Rc<RefCell<ListNode<T>>>>, // 以首節點作為堆疊頂端
    stk_size: usize,                              // 堆疊長度
}

impl<T: Copy> LinkedListStack<T> {
    pub fn new() -> Self {
        Self {
            stack_peek: None,
            stk_size: 0,
        }
    }

    /* 取得堆疊長度 */
    pub fn size(&self) -> usize {
        return self.stk_size;
    }

    /* 判斷堆疊是否為空 */
    pub fn is_empty(&self) -> bool {
        return self.size() == 0;
    }

    /* 推入堆疊 */
    pub fn push(&mut self, num: T) {
        let node = ListNode::new(num);
        node.borrow_mut().next = self.stack_peek.take();
        self.stack_peek = Some(node);
        self.stk_size += 1;
    }

    /* 彈出堆疊頂端的元素 */
    pub fn pop(&mut self) -> Option<T> {
        self.stack_peek.take().map(|old_head| {
            self.stack_peek = old_head.borrow_mut().next.take();
            self.stk_size -= 1;

            old_head.borrow().val
        })
    }

    /* 取得堆疊頂端節點的參照 */
    pub fn peek(&self) -> Option<&Rc<RefCell<ListNode<T>>>> {
        self.stack_peek.as_ref()
    }

    /* 將鏈結串列轉成 Vec 並回傳 */
    pub fn to_array(&self) -> Vec<T> {
        fn _to_array<T: Sized + Copy>(head: Option<&Rc<RefCell<ListNode<T>>>>) -> Vec<T> {
            if let Some(node) = head {
                let mut nums = _to_array(node.borrow().next.as_ref());
                nums.push(node.borrow().val);
                return nums;
            }
            return Vec::new();
        }

        _to_array(self.peek())
    }
}

/* 範例程式 */
fn main() {
    /* 初始化堆疊 */
    let mut stack = LinkedListStack::new();

    /* 將元素推入堆疊 */
    stack.push(1);
    stack.push(3);
    stack.push(2);
    stack.push(5);
    stack.push(4);
    print!("堆疊 stack = ");
    print_util::print_array(&stack.to_array());

    /* 讀取堆疊頂端的元素 */
    let peek = stack.peek().unwrap().borrow().val;
    print!("\n堆疊頂端元素 peek = {}", peek);

    /* 從堆疊彈出元素 */
    let pop = stack.pop().unwrap();
    print!("\n彈出的元素 pop = {}，彈出後 stack = ", pop);
    print_util::print_array(&stack.to_array());

    /* 取得堆疊長度 */
    let size = stack.size();
    print!("\n堆疊長度 size = {}", size);

    /* 判斷堆疊是否為空 */
    let is_empty = stack.is_empty();
    print!("\n堆疊是否為空 = {}", is_empty);
}
