/*
 * File: subset_sum_i_naive.rs
 * Created Time: 2023-07-09
 * Author: codingonion (coderonion@gmail.com)
 */

/* バックトラッキング：部分集合和 I */
fn backtrack(
    state: &mut Vec<i32>,
    target: i32,
    total: i32,
    choices: &[i32],
    res: &mut Vec<Vec<i32>>,
) {
    // 部分集合の和が target と等しくなったら、解を記録する
    if total == target {
        res.push(state.clone());
        return;
    }
    // すべての選択肢を走査する
    for i in 0..choices.len() {
        // 枝刈り：部分集合の和が target を超える場合、この選択をスキップする
        if total + choices[i] > target {
            continue;
        }
        // 試行：選択を行い、要素の和 total を更新する
        state.push(choices[i]);
        // 次の選択に進む
        backtrack(state, target, total + choices[i], choices, res);
        // 復元：選択を取り消し、以前の状態に戻す
        state.pop();
    }
}

/* 部分集合和 I を解く（重複した部分集合を含む） */
fn subset_sum_i_naive(nums: &[i32], target: i32) -> Vec<Vec<i32>> {
    let mut state = Vec::new(); // 状態（部分集合）
    let total = 0; // 部分集合和
    let mut res = Vec::new(); // 結果リスト（部分集合のリスト）
    backtrack(&mut state, target, total, nums, &mut res);
    res
}

/* 実行用コード */
pub fn main() {
    let nums = [3, 4, 5];
    let target = 9;

    let res = subset_sum_i_naive(&nums, target);

    println!("入力配列 nums = {:?}, target = {}", &nums, target);
    println!("和が {} になるすべての部分集合 res = {:?}", target, &res);
    println!("この方法の出力結果には重複した集合が含まれることに注意");
}
