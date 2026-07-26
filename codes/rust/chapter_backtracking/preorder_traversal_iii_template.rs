/*
 * File: preorder_traversal_iii_template.rs
 * Created Time: 2023-07-15
 * Author: codingonion (coderonion@gmail.com)
 */

use hello_algo_rust::binary_tree::{BinaryTree, TreeLink};
use std::cell::RefCell;
use std::rc::Rc;

type State = Vec<Choice>;
type Choice = Option<Rc<RefCell<TreeNode>>>;
type TreeNode = hello_algo_rust::binary_tree::TreeNode<i32>;

/* 判断当前状态是否为解 */
fn is_solution(state: &mut State) -> bool {
    state
        .last()
        .and_then(|node| node.as_ref())
        .map(|node| node.borrow().val == 7)
        .unwrap_or(false)
}

/* 记录解 */
fn record_solution(state: &mut State, res: &mut Vec<State>) {
    res.push(state.clone());
}

/* 判断在当前状态下，该选择是否合法 */
fn is_valid(_state: &mut State, choice: Choice) -> bool {
    choice
        .as_ref()
        .map(|node| node.borrow().val != 3)
        .unwrap_or(false)
}

/* 更新状态 */
fn make_choice(state: &mut State, choice: Choice) {
    state.push(choice);
}

/* 恢复状态 */
fn undo_choice(state: &mut State, _choice: Choice) {
    state.pop();
}

/* 回溯算法：例题三 */
fn backtrack(state: &mut State, choices: &Vec<Choice>, res: &mut Vec<State>) {
    // 类型别名说明：
    //
    // type State = Vec<Choice>;
    // type Choice = Option<Rc<RefCell<TreeNode>>>;
    //
    // 注意，这是一套满足《Hello 算法》一书中回溯模板的类型体操，
    // 因此存在一些不必要的分支跳转、克隆和析构开销。

    // 判断是否为解
    if is_solution(state) {
        // 记录解
        record_solution(state, res);
        // 不再继续搜索
        return;
    }
    // 遍历所有选择
    for choice in choices {
        // 剪枝：判断选择是否合法
        if is_valid(state, choice.clone()) {
            // 尝试：做出选择，更新状态
            make_choice(state, choice.clone());
            // 完全按照回溯模板，choices 将会保持不变，除非在 Choice 类型中额外包含一个共享状态；
            // 但这属于违背框架语义的 hack，因此暂时手动创建新的 choices 列表。
            let borrow = choice.as_ref().unwrap_or_else(|| unreachable!()).borrow();
            let left = borrow.left.clone();
            let right = borrow.right.clone();
            let choices = &vec![left, right];
            backtrack(state, choices, res);
            // 回退：撤销选择，恢复到之前的状态
            undo_choice(state, choice.clone());
        }
    }
}

/* Driver Code */
fn main() {
    let root = TreeLink::try_from_array([1, 7, 3, 4, 5, 6, 7].map(Some)).ok();
    println!("初始化二叉树\n{}", root.display());

    // 回溯算法
    let mut res = Vec::new();
    backtrack(&mut Vec::new(), &vec![root], &mut res);

    println!("输出所有根节点到节点 7 的路径，要求路径中不包含值为 3 的节点");
    for path in res {
        let vals = path
            .iter()
            .map(|node| node.as_ref().unwrap().borrow().val)
            .collect::<Vec<_>>();
        println!("{vals:?}");
    }
}
