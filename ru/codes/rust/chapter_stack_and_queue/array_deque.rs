/*
 * File: array_deque.rs
 * Created Time: 2023-03-11
 * Author: codingonion (coderonion@gmail.com)
 */
use hello_algo_rust::include::print_util;
/* Двусторонняя очередь (дек) на основе кольцевого массива */
struct ArrayDeque<T> {
    nums: Vec<T>,    // Массив для хранения элементов дека
    front: usize,    // Индекс первого элемента дека
    que_size: usize, // Длина дека
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

    /* Получить ёмкость дека */
    pub fn capacity(&self) -> usize {
        self.nums.len()
    }

    /* Получить длину дека */
    pub fn size(&self) -> usize {
        self.que_size
    }

    /* Проверить, пуст ли дек */
    pub fn is_empty(&self) -> bool {
        self.que_size == 0
    }

    /* Вычислить индекс в кольцевом массиве */
    fn index(&self, i: i32) -> usize {
        // Операция взятия остатка связывает конец массива с его началом
        // Если индекс i выходит за конец массива, отсчёт продолжается с начала
        // Если индекс i выходит за начало массива, отсчёт продолжается с конца
        ((i + self.capacity() as i32) % self.capacity() as i32) as usize
    }

    /* Добавить элемент в начало дека */
    pub fn push_first(&mut self, num: T) {
        if self.que_size == self.capacity() {
            println!("Дек заполнен");
            return;
        }
        // Сдвинуть индекс начала дека на одну позицию влево
        // При выходе за начало массива операция взятия остатка возвращает front в конец
        self.front = self.index(self.front as i32 - 1);
        // Добавить num в начало дека
        self.nums[self.front] = num;
        self.que_size += 1;
    }

    /* Добавить элемент в конец дека */
    pub fn push_last(&mut self, num: T) {
        if self.que_size == self.capacity() {
            println!("Дек заполнен");
            return;
        }
        // Вычислить индекс вставки в конец дека: прибавить 1 к индексу последнего элемента с учётом перехода по кругу
        let rear = self.index(self.front as i32 + self.que_size as i32);
        // Добавить num в конец дека
        self.nums[rear] = num;
        self.que_size += 1;
    }

    /* Извлечь элемент из начала дека */
    fn pop_first(&mut self) -> T {
        let num = self.peek_first();
        // Сдвинуть индекс начала дека на одну позицию вперёд
        self.front = self.index(self.front as i32 + 1);
        self.que_size -= 1;
        num
    }

    /* Извлечь элемент из конца дека */
    fn pop_last(&mut self) -> T {
        let num = self.peek_last();
        self.que_size -= 1;
        num
    }

    /* Посмотреть первый элемент дека */
    fn peek_first(&self) -> T {
        if self.is_empty() {
            panic!("Дек пуст")
        };
        self.nums[self.front]
    }

    /* Посмотреть последний элемент дека */
    fn peek_last(&self) -> T {
        if self.is_empty() {
            panic!("Дек пуст")
        };
        // Вычислить индекс последнего элемента
        let last = self.index(self.front as i32 + self.que_size as i32 - 1);
        self.nums[last]
    }

    /* Вернуть динамический массив для вывода */
    fn to_array(&self) -> Vec<T> {
        // Преобразовать только те элементы, которые сейчас находятся в деке
        let mut res = vec![T::default(); self.que_size];
        let mut j = self.front;
        for i in 0..self.que_size {
            res[i] = self.nums[self.index(j as i32)];
            j += 1;
        }
        res
    }
}

/* Пример использования */
fn main() {
    /* Инициализировать дек */
    let mut deque = ArrayDeque::new(10);
    deque.push_last(3);
    deque.push_last(2);
    deque.push_last(5);
    print!("Дек deque = ");
    print_util::print_array(&deque.to_array());

    /* Посмотреть первый и последний элементы */
    let peek_first = deque.peek_first();
    print!("\nПервый элемент дека peek_first = {}", peek_first);
    let peek_last = deque.peek_last();
    print!("\nПоследний элемент дека peek_last = {}", peek_last);

    /* Добавить элементы в дек */
    deque.push_last(4);
    print!("\nПосле добавления 4 в конец дека deque = ");
    print_util::print_array(&deque.to_array());
    deque.push_first(1);
    print!("\nПосле добавления 1 в начало дека deque = ");
    print_util::print_array(&deque.to_array());

    /* Извлечь элементы из дека */
    let pop_last = deque.pop_last();
    print!("\nИзвлечённый последний элемент = {}, после извлечения deque = ", pop_last);
    print_util::print_array(&deque.to_array());
    let pop_first = deque.pop_first();
    print!("\nИзвлечённый первый элемент = {}, после извлечения deque = ", pop_first);
    print_util::print_array(&deque.to_array());

    /* Получить длину дека */
    let size = deque.size();
    print!("\nДлина дека size = {}", size);

    /* Проверить, пуст ли дек */
    let is_empty = deque.is_empty();
    print!("\nДек пуст = {}", is_empty);
}
