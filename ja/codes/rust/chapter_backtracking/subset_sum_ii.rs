/*
 * File: subset_sum_ii.rs
 * Created Time: 2023-07-09
 * Author: codingonion (coderonion@gmail.com)
 */

/* バックトラッキングによる部分和問題 II */
fn backtrack(
    state: &mut Vec<i32>,
    target: i32,
    choices: &[i32],
    start: usize,
    res: &mut Vec<Vec<i32>>,
) {
    // 部分集合の要素の和が target に等しくなったら解を記録する
    if target == 0 {
        res.push(state.clone());
        return;
    }
    // すべての選択肢を調べる
    // 枝刈り 2：start から調べて部分集合の重複を防ぐ
    // 枝刈り 3：start から調べて同じ要素を二度選ばないようにする
    for i in start..choices.len() {
        // 枝刈り 1：部分集合の要素の和が target を超えたらループを終了する
        // 配列はソート済みで、後の要素ほど大きく、和は必ず target を超えるため
        if target - choices[i] < 0 {
            break;
        }
        // 枝刈り 4：左隣の要素と値が等しければ、探索の枝が重複するので飛ばす
        if i > start && choices[i] == choices[i - 1] {
            continue;
        }
        // 試行：選択して target と start を更新する
        state.push(choices[i]);
        // 次の選択に進む
        backtrack(state, target - choices[i], choices, i + 1, res);
        // 後戻り：選択を取り消し、元の状態に戻す
        state.pop();
    }
}

/* 部分和問題 II を解く */
fn subset_sum_ii(nums: &mut [i32], target: i32) -> Vec<Vec<i32>> {
    let mut state = Vec::new(); // 状態（部分集合）
    nums.sort(); // nums をソートする
    let start = 0; // 走査の開始位置
    let mut res = Vec::new(); // 結果のリスト（部分集合のリスト）
    backtrack(&mut state, target, nums, start, &mut res);
    res
}

/* 実行例 */
pub fn main() {
    let mut nums = [4, 4, 5];
    let target = 9;

    let res = subset_sum_ii(&mut nums, target);

    println!("入力配列 nums = {:?}, target = {}", &nums, target);
    println!("要素の和が {} となるすべての部分集合 res = {:?}", target, &res);
}
