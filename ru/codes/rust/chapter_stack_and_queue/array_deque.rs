/*
 * File: array_deque.rs
 * Created Time: 2023-03-11
 * Author: codingonion (coderonion@gmail.com)
 */
use hello_algo_rust::include::print_util;
/* Двусторонняя очередь на основе циклического массива */
struct ArrayDeque<T> {
    nums: Vec<T>,    // Массив для хранения элементов двусторонней очереди
    front: usize,    // Указатель front, указывающий на первый элемент очереди
    que_size: usize, // Длина двусторонней очереди
}

impl<T: Copy + Default> ArrayDeque<T> {
    /* Конструктор */
    pub fn new(capacity: usize) -> Self {
        Self {
            nums: vec![T::default(); capacity],
            front: 0,
            que_size: 0,
        }
    }

    /* Получить вместимость двусторонней очереди */
    pub fn capacity(&self) -> usize {
        self.nums.len()
    }

    /* Получить длину двусторонней очереди */
    pub fn size(&self) -> usize {
        self.que_size
    }

    /* Проверить, пуста ли двусторонняя очередь */
    pub fn is_empty(&self) -> bool {
        self.que_size == 0
    }

    /* Вычислить индекс циклического массива */
    fn index(&self, i: i32) -> usize {
        // Сделать начало и конец массива циклически связанными с помощью операции взятия по модулю
        // Когда i выходит за конец массива, он возвращается к началу
        // Когда i выходит за начало массива, он возвращается к концу
        ((i + self.capacity() as i32) % self.capacity() as i32) as usize
    }

    /* Поместить в голову очереди */
    pub fn push_first(&mut self, num: T) {
        if self.que_size == self.capacity() {
            println!("двусторонняя очередьзаполнен");
            return;
        }
        // Указатель головы очереди сдвигается на одну позицию влево
        // Операция взятия по модулю позволяет front после выхода за начало массива вернуться к его концу
        self.front = self.index(self.front as i32 - 1);
        // Добавить num в голову очереди
        self.nums[self.front] = num;
        self.que_size += 1;
    }

    /* Поместить в хвост очереди */
    pub fn push_last(&mut self, num: T) {
        if self.que_size == self.capacity() {
            println!("двусторонняя очередьзаполнен");
            return;
        }
        // Вычислить указатель хвоста, указывающий на индекс за последним элементом
        let rear = self.index(self.front as i32 + self.que_size as i32);
        // Добавить num в конец очереди
        self.nums[rear] = num;
        self.que_size += 1;
    }

    /* Извлечь из головы очереди */
    fn pop_first(&mut self) -> T {
        let num = self.peek_first();
        // Указатель головы очереди сдвигается на одну позицию вперед
        self.front = self.index(self.front as i32 + 1);
        self.que_size -= 1;
        num
    }

    /* Извлечь из хвоста очереди */
    fn pop_last(&mut self) -> T {
        let num = self.peek_last();
        self.que_size -= 1;
        num
    }

    /* Получить элемент в начале очереди */
    fn peek_first(&self) -> T {
        if self.is_empty() {
            panic!("двусторонняя очередьпуст")
        };
        self.nums[self.front]
    }

    /* Обратиться к элементу в хвосте очереди */
    fn peek_last(&self) -> T {
        if self.is_empty() {
            panic!("двусторонняя очередьпуст")
        };
        // Вычислить индекс хвостового элемента
        let last = self.index(self.front as i32 + self.que_size as i32 - 1);
        self.nums[last]
    }

    /* Вернуть массив для печати */
    fn to_array(&self) -> Vec<T> {
        // Преобразовать только элементы списка в пределах действительной длины
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
    /* Инициализировать двустороннюю очередь */
    let mut deque = ArrayDeque::new(10);
    deque.push_last(3);
    deque.push_last(2);
    deque.push_last(5);
    print!("двусторонняя очередь deque =");
    print_util::print_array(&deque.to_array());

    /* Получить доступ к элементу */
    let peek_first = deque.peek_first();
    print!("\nэлемент в голове очереди peek_first = {}", peek_first);
    let peek_last = deque.peek_last();
    print!("\nэлемент в хвосте очереди peek_last = {}", peek_last);

    /* Поместить элемент в очередь */
    deque.push_last(4);
    print!("\nПосле помещения элемента 4 в хвост очереди deque =");
    print_util::print_array(&deque.to_array());
    deque.push_first(1);
    print!("\nПосле помещения элемента 1 в голову очереди deque =");
    print_util::print_array(&deque.to_array());

    /* Извлечь элемент из очереди */
    let pop_last = deque.pop_last();
    print!("\nЭлемент, извлеченный из хвоста очереди, = {}, deque после извлечения из хвоста =", pop_last);
    print_util::print_array(&deque.to_array());
    let pop_first = deque.pop_first();
    print!("\nЭлемент, извлеченный из головы очереди, = {}, deque после извлечения из головы =", pop_first);
    print_util::print_array(&deque.to_array());

    /* Получить длину двусторонней очереди */
    let size = deque.size();
    print!("\nДлина двусторонней очереди size = {}", size);

    /* Проверить, пуста ли двусторонняя очередь */
    let is_empty = deque.is_empty();
    print!("\nдвусторонняя очередьпуст ли = {}", is_empty);
}
