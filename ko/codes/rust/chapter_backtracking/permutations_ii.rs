/*
 * File: permutations_ii.rs
 * Created Time: 2023-07-15
 * Author: codingonion (coderonion@gmail.com)
 */

use std::collections::HashSet;

/* 백트래킹: 순열 II */
fn backtrack(mut state: Vec<i32>, choices: &[i32], selected: &mut [bool], res: &mut Vec<Vec<i32>>) {
    // 상태의 길이가 원소 개수와 같으면 해를 기록한다
    if state.len() == choices.len() {
        res.push(state);
        return;
    }
    // 모든 선택지를 순회한다
    let mut duplicated = HashSet::<i32>::new();
    for i in 0..choices.len() {
        let choice = choices[i];
        // 가지치기: 이미 선택한 원소를 다시 고르거나 같은 층에서 값이 같은 원소를 다시 고르지 않는다
        if !selected[i] && !duplicated.contains(&choice) {
            // 시도: 하나를 선택하고 상태를 갱신한다
            duplicated.insert(choice); // 선택한 원소의 값을 기록한다
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

/* 순열 II */
fn permutations_ii(nums: &mut [i32]) -> Vec<Vec<i32>> {
    let mut res = Vec::new();
    backtrack(Vec::new(), nums, &mut vec![false; nums.len()], &mut res);
    res
}

/* 실행 코드 */
pub fn main() {
    let mut nums = [1, 2, 2];

    let res = permutations_ii(&mut nums);

    println!("입력 배열 nums = {:?}", &nums);
    println!("모든 순열 res = {:?}", &res);
}
