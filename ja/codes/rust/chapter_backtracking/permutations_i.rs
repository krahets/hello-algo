/*
 * File: permutations_i.rs
 * Created Time: 2023-07-15
 * Author: codingonion (coderonion@gmail.com)
 */

/* バックトラッキングによる全順列 I */
fn backtrack(mut state: Vec<i32>, choices: &[i32], selected: &mut [bool], res: &mut Vec<Vec<i32>>) {
    // 状態の長さが要素数に達したら解を記録する
    if state.len() == choices.len() {
        res.push(state);
        return;
    }
    // すべての選択肢を調べる
    for i in 0..choices.len() {
        let choice = choices[i];
        // 枝刈り：同じ要素は二度選ばない
        if !selected[i] {
            // 試行：選択して状態を更新する
            selected[i] = true;
            state.push(choice);
            // 次の選択に進む
            backtrack(state.clone(), choices, selected, res);
            // 後戻り：選択を取り消し、元の状態に戻す
            selected[i] = false;
            state.pop();
        }
    }
}

/* 全順列 I */
fn permutations_i(nums: &mut [i32]) -> Vec<Vec<i32>> {
    let mut res = Vec::new(); // 状態（部分集合）
    backtrack(Vec::new(), nums, &mut vec![false; nums.len()], &mut res);
    res
}

/* 実行例 */
pub fn main() {
    let mut nums = [1, 2, 3];

    let res = permutations_i(&mut nums);

    println!("入力配列 nums = {:?}", &nums);
    println!("すべての順列 res = {:?}", &res);
}
