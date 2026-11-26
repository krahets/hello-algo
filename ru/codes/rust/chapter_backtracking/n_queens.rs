/*
 * File: n_queens.rs
 * Created Time: 2023-07-15
 * Author: codingonion (coderonion@gmail.com)
 */

/* Поиск с возвратом: задача о n ферзях */
fn backtrack(
    row: usize,
    n: usize,
    state: &mut Vec<Vec<String>>,
    res: &mut Vec<Vec<Vec<String>>>,
    cols: &mut [bool],
    diags1: &mut [bool],
    diags2: &mut [bool],
) {
    // Когда ферзи расставлены во всех строках, сохраняем решение
    if row == n {
        res.push(state.clone());
        return;
    }
    // Перебираем все столбцы
    for col in 0..n {
        // Вычисляем индексы прямой и обратной диагоналей клетки
        let diag1 = row + n - 1 - col;
        let diag2 = row + col;
        // Отсечение: в столбце и на обеих диагоналях клетки не должно быть ферзей
        if !cols[col] && !diags1[diag1] && !diags2[diag2] {
            // Пробуем поставить ферзя на эту клетку
            state[row][col] = "Q".into();
            (cols[col], diags1[diag1], diags2[diag2]) = (true, true, true);
            // Переходим к следующей строке
            backtrack(row + 1, n, state, res, cols, diags1, diags2);
            // Возврат: освобождаем клетку
            state[row][col] = "#".into();
            (cols[col], diags1[diag1], diags2[diag2]) = (false, false, false);
        }
    }
}

/* Решение задачи о n ферзях */
fn n_queens(n: usize) -> Vec<Vec<Vec<String>>> {
    // Создаём доску n*n, где 'Q' обозначает ферзя, а '#' — пустую клетку
    let mut state: Vec<Vec<String>> = vec![vec!["#".to_string(); n]; n];
    let mut cols = vec![false; n]; // Отмечаем столбцы, занятые ферзями
    let mut diags1 = vec![false; 2 * n - 1]; // Отмечаем прямые диагонали, занятые ферзями
    let mut diags2 = vec![false; 2 * n - 1]; // Отмечаем обратные диагонали, занятые ферзями
    let mut res: Vec<Vec<Vec<String>>> = Vec::new();

    backtrack(
        0,
        n,
        &mut state,
        &mut res,
        &mut cols,
        &mut diags1,
        &mut diags2,
    );

    res
}

/* Основная программа */
pub fn main() {
    let n: usize = 4;
    let res = n_queens(n);

    println!("Длина стороны доски: {n}");
    println!("Число расстановок ферзей: {}.", res.len());
    for state in res.iter() {
        println!("--------------------");
        for row in state.iter() {
            println!("{:?}", row);
        }
    }
}
