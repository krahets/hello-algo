/*
 * File: my_heap.rs
 * Created Time: 2023-07-16
 * Author: night-cruise (2586447362@qq.com)
 */

use hello_algo_rust::include::print_util;

/* 最大ヒープ */
struct MaxHeap {
    // 配列ではなく vector を使うため、容量の拡張を考慮する必要がない
    max_heap: Vec<i32>,
}

impl MaxHeap {
    /* コンストラクタ：入力リストからヒープを構築する */
    fn new(nums: Vec<i32>) -> Self {
        // リストの要素をそのままヒープに追加する
        let mut heap = MaxHeap { max_heap: nums };
        // 葉ノード以外の全ノードをヒープ化する
        for i in (0..=Self::parent(heap.size() - 1)).rev() {
            heap.sift_down(i);
        }
        heap
    }

    /* 左の子のインデックスを取得 */
    fn left(i: usize) -> usize {
        2 * i + 1
    }

    /* 右の子のインデックスを取得 */
    fn right(i: usize) -> usize {
        2 * i + 2
    }

    /* 親のインデックスを取得 */
    fn parent(i: usize) -> usize {
        (i - 1) / 2 // 切り捨て除算
    }

    /* 要素を交換する */
    fn swap(&mut self, i: usize, j: usize) {
        self.max_heap.swap(i, j);
    }

    /* ヒープのサイズを取得する */
    fn size(&self) -> usize {
        self.max_heap.len()
    }

    /* ヒープが空か判定 */
    fn is_empty(&self) -> bool {
        self.max_heap.is_empty()
    }

    /* ヒープの先頭要素にアクセスする */
    fn peek(&self) -> Option<i32> {
        self.max_heap.first().copied()
    }

    /* ヒープに要素を挿入する */
    fn push(&mut self, val: i32) {
        // ノードを追加する
        self.max_heap.push(val);
        // 下から上へヒープ化する
        self.sift_up(self.size() - 1);
    }

    /* ノード i から上向きにヒープ化する */
    fn sift_up(&mut self, mut i: usize) {
        loop {
            // ノード i はすでにヒープの先頭なので、ヒープ化を終了する
            if i == 0 {
                break;
            }
            // ノード i の親ノードを取得する
            let p = Self::parent(i);
            // 「ノードの修復が不要」の場合、ヒープ化を終了する
            if self.max_heap[i] <= self.max_heap[p] {
                break;
            }
            // 2 つのノードを交換する
            self.swap(i, p);
            // 上向きのヒープ化を繰り返す
            i = p;
        }
    }

    /* ヒープから要素を取り出す */
    fn pop(&mut self) -> i32 {
        // 空かどうかを確認する
        if self.is_empty() {
            panic!("インデックスが範囲外です");
        }
        // 根と最右の葉を交換（先頭要素と末尾要素を交換）
        self.swap(0, self.size() - 1);
        // ノードを削除する
        let val = self.max_heap.pop().unwrap();
        // 上から下へヒープ化する
        self.sift_down(0);
        // ヒープの先頭要素を返す
        val
    }

    /* ノード i から下向きにヒープ化する */
    fn sift_down(&mut self, mut i: usize) {
        loop {
            // ノード i, l, r のうち値が最大のノードを求め、ma とする
            let (l, r, mut ma) = (Self::left(i), Self::right(i), i);
            if l < self.size() && self.max_heap[l] > self.max_heap[ma] {
                ma = l;
            }
            if r < self.size() && self.max_heap[r] > self.max_heap[ma] {
                ma = r;
            }
            // ノード i が最大か添字 l, r が範囲外なら、ヒープ化は不要なので終了
            if ma == i {
                break;
            }
            // 2 つのノードを交換する
            self.swap(i, ma);
            // 下向きのヒープ化を繰り返す
            i = ma;
        }
    }

    /* ヒープ（二分木）を表示する */
    fn print(&self) {
        print_util::print_heap(self.max_heap.clone());
    }
}

/* 実行用コード */
fn main() {
    /* 最大ヒープを初期化する */
    let mut max_heap = MaxHeap::new(vec![9, 8, 6, 6, 7, 5, 2, 1, 4, 3, 6, 2]);
    println!("\nリストを入力してヒープを構築した後");
    max_heap.print();

    /* ヒープの先頭要素を取得する */
    let peek = max_heap.peek();
    if let Some(peek) = peek {
        println!("\nヒープの先頭要素は {}", peek);
    }

    /* ヒープに要素を挿入する */
    let val = 7;
    max_heap.push(val);
    println!("\n要素 {} をヒープに挿入した後", val);
    max_heap.print();

    /* ヒープの先頭要素を取り出す */
    let peek = max_heap.pop();
    println!("\nヒープの先頭要素 {} を取り出した後", peek);
    max_heap.print();

    /* ヒープのサイズを取得する */
    let size = max_heap.size();
    println!("\nヒープの要素数は {}", size);

    /* ヒープが空か判定 */
    let is_empty = max_heap.is_empty();
    println!("\nヒープは空か {}", is_empty);
}
