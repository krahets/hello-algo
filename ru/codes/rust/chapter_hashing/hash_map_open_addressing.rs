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
    size: usize,                // Число пар ключ-значение
    capacity: usize,            // Вместимость хеш-таблицы
    load_thres: f64,            // Порог коэффициента загрузки для запуска расширения
    extend_ratio: usize,        // Коэффициент расширения
    buckets: Vec<Option<Pair>>, // Массив корзин
    TOMBSTONE: Option<Pair>,    // Удалить метку
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

    /* Коэффициент загрузки */
    fn load_factor(&self) -> f64 {
        self.size as f64 / self.capacity as f64
    }

    /* Найти индекс корзины, соответствующий key */
    fn find_bucket(&mut self, key: i32) -> usize {
        let mut index = self.hash_func(key);
        let mut first_tombstone = -1;
        // Выполнять линейное пробирование и завершить при встрече с пустой корзиной
        while self.buckets[index].is_some() {
            // Если встретился key, вернуть соответствующий индекс корзины
            if self.buckets[index].as_ref().unwrap().key == key {
                // Если ранее встретилась метка удаления, переместить пару ключ-значение в этот индекс
                if first_tombstone != -1 {
                    self.buckets[first_tombstone as usize] = self.buckets[index].take();
                    self.buckets[index] = self.TOMBSTONE.clone();
                    return first_tombstone as usize; // Вернуть индекс корзины после перемещения
                }
                return index; // Вернуть индекс корзины
            }
            // Записать первую встретившуюся метку удаления
            if first_tombstone == -1 && self.buckets[index] == self.TOMBSTONE {
                first_tombstone = index as i32;
            }
            // Вычислить индекс корзины; при выходе за конец вернуться к началу
            index = (index + 1) % self.capacity;
        }
        // Если key не существует, вернуть индекс точки добавления
        if first_tombstone == -1 {
            index
        } else {
            first_tombstone as usize
        }
    }

    /* Операция поиска */
    fn get(&mut self, key: i32) -> Option<&str> {
        // Найти индекс корзины, соответствующий key
        let index = self.find_bucket(key);
        // Если пара ключ-значение найдена, вернуть соответствующее val
        if self.buckets[index].is_some() && self.buckets[index] != self.TOMBSTONE {
            return self.buckets[index].as_ref().map(|pair| &pair.val as &str);
        }
        // Если пары ключ-значение не существует, вернуть null
        None
    }

    /* Операция добавления */
    fn put(&mut self, key: i32, val: String) {
        // Когда коэффициент загрузки превышает порог, выполнить расширение
        if self.load_factor() > self.load_thres {
            self.extend();
        }
        // Найти индекс корзины, соответствующий key
        let index = self.find_bucket(key);
        // Если пара ключ-значение найдена, перезаписать val и вернуть
        if self.buckets[index].is_some() && self.buckets[index] != self.TOMBSTONE {
            self.buckets[index].as_mut().unwrap().val = val;
            return;
        }
        // Если пары ключ-значение нет, добавить ее
        self.buckets[index] = Some(Pair { key, val });
        self.size += 1;
    }

    /* Операция удаления */
    fn remove(&mut self, key: i32) {
        // Найти индекс корзины, соответствующий key
        let index = self.find_bucket(key);
        // Если пара ключ-значение найдена, заменить ее меткой удаления
        if self.buckets[index].is_some() && self.buckets[index] != self.TOMBSTONE {
            self.buckets[index] = self.TOMBSTONE.clone();
            self.size -= 1;
        }
    }

    /* Расширить хеш-таблицу */
    fn extend(&mut self) {
        // Временно сохранить исходную хеш-таблицу
        let buckets_tmp = self.buckets.clone();
        // Инициализация новой хеш-таблицы после расширения
        self.capacity *= self.extend_ratio;
        self.buckets = vec![None; self.capacity];
        self.size = 0;

        // Перенести пары ключ-значение из исходной хеш-таблицы в новую
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

/* Driver Code */
fn main() {
    /* Инициализация хеш-таблицы */
    let mut hashmap = HashMapOpenAddressing::new();

    /* Операция добавления */
    // Добавить пару (key, value) в хеш-таблицу
    hashmap.put(12836, "Сяо Ха".to_string());
    hashmap.put(15937, "Сяо Ло".to_string());
    hashmap.put(16750, "Сяо Суань".to_string());
    hashmap.put(13276, "Сяо Фа".to_string());
    hashmap.put(10583, "Сяо Я".to_string());

    println!("\nПосле добавления хеш-таблица имеет вид\nКлюч -> Значение");
    hashmap.print();

    /* Операция поиска */
    // Передать ключ key в хеш-таблицу и получить значение val
    let name = hashmap.get(13276).unwrap();
    println!("\nДля номера 13276 найдено имя {}", name);

    /* Операция удаления */
    // Удалить пару (key, val) из хеш-таблицы
    hashmap.remove(16750);
    println!("\nПосле удаления 16750 хеш-таблица имеет вид\nКлюч -> Значение");
    hashmap.print();
}
