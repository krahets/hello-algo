/*
 * File: n_queens.rs
 * Created Time: 2023-07-15
 * Author: codingonion (coderonion@gmail.com)
 */

/* 백트래킹 알고리즘: n-퀸 */
fn backtrack(
    row: usize,
    n: usize,
    state: &mut Vec<Vec<String>>,
    res: &mut Vec<Vec<Vec<String>>>,
    cols: &mut [bool],
    diags1: &mut [bool],
    diags2: &mut [bool],
) {
    // 모든 행에 배치했으면 해를 기록한다
    if row == n {
        res.push(state.clone());
        return;
    }
    // 모든 열을 순회한다
    for col in 0..n {
        // 해당 칸이 속한 주대각선과 부대각선을 계산한다
        let diag1 = row + n - 1 - col;
        let diag2 = row + col;
        // 가지치기: 해당 칸이 속한 열, 주대각선, 부대각선에 퀸이 있으면 안 된다
        if !cols[col] && !diags1[diag1] && !diags2[diag2] {
            // 시도: 해당 칸에 퀸을 놓는다
            state[row][col] = "Q".into();
            (cols[col], diags1[diag1], diags2[diag2]) = (true, true, true);
            // 다음 행에 배치한다
            backtrack(row + 1, n, state, res, cols, diags1, diags2);
            // 되돌리기: 해당 칸을 빈칸으로 되돌린다
            state[row][col] = "#".into();
            (cols[col], diags1[diag1], diags2[diag2]) = (false, false, false);
        }
    }
}

/* n-퀸 문제 풀기 */
fn n_queens(n: usize) -> Vec<Vec<Vec<String>>> {
    // n*n 크기의 체스판을 초기화한다. 'Q'는 퀸, '#'은 빈칸을 나타낸다
    let mut state: Vec<Vec<String>> = vec![vec!["#".to_string(); n]; n];
    let mut cols = vec![false; n]; // 열에 퀸이 있는지 기록한다
    let mut diags1 = vec![false; 2 * n - 1]; // 주대각선에 퀸이 있는지 기록한다
    let mut diags2 = vec![false; 2 * n - 1]; // 부대각선에 퀸이 있는지 기록한다
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

/* 실행 코드 */
pub fn main() {
    let n: usize = 4;
    let res = n_queens(n);

    println!("입력한 체스판의 가로와 세로 길이: {n}");
    println!("퀸을 배치하는 방법은 총 {}가지이다", res.len());
    for state in res.iter() {
        println!("--------------------");
        for row in state.iter() {
            println!("{:?}", row);
        }
    }
}
