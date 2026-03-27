/*
 * File: my_list.rs
 * Created Time: 2023-03-11
 * Author: codingonion (coderonion@gmail.com)
 */

use hello_algo_rust::include::print_util;

/* Класс списка */
#[allow(dead_code)]
struct MyList {
    arr: Vec<i32>,       // Массив (хранит элементы списка)
    capacity: usize,     // Вместимость списка
    size: usize,         // Длина списка (текущее количество элементов)
    extend_ratio: usize, // Коэффициент расширения списка при каждом увеличении
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

    /* Получить длину списка (текущее количество элементов) */
    pub fn size(&self) -> usize {
        return self.size;
    }

    /* Получить вместимость списка */
    pub fn capacity(&self) -> usize {
        return self.capacity;
    }

    /* Получить доступ к элементу */
    pub fn get(&self, index: usize) -> i32 {
        // Если индекс выходит за границы, выбросить исключение; далее аналогично
        if index >= self.size {
            panic!("Индекс вне допустимого диапазона")
        };
        return self.arr[index];
    }

    /* Обновить элемент */
    pub fn set(&mut self, index: usize, num: i32) {
        if index >= self.size {
            panic!("Индекс вне допустимого диапазона")
        };
        self.arr[index] = num;
    }

    /* Добавить элемент в конец */
    pub fn add(&mut self, num: i32) {
        // Если число элементов превышает вместимость, запустить механизм расширения
        if self.size == self.capacity() {
            self.extend_capacity();
        }
        self.arr[self.size] = num;
        // Обновить количество элементов
        self.size += 1;
    }

    /* Вставить элемент в середину */
    pub fn insert(&mut self, index: usize, num: i32) {
        if index >= self.size() {
            panic!("Индекс вне допустимого диапазона")
        };
        // Если число элементов превышает вместимость, запустить механизм расширения
        if self.size == self.capacity() {
            self.extend_capacity();
        }
        // Сдвинуть на одну позицию назад элемент с индексом index и все последующие элементы
        for j in (index..self.size).rev() {
            self.arr[j + 1] = self.arr[j];
        }
        self.arr[index] = num;
        // Обновить количество элементов
        self.size += 1;
    }

    /* Удалить элемент */
    pub fn remove(&mut self, index: usize) -> i32 {
        if index >= self.size() {
            panic!("Индекс вне допустимого диапазона")
        };
        let num = self.arr[index];
        // Сдвинуть на одну позицию вперед все элементы после индекса index
        for j in index..self.size - 1 {
            self.arr[j] = self.arr[j + 1];
        }
        // Обновить количество элементов
        self.size -= 1;
        // Вернуть удаленный элемент
        return num;
    }

    /* Расширение списка */
    pub fn extend_capacity(&mut self) {
        // Создать новый массив длиной в extend_ratio раз больше исходного и скопировать в него исходный массив
        let new_capacity = self.capacity * self.extend_ratio;
        self.arr.resize(new_capacity, 0);
        // ОбновитьВместимость списка
        self.capacity = new_capacity;
    }

    /* Преобразовать список в массив */
    pub fn to_array(&self) -> Vec<i32> {
        // Преобразовать только элементы списка в пределах действительной длины
        let mut arr = Vec::new();
        for i in 0..self.size {
            arr.push(self.get(i));
        }
        arr
    }
}

/* Driver Code */
fn main() {
    /* Инициализировать список */
    let mut nums = MyList::new(10);
    /* Добавить элемент в конец */
    nums.add(1);
    nums.add(3);
    nums.add(2);
    nums.add(5);
    nums.add(4);
    print!("Список nums = ");
    print_util::print_array(&nums.to_array());
    print!(", вместимость = {}, длина = {}", nums.capacity(), nums.size());

    /* Вставить элемент в середину */
    nums.insert(3, 6);
    print!("\nПосле вставки числа 6 по индексу 3 получаем nums =");
    print_util::print_array(&nums.to_array());

    /* Удалить элемент */
    nums.remove(3);
    print!("\nУдалитьиндекс 3 поэлемент, получаем nums =");
    print_util::print_array(&nums.to_array());

    /* Получить доступ к элементу */
    let num = nums.get(1);
    println!("\nобратиться киндекс 1 поэлемент, получаем num = {num}");

    /* Обновить элемент */
    nums.set(1, 0);
    print!("После обновления элемента по индексу 1 на 0 получаем nums = ");
    print_util::print_array(&nums.to_array());

    /* Проверить механизм расширения */
    for i in 0..10 {
        // При i = 5 длина списка превысит его вместимость, и тогда сработает механизм расширения
        nums.add(i);
    }
    print!("\nСписок nums после расширения =");
    print_util::print_array(&nums.to_array());
    print!(", вместимость = {}, длина = {}", nums.capacity(), nums.size());
}
