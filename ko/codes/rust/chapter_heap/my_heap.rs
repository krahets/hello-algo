/*
 * File: my_heap.rs
 * Created Time: 2023-07-16
 * Author: night-cruise (2586447362@qq.com)
 */

use hello_algo_rust::include::print_util;

/* 최대 힙 */
struct MaxHeap {
    // 용량 확장을 따로 고려할 필요가 없도록 배열 대신 vector 사용
    max_heap: Vec<i32>,
}

impl MaxHeap {
    /* 입력 리스트로 힙을 만드는 생성자 */
    fn new(nums: Vec<i32>) -> Self {
        // 리스트의 원소를 그대로 힙에 추가
        let mut heap = MaxHeap { max_heap: nums };
        // 리프를 제외한 모든 노드에서 힙 복구
        for i in (0..=Self::parent(heap.size() - 1)).rev() {
            heap.sift_down(i);
        }
        heap
    }

    /* 왼쪽 자식 노드의 인덱스 구하기 */
    fn left(i: usize) -> usize {
        2 * i + 1
    }

    /* 오른쪽 자식 노드의 인덱스 구하기 */
    fn right(i: usize) -> usize {
        2 * i + 2
    }

    /* 부모 노드의 인덱스 구하기 */
    fn parent(i: usize) -> usize {
        (i - 1) / 2 // 나눗셈 결과를 내림
    }

    /* 원소 교환 */
    fn swap(&mut self, i: usize, j: usize) {
        self.max_heap.swap(i, j);
    }

    /* 힙 크기 구하기 */
    fn size(&self) -> usize {
        self.max_heap.len()
    }

    /* 힙이 비었는지 확인 */
    fn is_empty(&self) -> bool {
        self.max_heap.is_empty()
    }

    /* 힙의 루트 원소 조회 */
    fn peek(&self) -> Option<i32> {
        self.max_heap.first().copied()
    }

    /* 힙에 원소 삽입 */
    fn push(&mut self, val: i32) {
        // 노드 추가
        self.max_heap.push(val);
        // 아래에서 위로 힙 복구
        self.sift_up(self.size() - 1);
    }

    /* 노드 i부터 아래에서 위로 힙 복구 */
    fn sift_up(&mut self, mut i: usize) {
        loop {
            // 노드 i가 이미 루트에 있으므로 힙 복구 종료
            if i == 0 {
                break;
            }
            // 노드 i의 부모 노드 구하기
            let p = Self::parent(i);
            // 노드를 조정할 필요가 없으면 힙 복구 종료
            if self.max_heap[i] <= self.max_heap[p] {
                break;
            }
            // 두 노드 교환
            self.swap(i, p);
            // 위로 올라가며 힙 복구 반복
            i = p;
        }
    }

    /* 힙에서 원소 꺼내기 */
    fn pop(&mut self) -> i32 {
        // 빈 힙 처리
        if self.is_empty() {
            panic!("인덱스가 범위를 벗어났다");
        }
        // 루트와 맨 오른쪽 리프 교환(첫 원소와 마지막 원소 교환)
        self.swap(0, self.size() - 1);
        // 노드 삭제
        let val = self.max_heap.pop().unwrap();
        // 위에서 아래로 힙 복구
        self.sift_down(0);
        // 힙의 루트 원소 반환
        val
    }

    /* 노드 i부터 위에서 아래로 힙 복구 */
    fn sift_down(&mut self, mut i: usize) {
        loop {
            // 노드 i, l, r 중 값이 가장 큰 노드의 인덱스를 ma에 저장
            let (l, r, mut ma) = (Self::left(i), Self::right(i), i);
            if l < self.size() && self.max_heap[l] > self.max_heap[ma] {
                ma = l;
            }
            if r < self.size() && self.max_heap[r] > self.max_heap[ma] {
                ma = r;
            }
            // 노드 i가 가장 크거나 인덱스 l, r이 범위를 벗어나면 더 복구할 필요가 없으므로 반복 종료
            if ma == i {
                break;
            }
            // 두 노드 교환
            self.swap(i, ma);
            // 아래로 내려가며 힙 복구 반복
            i = ma;
        }
    }

    /* 힙 출력(이진 트리) */
    fn print(&self) {
        print_util::print_heap(self.max_heap.clone());
    }
}

/* 실행 예제 */
fn main() {
    /* 최대 힙 초기화 */
    let mut max_heap = MaxHeap::new(vec![9, 8, 6, 6, 7, 5, 2, 1, 4, 3, 6, 2]);
    println!("\n입력 리스트로 만든 힙:");
    max_heap.print();

    /* 힙의 루트 원소 구하기 */
    let peek = max_heap.peek();
    if let Some(peek) = peek {
        println!("\n힙의 루트 원소: {}", peek);
    }

    /* 힙에 원소 삽입 */
    let val = 7;
    max_heap.push(val);
    println!("\n원소 {} 삽입 후", val);
    max_heap.print();

    /* 힙의 루트 원소 꺼내기 */
    let peek = max_heap.pop();
    println!("\n루트 원소 {} 제거 후", peek);
    max_heap.print();

    /* 힙 크기 구하기 */
    let size = max_heap.size();
    println!("\n힙의 원소 수: {}", size);

    /* 힙이 비었는지 확인 */
    let is_empty = max_heap.is_empty();
    println!("\n빈 힙 여부: {}", is_empty);
}
