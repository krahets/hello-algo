/*
 * File: permutations_ii.rs
 * Created Time: 2023-07-15
 * Author: codingonion (coderonion@gmail.com)
 */

use std::collections::HashSet;

/* Поиск с возвратом: перестановки II */
fn backtrack(mut state: Vec<i32>, choices: &[i32], selected: &mut [bool], res: &mut Vec<Vec<i32>>) {
    // Когда длина текущей перестановки равна числу элементов, сохраняем решение
    if state.len() == choices.len() {
        res.push(state);
        return;
    }
    // Перебираем все варианты
    let mut duplicated = HashSet::<i32>::new();
    for i in 0..choices.len() {
        let choice = choices[i];
        // Отсечение: нельзя повторно брать тот же элемент или пробовать на этом уровне то же значение
        if !selected[i] && !duplicated.contains(&choice) {
            // Пробуем вариант и обновляем состояние
            duplicated.insert(choice); // Отмечаем уже выбранные значения
            selected[i] = true;
            state.push(choice);
            // Переходим к следующему выбору
            backtrack(state.clone(), choices, selected, res);
            // Возврат: отменяем выбор и восстанавливаем прежнее состояние
            selected[i] = false;
            state.pop();
        }
    }
}

/* Перестановки II */
fn permutations_ii(nums: &mut [i32]) -> Vec<Vec<i32>> {
    let mut res = Vec::new();
    backtrack(Vec::new(), nums, &mut vec![false; nums.len()], &mut res);
    res
}

/* Основная программа */
pub fn main() {
    let mut nums = [1, 2, 2];

    let res = permutations_ii(&mut nums);

    println!("Исходный массив nums = {:?}", &nums);
    println!("Все перестановки res = {:?}", &res);
}
