/*
 * File: subset_sum_ii.rs
 * Created Time: 2023-07-09
 * Author: codingonion (coderonion@gmail.com)
 */

/* バックトラッキング：部分和 II */
fn backtrack(
    state: &mut Vec<i32>,
    target: i32,
    choices: &[i32],
    start: usize,
    res: &mut Vec<Vec<i32>>,
) {
    // 部分集合の和が target に等しければ、解を記録
    if target == 0 {
        res.push(state.clone());
        return;
    }
    // すべての選択肢を走査
    // 枝刈り 2: start から走査し、重複する部分集合の生成を避ける
    // 枝刈り 3: start から走査し、同じ要素の重複選択を避ける
    for i in start..choices.len() {
        // 枝刈り1：部分集合の和が target を超えたら、直ちにループを終了する
        // 配列はソート済みで後続要素のほうが大きく、部分集合の和は必ず target を超えるため
        if target - choices[i] < 0 {
            break;
        }
        // 枝刈り4：この要素が左隣の要素と等しければ、その探索分岐は重複しているためスキップする
        if i > start && choices[i] == choices[i - 1] {
            continue;
        }
        // 試す：選択を行い、target と start を更新
        state.push(choices[i]);
        // 次の選択へ進む
        backtrack(state, target - choices[i], choices, i + 1, res);
        // バックトラック：選択を取り消し、前の状態に戻す
        state.pop();
    }
}

/* 部分和 II を解く */
fn subset_sum_ii(nums: &mut [i32], target: i32) -> Vec<Vec<i32>> {
    let mut state = Vec::new(); // 状態（部分集合）
    nums.sort(); // nums をソート
    let start = 0; // 開始点を走査
    let mut res = Vec::new(); // 結果リスト（部分集合のリスト）
    backtrack(&mut state, target, nums, start, &mut res);
    res
}

/* Driver Code */
pub fn main() {
    let mut nums = [4, 4, 5];
    let target = 9;

    let res = subset_sum_ii(&mut nums, target);

    println!("入力配列 nums = {:?}, target = {}", &nums, target);
    println!("和が {} に等しいすべての部分集合 res = {:?}", target, &res);
}
