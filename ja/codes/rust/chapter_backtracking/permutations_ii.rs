/*
 * File: permutations_ii.rs
 * Created Time: 2023-07-15
 * Author: codingonion (coderonion@gmail.com)
 */

use std::collections::HashSet;

/* バックトラッキング：すべての順列 II */
fn backtrack(mut state: Vec<i32>, choices: &[i32], selected: &mut [bool], res: &mut Vec<Vec<i32>>) {
    // 状態の長さが要素数と等しくなったら、解を記録する
    if state.len() == choices.len() {
        res.push(state);
        return;
    }
    // すべての選択肢を走査する
    let mut duplicated = HashSet::<i32>::new();
    for i in 0..choices.len() {
        let choice = choices[i];
        // 枝刈り：同じ要素の再選択も、等しい値を持つ要素の重複選択も許可しない
        if !selected[i] && !duplicated.contains(&choice) {
            // 試行：選択を行い、状態を更新する
            duplicated.insert(choice); // 選択済みの要素の値を記録する
            selected[i] = true;
            state.push(choice);
            // 次の選択に進む
            backtrack(state.clone(), choices, selected, res);
            // 復元：選択を取り消し、以前の状態に戻す
            selected[i] = false;
            state.pop();
        }
    }
}

/* すべての順列 II */
fn permutations_ii(nums: &mut [i32]) -> Vec<Vec<i32>> {
    let mut res = Vec::new();
    backtrack(Vec::new(), nums, &mut vec![false; nums.len()], &mut res);
    res
}

/* 実行用コード */
pub fn main() {
    let mut nums = [1, 2, 2];

    let res = permutations_ii(&mut nums);

    println!("入力配列 nums = {:?}", &nums);
    println!("すべての順列 res = {:?}", &res);
}
