/*
 * File: my_heap.rs
 * Created Time: 2023-07-16
 * Author: night-cruise (2586447362@qq.com)
 */

use hello_algo_rust::include::print_util;

/* 최대 힙 */
struct MaxHeap {
    // 배열 대신 vector를 사용하면 용량 확장을 고려할 필요가 없다
    max_heap: Vec<i32>,
}

impl MaxHeap {
    /* 생성자: 입력 리스트를 바탕으로 힙 구성 */
    fn new(nums: Vec<i32>) -> Self {
        // 리스트 원소를 그대로 힙에 추가한다
        let mut heap = MaxHeap { max_heap: nums };
        // 리프 노드를 제외한 모든 노드에 힙 재정렬을 수행한다
        for i in (0..=Self::parent(heap.size() - 1)).rev() {
            heap.sift_down(i);
        }
        heap
    }

    /* 왼쪽 자식 노드의 인덱스 반환 */
    fn left(i: usize) -> usize {
        2 * i + 1
    }

    /* 오른쪽 자식 노드의 인덱스 반환 */
    fn right(i: usize) -> usize {
        2 * i + 2
    }

    /* 부모 노드의 인덱스 반환 */
    fn parent(i: usize) -> usize {
        (i - 1) / 2 // 나눗셈의 결과를 내림한다
    }

    /* 원소 교환 */
    fn swap(&mut self, i: usize, j: usize) {
        self.max_heap.swap(i, j);
    }

    /* 힙 크기 반환 */
    fn size(&self) -> usize {
        self.max_heap.len()
    }

    /* 힙이 비어 있는지 판단 */
    fn is_empty(&self) -> bool {
        self.max_heap.is_empty()
    }

    /* 힙의 루트 원소 접근 */
    fn peek(&self) -> Option<i32> {
        self.max_heap.first().copied()
    }

    /* 힙에 원소 삽입 */
    fn push(&mut self, val: i32) {
        // 노드 추가
        self.max_heap.push(val);
        // 아래에서 위로 힙을 재정렬한다
        self.sift_up(self.size() - 1);
    }

    /* 노드 i에서 시작하여 아래에서 위로 힙 재정렬 */
    fn sift_up(&mut self, mut i: usize) {
        loop {
            // 노드 i가 이미 힙의 루트이므로 힙 재정렬을 마친다
            if i == 0 {
                break;
            }
            // 노드 i의 부모 노드를 구한다
            let p = Self::parent(i);
            // 노드를 조정할 필요가 없으면 힙 재정렬을 마친다
            if self.max_heap[i] <= self.max_heap[p] {
                break;
            }
            // 두 노드를 교환한다
            self.swap(i, p);
            // 위쪽으로 힙 재정렬을 반복한다
            i = p;
        }
    }

    /* 힙에서 원소 꺼내기 */
    fn pop(&mut self) -> i32 {
        // 비어 있는 경우를 처리한다
        if self.is_empty() {
            panic!("인덱스가 범위를 벗어났다");
        }
        // 루트 노드와 가장 오른쪽 리프 노드를 교환한다(첫 원소와 마지막 원소 교환)
        self.swap(0, self.size() - 1);
        // 노드 삭제
        let val = self.max_heap.pop().unwrap();
        // 위에서 아래로 힙을 재정렬한다
        self.sift_down(0);
        // 힙의 루트 원소를 반환한다
        val
    }

    /* 노드 i에서 시작하여 위에서 아래로 힙 재정렬 */
    fn sift_down(&mut self, mut i: usize) {
        loop {
            // 노드 i, l, r 중 값이 가장 큰 노드를 찾아 ma로 표시한다
            let (l, r, mut ma) = (Self::left(i), Self::right(i), i);
            if l < self.size() && self.max_heap[l] > self.max_heap[ma] {
                ma = l;
            }
            if r < self.size() && self.max_heap[r] > self.max_heap[ma] {
                ma = r;
            }
            // 노드 i의 값이 가장 크거나 인덱스 l, r이 범위를 벗어나면 힙을 더 재정렬할 필요가 없으므로 종료한다
            if ma == i {
                break;
            }
            // 두 노드를 교환한다
            self.swap(i, ma);
            // 아래쪽으로 힙 재정렬을 반복한다
            i = ma;
        }
    }

    /* 힙 출력(이진 트리) */
    fn print(&self) {
        print_util::print_heap(self.max_heap.clone());
    }
}

/* 실행 코드 */
fn main() {
    /* 최대 힙 초기화 */
    let mut max_heap = MaxHeap::new(vec![9, 8, 6, 6, 7, 5, 2, 1, 4, 3, 6, 2]);
    println!("\n리스트를 입력하여 힙을 구성한 후");
    max_heap.print();

    /* 힙의 루트 원소 반환 */
    let peek = max_heap.peek();
    if let Some(peek) = peek {
        println!("\n힙의 루트 원소: {}", peek);
    }

    /* 힙에 원소 삽입 */
    let val = 7;
    max_heap.push(val);
    println!("\n원소 {} 삽입 후의 힙", val);
    max_heap.print();

    /* 힙의 루트 원소 꺼내기 */
    let peek = max_heap.pop();
    println!("\n루트 원소 {} 삭제 후의 힙", peek);
    max_heap.print();

    /* 힙 크기 반환 */
    let size = max_heap.size();
    println!("\n힙의 원소 개수: {}", size);

    /* 힙이 비어 있는지 판단 */
    let is_empty = max_heap.is_empty();
    println!("\n힙이 비어 있는가: {}", is_empty);
}
