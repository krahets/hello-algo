/*
 * File: coin_change_greedy.rs
 * Created Time: 2023-07-22
 * Author: night-cruise (2586447362@qq.com)
 */

/* Предмет */
struct Item {
    w: i32, // Вес предмета
    v: i32, // Стоимость предмета
}

impl Item {
    fn new(w: i32, v: i32) -> Self {
        Self { w, v }
    }
}

/* Дробный рюкзак: жадный алгоритм */
fn fractional_knapsack(wgt: &[i32], val: &[i32], mut cap: i32) -> f64 {
    // Создаём список предметов с двумя свойствами: весом и стоимостью
    let mut items = wgt
        .iter()
        .zip(val.iter())
        .map(|(&w, &v)| Item::new(w, v))
        .collect::<Vec<Item>>();
    // Сортируем по убыванию удельной стоимости item.v / item.w
    items.sort_by(|a, b| {
        (b.v as f64 / b.w as f64)
            .partial_cmp(&(a.v as f64 / a.w as f64))
            .unwrap()
    });
    // На каждом шаге делаем жадный выбор
    let mut res = 0.0;
    for item in &items {
        if item.w <= cap {
            // Если места достаточно, кладём предмет целиком
            res += item.v as f64;
            cap -= item.w;
        } else {
            // Если места недостаточно, кладём часть предмета
            res += item.v as f64 / item.w as f64 * cap as f64;
            // Рюкзак заполнен, выходим из цикла
            break;
        }
    }
    res
}

/* Пример запуска */
fn main() {
    let wgt = [10, 20, 30, 40, 50];
    let val = [50, 120, 150, 210, 240];
    let cap = 50;

    // Жадный алгоритм
    let res = fractional_knapsack(&wgt, &val, cap);
    println!("Максимальная стоимость при заданной вместимости рюкзака: {}", res);
}
