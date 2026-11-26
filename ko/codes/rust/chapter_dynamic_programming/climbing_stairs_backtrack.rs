/*
 * File: climbing_stairs_backtrack.rs
 * Created Time: 2023-07-09
 * Author: codingonion (coderonion@gmail.com)
 */

/* 백트래킹 */
fn backtrack(choices: &[i32], state: i32, n: i32, res: &mut [i32]) {
    // n번째 계단에 도달하면 방법 수를 1 늘린다
    if state == n {
        res[0] = res[0] + 1;
    }
    // 모든 선택지 순회
    for &choice in choices {
        // 가지치기: n번째 계단을 넘지 않는다
        if state + choice > n {
            continue;
        }
        // 시도: 선택한 뒤 상태를 갱신한다
        backtrack(choices, state + choice, n, res);
        // 선택 취소
    }
}

/* 계단 오르기: 백트래킹 */
fn climbing_stairs_backtrack(n: usize) -> i32 {
    let choices = vec![1, 2]; // 한 번에 한 계단 또는 두 계단을 오른다
    let state = 0; // 0번째 계단에서 출발한다
    let mut res = Vec::new();
    res.push(0); // res[0]에 방법 수를 기록한다
    backtrack(&choices, state, n as i32, &mut res);
    res[0]
}

/* 실행 예제 */
pub fn main() {
    let n: usize = 9;

    let res = climbing_stairs_backtrack(n);
    println!("계단 {n}개를 오르는 방법은 {res}가지");
}
