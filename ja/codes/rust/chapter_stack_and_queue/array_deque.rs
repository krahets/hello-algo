/*
 * File: array_deque.rs
 * Created Time: 2023-03-11
 * Author: codingonion (coderonion@gmail.com)
 */
use hello_algo_rust::include::print_util;
/* 循環配列で実装した両端キュー */
struct ArrayDeque<T> {
    nums: Vec<T>,    // 両端キューの要素を格納する配列
    front: usize,    // キューの先頭要素を指す先頭ポインタ
    que_size: usize, // 両端キューの長さ
}

impl<T: Copy + Default> ArrayDeque<T> {
    /* コンストラクタ */
    pub fn new(capacity: usize) -> Self {
        Self {
            nums: vec![T::default(); capacity],
            front: 0,
            que_size: 0,
        }
    }

    /* 両端キューの容量を取得する */
    pub fn capacity(&self) -> usize {
        self.nums.len()
    }

    /* 両端キューの長さを取得する */
    pub fn size(&self) -> usize {
        self.que_size
    }

    /* 両端キューが空かどうかを判定する */
    pub fn is_empty(&self) -> bool {
        self.que_size == 0
    }

    /* 循環配列のインデックスを計算する */
    fn index(&self, i: i32) -> usize {
        // 剰余演算を使い、配列の先頭と末尾をつなぐ
        // i が配列の末尾を越えたら、先頭に戻る
        // i が配列の先頭を越えたら、末尾に戻る
        ((i + self.capacity() as i32) % self.capacity() as i32) as usize
    }

    /* 先頭にエンキューする */
    pub fn push_first(&mut self, num: T) {
        if self.que_size == self.capacity() {
            println!("両端キューが満杯です");
            return;
        }
        // 先頭ポインタを左に 1 つ移動する
        // 剰余演算により、front が配列の先頭を越えたら末尾に戻るようにする
        self.front = self.index(self.front as i32 - 1);
        // num をキューの先頭に追加する
        self.nums[self.front] = num;
        self.que_size += 1;
    }

    /* 末尾にエンキューする */
    pub fn push_last(&mut self, num: T) {
        if self.que_size == self.capacity() {
            println!("両端キューが満杯です");
            return;
        }
        // 末尾のインデックス + 1 を指す末尾ポインタを計算する
        let rear = self.index(self.front as i32 + self.que_size as i32);
        // num をキューの末尾に追加する
        self.nums[rear] = num;
        self.que_size += 1;
    }

    /* 先頭からデキューする */
    fn pop_first(&mut self) -> T {
        let num = self.peek_first();
        // 先頭ポインタを後ろに 1 つ移動する
        self.front = self.index(self.front as i32 + 1);
        self.que_size -= 1;
        num
    }

    /* 末尾からデキューする */
    fn pop_last(&mut self) -> T {
        let num = self.peek_last();
        self.que_size -= 1;
        num
    }

    /* キューの先頭要素にアクセス */
    fn peek_first(&self) -> T {
        if self.is_empty() {
            panic!("両端キューが空です")
        };
        self.nums[self.front]
    }

    /* キューの末尾要素にアクセスする */
    fn peek_last(&self) -> T {
        if self.is_empty() {
            panic!("両端キューが空です")
        };
        // 末尾要素のインデックスを計算する
        let last = self.index(self.front as i32 + self.que_size as i32 - 1);
        self.nums[last]
    }

    /* 表示用の配列を返す */
    fn to_array(&self) -> Vec<T> {
        // 有効な長さの範囲内にあるリストの要素だけを変換する
        let mut res = vec![T::default(); self.que_size];
        let mut j = self.front;
        for i in 0..self.que_size {
            res[i] = self.nums[self.index(j as i32)];
            j += 1;
        }
        res
    }
}

/* 実行用コード */
fn main() {
    /* 両端キューを初期化する */
    let mut deque = ArrayDeque::new(10);
    deque.push_last(3);
    deque.push_last(2);
    deque.push_last(5);
    print!("両端キュー deque = ");
    print_util::print_array(&deque.to_array());

    /* 要素にアクセスする */
    let peek_first = deque.peek_first();
    print!("\nキューの先頭要素 peek_first = {}", peek_first);
    let peek_last = deque.peek_last();
    print!("\nキューの末尾要素 peek_last = {}", peek_last);

    /* 要素をエンキューする */
    deque.push_last(4);
    print!("\n要素 4 を末尾にエンキューした後 deque = ");
    print_util::print_array(&deque.to_array());
    deque.push_first(1);
    print!("\n要素 1 を先頭にエンキューした後 deque = ");
    print_util::print_array(&deque.to_array());

    /* 要素をデキューする */
    let pop_last = deque.pop_last();
    print!("\n末尾からデキューした要素 = {}、末尾からデキューした後 deque = ", pop_last);
    print_util::print_array(&deque.to_array());
    let pop_first = deque.pop_first();
    print!("\n先頭からデキューした要素 = {}、先頭からデキューした後 deque = ", pop_first);
    print_util::print_array(&deque.to_array());

    /* 両端キューの長さを取得する */
    let size = deque.size();
    print!("\n両端キューの長さ size = {}", size);

    /* 両端キューが空かどうかを判定する */
    let is_empty = deque.is_empty();
    print!("\n両端キューは空か = {}", is_empty);
}
