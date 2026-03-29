/*
 * File: subset_sum_i_naive.rs
 * Created Time: 2023-07-09
 * Author: codingonion (coderonion@gmail.com)
 */

/* バックトラッキング：部分和 I */
fn backtrack(
    state: &mut Vec<i32>,
    target: i32,
    total: i32,
    choices: &[i32],
    res: &mut Vec<Vec<i32>>,
) {
    // 部分集合の和が target に等しければ、解を記録
    if total == target {
        res.push(state.clone());
        return;
    }
    // すべての選択肢を走査
    for i in 0..choices.len() {
        // 枝刈り：部分和が target を超える場合はその選択をスキップする
        if total + choices[i] > target {
            continue;
        }
        // 試行：選択を行い、要素と total を更新する
        state.push(choices[i]);
        // 次の選択へ進む
        backtrack(state, target, total + choices[i], choices, res);
        // バックトラック：選択を取り消し、前の状態に戻す
        state.pop();
    }
}

/* 部分和 I を解く（重複部分集合を含む） */
fn subset_sum_i_naive(nums: &[i32], target: i32) -> Vec<Vec<i32>> {
    let mut state = Vec::new(); // 状態（部分集合）
    let total = 0; // 部分和
    let mut res = Vec::new(); // 結果リスト（部分集合のリスト）
    backtrack(&mut state, target, total, nums, &mut res);
    res
}

/* Driver Code */
pub fn main() {
    let nums = [3, 4, 5];
    let target = 9;

    let res = subset_sum_i_naive(&nums, target);

    println!("入力配列 nums = {:?}, target = {}", &nums, target);
    println!("和が {} に等しいすべての部分集合 res = {:?}", target, &res);
    println!("注意: この方法の出力結果には重複した集合が含まれます");
}
