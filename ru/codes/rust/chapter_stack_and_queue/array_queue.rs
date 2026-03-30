/*
 * File: array_queue.rs
 * Created Time: 2023-02-06
 * Author: WSL0809 (wslzzy@outlook.com)
 */

/* Очередь на основе кольцевого массива */
struct ArrayQueue<T> {
    nums: Vec<T>,      // Массив для хранения элементов очереди
    front: i32,        // Указатель head, указывающий на первый элемент очереди
    que_size: i32,     // Длина очереди
    que_capacity: i32, // Вместимость очереди
}

impl<T: Copy + Default> ArrayQueue<T> {
    /* Конструктор */
    fn new(capacity: i32) -> ArrayQueue<T> {
        ArrayQueue {
            nums: vec![T::default(); capacity as usize],
            front: 0,
            que_size: 0,
            que_capacity: capacity,
        }
    }

    /* Получить вместимость очереди */
    fn capacity(&self) -> i32 {
        self.que_capacity
    }

    /* Получение длины очереди */
    fn size(&self) -> i32 {
        self.que_size
    }

    /* Проверка, пуста ли очередь */
    fn is_empty(&self) -> bool {
        self.que_size == 0
    }

    /* Поместить в очередь */
    fn push(&mut self, num: T) {
        if self.que_size == self.capacity() {
            println!("Очередь заполнена");
            return;
        }
        // Вычислить указатель хвоста, указывающий на индекс хвоста + 1
        // С помощью операции взятия по модулю вернуть rear к началу после выхода за конец массива
        let rear = (self.front + self.que_size) % self.que_capacity;
        // Добавить num в хвост очереди
        self.nums[rear as usize] = num;
        self.que_size += 1;
    }

    /* Извлечь из очереди */
    fn pop(&mut self) -> T {
        let num = self.peek();
        // Указатель head сдвигается на одну позицию назад; если он выходит за конец, то возвращается в начало массива
        self.front = (self.front + 1) % self.que_capacity;
        self.que_size -= 1;
        num
    }

    /* Доступ к элементу в начале очереди */
    fn peek(&self) -> T {
        if self.is_empty() {
            panic!("index out of bounds");
        }
        self.nums[self.front as usize]
    }

    /* Вернуть массив */
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
    /* Инициализация очереди */
    let capacity = 10;
    let mut queue = ArrayQueue::new(capacity);

    /* Добавление элемента в очередь */
    queue.push(1);
    queue.push(3);
    queue.push(2);
    queue.push(5);
    queue.push(4);
    println!("Очередь queue = {:?}", queue.to_vector());

    /* Доступ к элементу в начале очереди */
    let peek = queue.peek();
    println!("Первый элемент peek = {}", peek);

    /* Извлечение элемента из очереди */
    let pop = queue.pop();
    println!(
        "Извлеченный элемент pop = {:?}, queue после извлечения = {:?}",
        pop,
        queue.to_vector()
    );

    /* Получение длины очереди */
    let size = queue.size();
    println!("Длина очереди size = {}", size);

    /* Проверка, пуста ли очередь */
    let is_empty = queue.is_empty();
    println!("Пуста ли очередь = {}", is_empty);

    /* Проверка кольцевого массива */
    for i in 0..10 {
        queue.push(i);
        queue.pop();
        println!("После {:?}-го раунда операций enqueue и dequeue queue = {:?}", i, queue.to_vector());
    }
}
