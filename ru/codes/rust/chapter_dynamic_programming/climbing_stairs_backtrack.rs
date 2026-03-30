/*
 * File: climbing_stairs_backtrack.rs
 * Created Time: 2023-07-09
 * Author: codingonion (coderonion@gmail.com)
 */

/* Бэктрекинг */
fn backtrack(choices: &[i32], state: i32, n: i32, res: &mut [i32]) {
    // Когда подъем достигает n-й ступени, число вариантов увеличивается на 1
    if state == n {
        res[0] = res[0] + 1;
    }
    // Перебор всех вариантов выбора
    for &choice in choices {
        // Отсечение: нельзя выходить за n-ю ступень
        if state + choice > n {
            continue;
        }
        // Попытка: сделать выбор и обновить состояние
        backtrack(choices, state + choice, n, res);
        // Откат
    }
}

/* Подъем по лестнице: бэктрекинг */
fn climbing_stairs_backtrack(n: usize) -> i32 {
    let choices = vec![1, 2]; // Можно подняться на 1 или 2 ступени
    let state = 0; // Начать подъем с 0-й ступени
    let mut res = Vec::new();
    res.push(0); // Использовать res[0] для хранения числа решений
    backtrack(&choices, state, n as i32, &mut res);
    res[0]
}

/* Driver Code */
pub fn main() {
    let n: usize = 9;

    let res = climbing_stairs_backtrack(n);
    println!("Количество способов подняться по лестнице из {n} ступеней = {res}");
}
