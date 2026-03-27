/*
 * File: subset_sum_i.rs
 * Created Time: 2023-07-09
 * Author: codingonion (coderonion@gmail.com)
 */

/* Алгоритм бэктрекинга: сумма подмножеств I */
fn backtrack(
    state: &mut Vec<i32>,
    target: i32,
    choices: &[i32],
    start: usize,
    res: &mut Vec<Vec<i32>>,
) {
    // Если сумма подмножества равна target, записать решение
    if target == 0 {
        res.push(state.clone());
        return;
    }
    // Обойти все варианты выбора
    // Отсечение 2: начинать обход с start, чтобы избежать генерации повторяющихся подмножеств
    for i in start..choices.len() {
        // Отсечение 1: если сумма подмножества превышает target, немедленно завершить цикл
        // Это связано с тем, что массив уже отсортирован, следующие элементы больше, и сумма подмножества точно превысит target
        if target - choices[i] < 0 {
            break;
        }
        // Попытка: сделать выбор и обновить target и start
        state.push(choices[i]);
        // Перейти к следующему выбору
        backtrack(state, target - choices[i], choices, i, res);
        // Откат: отменить выбор и восстановить предыдущее состояние
        state.pop();
    }
}

/* Решить задачу суммы подмножеств I */
fn subset_sum_i(nums: &mut [i32], target: i32) -> Vec<Vec<i32>> {
    let mut state = Vec::new(); // Состояние (подмножество)
    nums.sort(); // Отсортировать nums
    let start = 0; // Стартовая вершина обхода
    let mut res = Vec::new(); // Список результатов (список подмножеств)
    backtrack(&mut state, target, nums, start, &mut res);
    res
}

/* Driver Code */
pub fn main() {
    let mut nums = [3, 4, 5];
    let target = 9;

    let res = subset_sum_i(&mut nums, target);

    println!("Входной массив nums = {:?}, target = {}", &nums, target);
    println!("Все подмножества с суммой {}: res = {:?}", target, &res);
}
