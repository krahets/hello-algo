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
    // Когда все строки заполнены, записать решение
    if row == n {
        res.push(state.clone());
        return;
    }
    // Обойти все столбцы
    for col in 0..n {
        // Вычислить главную и побочную диагонали, соответствующие этой клетке
        let diag1 = row + n - 1 - col;
        let diag2 = row + col;
        // Отсечение: не допускается наличие ферзя в этом столбце, на главной диагонали или на побочной диагонали
        if !cols[col] && !diags1[diag1] && !diags2[diag2] {
            // Попытка: разместить ферзя в этой клетке
            state[row][col] = "Q".into();
            (cols[col], diags1[diag1], diags2[diag2]) = (true, true, true);
            // Перейти к размещению следующей строки
            backtrack(row + 1, n, state, res, cols, diags1, diags2);
            // Откат: восстановить эту клетку в пустое состояние
            state[row][col] = "#".into();
            (cols[col], diags1[diag1], diags2[diag2]) = (false, false, false);
        }
    }
}

/* Решить задачу n ферзей */
fn n_queens(n: usize) -> Vec<Vec<Vec<String>>> {
    // Инициализировать доску размера n*n, где 'Q' обозначает ферзя, а '#' обозначает пустую клетку
    let mut state: Vec<Vec<String>> = vec![vec!["#".to_string(); n]; n];
    let mut cols = vec![false; n]; // Записать, есть ли ферзь в столбце
    let mut diags1 = vec![false; 2 * n - 1]; // Записать, есть ли ферзь на главной диагонали
    let mut diags2 = vec![false; 2 * n - 1]; // Записать, есть ли ферзь на побочной диагонали
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

    println!("Входдоскаразмерравно {n}");
    println!("Количество схем размещения ферзей равно {} видов", res.len());
    for state in res.iter() {
        println!("--------------------");
        for row in state.iter() {
            println!("{:?}", row);
        }
    }
}
