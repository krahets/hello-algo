/*
 * File: permutations_i.rs
 * Created Time: 2023-07-15
 * Author: codingonion (coderonion@gmail.com)
 */

/* 백트래킹: 순열 I */
fn backtrack(mut state: Vec<i32>, choices: &[i32], selected: &mut [bool], res: &mut Vec<Vec<i32>>) {
    // 상태의 길이가 원소 개수와 같으면 해를 기록한다
    if state.len() == choices.len() {
        res.push(state);
        return;
    }
    // 모든 선택지를 순회한다
    for i in 0..choices.len() {
        let choice = choices[i];
        // 가지치기: 이미 선택한 원소는 다시 선택하지 않는다
        if !selected[i] {
            // 시도: 하나를 선택하고 상태를 갱신한다
            selected[i] = true;
            state.push(choice);
            // 다음 선택을 진행한다
            backtrack(state.clone(), choices, selected, res);
            // 되돌리기: 선택을 취소하고 이전 상태를 복원한다
            selected[i] = false;
            state.pop();
        }
    }
}

/* 순열 I */
fn permutations_i(nums: &mut [i32]) -> Vec<Vec<i32>> {
    let mut res = Vec::new(); // 상태(부분집합)
    backtrack(Vec::new(), nums, &mut vec![false; nums.len()], &mut res);
    res
}

/* 실행 코드 */
pub fn main() {
    let mut nums = [1, 2, 3];

    let res = permutations_i(&mut nums);

    println!("입력 배열 nums = {:?}", &nums);
    println!("모든 순열 res = {:?}", &res);
}
