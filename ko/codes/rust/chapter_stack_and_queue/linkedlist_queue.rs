/*
 * File: linkedlist_queue.rs
 * Created Time: 2023-03-11
 * Author: codingonion (coderonion@gmail.com)
 */

use hello_algo_rust::include::{print_util, ListNode};

use std::cell::RefCell;
use std::rc::Rc;

/* 연결 리스트로 구현한 큐 */
#[allow(dead_code)]
pub struct LinkedListQueue<T> {
    front: Option<Rc<RefCell<ListNode<T>>>>, // 머리 노드 front
    rear: Option<Rc<RefCell<ListNode<T>>>>,  // 꼬리 노드 rear
    que_size: usize,                         // 큐의 길이
}

impl<T: Copy> LinkedListQueue<T> {
    pub fn new() -> Self {
        Self {
            front: None,
            rear: None,
            que_size: 0,
        }
    }

    /* 큐의 길이 반환 */
    pub fn size(&self) -> usize {
        return self.que_size;
    }

    /* 큐가 비어 있는지 판단 */
    pub fn is_empty(&self) -> bool {
        return self.que_size == 0;
    }

    /* 큐에 삽입 */
    pub fn push(&mut self, num: T) {
        // 꼬리 노드 뒤에 num을 추가한다
        let new_rear = ListNode::new(num);
        match self.rear.take() {
            // 큐가 비어 있지 않으면 해당 노드를 꼬리 노드 뒤에 추가한다
            Some(old_rear) => {
                old_rear.borrow_mut().next = Some(new_rear.clone());
                self.rear = Some(new_rear);
            }
            // 큐가 비어 있으면 머리와 꼬리 노드가 모두 해당 노드를 가리키게 한다
            None => {
                self.front = Some(new_rear.clone());
                self.rear = Some(new_rear);
            }
        }
        self.que_size += 1;
    }

    /* 큐에서 꺼내기 */
    pub fn pop(&mut self) -> Option<T> {
        self.front.take().map(|old_front| {
            match old_front.borrow_mut().next.take() {
                Some(new_front) => {
                    self.front = Some(new_front);
                }
                None => {
                    self.rear.take();
                }
            }
            self.que_size -= 1;
            old_front.borrow().val
        })
    }

    /* 맨 앞 원소 접근 */
    pub fn peek(&self) -> Option<&Rc<RefCell<ListNode<T>>>> {
        self.front.as_ref()
    }

    /* 연결 리스트를 Array로 변환하여 반환 */
    pub fn to_array(&self, head: Option<&Rc<RefCell<ListNode<T>>>>) -> Vec<T> {
        let mut res: Vec<T> = Vec::new();

        fn recur<T: Copy>(cur: Option<&Rc<RefCell<ListNode<T>>>>, res: &mut Vec<T>) {
            if let Some(cur) = cur {
                res.push(cur.borrow().val);
                recur(cur.borrow().next.as_ref(), res);
            }
        }

        recur(head, &mut res);

        res
    }
}

/* 실행 코드 */
fn main() {
    /* 큐 초기화 */
    let mut queue = LinkedListQueue::new();

    /* 큐에 원소 삽입 */
    queue.push(1);
    queue.push(3);
    queue.push(2);
    queue.push(5);
    queue.push(4);
    print!("큐 queue = ");
    print_util::print_array(&queue.to_array(queue.peek()));

    /* 맨 앞 원소 접근 */
    let peek = queue.peek().unwrap().borrow().val;
    print!("\n맨 앞 원소 peek = {}", peek);

    /* 큐에서 원소 꺼내기 */
    let pop = queue.pop().unwrap();
    print!("\n꺼낸 원소 pop = {}, 꺼낸 뒤 queue = ", pop);
    print_util::print_array(&queue.to_array(queue.peek()));

    /* 큐의 길이 반환 */
    let size = queue.size();
    print!("\n큐 길이 size = {}", size);

    /* 큐가 비어 있는지 판단 */
    let is_empty = queue.is_empty();
    print!("\n큐가 비어 있는가 = {}", is_empty);
}
