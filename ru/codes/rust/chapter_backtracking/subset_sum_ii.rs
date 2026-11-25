/*
 * File: subset_sum_ii.rs
 * Created Time: 2023-07-09
 * Author: codingonion (coderonion@gmail.com)
 */

/* Поиск с возвратом: сумма подмножества II */
fn backtrack(
    state: &mut Vec<i32>,
    target: i32,
    choices: &[i32],
    start: usize,
    res: &mut Vec<Vec<i32>>,
) {
    // Если сумма подмножества равна target, сохраняем решение
    if target == 0 {
        res.push(state.clone());
        return;
    }
    // Перебираем все варианты
    // Отсечение 2: начинаем перебор с start, чтобы не получать одинаковые подмножества
    // Отсечение 3: начинаем перебор с start, чтобы не брать один и тот же элемент дважды
    for i in start..choices.len() {
        // Отсечение 1: если сумма подмножества превышает target, выходим из цикла
        // Массив отсортирован: следующие элементы не меньше текущего, поэтому сумма тоже превысит target
        if target - choices[i] < 0 {
            break;
        }
        // Отсечение 4: если значение совпало с уже проверенным на этом шаге соседом слева, пропускаем повторную ветвь
        if i > start && choices[i] == choices[i - 1] {
            continue;
        }
        // Пробуем вариант и обновляем target и start
        state.push(choices[i]);
        // Переходим к следующему выбору
        backtrack(state, target - choices[i], choices, i + 1, res);
        // Возврат: отменяем выбор и восстанавливаем прежнее состояние
        state.pop();
    }
}

/* Задача о сумме подмножества II */
fn subset_sum_ii(nums: &mut [i32], target: i32) -> Vec<Vec<i32>> {
    let mut state = Vec::new(); // Состояние (подмножество)
    nums.sort(); // Сортируем nums
    let start = 0; // Начальная позиция перебора
    let mut res = Vec::new(); // Список результатов (список подмножеств)
    backtrack(&mut state, target, nums, start, &mut res);
    res
}

/* Основная программа */
pub fn main() {
    let mut nums = [4, 4, 5];
    let target = 9;

    let res = subset_sum_ii(&mut nums, target);

    println!("Исходный массив nums = {:?}, target = {}", &nums, target);
    println!("Все подмножества с суммой {}: res = {:?}", target, &res);
}
