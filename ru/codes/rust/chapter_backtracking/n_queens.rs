/*
 * File: n_queens.rs
 * Created Time: 2023-07-15
 * Author: codingonion (coderonion@gmail.com)
 */

/* Алгоритм бэктрекинга: n ферзей */
fn backtrack(
    row: usize,
    n: usize,
    state: &mut Vec<Vec<String>>,
    res: &mut Vec<Vec<Vec<String>>>,
    cols: &mut [bool],
    diags1: &mut [bool],
    diags2: &mut [bool],
) {
    // Когда все строки уже обработаны, записать решение
    if row == n {
        res.push(state.clone());
        return;
    }
    // Обойти все столбцы
    for col in 0..n {
        // Вычислить главную и побочную диагонали, соответствующие этой клетке
        let diag1 = row + n - 1 - col;
        let diag2 = row + col;
        // Отсечение: в столбце, главной диагонали и побочной диагонали этой клетки не должно быть ферзей
        if !cols[col] && !diags1[diag1] && !diags2[diag2] {
            // Попытка: поставить ферзя в эту клетку
            state[row][col] = "Q".into();
            (cols[col], diags1[diag1], diags2[diag2]) = (true, true, true);
            // Перейти к размещению следующей строки
            backtrack(row + 1, n, state, res, cols, diags1, diags2);
            // Откат: восстановить эту клетку как пустую
            state[row][col] = "#".into();
            (cols[col], diags1[diag1], diags2[diag2]) = (false, false, false);
        }
    }
}

/* Решить задачу о n ферзях */
fn n_queens(n: usize) -> Vec<Vec<Vec<String>>> {
    // Инициализировать доску размера n*n, где 'Q' обозначает ферзя, а '#' — пустую клетку
    let mut state: Vec<Vec<String>> = vec![vec!["#".to_string(); n]; n];
    let mut cols = vec![false; n]; // Отмечать, есть ли ферзь в столбце
    let mut diags1 = vec![false; 2 * n - 1]; // Отмечать наличие ферзя на главной диагонали
    let mut diags2 = vec![false; 2 * n - 1]; // Отмечать наличие ферзя на побочной диагонали
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

/* Driver Code */
pub fn main() {
    let n: usize = 4;
    let res = n_queens(n);

    println!("Размер входной доски = {n}");
    println!("Количество способов расстановки ферзей: {}", res.len());
    for state in res.iter() {
        println!("--------------------");
        for row in state.iter() {
            println!("{:?}", row);
        }
    }
}
