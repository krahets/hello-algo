/*
 * File: hash_map_chaining.rs
 * Created Time: 2023-07-07
 * Author: WSL0809 (wslzzy@outlook.com)
 */

#[derive(Clone)]
/* Пара ключ-значение */
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

    /* Коэффициент загрузки */
    fn load_factor(&self) -> f32 {
        self.size as f32 / self.capacity as f32
    }

    /* Операция удаления */
    fn remove(&mut self, key: i32) -> Option<String> {
        let index = self.hash_func(key);

        // Обойти корзину и удалить из нее пару ключ-значение
        for (i, p) in self.buckets[index].iter_mut().enumerate() {
            if p.key == key {
                let pair = self.buckets[index].remove(i);
                self.size -= 1;
                return Some(pair.val);
            }
        }

        // Если key не найден, вернуть None
        None
    }

    /* Расширить хеш-таблицу */
    fn extend(&mut self) {
        // Временно сохранить исходную хеш-таблицу
        let buckets_tmp = std::mem::take(&mut self.buckets);

        // Инициализация новой хеш-таблицы после расширения
        self.capacity *= self.extend_ratio;
        self.buckets = vec![Vec::new(); self.capacity as usize];
        self.size = 0;

        // Перенести пары ключ-значение из исходной хеш-таблицы в новую
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

    /* Операция добавления */
    fn put(&mut self, key: i32, val: String) {
        // Когда коэффициент загрузки превышает порог, выполнить расширение
        if self.load_factor() > self.load_thres {
            self.extend();
        }

        let index = self.hash_func(key);

        // Обойти корзину; если встретился указанный key, обновить соответствующее val и вернуть
        for pair in self.buckets[index].iter_mut() {
            if pair.key == key {
                pair.val = val;
                return;
            }
        }

        // Если такого key нет, добавить пару ключ-значение в конец
        let pair = Pair { key, val };
        self.buckets[index].push(pair);
        self.size += 1;
    }

    /* Операция поиска */
    fn get(&self, key: i32) -> Option<&str> {
        let index = self.hash_func(key);

        // Обойти корзину; если найден key, вернуть соответствующее val
        for pair in self.buckets[index].iter() {
            if pair.key == key {
                return Some(&pair.val);
            }
        }

        // Если key не найден, вернуть None
        None
    }
}

/* Driver Code */
pub fn main() {
    /* Инициализация хеш-таблицы */
    let mut map = HashMapChaining::new();

    /* Операция добавления */
    // Добавить пару (key, value) в хеш-таблицу
    map.put(12836, "Сяо Ха".to_string());
    map.put(15937, "Сяо Ло".to_string());
    map.put(16750, "Сяо Суань".to_string());
    map.put(13276, "Сяо Фа".to_string());
    map.put(10583, "Сяо Я".to_string());
    println!("\nПосле добавления хеш-таблица имеет вид\nКлюч -> Значение");
    map.print();

    /* Операция поиска */
    // Ввести в хеш-таблицу ключ key и получить значение value
    println!(
        "\nПо номеру 13276 найдено имя {}",\nmatch map.get(13276) {\n    Some(value) => value,\n    None => "Not a valid Key",\n}
    );

    /* Операция удаления */
    // Удалить пару (key, value) из хеш-таблицы
    map.remove(12836);
    println!("\nПосле удаления 12836 хеш-таблица имеет вид\nКлюч -> Значение");
    map.print();
}
