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
    // Создать список предметов с двумя свойствами: вес и стоимость
    let mut items = wgt
        .iter()
        .zip(val.iter())
        .map(|(&w, &v)| Item::new(w, v))
        .collect::<Vec<Item>>();
    // Отсортировать по удельной стоимости item.v / item.w в порядке убывания
    items.sort_by(|a, b| {
        (b.v as f64 / b.w as f64)
            .partial_cmp(&(a.v as f64 / a.w as f64))
            .unwrap()
    });
    // Циклический жадный выбор
    let mut res = 0.0;
    for item in &items {
        if item.w <= cap {
            // Если оставшейся вместимости достаточно, положить в рюкзак текущий предмет целиком
            res += item.v as f64;
            cap -= item.w;
        } else {
            // Если оставшейся вместимости недостаточно, положить в рюкзак часть текущего предмета
            res += item.v as f64 / item.w as f64 * cap as f64;
            // Свободной вместимости больше не осталось, поэтому выйти из цикла
            break;
        }
    }
    res
}

/* Driver Code */
fn main() {
    let wgt = [10, 20, 30, 40, 50];
    let val = [50, 120, 150, 210, 240];
    let cap = 50;

    // Жадный алгоритм
    let res = fractional_knapsack(&wgt, &val, cap);
    println!("Максимальная стоимость предметов без превышения вместимости рюкзака = {}", res);
}
