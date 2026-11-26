/*
 * File: subset_sum_i_naive.rs
 * Created Time: 2023-07-09
 * Author: codingonion (coderonion@gmail.com)
 */

/* Поиск с возвратом: сумма подмножества I */
fn backtrack(
    state: &mut Vec<i32>,
    target: i32,
    total: i32,
    choices: &[i32],
    res: &mut Vec<Vec<i32>>,
) {
    // Если сумма подмножества равна target, сохраняем решение
    if total == target {
        res.push(state.clone());
        return;
    }
    // Перебираем все варианты
    for i in 0..choices.len() {
        // Отсечение: если сумма подмножества превысит target, пропускаем этот вариант
        if total + choices[i] > target {
            continue;
        }
        // Пробуем вариант и обновляем сумму элементов total
        state.push(choices[i]);
        // Переходим к следующему выбору
        backtrack(state, target, total + choices[i], choices, res);
        // Возврат: отменяем выбор и восстанавливаем прежнее состояние
        state.pop();
    }
}

/* Задача о сумме подмножества I (с повторяющимися подмножествами) */
fn subset_sum_i_naive(nums: &[i32], target: i32) -> Vec<Vec<i32>> {
    let mut state = Vec::new(); // Состояние (подмножество)
    let total = 0; // Сумма подмножества
    let mut res = Vec::new(); // Список результатов (список подмножеств)
    backtrack(&mut state, target, total, nums, &mut res);
    res
}

/* Основная программа */
pub fn main() {
    let nums = [3, 4, 5];
    let target = 9;

    let res = subset_sum_i_naive(&nums, target);

    println!("Исходный массив nums = {:?}, target = {}", &nums, target);
    println!("Все подмножества с суммой {}: res = {:?}", target, &res);
    println!("Обратите внимание: результат этого метода содержит повторяющиеся множества");
}
