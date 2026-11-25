/*
 * File: array_deque.rs
 * Created Time: 2023-03-11
 * Author: codingonion (coderonion@gmail.com)
 */
use hello_algo_rust::include::print_util;
/* 循環配列を使った両端キュー */
struct ArrayDeque<T> {
    nums: Vec<T>,    // 両端キューの要素を格納する配列
    front: usize,    // 両端キューの先頭要素を指すインデックス
    que_size: usize, // 両端キューの要素数
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

    /* 両端キューの要素数を取得する */
    pub fn size(&self) -> usize {
        self.que_size
    }

    /* 両端キューが空かどうかを判定する */
    pub fn is_empty(&self) -> bool {
        self.que_size == 0
    }

    /* 循環配列のインデックスを求める */
    fn index(&self, i: i32) -> usize {
        // 剰余を使って配列の先頭と末尾をつなぐ
        // i が配列の末尾を越えたら先頭に戻る
        // i が配列の先頭より前に出たら末尾に回る
        ((i + self.capacity() as i32) % self.capacity() as i32) as usize
    }

    /* 先頭に追加する */
    pub fn push_first(&mut self, num: T) {
        if self.que_size == self.capacity() {
            println!("両端キューが満杯です");
            return;
        }
        // 先頭のインデックスを左に 1 つ移す
        // 剰余を使い、front が配列の先頭より前に出たら末尾に回るようにする
        self.front = self.index(self.front as i32 - 1);
        // num を両端キューの先頭に追加する
        self.nums[self.front] = num;
        self.que_size += 1;
    }

    /* 末尾に追加する */
    pub fn push_last(&mut self, num: T) {
        if self.que_size == self.capacity() {
            println!("両端キューが満杯です");
            return;
        }
        // 両端キューの末尾要素の次の位置を示すインデックスを求める
        let rear = self.index(self.front as i32 + self.que_size as i32);
        // num を両端キューの末尾に追加する
        self.nums[rear] = num;
        self.que_size += 1;
    }

    /* 先頭から取り出す */
    fn pop_first(&mut self) -> T {
        let num = self.peek_first();
        // 先頭のインデックスを 1 つ進める
        self.front = self.index(self.front as i32 + 1);
        self.que_size -= 1;
        num
    }

    /* 末尾から取り出す */
    fn pop_last(&mut self) -> T {
        let num = self.peek_last();
        self.que_size -= 1;
        num
    }

    /* 両端キューの先頭要素を参照する */
    fn peek_first(&self) -> T {
        if self.is_empty() {
            panic!("両端キューが空です")
        };
        self.nums[self.front]
    }

    /* 両端キューの末尾要素を参照する */
    fn peek_last(&self) -> T {
        if self.is_empty() {
            panic!("両端キューが空です")
        };
        // 末尾要素のインデックスを求める
        let last = self.index(self.front as i32 + self.que_size as i32 - 1);
        self.nums[last]
    }

    /* 表示用の Vec を返す */
    fn to_array(&self) -> Vec<T> {
        // 両端キューの要素数に当たる範囲だけを変換する
        let mut res = vec![T::default(); self.que_size];
        let mut j = self.front;
        for i in 0..self.que_size {
            res[i] = self.nums[self.index(j as i32)];
            j += 1;
        }
        res
    }
}

/* 実行例 */
fn main() {
    /* 両端キューを初期化する */
    let mut deque = ArrayDeque::new(10);
    deque.push_last(3);
    deque.push_last(2);
    deque.push_last(5);
    print!("両端キュー deque = ");
    print_util::print_array(&deque.to_array());

    /* 要素を参照する */
    let peek_first = deque.peek_first();
    print!("\n先頭要素 peek_first = {}", peek_first);
    let peek_last = deque.peek_last();
    print!("\n末尾要素 peek_last = {}", peek_last);

    /* 要素を両端キューに追加する */
    deque.push_last(4);
    print!("\n末尾に 4 を追加した後の deque = ");
    print_util::print_array(&deque.to_array());
    deque.push_first(1);
    print!("\n先頭に 1 を追加した後の deque = ");
    print_util::print_array(&deque.to_array());

    /* 両端キューから要素を取り出す */
    let pop_last = deque.pop_last();
    print!("\n末尾から取り出した要素 = {}、末尾から取り出した後の deque = ", pop_last);
    print_util::print_array(&deque.to_array());
    let pop_first = deque.pop_first();
    print!("\n先頭から取り出した要素 = {}、先頭から取り出した後の deque = ", pop_first);
    print_util::print_array(&deque.to_array());

    /* 両端キューの要素数を取得する */
    let size = deque.size();
    print!("\n両端キューの要素数 size = {}", size);

    /* 両端キューが空かどうかを判定する */
    let is_empty = deque.is_empty();
    print!("\n両端キューは空か = {}", is_empty);
}
