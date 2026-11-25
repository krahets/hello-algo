/*
 * File: subset_sum_i_naive.rs
 * Created Time: 2023-07-09
 * Author: codingonion (coderonion@gmail.com)
 */

/* バックトラッキングによる部分和問題 I */
fn backtrack(
    state: &mut Vec<i32>,
    target: i32,
    total: i32,
    choices: &[i32],
    res: &mut Vec<Vec<i32>>,
) {
    // 部分集合の要素の和が target に等しくなったら解を記録する
    if total == target {
        res.push(state.clone());
        return;
    }
    // すべての選択肢を調べる
    for i in 0..choices.len() {
        // 枝刈り：部分集合の要素の和が target を超えるなら、その選択を飛ばす
        if total + choices[i] > target {
            continue;
        }
        // 試行：選択して要素の和 total を更新する
        state.push(choices[i]);
        // 次の選択に進む
        backtrack(state, target, total + choices[i], choices, res);
        // 後戻り：選択を取り消し、元の状態に戻す
        state.pop();
    }
}

/* 部分和問題 I を解く（重複する部分集合を含む） */
fn subset_sum_i_naive(nums: &[i32], target: i32) -> Vec<Vec<i32>> {
    let mut state = Vec::new(); // 状態（部分集合）
    let total = 0; // 部分和
    let mut res = Vec::new(); // 結果のリスト（部分集合のリスト）
    backtrack(&mut state, target, total, nums, &mut res);
    res
}

/* 実行例 */
pub fn main() {
    let nums = [3, 4, 5];
    let target = 9;

    let res = subset_sum_i_naive(&nums, target);

    println!("入力配列 nums = {:?}, target = {}", &nums, target);
    println!("要素の和が {} となるすべての部分集合 res = {:?}", target, &res);
    println!("この方法の出力には重複する集合が含まれる点に注意");
}
