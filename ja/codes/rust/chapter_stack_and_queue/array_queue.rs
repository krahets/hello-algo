/*
 * File: array_queue.rs
 * Created Time: 2023-02-06
 * Author: WSL0809 (wslzzy@outlook.com)
 */

/* 循環配列ベースのキュー */
struct ArrayQueue<T> {
    nums: Vec<T>,      // キュー要素を格納する配列
    front: i32,        // 先頭ポインタ。先頭要素を指す
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

    /* キューの容量を取得 */
    fn capacity(&self) -> i32 {
        self.que_capacity
    }

    /* キューの長さを取得 */
    fn size(&self) -> i32 {
        self.que_size
    }

    /* キューが空かどうかを判定 */
    fn is_empty(&self) -> bool {
        self.que_size == 0
    }

    /* エンキュー */
    fn push(&mut self, num: T) {
        if self.que_size == self.capacity() {
            println!("キューがいっぱいです");
            return;
        }
        // 末尾ポインタを計算し、末尾インデックス + 1 を指す
        // 剰余演算により、rear が配列末尾を越えた後に先頭へ戻るようにする
        let rear = (self.front + self.que_size) % self.que_capacity;
        // num をキュー末尾に追加
        self.nums[rear as usize] = num;
        self.que_size += 1;
    }

    /* デキュー */
    fn pop(&mut self) -> T {
        let num = self.peek();
        // 先頭ポインタを1つ後ろへ進め、末尾を越えたら配列先頭に戻す
        self.front = (self.front + 1) % self.que_capacity;
        self.que_size -= 1;
        num
    }

    /* キュー先頭の要素にアクセス */
    fn peek(&self) -> T {
        if self.is_empty() {
            panic!("index out of bounds");
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

/* Driver Code */
fn main() {
    /* キューを初期化 */
    let capacity = 10;
    let mut queue = ArrayQueue::new(capacity);

    /* 要素をエンキュー */
    queue.push(1);
    queue.push(3);
    queue.push(2);
    queue.push(5);
    queue.push(4);
    println!("キュー queue = {:?}", queue.to_vector());

    /* キュー先頭の要素にアクセス */
    let peek = queue.peek();
    println!("先頭要素 peek = {}", peek);

    /* 要素をデキュー */
    let pop = queue.pop();
    println!(
        "取り出した要素 pop = {:?},取り出し後 queue = {:?}",
        pop,
        queue.to_vector()
    );

    /* キューの長さを取得 */
    let size = queue.size();
    println!("キューの長さ size = {}", size);

    /* キューが空かどうかを判定 */
    let is_empty = queue.is_empty();
    println!("キューが空かどうか = {}", is_empty);

    /* 循環配列をテストする */
    for i in 0..10 {
        queue.push(i);
        queue.pop();
        println!("第 {:?} 回のエンキュー + デキュー後 queue = {:?}", i, queue.to_vector());
    }
}
