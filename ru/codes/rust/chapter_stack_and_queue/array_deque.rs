/*
 * File: array_deque.rs
 * Created Time: 2023-03-11
 * Author: codingonion (coderonion@gmail.com)
 */
use hello_algo_rust::include::print_util;
/* Двусторонняя очередь на основе кольцевого массива */
struct ArrayDeque<T> {
    nums: Vec<T>,    // Массив для хранения элементов двусторонней очереди
    front: usize,    // Указатель head, указывающий на первый элемент очереди
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

    /* Получение длины двусторонней очереди */
    pub fn size(&self) -> usize {
        self.que_size
    }

    /* Проверка, пуста ли двусторонняя очередь */
    pub fn is_empty(&self) -> bool {
        self.que_size == 0
    }

    /* Вычислить индекс в кольцевом массиве */
    fn index(&self, i: i32) -> usize {
        // С помощью операции взятия по модулю соединить начало и конец массива
        // Когда i выходит за конец массива, он возвращается в начало
        // Когда i выходит за начало массива, он возвращается в конец
        ((i + self.capacity() as i32) % self.capacity() as i32) as usize
    }

    /* Добавление в голову очереди */
    pub fn push_first(&mut self, num: T) {
        if self.que_size == self.capacity() {
            println!("Двусторонняя очередь заполнена");
            return;
        }
        // Указатель головы сдвигается на одну позицию влево
        // С помощью операции взятия по модулю front после выхода за начало массива возвращается в хвост
        self.front = self.index(self.front as i32 - 1);
        // Добавить num в голову очереди
        self.nums[self.front] = num;
        self.que_size += 1;
    }

    /* Добавление в хвост очереди */
    pub fn push_last(&mut self, num: T) {
        if self.que_size == self.capacity() {
            println!("Двусторонняя очередь заполнена");
            return;
        }
        // Вычислить указатель хвоста, указывающий на индекс хвоста + 1
        let rear = self.index(self.front as i32 + self.que_size as i32);
        // Добавить num в хвост очереди
        self.nums[rear] = num;
        self.que_size += 1;
    }

    /* Извлечение из головы очереди */
    fn pop_first(&mut self) -> T {
        let num = self.peek_first();
        // Указатель головы сдвигается на одну позицию назад
        self.front = self.index(self.front as i32 + 1);
        self.que_size -= 1;
        num
    }

    /* Извлечение из хвоста очереди */
    fn pop_last(&mut self) -> T {
        let num = self.peek_last();
        self.que_size -= 1;
        num
    }

    /* Доступ к элементу в начале очереди */
    fn peek_first(&self) -> T {
        if self.is_empty() {
            panic!("двусторонняя очередь пуста")
        };
        self.nums[self.front]
    }

    /* Доступ к элементу в конце очереди */
    fn peek_last(&self) -> T {
        if self.is_empty() {
            panic!("двусторонняя очередь пуста")
        };
        // Вычислить индекс хвостового элемента
        let last = self.index(self.front as i32 + self.que_size as i32 - 1);
        self.nums[last]
    }

    /* Вернуть массив для вывода */
    fn to_array(&self) -> Vec<T> {
        // Преобразовывать только элементы списка в пределах фактической длины
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
    /* Инициализация двусторонней очереди */
    let mut deque = ArrayDeque::new(10);
    deque.push_last(3);
    deque.push_last(2);
    deque.push_last(5);
    print!("Двусторонняя очередь deque = ");
    print_util::print_array(&deque.to_array());

    /* Доступ к элементу */
    let peek_first = deque.peek_first();
    print!("\nПервый элемент peek_first = {}", peek_first);
    let peek_last = deque.peek_last();
    print!("\nПоследний элемент peek_last = {}", peek_last);

    /* Добавление элемента в очередь */
    deque.push_last(4);
    print!("\nПосле добавления элемента 4 в хвост deque = ");
    print_util::print_array(&deque.to_array());
    deque.push_first(1);
    print!("\nПосле добавления элемента 1 в голову deque = ");
    print_util::print_array(&deque.to_array());

    /* Извлечение элемента из очереди */
    let pop_last = deque.pop_last();
    print!("\nИзвлеченный из хвоста элемент = {}, deque после извлечения из хвоста = ", pop_last);
    print_util::print_array(&deque.to_array());
    let pop_first = deque.pop_first();
    print!("\nИзвлеченный из головы элемент = {}, deque после извлечения из головы = ", pop_first);
    print_util::print_array(&deque.to_array());

    /* Получение длины двусторонней очереди */
    let size = deque.size();
    print!("\nДлина двусторонней очереди size = {}", size);

    /* Проверка, пуста ли двусторонняя очередь */
    let is_empty = deque.is_empty();
    print!("\nПуста ли двусторонняя очередь = {}", is_empty);
}
