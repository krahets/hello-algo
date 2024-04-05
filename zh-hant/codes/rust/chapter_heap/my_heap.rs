/*
 * File: my_heap.rs
 * Created Time: 2023-07-16
 * Author: night-cruise (2586447362@qq.com)
 */

include!("../include/include.rs");

/* 大頂堆積 */
struct MaxHeap {
    // 使用 vector 而非陣列，這樣無須考慮擴容問題
    max_heap: Vec<i32>,
}

impl MaxHeap {
    /* 建構子，根據輸入串列建堆積 */
    fn new(nums: Vec<i32>) -> Self {
        // 將串列元素原封不動新增進堆積
        let mut heap = MaxHeap { max_heap: nums };
        // 堆積化除葉節點以外的其他所有節點
        for i in (0..=Self::parent(heap.size() - 1)).rev() {
            heap.sift_down(i);
        }
        heap
    }

    /* 獲取左子節點的索引 */
    fn left(i: usize) -> usize {
        2 * i + 1
    }

    /* 獲取右子節點的索引 */
    fn right(i: usize) -> usize {
        2 * i + 2
    }

    /* 獲取父節點的索引 */
    fn parent(i: usize) -> usize {
        (i - 1) / 2 // 向下整除
    }

    /* 交換元素 */
    fn swap(&mut self, i: usize, j: usize) {
        self.max_heap.swap(i, j);
    }

    /* 獲取堆積大小 */
    fn size(&self) -> usize {
        self.max_heap.len()
    }

    /* 判斷堆積是否為空 */
    fn is_empty(&self) -> bool {
        self.max_heap.is_empty()
    }

    /* 訪問堆積頂元素 */
    fn peek(&self) -> Option<i32> {
        self.max_heap.first().copied()
    }

    /* 元素入堆積 */
    fn push(&mut self, val: i32) {
        // 新增節點
        self.max_heap.push(val);
        // 從底至頂堆積化
        self.sift_up(self.size() - 1);
    }

    /* 從節點 i 開始，從底至頂堆積化 */
    fn sift_up(&mut self, mut i: usize) {
        loop {
            // 節點 i 已經是堆積頂節點了，結束堆積化
            if i == 0 {
                break;
            }
            // 獲取節點 i 的父節點
            let p = Self::parent(i);
            // 當“節點無須修復”時，結束堆積化
            if self.max_heap[i] <= self.max_heap[p] {
                break;
            }
            // 交換兩節點
            self.swap(i, p);
            // 迴圈向上堆積化
            i = p;
        }
    }

    /* 元素出堆積 */
    fn pop(&mut self) -> i32 {
        // 判空處理
        if self.is_empty() {
            panic!("index out of bounds");
        }
        // 交換根節點與最右葉節點（交換首元素與尾元素）
        self.swap(0, self.size() - 1);
        // 刪除節點
        let val = self.max_heap.remove(self.size() - 1);
        // 從頂至底堆積化
        self.sift_down(0);
        // 返回堆積頂元素
        val
    }

    /* 從節點 i 開始，從頂至底堆積化 */
    fn sift_down(&mut self, mut i: usize) {
        loop {
            // 判斷節點 i, l, r 中值最大的節點，記為 ma
            let (l, r, mut ma) = (Self::left(i), Self::right(i), i);
            if l < self.size() && self.max_heap[l] > self.max_heap[ma] {
                ma = l;
            }
            if r < self.size() && self.max_heap[r] > self.max_heap[ma] {
                ma = r;
            }
            // 若節點 i 最大或索引 l, r 越界，則無須繼續堆積化，跳出
            if ma == i {
                break;
            }
            // 交換兩節點
            self.swap(i, ma);
            // 迴圈向下堆積化
            i = ma;
        }
    }

    /* 列印堆積（二元樹） */
    fn print(&self) {
        print_util::print_heap(self.max_heap.clone());
    }
}

/* Driver Code */
fn main() {
    /* 初始化大頂堆積 */
    let mut max_heap = MaxHeap::new(vec![9, 8, 6, 6, 7, 5, 2, 1, 4, 3, 6, 2]);
    println!("\n輸入串列並建堆積後");
    max_heap.print();

    /* 獲取堆積頂元素 */
    let peek = max_heap.peek();
    if let Some(peek) = peek {
        println!("\n堆積頂元素為 {}", peek);
    }

    /* 元素入堆積 */
    let val = 7;
    max_heap.push(val);
    println!("\n元素 {} 入堆積後", val);
    max_heap.print();

    /* 堆積頂元素出堆積 */
    let peek = max_heap.pop();
    println!("\n堆積頂元素 {} 出堆積後", peek);
    max_heap.print();

    /* 獲取堆積大小 */
    let size = max_heap.size();
    println!("\n堆積元素數量為 {}", size);

    /* 判斷堆積是否為空 */
    let is_empty = max_heap.is_empty();
    println!("\n堆積是否為空 {}", is_empty);
}
