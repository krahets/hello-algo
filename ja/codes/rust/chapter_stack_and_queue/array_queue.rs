/*
 * File: array_queue.rs
 * Created Time: 2023-02-06
 * Author: WSL0809 (wslzzy@outlook.com)
 */

/* 循環配列を使ったキュー */
struct ArrayQueue<T> {
    nums: Vec<T>,      // キューの要素を格納する配列
    front: i32,        // キューの先頭要素を指すインデックス
    que_size: i32,     // キューの要素数
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

    /* キューの要素数を取得する */
    fn size(&self) -> i32 {
        self.que_size
    }

    /* キューが空かどうかを判定する */
    fn is_empty(&self) -> bool {
        self.que_size == 0
    }

    /* エンキューする */
    fn push(&mut self, num: T) {
        if self.que_size == self.capacity() {
            println!("キューが満杯です");
            return;
        }
        // キューの末尾要素の次の位置を示すインデックスを求める
        // 剰余を使い、rear が配列の末尾を越えたら先頭に戻るようにする
        let rear = (self.front + self.que_size) % self.que_capacity;
        // num をキューの末尾に追加する
        self.nums[rear as usize] = num;
        self.que_size += 1;
    }

    /* デキューする */
    fn pop(&mut self) -> T {
        let num = self.peek();
        // 先頭のインデックスを 1 つ進め、配列の末尾を越えたら先頭に戻す
        self.front = (self.front + 1) % self.que_capacity;
        self.que_size -= 1;
        num
    }

    /* キューの先頭要素を参照する */
    fn peek(&self) -> T {
        if self.is_empty() {
            panic!("index out of bounds");
        }
        self.nums[self.front as usize]
    }

    /* 要素を Vec にまとめて返す */
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

/* 実行例 */
fn main() {
    /* キューを初期化する */
    let capacity = 10;
    let mut queue = ArrayQueue::new(capacity);

    /* 要素をキューに追加する */
    queue.push(1);
    queue.push(3);
    queue.push(2);
    queue.push(5);
    queue.push(4);
    println!("キュー queue = {:?}", queue.to_vector());

    /* キューの先頭要素を参照する */
    let peek = queue.peek();
    println!("先頭要素 peek = {}", peek);

    /* キューから要素を取り出す */
    let pop = queue.pop();
    println!(
        "デキューした要素 pop = {:?}、デキュー後の queue = {:?}",
        pop,
        queue.to_vector()
    );

    /* キューの要素数を取得する */
    let size = queue.size();
    println!("キューの要素数 size = {}", size);

    /* キューが空かどうかを判定する */
    let is_empty = queue.is_empty();
    println!("キューは空か = {}", is_empty);

    /* 循環配列の動作を確認する */
    for i in 0..10 {
        queue.push(i);
        queue.pop();
        println!("第 {:?} 回のエンキューとデキューを終えた後の queue = {:?}", i, queue.to_vector());
    }
}
