/*
 * File: my_list.rs
 * Created Time: 2023-03-11
 * Author: codingonion (coderonion@gmail.com)
 */

use hello_algo_rust::include::print_util;

/* Класс списка */
#[allow(dead_code)]
struct MyList {
    arr: Vec<i32>,       // Массив для хранения элементов списка
    capacity: usize,     // Ёмкость списка
    size: usize,         // Длина списка (текущее количество элементов)
    extend_ratio: usize, // Коэффициент увеличения ёмкости списка
}

#[allow(unused, unused_comparisons)]
impl MyList {
    /* Конструктор */
    pub fn new(capacity: usize) -> Self {
        let mut vec = vec![0; capacity];
        Self {
            arr: vec,
            capacity,
            size: 0,
            extend_ratio: 2,
        }
    }

    /* Получить длину списка (текущее количество элементов)*/
    pub fn size(&self) -> usize {
        return self.size;
    }

    /* Получить ёмкость списка */
    pub fn capacity(&self) -> usize {
        return self.capacity;
    }

    /* Доступ к элементу */
    pub fn get(&self, index: usize) -> i32 {
        // При выходе индекса за границы выбросить исключение. То же правило действует ниже
        if index >= self.size {
            panic!("Индекс за пределами списка")
        };
        return self.arr[index];
    }

    /* Изменение элемента */
    pub fn set(&mut self, index: usize, num: i32) {
        if index >= self.size {
            panic!("Индекс за пределами списка")
        };
        self.arr[index] = num;
    }

    /* Добавление элемента в конец */
    pub fn add(&mut self, num: i32) {
        // Если для элементов не хватает места, увеличить ёмкость
        if self.size == self.capacity() {
            self.extend_capacity();
        }
        self.arr[self.size] = num;
        // Обновить количество элементов
        self.size += 1;
    }

    /* Вставка элемента в середину */
    pub fn insert(&mut self, index: usize, num: i32) {
        if index >= self.size() {
            panic!("Индекс за пределами списка")
        };
        // Если для элементов не хватает места, увеличить ёмкость
        if self.size == self.capacity() {
            self.extend_capacity();
        }
        // Сдвинуть все элементы начиная с index на одну позицию вправо
        for j in (index..self.size).rev() {
            self.arr[j + 1] = self.arr[j];
        }
        self.arr[index] = num;
        // Обновить количество элементов
        self.size += 1;
    }

    /* Удаление элемента */
    pub fn remove(&mut self, index: usize) -> i32 {
        if index >= self.size() {
            panic!("Индекс за пределами списка")
        };
        let num = self.arr[index];
        // Сдвинуть все элементы после index на одну позицию влево
        for j in index..self.size - 1 {
            self.arr[j] = self.arr[j + 1];
        }
        // Обновить количество элементов
        self.size -= 1;
        // Вернуть удалённый элемент
        return num;
    }

    /* Увеличение ёмкости списка */
    pub fn extend_capacity(&mut self) {
        // Создать массив в extend_ratio раз длиннее исходного и скопировать в него исходный массив
        let new_capacity = self.capacity * self.extend_ratio;
        self.arr.resize(new_capacity, 0);
        // Обновить ёмкость списка
        self.capacity = new_capacity;
    }

    /* Преобразовать список в массив */
    pub fn to_array(&self) -> Vec<i32> {
        // Преобразовать только используемую часть списка
        let mut arr = Vec::new();
        for i in 0..self.size {
            arr.push(self.get(i));
        }
        arr
    }
}

/* Демонстрационный код */
fn main() {
    /* Инициализация списка */
    let mut nums = MyList::new(10);
    /* Добавление элемента в конец */
    nums.add(1);
    nums.add(3);
    nums.add(2);
    nums.add(5);
    nums.add(4);
    print!("Список nums = ");
    print_util::print_array(&nums.to_array());
    print!(" | ёмкость = {}, длина = {}", nums.capacity(), nums.size());

    /* Вставка элемента в середину */
    nums.insert(3, 6);
    print!("\nПосле вставки числа 6 по индексу 3 nums = ");
    print_util::print_array(&nums.to_array());

    /* Удаление элемента */
    nums.remove(3);
    print!("\nПосле удаления элемента по индексу 3 nums = ");
    print_util::print_array(&nums.to_array());

    /* Доступ к элементу */
    let num = nums.get(1);
    println!("\nЭлемент по индексу 1: num = {num}");

    /* Изменение элемента */
    nums.set(1, 0);
    print!("После записи 0 по индексу 1 nums = ");
    print_util::print_array(&nums.to_array());

    /* Проверка увеличения ёмкости */
    for i in 0..10 {
        // При i = 5 длина списка превысит его ёмкость, поэтому потребуется увеличить ёмкость
        nums.add(i);
    }
    print!("\nПосле увеличения ёмкости список nums = ");
    print_util::print_array(&nums.to_array());
    print!(" | ёмкость = {}, длина = {}", nums.capacity(), nums.size());
}
