/*
 * File: my_heap.rs
 * Created Time: 2023-07-16
 * Author: night-cruise (2586447362@qq.com)
 */

include!("../include/include.rs");

/* 大顶堆 */
struct MaxHeap {
    // 使用 vector 而非数组，这样无须考虑扩容问题
    max_heap: Vec<i32>,
}

impl MaxHeap {
    /* 构造方法，根据输入列表建堆 */
    fn new(nums: Vec<i32>) -> Self {
        // 将列表元素原封不动添加进堆
        let mut heap = MaxHeap { max_heap: nums };
        // 堆化除叶节点以外的其他所有节点
        for i in (0..=Self::parent(heap.size() - 1)).rev() {
            heap.sift_down(i);
        }
        heap
    }

    /* 获取左子节点的索引 */
    fn left(i: usize) -> usize {
        2 * i + 1
    }

    /* 获取右子节点的索引 */
    fn right(i: usize) -> usize {
        2 * i + 2
    }

    /* 获取父节点的索引 */
    fn parent(i: usize) -> usize {
        (i - 1) / 2 // 向下整除
    }

    /* 交换元素 */
    fn swap(&mut self, i: usize, j: usize) {
        self.max_heap.swap(i, j);
    }

    /* 获取堆大小 */
    fn size(&self) -> usize {
        self.max_heap.len()
    }

    /* 判断堆是否为空 */
    fn is_empty(&self) -> bool {
        self.max_heap.is_empty()
    }

    /* 访问堆顶元素 */
    fn peek(&self) -> Option<i32> {
        self.max_heap.first().copied()
    }

    /* 元素入堆 */
    fn push(&mut self, val: i32) {
        // 添加节点
        self.max_heap.push(val);
        // 从底至顶堆化
        self.sift_up(self.size() - 1);
    }

    /* 从节点 i 开始，从底至顶堆化 */
    fn sift_up(&mut self, mut i: usize) {
        loop {
            // 节点 i 已经是堆顶节点了，结束堆化
            if i == 0 {
                break;
            }
            // 获取节点 i 的父节点
            let p = Self::parent(i);
            // 当“节点无须修复”时，结束堆化
            if self.max_heap[i] <= self.max_heap[p] {
                break;
            }
            // 交换两节点
            self.swap(i, p);
            // 循环向上堆化
            i = p;
        }
    }

    /* 元素出堆 */
    fn pop(&mut self) -> i32 {
        // 判空处理
        if self.is_empty() {
            panic!("index out of bounds");
        }
        // 交换根节点与最右叶节点（交换首元素与尾元素）
        self.swap(0, self.size() - 1);
        // 删除节点
        let val = self.max_heap.pop().unwrap();
        // 从顶至底堆化
        self.sift_down(0);
        // 返回堆顶元素
        val
    }

    /* 从节点 i 开始，从顶至底堆化 */
    fn sift_down(&mut self, mut i: usize) {
        loop {
            // 判断节点 i, l, r 中值最大的节点，记为 ma
            let (l, r, mut ma) = (Self::left(i), Self::right(i), i);
            if l < self.size() && self.max_heap[l] > self.max_heap[ma] {
                ma = l;
            }
            if r < self.size() && self.max_heap[r] > self.max_heap[ma] {
                ma = r;
            }
            // 若节点 i 最大或索引 l, r 越界，则无须继续堆化，跳出
            if ma == i {
                break;
            }
            // 交换两节点
            self.swap(i, ma);
            // 循环向下堆化
            i = ma;
        }
    }

    /* 打印堆（二叉树） */
    fn print(&self) {
        print_util::print_heap(self.max_heap.clone());
    }
}

/* Driver Code */
fn main() {
    /* 初始化大顶堆 */
    let mut max_heap = MaxHeap::new(vec![9, 8, 6, 6, 7, 5, 2, 1, 4, 3, 6, 2]);
    println!("\n输入列表并建堆后");
    max_heap.print();

    /* 获取堆顶元素 */
    let peek = max_heap.peek();
    if let Some(peek) = peek {
        println!("\n堆顶元素为 {}", peek);
    }

    /* 元素入堆 */
    let val = 7;
    max_heap.push(val);
    println!("\n元素 {} 入堆后", val);
    max_heap.print();

    /* 堆顶元素出堆 */
    let peek = max_heap.pop();
    println!("\n堆顶元素 {} 出堆后", peek);
    max_heap.print();

    /* 获取堆大小 */
    let size = max_heap.size();
    println!("\n堆元素数量为 {}", size);

    /* 判断堆是否为空 */
    let is_empty = max_heap.is_empty();
    println!("\n堆是否为空 {}", is_empty);
}
