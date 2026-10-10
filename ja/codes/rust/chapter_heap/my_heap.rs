/*
 * File: my_heap.rs
 * Created Time: 2023-07-16
 * Author: night-cruise (2586447362@qq.com)
 */

use hello_algo_rust::include::print_util;

/* 最大ヒープ */
struct MaxHeap {
    // 配列ではなく vector を使うことで、拡張を考慮せずに済む
    max_heap: Vec<i32>,
}

impl MaxHeap {
    /* コンストラクタ。入力リストに基づいてヒープを構築する */
    fn new(nums: Vec<i32>) -> Self {
        // リスト要素をそのままヒープに追加
        let mut heap = MaxHeap { max_heap: nums };
        // 葉ノード以外のすべてのノードをヒープ化
        for i in (0..=Self::parent(heap.size() - 1)).rev() {
            heap.sift_down(i);
        }
        heap
    }

    /* 左子ノードのインデックスを取得 */
    fn left(i: usize) -> usize {
        2 * i + 1
    }

    /* 右子ノードのインデックスを取得 */
    fn right(i: usize) -> usize {
        2 * i + 2
    }

    /* 親ノードのインデックスを取得 */
    fn parent(i: usize) -> usize {
        (i - 1) / 2 // 切り捨て除算
    }

    /* 要素を交換 */
    fn swap(&mut self, i: usize, j: usize) {
        self.max_heap.swap(i, j);
    }

    /* ヒープのサイズを取得 */
    fn size(&self) -> usize {
        self.max_heap.len()
    }

    /* ヒープが空かどうかを判定 */
    fn is_empty(&self) -> bool {
        self.max_heap.is_empty()
    }

    /* ヒープ先頭要素にアクセス */
    fn peek(&self) -> Option<i32> {
        self.max_heap.first().copied()
    }

    /* 要素をヒープに追加 */
    fn push(&mut self, val: i32) {
        // ノードを追加
        self.max_heap.push(val);
        // 下から上へヒープ化
        self.sift_up(self.size() - 1);
    }

    /* ノード i から始めて、下から上へヒープ化 */
    fn sift_up(&mut self, mut i: usize) {
        loop {
            // ノード i はすでにヒープの先頭ノードなので、ヒープ化を終了する
            if i == 0 {
                break;
            }
            // ノード i の親ノードを取得
            let p = Self::parent(i);
            // 「ノードの修復が不要」になったら、ヒープ化を終了
            if self.max_heap[i] <= self.max_heap[p] {
                break;
            }
            // 2 つのノードを交換
            self.swap(i, p);
            // ループで下から上へヒープ化
            i = p;
        }
    }

    /* 要素をヒープから取り出す */
    fn pop(&mut self) -> i32 {
        // 空判定の処理
        if self.is_empty() {
            panic!("index out of bounds");
        }
        // 根ノードと最も右の葉ノードを交換（先頭要素と末尾要素を交換）
        self.swap(0, self.size() - 1);
        // ノードを削除
        let val = self.max_heap.pop().unwrap();
        // 上から下へヒープ化
        self.sift_down(0);
        // ヒープ先頭要素を返す
        val
    }

    /* ノード i から始めて、上から下へヒープ化 */
    fn sift_down(&mut self, mut i: usize) {
        loop {
            // ノード i, l, r のうち値が最大のノードを ma とする
            let (l, r, mut ma) = (Self::left(i), Self::right(i), i);
            if l < self.size() && self.max_heap[l] > self.max_heap[ma] {
                ma = l;
            }
            if r < self.size() && self.max_heap[r] > self.max_heap[ma] {
                ma = r;
            }
            // ノード i が最大、またはインデックス l, r が範囲外なら、ヒープ化は不要なので抜ける
            if ma == i {
                break;
            }
            // 2 つのノードを交換
            self.swap(i, ma);
            // ループで上から下へヒープ化
            i = ma;
        }
    }

    /* ヒープ（二分木）を出力 */
    fn print(&self) {
        print_util::print_heap(self.max_heap.clone());
    }
}

/* Driver Code */
fn main() {
    /* 最大ヒープを初期化 */
    let mut max_heap = MaxHeap::new(vec![9, 8, 6, 6, 7, 5, 2, 1, 4, 3, 6, 2]);
    println!("\nリストを入力してヒープを構築した後");
    max_heap.print();

    /* ヒープ頂点の要素を取得 */
    let peek = max_heap.peek();
    if let Some(peek) = peek {
        println!("\nヒープ先頭要素は {}", peek);
    }

    /* 要素をヒープに追加 */
    let val = 7;
    max_heap.push(val);
    println!("\n要素 {} をヒープに追加した後", val);
    max_heap.print();

    /* ヒープ頂点の要素を取り出す */
    let peek = max_heap.pop();
    println!("\nヒープ先頭要素 {} を取り出した後", peek);
    max_heap.print();

    /* ヒープのサイズを取得 */
    let size = max_heap.size();
    println!("\nヒープ要素数は {}", size);

    /* ヒープが空かどうかを判定 */
    let is_empty = max_heap.is_empty();
    println!("\nヒープは空か {}", is_empty);
}
