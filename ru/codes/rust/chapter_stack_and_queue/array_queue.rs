/*
 * File: array_queue.rs
 * Created Time: 2023-02-06
 * Author: WSL0809 (wslzzy@outlook.com)
 */

/* Очередь на основе циклического массива */
struct ArrayQueue<T> {
    nums: Vec<T>,      // Массив для хранения элементов очереди
    front: i32,        // Указатель front, указывающий на первый элемент очереди
    que_size: i32,     // Длина очереди
    que_capacity: i32, // вместимость очереди
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

    /* Получить длину очереди */
    fn size(&self) -> i32 {
        self.que_size
    }

    /* Проверить, пуста ли очередь */
    fn is_empty(&self) -> bool {
        self.que_size == 0
    }

    /* Поместить в очередь */
    fn push(&mut self, num: T) {
        if self.que_size == self.capacity() {
            println!("очередьзаполнен");
            return;
        }
        // Вычислить указатель хвоста очереди, указывающий на индекс хвоста + 1
        // Операция взятия по модулю позволяет rear после выхода за конец массива вернуться к его началу
        let rear = (self.front + self.que_size) % self.que_capacity;
        // Добавить num в конец очереди
        self.nums[rear as usize] = num;
        self.que_size += 1;
    }

    /* Извлечь из очереди */
    fn pop(&mut self) -> T {
        let num = self.peek();
        // Указатель головы очереди сдвигается на одну позицию вперед; если он выходит за конец, то возвращается в начало массива
        self.front = (self.front + 1) % self.que_capacity;
        self.que_size -= 1;
        num
    }

    /* Получить элемент в начале очереди */
    fn peek(&self) -> T {
        if self.is_empty() {
            panic!("index out of bounds");
        }
        self.nums[self.front as usize]
    }

    /* Вернутьмассив */
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
    /* Инициализировать очередь */
    let capacity = 10;
    let mut queue = ArrayQueue::new(capacity);

    /* Поместить элемент в очередь */
    queue.push(1);
    queue.push(3);
    queue.push(2);
    queue.push(5);
    queue.push(4);
    println!("очередь queue = {:?}", queue.to_vector());

    /* Получить элемент в начале очереди */
    let peek = queue.peek();
    println!("элемент в голове очереди peek = {}", peek);

    /* Извлечь элемент из очереди */
    let pop = queue.pop();
    println!(
        "Элемент, извлеченный из очереди, pop = {:?},queue после извлечения = {:?}",
        pop,
        queue.to_vector()
    );

    /* Получить длину очереди */
    let size = queue.size();
    println!("Длина очереди size = {}", size);

    /* Проверить, пуста ли очередь */
    let is_empty = queue.is_empty();
    println!("Очередь пуста: {}", is_empty);

    /* Проверить кольцевой массив */
    for i in 0..10 {
        queue.push(i);
        queue.pop();
        println!("Итерация {:?}: после enqueue + dequeue queue = {:?}", i, queue.to_vector());
    }
}
