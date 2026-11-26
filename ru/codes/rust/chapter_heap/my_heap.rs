/*
 * File: my_heap.rs
 * Created Time: 2023-07-16
 * Author: night-cruise (2586447362@qq.com)
 */

use hello_algo_rust::include::print_util;

/* Макс-куча */
struct MaxHeap {
    // Вектор, в отличие от массива, расширяется автоматически
    max_heap: Vec<i32>,
}

impl MaxHeap {
    /* Конструктор кучи по входному списку */
    fn new(nums: Vec<i32>) -> Self {
        // Поместить элементы списка в кучу в прежнем порядке
        let mut heap = MaxHeap { max_heap: nums };
        // Выполнить просеивание для всех узлов, кроме листьев
        for i in (0..=Self::parent(heap.size() - 1)).rev() {
            heap.sift_down(i);
        }
        heap
    }

    /* Индекс левого ребёнка */
    fn left(i: usize) -> usize {
        2 * i + 1
    }

    /* Индекс правого ребёнка */
    fn right(i: usize) -> usize {
        2 * i + 2
    }

    /* Индекс родителя */
    fn parent(i: usize) -> usize {
        (i - 1) / 2 // Целочисленное деление с округлением вниз
    }

    /* Поменять элементы местами */
    fn swap(&mut self, i: usize, j: usize) {
        self.max_heap.swap(i, j);
    }

    /* Размер кучи */
    fn size(&self) -> usize {
        self.max_heap.len()
    }

    /* Проверить, пуста ли куча */
    fn is_empty(&self) -> bool {
        self.max_heap.is_empty()
    }

    /* Посмотреть элемент в корне */
    fn peek(&self) -> Option<i32> {
        self.max_heap.first().copied()
    }

    /* Вставить элемент в кучу */
    fn push(&mut self, val: i32) {
        // Добавить узел
        self.max_heap.push(val);
        // Просеивание вверх
        self.sift_up(self.size() - 1);
    }

    /* Просеивать вверх от узла i */
    fn sift_up(&mut self, mut i: usize) {
        loop {
            // Узел i уже достиг корня. Завершить просеивание
            if i == 0 {
                break;
            }
            // Найти родителя узла i
            let p = Self::parent(i);
            // Если узел уже на своём месте, завершить просеивание
            if self.max_heap[i] <= self.max_heap[p] {
                break;
            }
            // Поменять два узла местами
            self.swap(i, p);
            // Продолжить просеивание вверх
            i = p;
        }
    }

    /* Извлечь элемент из кучи */
    fn pop(&mut self) -> i32 {
        // Проверить, пуста ли куча
        if self.is_empty() {
            panic!("index out of bounds");
        }
        // Поменять местами корень и крайний правый лист (первый и последний элементы)
        self.swap(0, self.size() - 1);
        // Удалить узел
        let val = self.max_heap.pop().unwrap();
        // Просеивание вниз
        self.sift_down(0);
        // Вернуть элемент из корня
        val
    }

    /* Просеивать вниз от узла i */
    fn sift_down(&mut self, mut i: usize) {
        loop {
            // Сохранить в ma индекс наибольшего из узлов i, l и r
            let (l, r, mut ma) = (Self::left(i), Self::right(i), i);
            if l < self.size() && self.max_heap[l] > self.max_heap[ma] {
                ma = l;
            }
            if r < self.size() && self.max_heap[r] > self.max_heap[ma] {
                ma = r;
            }
            // Если ни у одного потомка значение не больше, чем у родителя, завершить просеивание
            if ma == i {
                break;
            }
            // Поменять два узла местами
            self.swap(i, ma);
            // Продолжить просеивание вниз
            i = ma;
        }
    }

    /* Вывести кучу в виде бинарного дерева */
    fn print(&self) {
        print_util::print_heap(self.max_heap.clone());
    }
}

/* Пример использования */
fn main() {
    /* Инициализировать макс-кучу */
    let mut max_heap = MaxHeap::new(vec![9, 8, 6, 6, 7, 5, 2, 1, 4, 3, 6, 2]);
    println!("\nКуча, построенная по входному списку:");
    max_heap.print();

    /* Получить элемент в корне */
    let peek = max_heap.peek();
    if let Some(peek) = peek {
        println!("\nЭлемент в корне: {}", peek);
    }

    /* Вставить элемент в кучу */
    let val = 7;
    max_heap.push(val);
    println!("\nПосле вставки элемента {}:", val);
    max_heap.print();

    /* Извлечь элемент из корня */
    let peek = max_heap.pop();
    println!("\nПосле извлечения элемента {} из корня:", peek);
    max_heap.print();

    /* Размер кучи */
    let size = max_heap.size();
    println!("\nЧисло элементов в куче: {}", size);

    /* Проверить, пуста ли куча */
    let is_empty = max_heap.is_empty();
    println!("\nПуста ли куча: {}", is_empty);
}
