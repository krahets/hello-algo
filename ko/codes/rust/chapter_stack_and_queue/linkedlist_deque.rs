/*
 * File: linkedlist_deque.rs
 * Created Time: 2023-03-11
 * Author: codingonion (coderonion@gmail.com)
 */

use hello_algo_rust::include::print_util;

use std::cell::RefCell;
use std::rc::Rc;

/* 이중 연결 리스트의 노드 */
pub struct ListNode<T> {
    pub val: T,                                 // 노드의 값
    pub next: Option<Rc<RefCell<ListNode<T>>>>, // 다음 노드를 가리키는 포인터
    pub prev: Option<Rc<RefCell<ListNode<T>>>>, // 이전 노드를 가리키는 포인터
}

impl<T> ListNode<T> {
    pub fn new(val: T) -> Rc<RefCell<ListNode<T>>> {
        Rc::new(RefCell::new(ListNode {
            val,
            next: None,
            prev: None,
        }))
    }
}

/* 이중 연결 리스트로 구현한 덱 */
#[allow(dead_code)]
pub struct LinkedListDeque<T> {
    front: Option<Rc<RefCell<ListNode<T>>>>, // 첫 노드 front
    rear: Option<Rc<RefCell<ListNode<T>>>>,  // 마지막 노드 rear
    que_size: usize,                         // 덱의 길이
}

impl<T: Copy> LinkedListDeque<T> {
    pub fn new() -> Self {
        Self {
            front: None,
            rear: None,
            que_size: 0,
        }
    }

    /* 덱의 길이 조회 */
    pub fn size(&self) -> usize {
        return self.que_size;
    }

    /* 덱이 비어 있는지 확인 */
    pub fn is_empty(&self) -> bool {
        return self.que_size == 0;
    }

    /* 삽입 연산 */
    fn push(&mut self, num: T, is_front: bool) {
        let node = ListNode::new(num);
        // 맨 앞에 삽입하는 연산
        if is_front {
            match self.front.take() {
                // 연결 리스트가 비어 있으면 front와 rear가 모두 node를 가리키게 한다
                None => {
                    self.rear = Some(node.clone());
                    self.front = Some(node);
                }
                // 연결 리스트의 맨 앞에 node를 추가한다
                Some(old_front) => {
                    old_front.borrow_mut().prev = Some(node.clone());
                    node.borrow_mut().next = Some(old_front);
                    self.front = Some(node); // 첫 노드 갱신
                }
            }
        }
        // 맨 뒤에 삽입하는 연산
        else {
            match self.rear.take() {
                // 연결 리스트가 비어 있으면 front와 rear가 모두 node를 가리키게 한다
                None => {
                    self.front = Some(node.clone());
                    self.rear = Some(node);
                }
                // 연결 리스트의 맨 뒤에 node를 추가한다
                Some(old_rear) => {
                    old_rear.borrow_mut().next = Some(node.clone());
                    node.borrow_mut().prev = Some(old_rear);
                    self.rear = Some(node); // 마지막 노드 갱신
                }
            }
        }
        self.que_size += 1; // 덱의 길이 갱신
    }

    /* 맨 앞에 삽입 */
    pub fn push_first(&mut self, num: T) {
        self.push(num, true);
    }

    /* 맨 뒤에 삽입 */
    pub fn push_last(&mut self, num: T) {
        self.push(num, false);
    }

    /* 삭제 연산 */
    fn pop(&mut self, is_front: bool) -> Option<T> {
        // 덱이 비어 있으면 즉시 None을 반환한다
        if self.is_empty() {
            return None;
        };
        // 맨 앞에서 꺼내는 연산
        if is_front {
            self.front.take().map(|old_front| {
                match old_front.borrow_mut().next.take() {
                    Some(new_front) => {
                        new_front.borrow_mut().prev.take();
                        self.front = Some(new_front); // 첫 노드 갱신
                    }
                    None => {
                        self.rear.take();
                    }
                }
                self.que_size -= 1; // 덱의 길이 갱신
                old_front.borrow().val
            })
        }
        // 맨 뒤에서 꺼내는 연산
        else {
            self.rear.take().map(|old_rear| {
                match old_rear.borrow_mut().prev.take() {
                    Some(new_rear) => {
                        new_rear.borrow_mut().next.take();
                        self.rear = Some(new_rear); // 마지막 노드 갱신
                    }
                    None => {
                        self.front.take();
                    }
                }
                self.que_size -= 1; // 덱의 길이 갱신
                old_rear.borrow().val
            })
        }
    }

    /* 맨 앞에서 꺼내기 */
    pub fn pop_first(&mut self) -> Option<T> {
        return self.pop(true);
    }

    /* 맨 뒤에서 꺼내기 */
    pub fn pop_last(&mut self) -> Option<T> {
        return self.pop(false);
    }

    /* 맨 앞 원소 조회 */
    pub fn peek_first(&self) -> Option<&Rc<RefCell<ListNode<T>>>> {
        self.front.as_ref()
    }

    /* 맨 뒤 원소 조회 */
    pub fn peek_last(&self) -> Option<&Rc<RefCell<ListNode<T>>>> {
        self.rear.as_ref()
    }

    /* 출력할 동적 배열(Vec) 반환 */
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

/* 실행 예제 */
fn main() {
    /* 덱 초기화 */
    let mut deque = LinkedListDeque::new();
    deque.push_last(3);
    deque.push_last(2);
    deque.push_last(5);
    print!("덱 deque = ");
    print_util::print_array(&deque.to_array(deque.peek_first()));

    /* 원소 조회 */
    let peek_first = deque.peek_first().unwrap().borrow().val;
    print!("\n맨 앞 원소 peek_first = {}", peek_first);
    let peek_last = deque.peek_last().unwrap().borrow().val;
    print!("\n맨 뒤 원소 peek_last = {}", peek_last);

    /* 덱에 원소 삽입 */
    deque.push_last(4);
    print!("\n맨 뒤에 원소 4를 삽입한 후 deque = ");
    print_util::print_array(&deque.to_array(deque.peek_first()));
    deque.push_first(1);
    print!("\n맨 앞에 원소 1을 삽입한 후 deque = ");
    print_util::print_array(&deque.to_array(deque.peek_first()));

    /* 덱에서 원소 꺼내기 */
    let pop_last = deque.pop_last().unwrap();
    print!("\n맨 뒤에서 꺼낸 원소 = {}, 맨 뒤에서 꺼낸 후 deque = ", pop_last);
    print_util::print_array(&deque.to_array(deque.peek_first()));
    let pop_first = deque.pop_first().unwrap();
    print!("\n맨 앞에서 꺼낸 원소 = {}, 맨 앞에서 꺼낸 후 deque = ", pop_first);
    print_util::print_array(&deque.to_array(deque.peek_first()));

    /* 덱의 길이 조회 */
    let size = deque.size();
    print!("\n덱의 길이 size = {}", size);

    /* 덱이 비어 있는지 확인 */
    let is_empty = deque.is_empty();
    print!("\n덱이 비어 있는가 = {}", is_empty);
}
