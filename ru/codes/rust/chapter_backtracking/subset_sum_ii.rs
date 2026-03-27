/*
 * File: subset_sum_ii.rs
 * Created Time: 2023-07-09
 * Author: codingonion (coderonion@gmail.com)
 */

/* Алгоритм бэктрекинга: сумма подмножеств II */
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
    // Отсечение 3: начинать обход с start, чтобы избежать повторного выбора одного и того же элемента
    for i in start..choices.len() {
        // Отсечение 1: если сумма подмножества превышает target, немедленно завершить цикл
        // Это связано с тем, что массив уже отсортирован, следующие элементы больше, и сумма подмножества точно превысит target
        if target - choices[i] < 0 {
            break;
        }
        // Отсечение 4: если этот элемент равен элементу слева, значит ветвь поиска повторяется, ее нужно сразу пропустить
        if i > start && choices[i] == choices[i - 1] {
            continue;
        }
        // Попытка: сделать выбор и обновить target и start
        state.push(choices[i]);
        // Перейти к следующему выбору
        backtrack(state, target - choices[i], choices, i + 1, res);
        // Откат: отменить выбор и восстановить предыдущее состояние
        state.pop();
    }
}

/* Решить задачу суммы подмножеств II */
fn subset_sum_ii(nums: &mut [i32], target: i32) -> Vec<Vec<i32>> {
    let mut state = Vec::new(); // Состояние (подмножество)
    nums.sort(); // Отсортировать nums
    let start = 0; // Стартовая вершина обхода
    let mut res = Vec::new(); // Список результатов (список подмножеств)
    backtrack(&mut state, target, nums, start, &mut res);
    res
}

/* Driver Code */
pub fn main() {
    let mut nums = [4, 4, 5];
    let target = 9;

    let res = subset_sum_ii(&mut nums, target);

    println!("Входной массив nums = {:?}, target = {}", &nums, target);
    println!("Все подмножества с суммой {}: res = {:?}", target, &res);
}
