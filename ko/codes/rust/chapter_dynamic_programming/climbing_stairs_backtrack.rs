/*
 * File: climbing_stairs_backtrack.rs
 * Created Time: 2023-07-09
 * Author: codingonion (coderonion@gmail.com)
 */

/* 백트래킹 */
fn backtrack(choices: &[i32], state: i32, n: i32, res: &mut [i32]) {
    // n번째 계단에 도달하면 방법의 수에 1을 더한다
    if state == n {
        res[0] = res[0] + 1;
    }
    // 모든 선택지를 순회한다
    for &choice in choices {
        // 가지치기: n번째 계단을 넘어갈 수 없다
        if state + choice > n {
            continue;
        }
        // 시도: 선택하고 상태를 갱신한다
        backtrack(choices, state + choice, n, res);
        // 되돌리기
    }
}

/* 계단 오르기: 백트래킹 */
fn climbing_stairs_backtrack(n: usize) -> i32 {
    let choices = vec![1, 2]; // 한 계단 또는 두 계단 오르기를 선택할 수 있다
    let state = 0; // 0번째 계단에서 오르기 시작한다
    let mut res = Vec::new();
    res.push(0); // res[0]에 방법의 수를 기록한다
    backtrack(&choices, state, n as i32, &mut res);
    res[0]
}

/* 실행 코드 */
pub fn main() {
    let n: usize = 9;

    let res = climbing_stairs_backtrack(n);
    println!("{n}개의 계단을 오르는 방법은 총 {res}가지이다");
}
