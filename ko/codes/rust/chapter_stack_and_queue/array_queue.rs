/*
 * File: array_queue.rs
 * Created Time: 2023-02-06
 * Author: WSL0809 (wslzzy@outlook.com)
 */

/* 원형 배열로 구현한 큐 */
struct ArrayQueue<T> {
    nums: Vec<T>,      // 큐의 원소를 저장하는 배열
    front: i32,        // 맨 앞 원소를 가리키는 맨 앞 포인터
    que_size: i32,     // 큐 길이
    que_capacity: i32, // 큐 용량
}

impl<T: Copy + Default> ArrayQueue<T> {
    /* 생성자 */
    fn new(capacity: i32) -> ArrayQueue<T> {
        ArrayQueue {
            nums: vec![T::default(); capacity as usize],
            front: 0,
            que_size: 0,
            que_capacity: capacity,
        }
    }

    /* 큐의 용량 반환 */
    fn capacity(&self) -> i32 {
        self.que_capacity
    }

    /* 큐의 길이 반환 */
    fn size(&self) -> i32 {
        self.que_size
    }

    /* 큐가 비어 있는지 판단 */
    fn is_empty(&self) -> bool {
        self.que_size == 0
    }

    /* 큐에 삽입 */
    fn push(&mut self, num: T) {
        if self.que_size == self.capacity() {
            println!("큐가 가득 찼다");
            return;
        }
        // 맨 뒤 인덱스 + 1을 가리키는 맨 뒤 포인터를 계산한다
        // 나머지 연산을 통해 rear가 배열의 끝을 넘어가면 처음으로 돌아오게 한다
        let rear = (self.front + self.que_size) % self.que_capacity;
        // num을 맨 뒤에 추가한다
        self.nums[rear as usize] = num;
        self.que_size += 1;
    }

    /* 큐에서 꺼내기 */
    fn pop(&mut self) -> T {
        let num = self.peek();
        // 맨 앞 포인터를 뒤로 한 칸 이동하고, 끝을 넘어가면 배열의 처음으로 돌아온다
        self.front = (self.front + 1) % self.que_capacity;
        self.que_size -= 1;
        num
    }

    /* 맨 앞 원소 접근 */
    fn peek(&self) -> T {
        if self.is_empty() {
            panic!("인덱스가 범위를 벗어났다");
        }
        self.nums[self.front as usize]
    }

    /* 배열 반환 */
    fn to_vector(&self) -> Vec<T> {
        let cap = self.que_capacity;
        let mut j = self.front;
        let mut arr = vec![T::default(); cap as usize];
        for i in 0..self.que_size {
            arr[i as usize] = self.nums[(j % cap) as usize];
            j += 1;
        }
        arr
    }
}

/* 실행 코드 */
fn main() {
    /* 큐 초기화 */
    let capacity = 10;
    let mut queue = ArrayQueue::new(capacity);

    /* 큐에 원소 삽입 */
    queue.push(1);
    queue.push(3);
    queue.push(2);
    queue.push(5);
    queue.push(4);
    println!("큐 queue = {:?}", queue.to_vector());

    /* 맨 앞 원소 접근 */
    let peek = queue.peek();
    println!("맨 앞 원소 peek = {}", peek);

    /* 큐에서 원소 꺼내기 */
    let pop = queue.pop();
    println!(
        "꺼낸 원소 pop = {:?}, 꺼낸 뒤 queue = {:?}",
        pop,
        queue.to_vector()
    );

    /* 큐의 길이 반환 */
    let size = queue.size();
    println!("큐 길이 size = {}", size);

    /* 큐가 비어 있는지 판단 */
    let is_empty = queue.is_empty();
    println!("큐가 비어 있는가 = {}", is_empty);

    /* 원형 배열 테스트 */
    for i in 0..10 {
        queue.push(i);
        queue.pop();
        println!("{:?}번째 삽입 + 꺼내기 후 queue = {:?}", i, queue.to_vector());
    }
}
