/**
 * File: array_hash_map.rs
 * Created Time: 2023-2-18
 * Author: xBLACICEx (xBLACKICEx@outlook.com)
 */

/* Пара ключ-значение */
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
        // Инициализировать массив, содержащий 100 корзин
        Self {
            buckets: vec![None; 100],
        }
    }

    /* Хеш-функция */
    fn hash_func(&self, key: i32) -> usize {
        key as usize % 100
    }

    /* Операция поиска */
    pub fn get(&self, key: i32) -> Option<&String> {
        let index = self.hash_func(key);
        self.buckets[index].as_ref().map(|pair| &pair.val)
    }

    /* Операция добавления */
    pub fn put(&mut self, key: i32, val: &str) {
        let index = self.hash_func(key);
        self.buckets[index] = Some(Pair {
            key,
            val: val.to_string(),
        });
    }

    /* Операция удаления */
    pub fn remove(&mut self, key: i32) {
        let index = self.hash_func(key);
        // Присвоить None, что означает удаление
        self.buckets[index] = None;
    }

    /* Получить все пары ключ-значение */
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
    /* Инициализация хеш-таблицы */
    let mut map = ArrayHashMap::new();
    /* Операция добавления */
    // Добавить пару (key, value) в хеш-таблицу
    map.put(12836, "Сяо Ха");
    map.put(15937, "Сяо Ло");
    map.put(16750, "Сяо Суань");
    map.put(13276, "Сяо Фа");
    map.put(10583, "Сяо Я");
    println!("\nПосле добавления хеш-таблица имеет вид\nКлюч -> Значение");
    map.print();

    /* Операция поиска */
    // Ввести в хеш-таблицу ключ key и получить значение value
    let name = map.get(15937).unwrap();
    println!("\nДля номера 15937 найдено имя {}", name);

    /* Операция удаления */
    // Удалить пару (key, value) из хеш-таблицы
    map.remove(10583);
    println!("\nПосле удаления 10583 хеш-таблица имеет вид\nКлюч -> Значение");
    map.print();

    /* Обход хеш-таблицы */
    println!("\nОтдельный обход пар ключ-значение");
    for pair in map.entry_set() {
        println!("{} -> {}", pair.key, pair.val);
    }

    println!("\nОтдельный обход ключей");
    for key in map.key_set() {
        println!("{}", key);
    }

    println!("\nОтдельный обход значений");
    for val in map.value_set() {
        println!("{}", val);
    }
}
