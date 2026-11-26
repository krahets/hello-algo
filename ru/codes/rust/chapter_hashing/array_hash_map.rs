/**
 * File: array_hash_map.rs
 * Created Time: 2023-2-18
 * Author: xBLACICEx (xBLACKICEx@outlook.com)
 */

/* Пара «ключ — значение» */
#[derive(Debug, Clone, PartialEq)]
pub struct Pair {
    pub key: i32,
    pub val: String,
}
/* Хеш-таблица на основе массива */
pub struct ArrayHashMap {
    buckets: Vec<Option<Pair>>,
}

impl ArrayHashMap {
    pub fn new() -> ArrayHashMap {
        // Создать массив из 100 корзин
        Self {
            buckets: vec![None; 100],
        }
    }

    /* Хеш-функция */
    fn hash_func(&self, key: i32) -> usize {
        key as usize % 100
    }

    /* Поиск */
    pub fn get(&self, key: i32) -> Option<&String> {
        let index = self.hash_func(key);
        self.buckets[index].as_ref().map(|pair| &pair.val)
    }

    /* Вставка */
    pub fn put(&mut self, key: i32, val: &str) {
        let index = self.hash_func(key);
        self.buckets[index] = Some(Pair {
            key,
            val: val.to_string(),
        });
    }

    /* Удаление */
    pub fn remove(&mut self, key: i32) {
        let index = self.hash_func(key);
        // Записать None в знак удаления
        self.buckets[index] = None;
    }

    /* Получить все пары «ключ — значение» */
    pub fn entry_set(&self) -> Vec<&Pair> {
        self.buckets
            .iter()
            .filter_map(|pair| pair.as_ref())
            .collect()
    }

    /* Получить все ключи */
    pub fn key_set(&self) -> Vec<&i32> {
        self.buckets
            .iter()
            .filter_map(|pair| pair.as_ref().map(|pair| &pair.key))
            .collect()
    }

    /* Получить все значения */
    pub fn value_set(&self) -> Vec<&String> {
        self.buckets
            .iter()
            .filter_map(|pair| pair.as_ref().map(|pair| &pair.val))
            .collect()
    }

    /* Вывести хеш-таблицу */
    pub fn print(&self) {
        for pair in self.entry_set() {
            println!("{} -> {}", pair.key, pair.val);
        }
    }
}

fn main() {
    /* Создать хеш-таблицу */
    let mut map = ArrayHashMap::new();
    /*Вставка */
    // Добавить в таблицу пару (key, value)
    map.put(12836, "Сяо Ха");
    map.put(15937, "Сяо Ло");
    map.put(16750, "Сяо Суань");
    map.put(13276, "Сяо Фа");
    map.put(10583, "Сяо Я");
    println!("\nХеш-таблица после вставки:\nКлюч -> Значение");
    map.print();

    /* Поиск */
    // Получить из таблицы значение value по ключу key
    let name = map.get(15937).unwrap();
    println!("\nИмя студента с номером 15937: {}", name);

    /* Удаление */
    // Удалить из таблицы пару (key, value)
    map.remove(10583);
    println!("\nХеш-таблица после удаления 10583:\nКлюч -> Значение");
    map.print();

    /* Обход хеш-таблицы */
    println!("\nОбход пар «ключ -> значение»");
    for pair in map.entry_set() {
        println!("{} -> {}", pair.key, pair.val);
    }

    println!("\nОбход только ключей");
    for key in map.key_set() {
        println!("{}", key);
    }

    println!("\nОбход только значений");
    for val in map.value_set() {
        println!("{}", val);
    }
}
