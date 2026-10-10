/*
 * File: array_deque.rs
 * Created Time: 2023-03-11
 * Author: codingonion (coderonion@gmail.com)
 */
use hello_algo_rust::include::print_util;
/* 循環配列ベースの両端キュー */
struct ArrayDeque<T> {
    nums: Vec<T>,    // 両端キューの要素を格納する配列
    front: usize,    // 先頭ポインタ。先頭要素を指す
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

    /* 両端キューの容量を取得 */
    pub fn capacity(&self) -> usize {
        self.nums.len()
    }

    /* 両端キューの長さを取得 */
    pub fn size(&self) -> usize {
        self.que_size
    }

    /* 両端キューが空かどうかを判定 */
    pub fn is_empty(&self) -> bool {
        self.que_size == 0
    }

    /* 循環配列のインデックスを計算 */
    fn index(&self, i: i32) -> usize {
        // 剰余演算により配列の先頭と末尾をつなげる
        // i が配列の末尾を越えたら先頭に戻る
        // i が配列の先頭を越えて前に出たら末尾に戻る
        ((i + self.capacity() as i32) % self.capacity() as i32) as usize
    }

    /* キュー先頭にエンキュー */
    pub fn push_first(&mut self, num: T) {
        if self.que_size == self.capacity() {
            println!("両端キューがいっぱいです");
            return;
        }
        // 先頭ポインタを左に 1 つ移動する
        // 剰余演算により、front が配列先頭を越えた後に末尾へ戻るようにする
        self.front = self.index(self.front as i32 - 1);
        // num をキュー先頭に追加
        self.nums[self.front] = num;
        self.que_size += 1;
    }

    /* キュー末尾にエンキュー */
    pub fn push_last(&mut self, num: T) {
        if self.que_size == self.capacity() {
            println!("両端キューがいっぱいです");
            return;
        }
        // キュー末尾ポインタを計算し、末尾インデックス + 1 を指す
        let rear = self.index(self.front as i32 + self.que_size as i32);
        // num をキュー末尾に追加
        self.nums[rear] = num;
        self.que_size += 1;
    }

    /* キュー先頭からデキュー */
    fn pop_first(&mut self) -> T {
        let num = self.peek_first();
        // 先頭ポインタを 1 つ後ろへ進める
        self.front = self.index(self.front as i32 + 1);
        self.que_size -= 1;
        num
    }

    /* キュー末尾からデキュー */
    fn pop_last(&mut self) -> T {
        let num = self.peek_last();
        self.que_size -= 1;
        num
    }

    /* キュー先頭の要素にアクセス */
    fn peek_first(&self) -> T {
        if self.is_empty() {
            panic!("両端キューが空です")
        };
        self.nums[self.front]
    }

    /* キュー末尾の要素にアクセス */
    fn peek_last(&self) -> T {
        if self.is_empty() {
            panic!("両端キューが空です")
        };
        // 末尾要素のインデックスを計算
        let last = self.index(self.front as i32 + self.que_size as i32 - 1);
        self.nums[last]
    }

    /* 出力用の配列を返す */
    fn to_array(&self) -> Vec<T> {
        // 有効長の範囲内のリスト要素のみを変換
        let mut res = vec![T::default(); self.que_size];
        let mut j = self.front;
        for i in 0..self.que_size {
            res[i] = self.nums[self.index(j as i32)];
            j += 1;
        }
        res
    }
}

/* Driver Code */
fn main() {
    /* 両端キューを初期化 */
    let mut deque = ArrayDeque::new(10);
    deque.push_last(3);
    deque.push_last(2);
    deque.push_last(5);
    print!("両端キュー deque = ");
    print_util::print_array(&deque.to_array());

    /* 要素にアクセス */
    let peek_first = deque.peek_first();
    print!("\n先頭要素 peek_first = {}", peek_first);
    let peek_last = deque.peek_last();
    print!("\n末尾要素 peek_last = {}", peek_last);

    /* 要素をエンキュー */
    deque.push_last(4);
    print!("\n要素 4 を末尾に追加後 deque = ");
    print_util::print_array(&deque.to_array());
    deque.push_first(1);
    print!("\n要素 1 を先頭に追加後 deque = ");
    print_util::print_array(&deque.to_array());

    /* 要素をデキュー */
    let pop_last = deque.pop_last();
    print!("\n末尾から取り出した要素 = {}、取り出し後 deque = ", pop_last);
    print_util::print_array(&deque.to_array());
    let pop_first = deque.pop_first();
    print!("\n先頭から取り出した要素 = {}、取り出し後 deque = ", pop_first);
    print_util::print_array(&deque.to_array());

    /* 両端キューの長さを取得 */
    let size = deque.size();
    print!("\n両端キューの長さ size = {}", size);

    /* 両端キューが空かどうかを判定 */
    let is_empty = deque.is_empty();
    print!("\n両端キューが空かどうか = {}", is_empty);
}
