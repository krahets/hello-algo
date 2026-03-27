/*
 * File: my_heap.rs
 * Created Time: 2023-07-16
 * Author: night-cruise (2586447362@qq.com)
 */

use hello_algo_rust::include::print_util;

/* Максимальная куча */
struct MaxHeap {
    // Использовать vector вместо массива, чтобы не учитывать проблему расширения
    max_heap: Vec<i32>,
}

impl MaxHeap {
    /* Конструктор, строящий кучу по входному списку */
    fn new(nums: Vec<i32>) -> Self {
        // Добавить элементы списка в кучу без изменений
        let mut heap = MaxHeap { max_heap: nums };
        // Выполнить heapify для всех узлов, кроме листовых
        for i in (0..=Self::parent(heap.size() - 1)).rev() {
            heap.sift_down(i);
        }
        heap
    }

    /* Получить индекс левого дочернего узла */
    fn left(i: usize) -> usize {
        2 * i + 1
    }

    /* Получить индекс правого дочернего узла */
    fn right(i: usize) -> usize {
        2 * i + 2
    }

    /* Получить индекс родительского узла */
    fn parent(i: usize) -> usize {
        (i - 1) / 2 // Округление вниз при делении
    }

    /* Поменять элементы местами */
    fn swap(&mut self, i: usize, j: usize) {
        self.max_heap.swap(i, j);
    }

    /* Получение размера кучи */
    fn size(&self) -> usize {
        self.max_heap.len()
    }

    /* Проверка, пуста ли куча */
    fn is_empty(&self) -> bool {
        self.max_heap.is_empty()
    }

    /* Доступ к элементу на вершине кучи */
    fn peek(&self) -> Option<i32> {
        self.max_heap.first().copied()
    }

    /* Добавление элемента в кучу */
    fn push(&mut self, val: i32) {
        // Добавление узла
        self.max_heap.push(val);
        // Просеивание снизу вверх
        self.sift_up(self.size() - 1);
    }

    /* Начиная с узла i, выполнить просеивание снизу вверх */
    fn sift_up(&mut self, mut i: usize) {
        loop {
            // Если узел i уже является вершиной кучи, завершить просеивание
            if i == 0 {
                break;
            }
            // Получение родительского узла для узла i
            let p = Self::parent(i);
            // Когда «узел не требует исправления», завершить просеивание
            if self.max_heap[i] <= self.max_heap[p] {
                break;
            }
            // Поменять два узла местами
            self.swap(i, p);
            // Циклическое просеивание вверх
            i = p;
        }
    }

    /* Извлечение элемента из кучи */
    fn pop(&mut self) -> i32 {
        // Обработка пустого случая
        if self.is_empty() {
            panic!("index out of bounds");
        }
        // Поменять корневой узел с самым правым листом местами (поменять первый и последний элементы)
        self.swap(0, self.size() - 1);
        // Удаление узла
        let val = self.max_heap.pop().unwrap();
        // Просеивание сверху вниз
        self.sift_down(0);
        // Вернуть элемент с вершины кучи
        val
    }

    /* Начиная с узла i, выполнить просеивание сверху вниз */
    fn sift_down(&mut self, mut i: usize) {
        loop {
            // Определить узел с максимальным значением среди i, l и r и обозначить его как ma
            let (l, r, mut ma) = (Self::left(i), Self::right(i), i);
            if l < self.size() && self.max_heap[l] > self.max_heap[ma] {
                ma = l;
            }
            if r < self.size() && self.max_heap[r] > self.max_heap[ma] {
                ma = r;
            }
            // Если узел i уже максимален или индексы l и r вне границ, дальнейшее просеивание не требуется, выйти
            if ma == i {
                break;
            }
            // Поменять два узла местами
            self.swap(i, ma);
            // Циклическое просеивание вниз
            i = ma;
        }
    }

    /* Вывести кучу (двоичное дерево) */
    fn print(&self) {
        print_util::print_heap(self.max_heap.clone());
    }
}

/* Driver Code */
fn main() {
    /* Инициализация максимальной кучи */
    let mut max_heap = MaxHeap::new(vec![9, 8, 6, 6, 7, 5, 2, 1, 4, 3, 6, 2]);
    println!("\nПосле построения кучи из входного списка");
    max_heap.print();

    /* Получение элемента с вершины кучи */
    let peek = max_heap.peek();
    if let Some(peek) = peek {
        println!("\nЭлемент на вершине кучи = {}", peek);
    }

    /* Добавление элемента в кучу */
    let val = 7;
    max_heap.push(val);
    println!("\nПосле добавления элемента {} в кучу", val);
    max_heap.print();

    /* Извлечение элемента с вершины кучи */
    let peek = max_heap.pop();
    println!("\nПосле извлечения элемента вершины кучи {}", peek);
    max_heap.print();

    /* Получение размера кучи */
    let size = max_heap.size();
    println!("\nКоличество элементов в куче = {}", size);

    /* Проверка, пуста ли куча */
    let is_empty = max_heap.is_empty();
    println!("\nПуста ли куча: {}", is_empty);
}
