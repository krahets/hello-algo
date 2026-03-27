/*
 * File: my_list.rs
 * Created Time: 2023-03-11
 * Author: codingonion (coderonion@gmail.com)
 */

use hello_algo_rust::include::print_util;

/* Класс списка */
#[allow(dead_code)]
struct MyList {
    arr: Vec<i32>,       // Массив (для хранения элементов списка)
    capacity: usize,     // Вместимость списка
    size: usize,         // Длина списка (текущее число элементов)
    extend_ratio: usize, // Коэффициент увеличения списка при каждом расширении
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

    /* Получить длину списка (текущее число элементов) */
    pub fn size(&self) -> usize {
        return self.size;
    }

    /* Получить вместимость списка */
    pub fn capacity(&self) -> usize {
        return self.capacity;
    }

    /* Доступ к элементу */
    pub fn get(&self, index: usize) -> i32 {
        // Если индекс выходит за границы, выбрасывается исключение; далее аналогично
        if index >= self.size {
            panic!("индекс выходит за границы")
        };
        return self.arr[index];
    }

    /* Обновление элемента */
    pub fn set(&mut self, index: usize, num: i32) {
        if index >= self.size {
            panic!("индекс выходит за границы")
        };
        self.arr[index] = num;
    }

    /* Добавление элемента в конец */
    pub fn add(&mut self, num: i32) {
        // При превышении вместимости по числу элементов запускается расширение
        if self.size == self.capacity() {
            self.extend_capacity();
        }
        self.arr[self.size] = num;
        // Обновить число элементов
        self.size += 1;
    }

    /* Вставка элемента в середину */
    pub fn insert(&mut self, index: usize, num: i32) {
        if index >= self.size() {
            panic!("индекс выходит за границы")
        };
        // При превышении вместимости по числу элементов запускается расширение
        if self.size == self.capacity() {
            self.extend_capacity();
        }
        // Сдвинуть элемент с индексом index и все следующие элементы на одну позицию назад
        for j in (index..self.size).rev() {
            self.arr[j + 1] = self.arr[j];
        }
        self.arr[index] = num;
        // Обновить число элементов
        self.size += 1;
    }

    /* Удаление элемента */
    pub fn remove(&mut self, index: usize) -> i32 {
        if index >= self.size() {
            panic!("индекс выходит за границы")
        };
        let num = self.arr[index];
        // Сдвинуть все элементы после индекса index на одну позицию вперед
        for j in index..self.size - 1 {
            self.arr[j] = self.arr[j + 1];
        }
        // Обновить число элементов
        self.size -= 1;
        // Вернуть удаленный элемент
        return num;
    }

    /* Расширение списка */
    pub fn extend_capacity(&mut self) {
        // Создать новый массив длиной в extend_ratio раз больше исходного и скопировать в него исходный массив
        let new_capacity = self.capacity * self.extend_ratio;
        self.arr.resize(new_capacity, 0);
        // Обновить вместимость списка
        self.capacity = new_capacity;
    }

    /* Преобразовать список в массив */
    pub fn to_array(&self) -> Vec<i32> {
        // Преобразовывать только элементы списка в пределах фактической длины
        let mut arr = Vec::new();
        for i in 0..self.size {
            arr.push(self.get(i));
        }
        arr
    }
}

/* Driver Code */
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
    print!(" , вместимость = {} , длина = {}", nums.capacity(), nums.size());

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

    /* Обновление элемента */
    nums.set(1, 0);
    print!("После обновления элемента по индексу 1 до 0 nums = ");
    print_util::print_array(&nums.to_array());

    /* Проверка механизма расширения */
    for i in 0..10 {
        // При i = 5 длина списка превысит его вместимость, и в этот момент сработает механизм расширения
        nums.add(i);
    }
    print!("\nСписок nums после увеличения вместимости = ");
    print_util::print_array(&nums.to_array());
    print!(" , вместимость = {} , длина = {}", nums.capacity(), nums.size());
}
