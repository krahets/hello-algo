/*
 * File: hash_map_open_addressing.rs
 * Created Time: 2023-07-16
 * Author: WSL0809 (wslzzy@outlook.com), night-cruise (2586447362@qq.com)
 */
#![allow(non_snake_case)]
#![allow(unused)]

mod array_hash_map;

use array_hash_map::Pair;

/* Хеш-таблица с открытой адресацией */
struct HashMapOpenAddressing {
    size: usize,                // Число пар «ключ — значение»
    capacity: usize,            // Ёмкость хеш-таблицы
    load_thres: f64,            // Порог коэффициента заполнения для расширения
    extend_ratio: usize,        // Во сколько раз увеличивается ёмкость
    buckets: Vec<Option<Pair>>, // Массив корзин
    TOMBSTONE: Option<Pair>,    // Метка удаления
}

impl HashMapOpenAddressing {
    /* Конструктор */
    fn new() -> Self {
        Self {
            size: 0,
            capacity: 4,
            load_thres: 2.0 / 3.0,
            extend_ratio: 2,
            buckets: vec![None; 4],
            TOMBSTONE: Some(Pair {
                key: -1,
                val: "-1".to_string(),
            }),
        }
    }

    /* Хеш-функция */
    fn hash_func(&self, key: i32) -> usize {
        (key % self.capacity as i32) as usize
    }

    /* Коэффициент заполнения */
    fn load_factor(&self) -> f64 {
        self.size as f64 / self.capacity as f64
    }

    /* Найти индекс корзины для ключа key */
    fn find_bucket(&mut self, key: i32) -> usize {
        let mut index = self.hash_func(key);
        let mut first_tombstone = -1;
        // Линейное пробирование до первой пустой корзины
        while self.buckets[index].is_some() {
            // При совпадении ключа key вернуть индекс его корзины
            if self.buckets[index].as_ref().unwrap().key == key {
                // Если ранее встретилась метка удаления, переместить пару на её место
                if first_tombstone != -1 {
                    self.buckets[first_tombstone as usize] = self.buckets[index].take();
                    self.buckets[index] = self.TOMBSTONE.clone();
                    return first_tombstone as usize; // Вернуть индекс корзины после перемещения
                }
                return index; // Вернуть индекс корзины
            }
            // Запомнить первую встретившуюся метку удаления
            if first_tombstone == -1 && self.buckets[index] == self.TOMBSTONE {
                first_tombstone = index as i32;
            }
            // Вычислить индекс корзины, после конца массива перейти в начало
            index = (index + 1) % self.capacity;
        }
        // Если ключа key нет, вернуть индекс для вставки
        if first_tombstone == -1 {
            index
        } else {
            first_tombstone as usize
        }
    }

    /* Поиск */
    fn get(&mut self, key: i32) -> Option<&str> {
        // Найти индекс корзины для ключа key
        let index = self.find_bucket(key);
        // Если пара найдена, вернуть её значение val
        if self.buckets[index].is_some() && self.buckets[index] != self.TOMBSTONE {
            return self.buckets[index].as_ref().map(|pair| &pair.val as &str);
        }
        // Если пары нет, вернуть null
        None
    }

    /* Вставка */
    fn put(&mut self, key: i32, val: String) {
        // Расширить таблицу, если коэффициент заполнения превысил порог
        if self.load_factor() > self.load_thres {
            self.extend();
        }
        // Найти индекс корзины для ключа key
        let index = self.find_bucket(key);
        // Если пара найдена, заменить val и завершить операцию
        if self.buckets[index].is_some() && self.buckets[index] != self.TOMBSTONE {
            self.buckets[index].as_mut().unwrap().val = val;
            return;
        }
        // Если пары нет, добавить её
        self.buckets[index] = Some(Pair { key, val });
        self.size += 1;
    }

    /* Удаление */
    fn remove(&mut self, key: i32) {
        // Найти индекс корзины для ключа key
        let index = self.find_bucket(key);
        // Если пара найдена, заменить её меткой удаления
        if self.buckets[index].is_some() && self.buckets[index] != self.TOMBSTONE {
            self.buckets[index] = self.TOMBSTONE.clone();
            self.size -= 1;
        }
    }

    /* Расширить хеш-таблицу */
    fn extend(&mut self) {
        // Временно сохранить исходную хеш-таблицу
        let buckets_tmp = self.buckets.clone();
        // Создать новую таблицу увеличенной ёмкости
        self.capacity *= self.extend_ratio;
        self.buckets = vec![None; self.capacity];
        self.size = 0;

        // Перенести пары из исходной таблицы в новую
        for pair in buckets_tmp {
            if pair.is_none() || pair == self.TOMBSTONE {
                continue;
            }
            let pair = pair.unwrap();

            self.put(pair.key, pair.val);
        }
    }
    /* Вывести хеш-таблицу */
    fn print(&self) {
        for pair in &self.buckets {
            if pair.is_none() {
                println!("null");
            } else if pair == &self.TOMBSTONE {
                println!("TOMBSTONE");
            } else {
                let pair = pair.as_ref().unwrap();
                println!("{} -> {}", pair.key, pair.val);
            }
        }
    }
}

/* Демонстрационный код */
fn main() {
    /* Создать хеш-таблицу */
    let mut hashmap = HashMapOpenAddressing::new();

    /* Вставка */
    // Добавить в таблицу пару (key, value)
    hashmap.put(12836, "Сяо Ха".to_string());
    hashmap.put(15937, "Сяо Ло".to_string());
    hashmap.put(16750, "Сяо Суань".to_string());
    hashmap.put(13276, "Сяо Фа".to_string());
    hashmap.put(10583, "Сяо Я".to_string());

    println!("\nХеш-таблица после вставки:\nКлюч -> Значение");
    hashmap.print();

    /* Поиск */
    // Получить из таблицы значение val по ключу key
    let name = hashmap.get(13276).unwrap();
    println!("\nИмя студента с номером 13276: {}", name);

    /* Удаление */
    // Удалить из таблицы пару (key, val)
    hashmap.remove(16750);
    println!("\nХеш-таблица после удаления 16750:\nКлюч -> Значение");
    hashmap.print();
}
