/*
 * File: subset_sum_i_naive.rs
 * Created Time: 2023-07-09
 * Author: codingonion (coderonion@gmail.com)
 */

/* Алгоритм бэктрекинга: сумма подмножеств I */
fn backtrack(
    state: &mut Vec<i32>,
    target: i32,
    total: i32,
    choices: &[i32],
    res: &mut Vec<Vec<i32>>,
) {
    // Если сумма подмножества равна target, записать решение
    if total == target {
        res.push(state.clone());
        return;
    }
    // Перебор всех вариантов выбора
    for i in 0..choices.len() {
        // Отсечение: если сумма подмножества превышает target, пропустить этот выбор
        if total + choices[i] > target {
            continue;
        }
        // Попытка: сделать выбор и обновить элемент и total
        state.push(choices[i]);
        // Перейти к следующему выбору
        backtrack(state, target, total + choices[i], choices, res);
        // Откат: отменить выбор и восстановить предыдущее состояние
        state.pop();
    }
}

/* Решить задачу суммы подмножеств I (с повторяющимися подмножествами) */
fn subset_sum_i_naive(nums: &[i32], target: i32) -> Vec<Vec<i32>> {
    let mut state = Vec::new(); // Состояние (подмножество)
    let total = 0; // Сумма подмножеств
    let mut res = Vec::new(); // Список результатов (список подмножеств)
    backtrack(&mut state, target, total, nums, &mut res);
    res
}

/* Driver Code */
pub fn main() {
    let nums = [3, 4, 5];
    let target = 9;

    let res = subset_sum_i_naive(&nums, target);

    println!("Входной массив nums = {:?}, target = {}", &nums, target);
    println!("Все подмножества с суммой {}: res = {:?}", target, &res);
    println!("Обратите внимание: результат этого метода содержит повторяющиеся множества");
}
