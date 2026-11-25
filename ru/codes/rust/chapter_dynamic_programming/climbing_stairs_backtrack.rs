/*
 * File: climbing_stairs_backtrack.rs
 * Created Time: 2023-07-09
 * Author: codingonion (coderonion@gmail.com)
 */

/* Поиск с возвратом */
fn backtrack(choices: &[i32], state: i32, n: i32, res: &mut [i32]) {
    // На ступени n увеличить число способов на 1
    if state == n {
        res[0] = res[0] + 1;
    }
    // Перебрать все варианты
    for &choice in choices {
        // Отсечь шаги за ступень n
        if state + choice > n {
            continue;
        }
        // Сделать выбор и обновить состояние
        backtrack(choices, state + choice, n, res);
        // Отменить выбор
    }
}

/* Подъём по лестнице: поиск с возвратом */
fn climbing_stairs_backtrack(n: usize) -> i32 {
    let choices = vec![1, 2]; // Можно подняться на 1 или 2 ступени
    let state = 0; // Начать со ступени 0
    let mut res = Vec::new();
    res.push(0); // Хранить число способов в res[0]
    backtrack(&choices, state, n as i32, &mut res);
    res[0]
}

/* Основная программа */
pub fn main() {
    let n: usize = 9;

    let res = climbing_stairs_backtrack(n);
    println!("Число способов подняться на лестницу из {n} ступеней: {res}.");
}
