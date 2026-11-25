/*
 * File: hash_map_chaining.rs
 * Created Time: 2023-07-07
 * Author: WSL0809 (wslzzy@outlook.com)
 */

#[derive(Clone)]
/* Пара «ключ — значение» */
struct Pair {
    key: i32,
    val: String,
}

/* Хеш-таблица с цепочками */
struct HashMapChaining {
    size: usize,
    capacity: usize,
    load_thres: f32,
    extend_ratio: usize,
    buckets: Vec<Vec<Pair>>,
}

impl HashMapChaining {
    /* Конструктор */
    fn new() -> Self {
        Self {
            size: 0,
            capacity: 4,
            load_thres: 2.0 / 3.0,
            extend_ratio: 2,
            buckets: vec![vec![]; 4],
        }
    }

    /* Хеш-функция */
    fn hash_func(&self, key: i32) -> usize {
        key as usize % self.capacity
    }

    /* Коэффициент заполнения */
    fn load_factor(&self) -> f32 {
        self.size as f32 / self.capacity as f32
    }

    /* Удаление */
    fn remove(&mut self, key: i32) -> Option<String> {
        let index = self.hash_func(key);

        // Обойти корзину и удалить из неё нужную пару
        for (i, p) in self.buckets[index].iter_mut().enumerate() {
            if p.key == key {
                let pair = self.buckets[index].remove(i);
                self.size -= 1;
                return Some(pair.val);
            }
        }

        // Если ключ key не найден, вернуть None
        None
    }

    /* Расширить хеш-таблицу */
    fn extend(&mut self) {
        // Временно сохранить исходную хеш-таблицу
        let buckets_tmp = std::mem::take(&mut self.buckets);

        // Создать новую таблицу увеличенной ёмкости
        self.capacity *= self.extend_ratio;
        self.buckets = vec![Vec::new(); self.capacity as usize];
        self.size = 0;

        // Перенести пары из исходной таблицы в новую
        for bucket in buckets_tmp {
            for pair in bucket {
                self.put(pair.key, pair.val);
            }
        }
    }

    /* Вывести хеш-таблицу */
    fn print(&self) {
        for bucket in &self.buckets {
            let mut res = Vec::new();
            for pair in bucket {
                res.push(format!("{} -> {}", pair.key, pair.val));
            }
            println!("{:?}", res);
        }
    }

    /* Вставка */
    fn put(&mut self, key: i32, val: String) {
        // Расширить таблицу, если коэффициент заполнения превысил порог
        if self.load_factor() > self.load_thres {
            self.extend();
        }

        let index = self.hash_func(key);

        // Обойти корзину. Если найден ключ key, обновить val и завершить операцию
        for pair in self.buckets[index].iter_mut() {
            if pair.key == key {
                pair.val = val;
                return;
            }
        }

        // Если ключа key нет, добавить пару в конец списка
        let pair = Pair { key, val };
        self.buckets[index].push(pair);
        self.size += 1;
    }

    /* Поиск */
    fn get(&self, key: i32) -> Option<&str> {
        let index = self.hash_func(key);

        // Обойти корзину и при совпадении ключа key вернуть соответствующее значение val
        for pair in self.buckets[index].iter() {
            if pair.key == key {
                return Some(&pair.val);
            }
        }

        // Если ключ key не найден, вернуть None
        None
    }
}

/* Демонстрационный код */
pub fn main() {
    /* Создать хеш-таблицу */
    let mut map = HashMapChaining::new();

    /* Вставка */
    // Добавить в таблицу пару (key, value)
    map.put(12836, "Сяо Ха".to_string());
    map.put(15937, "Сяо Ло".to_string());
    map.put(16750, "Сяо Суань".to_string());
    map.put(13276, "Сяо Фа".to_string());
    map.put(10583, "Сяо Я".to_string());
    println!("\nХеш-таблица после вставки:\nКлюч -> Значение");
    map.print();

    /* Поиск */
    // Получить из таблицы значение value по ключу key
    println!(
        "\nИмя студента с номером 13276: {}",
        match map.get(13276) {
            Some(value) => value,
            None => "Not a valid Key",
        }
    );

    /* Удаление */
    // Удалить из таблицы пару (key, value)
    map.remove(12836);
    println!("\nХеш-таблица после удаления 12836:\nКлюч -> Значение");
    map.print();
}
