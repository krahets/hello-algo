/*
 * File: permutations_i.rs
 * Created Time: 2023-07-15
 * Author: codingonion (coderonion@gmail.com)
 */

/* Поиск с возвратом: перестановки I */
fn backtrack(mut state: Vec<i32>, choices: &[i32], selected: &mut [bool], res: &mut Vec<Vec<i32>>) {
    // Когда длина текущей перестановки равна числу элементов, сохраняем решение
    if state.len() == choices.len() {
        res.push(state);
        return;
    }
    // Перебираем все варианты
    for i in 0..choices.len() {
        let choice = choices[i];
        // Отсечение: нельзя выбирать один элемент дважды
        if !selected[i] {
            // Пробуем вариант и обновляем состояние
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

/* Перестановки I */
fn permutations_i(nums: &mut [i32]) -> Vec<Vec<i32>> {
    let mut res = Vec::new(); // Состояние (подмножество)
    backtrack(Vec::new(), nums, &mut vec![false; nums.len()], &mut res);
    res
}

/* Основная программа */
pub fn main() {
    let mut nums = [1, 2, 3];

    let res = permutations_i(&mut nums);

    println!("Исходный массив nums = {:?}", &nums);
    println!("Все перестановки res = {:?}", &res);
}
