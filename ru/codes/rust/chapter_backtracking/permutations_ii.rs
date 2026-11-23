/*
 * File: permutations_ii.rs
 * Created Time: 2023-07-15
 * Author: codingonion (coderonion@gmail.com)
 */

use std::collections::HashSet;

/* Алгоритм бэктрекинга: все перестановки II */
fn backtrack(mut state: Vec<i32>, choices: &[i32], selected: &mut [bool], res: &mut Vec<Vec<i32>>) {
    // Когда длина состояния равна числу элементов, записать решение
    if state.len() == choices.len() {
        res.push(state);
        return;
    }
    // Перебор всех вариантов выбора
    let mut duplicated = HashSet::<i32>::new();
    for i in 0..choices.len() {
        let choice = choices[i];
        // Отсечение: нельзя выбирать один и тот же элемент повторно и нельзя повторно выбирать равные элементы
        if !selected[i] && !duplicated.contains(&choice) {
            // Попытка: сделать выбор и обновить состояние
            duplicated.insert(choice); // Записать значения уже выбранных элементов
            selected[i] = true;
            state.push(choice);
            // Перейти к следующему выбору
            backtrack(state.clone(), choices, selected, res);
            // Откат: отменить выбор и восстановить предыдущее состояние
            selected[i] = false;
            state.pop();
        }
    }
}

/* Все перестановки II */
fn permutations_ii(nums: &mut [i32]) -> Vec<Vec<i32>> {
    let mut res = Vec::new();
    backtrack(Vec::new(), nums, &mut vec![false; nums.len()], &mut res);
    res
}

/* Driver Code */
pub fn main() {
    let mut nums = [1, 2, 2];

    let res = permutations_ii(&mut nums);

    println!("Входной массив nums = {:?}", &nums);
    println!("Все перестановки res = {:?}", &res);
}
