/*
 * File: coin_change_greedy.rs
 * Created Time: 2023-07-22
 * Author: night-cruise (2586447362@qq.com)
 */

/* Максимальная вместимость: жадный алгоритм */
fn max_capacity(ht: &[i32]) -> i32 {
    // Ставим i и j на противоположные концы массива
    let mut i = 0;
    let mut j = ht.len() - 1;
    // Изначально максимальная вместимость равна 0
    let mut res = 0;
    // Повторяем жадный выбор, пока перегородки не встретятся
    while i < j {
        // Обновляем максимальную вместимость
        let cap = std::cmp::min(ht[i], ht[j]) * (j - i) as i32;
        res = std::cmp::max(res, cap);
        // Сдвигаем указатель у более низкой перегородки к центру
        if ht[i] < ht[j] {
            i += 1;
        } else {
            j -= 1;
        }
    }
    res
}

/* Пример запуска */
fn main() {
    let ht = [3, 8, 5, 2, 7, 7, 3, 4];

    // Жадный алгоритм
    let res = max_capacity(&ht);
    println!("Максимальная вместимость: {}", res);
}
