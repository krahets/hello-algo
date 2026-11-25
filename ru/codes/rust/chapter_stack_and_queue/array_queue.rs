/*
 * File: array_queue.rs
 * Created Time: 2023-02-06
 * Author: WSL0809 (wslzzy@outlook.com)
 */

/* Очередь на основе кольцевого массива */
struct ArrayQueue<T> {
    nums: Vec<T>,      // Массив для хранения элементов очереди
    front: i32,        // Индекс первого элемента очереди
    que_size: i32,     // Длина очереди
    que_capacity: i32, // Ёмкость очереди
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

    /* Получить ёмкость очереди */
    fn capacity(&self) -> i32 {
        self.que_capacity
    }

    /* Получить длину очереди */
    fn size(&self) -> i32 {
        self.que_size
    }

    /* Проверить, пуста ли очередь */
    fn is_empty(&self) -> bool {
        self.que_size == 0
    }

    /* Добавить элемент в очередь */
    fn push(&mut self, num: T) {
        if self.que_size == self.capacity() {
            println!("Очередь заполнена");
            return;
        }
        // Вычислить индекс вставки в конец очереди: прибавить 1 к индексу последнего элемента с учётом перехода по кругу
        // При выходе за конец массива операция взятия остатка возвращает rear в начало
        let rear = (self.front + self.que_size) % self.que_capacity;
        // Добавить num в конец очереди
        self.nums[rear as usize] = num;
        self.que_size += 1;
    }

    /* Извлечь элемент из очереди */
    fn pop(&mut self) -> T {
        let num = self.peek();
        // Сдвинуть индекс начала очереди на одну позицию вперёд. При выходе за конец массива перейти к его началу
        self.front = (self.front + 1) % self.que_capacity;
        self.que_size -= 1;
        num
    }

    /* Посмотреть первый элемент очереди */
    fn peek(&self) -> T {
        if self.is_empty() {
            panic!("index out of bounds");
        }
        self.nums[self.front as usize]
    }

    /* Вернуть динамический массив */
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

/* Пример использования */
fn main() {
    /* Инициализировать очередь */
    let capacity = 10;
    let mut queue = ArrayQueue::new(capacity);

    /* Добавить элементы в очередь */
    queue.push(1);
    queue.push(3);
    queue.push(2);
    queue.push(5);
    queue.push(4);
    println!("Очередь queue = {:?}", queue.to_vector());

    /* Посмотреть первый элемент очереди */
    let peek = queue.peek();
    println!("Первый элемент очереди peek = {}", peek);

    /* Извлечь элемент из очереди */
    let pop = queue.pop();
    println!(
        "Извлечённый элемент pop = {:?}, после извлечения queue = {:?}",
        pop,
        queue.to_vector()
    );

    /* Получить длину очереди */
    let size = queue.size();
    println!("Длина очереди size = {}", size);

    /* Проверить, пуста ли очередь */
    let is_empty = queue.is_empty();
    println!("Очередь пуста = {}", is_empty);

    /* Проверить работу кольцевого массива */
    for i in 0..10 {
        queue.push(i);
        queue.pop();
        println!("В цикле {:?} после добавления и извлечения элемента queue = {:?}", i, queue.to_vector());
    }
}
