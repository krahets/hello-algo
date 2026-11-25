/*
 * File: my_heap.rs
 * Created Time: 2023-07-16
 * Author: night-cruise (2586447362@qq.com)
 */

use hello_algo_rust::include::print_util;

/* 最大ヒープ */
struct MaxHeap {
    // 配列の代わりに vector を使えば、容量の拡張を自分で扱う必要がない
    max_heap: Vec<i32>,
}

impl MaxHeap {
    /* 入力リストからヒープを構築するコンストラクタ */
    fn new(nums: Vec<i32>) -> Self {
        // リストの要素をそのままヒープに追加する
        let mut heap = MaxHeap { max_heap: nums };
        // 葉以外のすべてのノードをヒープ化する
        for i in (0..=Self::parent(heap.size() - 1)).rev() {
            heap.sift_down(i);
        }
        heap
    }

    /* 左の子のインデックスを取得する */
    fn left(i: usize) -> usize {
        2 * i + 1
    }

    /* 右の子のインデックスを取得する */
    fn right(i: usize) -> usize {
        2 * i + 2
    }

    /* 親のインデックスを取得する */
    fn parent(i: usize) -> usize {
        (i - 1) / 2 // 商を負の無限大方向に切り捨てる
    }

    /* 要素を交換する */
    fn swap(&mut self, i: usize, j: usize) {
        self.max_heap.swap(i, j);
    }

    /* ヒープのサイズを取得する */
    fn size(&self) -> usize {
        self.max_heap.len()
    }

    /* ヒープが空か判定する */
    fn is_empty(&self) -> bool {
        self.max_heap.is_empty()
    }

    /* ヒープの根の要素を参照する */
    fn peek(&self) -> Option<i32> {
        self.max_heap.first().copied()
    }

    /* 要素をヒープに挿入する */
    fn push(&mut self, val: i32) {
        // ノードを追加する
        self.max_heap.push(val);
        // 上に向かってヒープ化する
        self.sift_up(self.size() - 1);
    }

    /* ノード i から上に向かってヒープ化する */
    fn sift_up(&mut self, mut i: usize) {
        loop {
            // ノード i はすでに根にあるのでヒープ化を終える
            if i == 0 {
                break;
            }
            // ノード i の親を取得する
            let p = Self::parent(i);
            // ノードを調整する必要がなくなれば、ヒープ化を終える
            if self.max_heap[i] <= self.max_heap[p] {
                break;
            }
            // 2 つのノードを交換する
            self.swap(i, p);
            // 上へのヒープ化を繰り返す
            i = p;
        }
    }

    /* 根の要素をヒープから取り出す */
    fn pop(&mut self) -> i32 {
        // 空の場合の処理
        if self.is_empty() {
            panic!("index out of bounds");
        }
        // 根と最も右の葉（先頭要素と末尾要素）を交換する
        self.swap(0, self.size() - 1);
        // ノードを削除する
        let val = self.max_heap.pop().unwrap();
        // 下に向かってヒープ化する
        self.sift_down(0);
        // 根の要素を返す
        val
    }

    /* ノード i から下に向かってヒープ化する */
    fn sift_down(&mut self, mut i: usize) {
        loop {
            // ノード i、l、r のうち値が最大のものを ma とする
            let (l, r, mut ma) = (Self::left(i), Self::right(i), i);
            if l < self.size() && self.max_heap[l] > self.max_heap[ma] {
                ma = l;
            }
            if r < self.size() && self.max_heap[r] > self.max_heap[ma] {
                ma = r;
            }
            // ノード i が最大か、インデックス l と r がともに範囲外なら、ヒープ化を終えてループを抜ける
            if ma == i {
                break;
            }
            // 2 つのノードを交換する
            self.swap(i, ma);
            // 下へのヒープ化を繰り返す
            i = ma;
        }
    }

    /* ヒープを二分木として表示する */
    fn print(&self) {
        print_util::print_heap(self.max_heap.clone());
    }
}

/* 実行例 */
fn main() {
    /* 最大ヒープを初期化する */
    let mut max_heap = MaxHeap::new(vec![9, 8, 6, 6, 7, 5, 2, 1, 4, 3, 6, 2]);
    println!("\n入力リストから構築したヒープ：");
    max_heap.print();

    /* ヒープの根の要素を取得する */
    let peek = max_heap.peek();
    if let Some(peek) = peek {
        println!("\nヒープの根の要素：{}", peek);
    }

    /* 要素をヒープに挿入する */
    let val = 7;
    max_heap.push(val);
    println!("\n要素 {} の挿入後：", val);
    max_heap.print();

    /* 根の要素を取り出す */
    let peek = max_heap.pop();
    println!("\n根の要素 {} を取り出した後：", peek);
    max_heap.print();

    /* ヒープのサイズを取得する */
    let size = max_heap.size();
    println!("\nヒープの要素数：{}", size);

    /* ヒープが空か判定する */
    let is_empty = max_heap.is_empty();
    println!("\nヒープは空か：{}", is_empty);
}
