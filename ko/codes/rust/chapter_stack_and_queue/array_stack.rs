/*
 * File: array_stack.rs
 * Created Time: 2023-02-05
 * Author: WSL0809 (wslzzy@outlook.com), codingonion (coderonion@gmail.com)
 */

use hello_algo_rust::include::print_util;

/* 배열로 구현한 스택 */
struct ArrayStack<T> {
    stack: Vec<T>,
}

impl<T> ArrayStack<T> {
    /* 스택 초기화 */
    fn new() -> ArrayStack<T> {
        ArrayStack::<T> {
            stack: Vec::<T>::new(),
        }
    }

    /* 스택의 길이 반환 */
    fn size(&self) -> usize {
        self.stack.len()
    }

    /* 스택이 비어 있는지 판단 */
    fn is_empty(&self) -> bool {
        self.size() == 0
    }

    /* 스택에 삽입 */
    fn push(&mut self, num: T) {
        self.stack.push(num);
    }

    /* 스택에서 꺼내기 */
    fn pop(&mut self) -> Option<T> {
        self.stack.pop()
    }

    /* 스택 맨 위 원소 접근 */
    fn peek(&self) -> Option<&T> {
        if self.is_empty() {
            panic!("스택이 비어 있다")
        };
        self.stack.last()
    }

    /* &Vec를 반환한다 */
    fn to_array(&self) -> &Vec<T> {
        &self.stack
    }
}

/* 실행 코드 */
fn main() {
    // 스택 초기화
    let mut stack = ArrayStack::<i32>::new();

    // 스택에 원소 삽입
    stack.push(1);
    stack.push(3);
    stack.push(2);
    stack.push(5);
    stack.push(4);
    print!("스택 stack = ");
    print_util::print_array(stack.to_array());

    //스택 맨 위 원소 접근
    let peek = stack.peek().unwrap();
    print!("\n스택 맨 위 원소 peek = {}", peek);

    // 스택에서 원소 꺼내기
    let pop = stack.pop().unwrap();
    print!("\n꺼낸 원소 pop = {pop}, 꺼낸 뒤 stack = ");
    print_util::print_array(stack.to_array());

    // 스택의 길이 반환
    let size = stack.size();
    print!("\n스택 길이 size = {size}");

    // 비어 있는지 판단
    let is_empty = stack.is_empty();
    print!("\n스택이 비어 있는가 = {is_empty}");
}
