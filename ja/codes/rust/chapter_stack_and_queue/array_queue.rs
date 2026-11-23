/*
 * File: array_queue.rs
 * Created Time: 2023-02-06
 * Author: WSL0809 (wslzzy@outlook.com)
 */

/* 循環配列で実装したキュー */
struct ArrayQueue<T> {
    nums: Vec<T>,      // キューの要素を格納する配列
    front: i32,        // キューの先頭要素を指す先頭ポインタ
    que_size: i32,     // キューの長さ
    que_capacity: i32, // キューの容量
}

impl<T: Copy + Default> ArrayQueue<T> {
    /* コンストラクタ */
    fn new(capacity: i32) -> ArrayQueue<T> {
        ArrayQueue {
            nums: vec![T::default(); capacity as usize],
            front: 0,
            que_size: 0,
            que_capacity: capacity,
        }
    }

    /* キューの容量を取得する */
    fn capacity(&self) -> i32 {
        self.que_capacity
    }

    /* キューの長さを取得 */
    fn size(&self) -> i32 {
        self.que_size
    }

    /* キューが空か判定 */
    fn is_empty(&self) -> bool {
        self.que_size == 0
    }

    /* エンキュー */
    fn push(&mut self, num: T) {
        if self.que_size == self.capacity() {
            println!("キューが満杯です");
            return;
        }
        // 末尾のインデックス + 1 を指す末尾ポインタを計算する
        // 剰余演算で、rear が配列末尾を越えたら先頭へ戻る
        let rear = (self.front + self.que_size) % self.que_capacity;
        // num をキューの末尾に追加する
        self.nums[rear as usize] = num;
        self.que_size += 1;
    }

    /* デキュー */
    fn pop(&mut self) -> T {
        let num = self.peek();
        // 先頭ポインタを後ろに 1 つ移動し、末尾を越えたら配列の先頭に戻す
        self.front = (self.front + 1) % self.que_capacity;
        self.que_size -= 1;
        num
    }

    /* キューの先頭要素にアクセス */
    fn peek(&self) -> T {
        if self.is_empty() {
            panic!("インデックスが範囲外です");
        }
        self.nums[self.front as usize]
    }

    /* 配列を返す */
    fn to_vector(&self) -> Vec<T> {
        let cap = self.que_capacity;
        let mut j = self.front;
        let mut arr = vec![T::default(); cap as usize];
        for i in 0..self.que_size {
            arr[i as usize] = self.nums[(j % cap) as usize];
            j += 1;
        }
        arr
    }
}

/* 実行用コード */
fn main() {
    /* キューを初期化する */
    let capacity = 10;
    let mut queue = ArrayQueue::new(capacity);

    /* 要素をエンキューする */
    queue.push(1);
    queue.push(3);
    queue.push(2);
    queue.push(5);
    queue.push(4);
    println!("キュー queue = {:?}", queue.to_vector());

    /* キューの先頭要素にアクセス */
    let peek = queue.peek();
    println!("キューの先頭要素 peek = {}", peek);

    /* 要素をデキューする */
    let pop = queue.pop();
    println!(
        "デキューした要素 pop = {:?},デキュー後 queue = {:?}",
        pop,
        queue.to_vector()
    );

    /* キューの長さを取得 */
    let size = queue.size();
    println!("キューの長さ size = {}", size);

    /* キューが空か判定 */
    let is_empty = queue.is_empty();
    println!("キューは空か = {}", is_empty);

    /* 循環配列をテストする */
    for i in 0..10 {
        queue.push(i);
        queue.pop();
        println!("第 {:?} 回のエンキューとデキューの後 queue = {:?}", i, queue.to_vector());
    }
}
