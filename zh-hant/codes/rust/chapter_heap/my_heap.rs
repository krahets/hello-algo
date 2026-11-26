/*
 * File: my_heap.rs
 * Created Time: 2023-07-16
 * Author: night-cruise (2586447362@qq.com)
 */

use hello_algo_rust::include::print_util;

/* 最大堆積 */
struct MaxHeap {
    // 採用 vector 取代陣列，無須自行處理擴充容量的問題
    max_heap: Vec<i32>,
}

impl MaxHeap {
    /* 建構式，根據輸入串列建立堆積 */
    fn new(nums: Vec<i32>) -> Self {
        // 將串列元素依原順序全部加入堆積
        let mut heap = MaxHeap { max_heap: nums };
        // 從每個非葉節點向下調整堆積
        for i in (0..=Self::parent(heap.size() - 1)).rev() {
            heap.sift_down(i);
        }
        heap
    }

    /* 取得左子節點的索引 */
    fn left(i: usize) -> usize {
        2 * i + 1
    }

    /* 取得右子節點的索引 */
    fn right(i: usize) -> usize {
        2 * i + 2
    }

    /* 取得父節點的索引 */
    fn parent(i: usize) -> usize {
        (i - 1) / 2 // 向下取整的整數除法
    }

    /* 交換元素 */
    fn swap(&mut self, i: usize, j: usize) {
        self.max_heap.swap(i, j);
    }

    /* 取得堆積大小 */
    fn size(&self) -> usize {
        self.max_heap.len()
    }

    /* 判斷堆積是否為空 */
    fn is_empty(&self) -> bool {
        self.max_heap.is_empty()
    }

    /* 讀取堆積頂端元素 */
    fn peek(&self) -> Option<i32> {
        self.max_heap.first().copied()
    }

    /* 將元素加入堆積 */
    fn push(&mut self, val: i32) {
        // 新增節點
        self.max_heap.push(val);
        // 由下往上調整堆積
        self.sift_up(self.size() - 1);
    }

    /* 從節點 i 開始向上調整堆積 */
    fn sift_up(&mut self, mut i: usize) {
        loop {
            // 節點 i 已位於堆積頂端，結束調整
            if i == 0 {
                break;
            }
            // 取得節點 i 的父節點
            let p = Self::parent(i);
            // 若節點已符合堆積性質，就結束調整
            if self.max_heap[i] <= self.max_heap[p] {
                break;
            }
            // 交換兩個節點
            self.swap(i, p);
            // 繼續向上調整堆積
            i = p;
        }
    }

    /* 從堆積取出元素 */
    fn pop(&mut self) -> i32 {
        // 檢查堆積是否為空
        if self.is_empty() {
            panic!("index out of bounds");
        }
        // 交換根節點與最右側的葉節點（即首尾兩個元素）
        self.swap(0, self.size() - 1);
        // 刪除節點
        let val = self.max_heap.pop().unwrap();
        // 由上往下調整堆積
        self.sift_down(0);
        // 回傳堆積頂端元素
        val
    }

    /* 從節點 i 開始向下調整堆積 */
    fn sift_down(&mut self, mut i: usize) {
        loop {
            // 找出節點 i、l、r 中值最大的節點，記為 ma
            let (l, r, mut ma) = (Self::left(i), Self::right(i), i);
            if l < self.size() && self.max_heap[l] > self.max_heap[ma] {
                ma = l;
            }
            if r < self.size() && self.max_heap[r] > self.max_heap[ma] {
                ma = r;
            }
            // 若節點 i 的值最大，或子節點索引 l、r 均超出範圍，即可結束調整，跳出迴圈
            if ma == i {
                break;
            }
            // 交換兩個節點
            self.swap(i, ma);
            // 繼續向下調整堆積
            i = ma;
        }
    }

    /* 印出堆積（二元樹） */
    fn print(&self) {
        print_util::print_heap(self.max_heap.clone());
    }
}

/* Driver Code */
fn main() {
    /* 初始化最大堆積 */
    let mut max_heap = MaxHeap::new(vec![9, 8, 6, 6, 7, 5, 2, 1, 4, 3, 6, 2]);
    println!("\n用輸入串列建立堆積後");
    max_heap.print();

    /* 取得堆積頂端元素 */
    let peek = max_heap.peek();
    if let Some(peek) = peek {
        println!("\n堆積頂端元素為 {}", peek);
    }

    /* 將元素加入堆積 */
    let val = 7;
    max_heap.push(val);
    println!("\n將元素 {} 加入堆積後", val);
    max_heap.print();

    /* 取出堆積頂端元素 */
    let peek = max_heap.pop();
    println!("\n取出堆積頂端元素 {} 後", peek);
    max_heap.print();

    /* 取得堆積大小 */
    let size = max_heap.size();
    println!("\n堆積中的元素個數為 {}", size);

    /* 判斷堆積是否為空 */
    let is_empty = max_heap.is_empty();
    println!("\n堆積是否為空 {}", is_empty);
}
