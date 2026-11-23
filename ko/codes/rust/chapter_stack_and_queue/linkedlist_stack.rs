/*
 * File: linkedlist_stack.rs
 * Created Time: 2023-03-11
 * Author: codingonion (coderonion@gmail.com)
 */

use hello_algo_rust::include::{print_util, ListNode};

use std::cell::RefCell;
use std::rc::Rc;

/* 연결 리스트로 구현한 스택 */
#[allow(dead_code)]
pub struct LinkedListStack<T> {
    stack_peek: Option<Rc<RefCell<ListNode<T>>>>, // 머리 노드를 스택의 맨 위로 사용한다
    stk_size: usize,                              // 스택의 길이
}

impl<T: Copy> LinkedListStack<T> {
    pub fn new() -> Self {
        Self {
            stack_peek: None,
            stk_size: 0,
        }
    }

    /* 스택의 길이 반환 */
    pub fn size(&self) -> usize {
        return self.stk_size;
    }

    /* 스택이 비어 있는지 판단 */
    pub fn is_empty(&self) -> bool {
        return self.size() == 0;
    }

    /* 스택에 삽입 */
    pub fn push(&mut self, num: T) {
        let node = ListNode::new(num);
        node.borrow_mut().next = self.stack_peek.take();
        self.stack_peek = Some(node);
        self.stk_size += 1;
    }

    /* 스택에서 꺼내기 */
    pub fn pop(&mut self) -> Option<T> {
        self.stack_peek.take().map(|old_head| {
            self.stack_peek = old_head.borrow_mut().next.take();
            self.stk_size -= 1;

            old_head.borrow().val
        })
    }

    /* 스택 맨 위 원소 접근 */
    pub fn peek(&self) -> Option<&Rc<RefCell<ListNode<T>>>> {
        self.stack_peek.as_ref()
    }

    /* List를 Array로 변환하여 반환 */
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

/* 실행 코드 */
fn main() {
    /* 스택 초기화 */
    let mut stack = LinkedListStack::new();

    /* 스택에 원소 삽입 */
    stack.push(1);
    stack.push(3);
    stack.push(2);
    stack.push(5);
    stack.push(4);
    print!("스택 stack = ");
    print_util::print_array(&stack.to_array());

    /* 스택 맨 위 원소 접근 */
    let peek = stack.peek().unwrap().borrow().val;
    print!("\n스택 맨 위 원소 peek = {}", peek);

    /* 스택에서 원소 꺼내기 */
    let pop = stack.pop().unwrap();
    print!("\n꺼낸 원소 pop = {}, 꺼낸 뒤 stack = ", pop);
    print_util::print_array(&stack.to_array());

    /* 스택의 길이 반환 */
    let size = stack.size();
    print!("\n스택 길이 size = {}", size);

    /* 비어 있는지 판단 */
    let is_empty = stack.is_empty();
    print!("\n스택이 비어 있는가 = {}", is_empty);
}
