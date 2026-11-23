/*
 * File: subset_sum_ii.rs
 * Created Time: 2023-07-09
 * Author: codingonion (coderonion@gmail.com)
 */

/* バックトラッキング：部分集合和 II */
fn backtrack(
    state: &mut Vec<i32>,
    target: i32,
    choices: &[i32],
    start: usize,
    res: &mut Vec<Vec<i32>>,
) {
    // 部分集合の和が target と等しくなったら、解を記録する
    if target == 0 {
        res.push(state.clone());
        return;
    }
    // すべての選択肢を走査する
    // 枝刈り 2：start から走査を始め、重複した部分集合の生成を避ける
    // 枝刈り 3：start から走査を始め、同じ要素の再選択を避ける
    for i in start..choices.len() {
        // 枝刈り 1：部分集合の和が target を超えたら、直ちにループを終了する
        // 配列はソート済みで後ろの要素ほど大きいため、部分集合の和が必ず target を超えるからである
        if target - choices[i] < 0 {
            break;
        }
        // 枝刈り 4：この要素が左隣の要素と等しい場合、探索の分岐が重複するため、直ちにスキップする
        if i > start && choices[i] == choices[i - 1] {
            continue;
        }
        // 試行：選択を行い、target, start を更新する
        state.push(choices[i]);
        // 次の選択に進む
        backtrack(state, target - choices[i], choices, i + 1, res);
        // 復元：選択を取り消し、以前の状態に戻す
        state.pop();
    }
}

/* 部分集合和 II を解く */
fn subset_sum_ii(nums: &mut [i32], target: i32) -> Vec<Vec<i32>> {
    let mut state = Vec::new(); // 状態（部分集合）
    nums.sort(); // nums をソートする
    let start = 0; // 走査の開始位置
    let mut res = Vec::new(); // 結果リスト（部分集合のリスト）
    backtrack(&mut state, target, nums, start, &mut res);
    res
}

/* 実行用コード */
pub fn main() {
    let mut nums = [4, 4, 5];
    let target = 9;

    let res = subset_sum_ii(&mut nums, target);

    println!("入力配列 nums = {:?}, target = {}", &nums, target);
    println!("和が {} になるすべての部分集合 res = {:?}", target, &res);
}
