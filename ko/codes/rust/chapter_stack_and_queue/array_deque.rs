/*
 * File: array_deque.rs
 * Created Time: 2023-03-11
 * Author: codingonion (coderonion@gmail.com)
 */
use hello_algo_rust::include::print_util;
/* 원형 배열로 구현한 덱 */
struct ArrayDeque<T> {
    nums: Vec<T>,    // 덱의 원소를 저장하는 배열
    front: usize,    // 맨 앞 원소를 가리키는 맨 앞 포인터
    que_size: usize, // 덱 길이
}

impl<T: Copy + Default> ArrayDeque<T> {
    /* 생성자 */
    pub fn new(capacity: usize) -> Self {
        Self {
            nums: vec![T::default(); capacity],
            front: 0,
            que_size: 0,
        }
    }

    /* 덱의 용량 반환 */
    pub fn capacity(&self) -> usize {
        self.nums.len()
    }

    /* 덱의 길이 반환 */
    pub fn size(&self) -> usize {
        self.que_size
    }

    /* 덱이 비어 있는지 판단 */
    pub fn is_empty(&self) -> bool {
        self.que_size == 0
    }

    /* 원형 배열 인덱스 계산 */
    fn index(&self, i: i32) -> usize {
        // 나머지 연산을 통해 배열의 처음과 끝을 연결한다
        // i가 배열의 끝을 넘어가면 처음으로 돌아온다
        // i가 배열의 처음을 넘어가면 끝으로 돌아온다
        ((i + self.capacity() as i32) % self.capacity() as i32) as usize
    }

    /* 맨 앞에 삽입 */
    pub fn push_first(&mut self, num: T) {
        if self.que_size == self.capacity() {
            println!("덱이 가득 찼다");
            return;
        }
        // 맨 앞 포인터를 왼쪽으로 한 칸 이동한다
        // 나머지 연산을 통해 front가 배열의 처음을 넘어가면 끝으로 돌아오게 한다
        self.front = self.index(self.front as i32 - 1);
        // num을 맨 앞에 추가한다
        self.nums[self.front] = num;
        self.que_size += 1;
    }

    /* 맨 뒤에 삽입 */
    pub fn push_last(&mut self, num: T) {
        if self.que_size == self.capacity() {
            println!("덱이 가득 찼다");
            return;
        }
        // 맨 뒤 인덱스 + 1을 가리키는 맨 뒤 포인터를 계산한다
        let rear = self.index(self.front as i32 + self.que_size as i32);
        // num을 맨 뒤에 추가한다
        self.nums[rear] = num;
        self.que_size += 1;
    }

    /* 맨 앞에서 꺼내기 */
    fn pop_first(&mut self) -> T {
        let num = self.peek_first();
        // 맨 앞 포인터를 뒤로 한 칸 이동한다
        self.front = self.index(self.front as i32 + 1);
        self.que_size -= 1;
        num
    }

    /* 맨 뒤에서 꺼내기 */
    fn pop_last(&mut self) -> T {
        let num = self.peek_last();
        self.que_size -= 1;
        num
    }

    /* 맨 앞 원소 접근 */
    fn peek_first(&self) -> T {
        if self.is_empty() {
            panic!("덱이 비어 있다")
        };
        self.nums[self.front]
    }

    /* 맨 뒤 원소 접근 */
    fn peek_last(&self) -> T {
        if self.is_empty() {
            panic!("덱이 비어 있다")
        };
        // 마지막 원소의 인덱스를 계산한다
        let last = self.index(self.front as i32 + self.que_size as i32 - 1);
        self.nums[last]
    }

    /* 출력에 사용할 배열 반환 */
    fn to_array(&self) -> Vec<T> {
        // 유효한 길이 범위 안의 리스트 원소만 변환한다
        let mut res = vec![T::default(); self.que_size];
        let mut j = self.front;
        for i in 0..self.que_size {
            res[i] = self.nums[self.index(j as i32)];
            j += 1;
        }
        res
    }
}

/* 실행 코드 */
fn main() {
    /* 덱 초기화 */
    let mut deque = ArrayDeque::new(10);
    deque.push_last(3);
    deque.push_last(2);
    deque.push_last(5);
    print!("덱 deque = ");
    print_util::print_array(&deque.to_array());

    /* 원소 접근 */
    let peek_first = deque.peek_first();
    print!("\n맨 앞 원소 peek_first = {}", peek_first);
    let peek_last = deque.peek_last();
    print!("\n맨 뒤 원소 peek_last = {}", peek_last);

    /* 큐에 원소 삽입 */
    deque.push_last(4);
    print!("\n원소 4를 뒤에 삽입한 뒤 deque = ");
    print_util::print_array(&deque.to_array());
    deque.push_first(1);
    print!("\n원소 1을 앞에 삽입한 뒤 deque = ");
    print_util::print_array(&deque.to_array());

    /* 큐에서 원소 꺼내기 */
    let pop_last = deque.pop_last();
    print!("\n뒤에서 꺼낸 원소 = {}, 꺼낸 뒤 deque = ", pop_last);
    print_util::print_array(&deque.to_array());
    let pop_first = deque.pop_first();
    print!("\n앞에서 꺼낸 원소 = {}, 꺼낸 뒤 deque = ", pop_first);
    print_util::print_array(&deque.to_array());

    /* 덱의 길이 반환 */
    let size = deque.size();
    print!("\n덱 길이 size = {}", size);

    /* 덱이 비어 있는지 판단 */
    let is_empty = deque.is_empty();
    print!("\n덱이 비어 있는가 = {}", is_empty);
}
