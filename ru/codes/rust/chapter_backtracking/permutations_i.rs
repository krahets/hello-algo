/*
 * File: permutations_i.rs
 * Created Time: 2023-07-15
 * Author: codingonion (coderonion@gmail.com)
 */

/* Алгоритм бэктрекинга: все перестановки I */
fn backtrack(mut state: Vec<i32>, choices: &[i32], selected: &mut [bool], res: &mut Vec<Vec<i32>>) {
    // Когда длина состояния равна числу элементов, записать решение
    if state.len() == choices.len() {
        res.push(state);
        return;
    }
    // Перебор всех вариантов выбора
    for i in 0..choices.len() {
        let choice = choices[i];
        // Отсечение: нельзя выбирать один и тот же элемент повторно
        if !selected[i] {
            // Попытка: сделать выбор и обновить состояние
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

/* Все перестановки I */
fn permutations_i(nums: &mut [i32]) -> Vec<Vec<i32>> {
    let mut res = Vec::new(); // Состояние (подмножество)
    backtrack(Vec::new(), nums, &mut vec![false; nums.len()], &mut res);
    res
}

/* Driver Code */
pub fn main() {
    let mut nums = [1, 2, 3];

    let res = permutations_i(&mut nums);

    println!("Входной массив nums = {:?}", &nums);
    println!("Все перестановки res = {:?}", &res);
}
