/*
 * File: permutations_i.rs
 * Created Time: 2023-07-15
 * Author: codingonion (coderonion@gmail.com)
 */

/* バックトラッキング：すべての順列 I */
fn backtrack(mut state: Vec<i32>, choices: &[i32], selected: &mut [bool], res: &mut Vec<Vec<i32>>) {
    // 状態の長さが要素数と等しくなったら、解を記録する
    if state.len() == choices.len() {
        res.push(state);
        return;
    }
    // すべての選択肢を走査する
    for i in 0..choices.len() {
        let choice = choices[i];
        // 枝刈り：同じ要素を繰り返し選んではならない
        if !selected[i] {
            // 試行：選択を行い、状態を更新する
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

/* すべての順列 I */
fn permutations_i(nums: &mut [i32]) -> Vec<Vec<i32>> {
    let mut res = Vec::new(); // 状態（部分集合）
    backtrack(Vec::new(), nums, &mut vec![false; nums.len()], &mut res);
    res
}

/* 実行用コード */
pub fn main() {
    let mut nums = [1, 2, 3];

    let res = permutations_i(&mut nums);

    println!("入力配列 nums = {:?}", &nums);
    println!("すべての順列 res = {:?}", &res);
}
