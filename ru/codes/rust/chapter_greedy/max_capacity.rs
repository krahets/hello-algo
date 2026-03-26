/*
 * File: coin_change_greedy.rs
 * Created Time: 2023-07-22
 * Author: night-cruise (2586447362@qq.com)
 */

/* Максимальная вместимость: жадный алгоритм */
fn max_capacity(ht: &[i32]) -> i32 {
    // Инициализировать i и j так, чтобы они располагались на двух концах массива
    let mut i = 0;
    let mut j = ht.len() - 1;
    // Начальная максимальная вместимость равна 0
    let mut res = 0;
    // Повторять жадный выбор, пока две доски не встретятся
    while i < j {
        // Обновить максимальную вместимость
        let cap = std::cmp::min(ht[i], ht[j]) * (j - i) as i32;
        res = std::cmp::max(res, cap);
        // Сдвинуть внутрь более короткую сторону
        if ht[i] < ht[j] {
            i += 1;
        } else {
            j -= 1;
        }
    }
    res
}

/* Driver Code */
fn main() {
    let ht = [3, 8, 5, 2, 7, 7, 3, 4];

    // Жадный алгоритм
    let res = max_capacity(&ht);
    println!("максимальныйвместимостьравно {}", res);
}
