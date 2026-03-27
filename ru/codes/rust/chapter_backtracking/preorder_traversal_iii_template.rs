/*
 * File: preorder_traversal_iii_template.rs
 * Created Time: 2023-07-15
 * Author: codingonion (coderonion@gmail.com)
 */

use hello_algo_rust::include::{print_util, vec_to_tree, TreeNode};
use std::{cell::RefCell, rc::Rc};

/* Проверить, является ли текущее состояние решением */
fn is_solution(state: &mut Vec<Rc<RefCell<TreeNode>>>) -> bool {
    return !state.is_empty() && state.last().unwrap().borrow().val == 7;
}

/* Записать решение */
fn record_solution(
    state: &mut Vec<Rc<RefCell<TreeNode>>>,
    res: &mut Vec<Vec<Rc<RefCell<TreeNode>>>>,
) {
    res.push(state.clone());
}

/* Проверить, допустим ли этот выбор в текущем состоянии */
fn is_valid(_: &mut Vec<Rc<RefCell<TreeNode>>>, choice: Option<&Rc<RefCell<TreeNode>>>) -> bool {
    return choice.is_some() && choice.unwrap().borrow().val != 3;
}

/* Обновить состояние */
fn make_choice(state: &mut Vec<Rc<RefCell<TreeNode>>>, choice: Rc<RefCell<TreeNode>>) {
    state.push(choice);
}

/* Восстановить состояние */
fn undo_choice(state: &mut Vec<Rc<RefCell<TreeNode>>>, _: Rc<RefCell<TreeNode>>) {
    state.pop();
}

/* Алгоритм бэктрекинга: пример 3 */
fn backtrack(
    state: &mut Vec<Rc<RefCell<TreeNode>>>,
    choices: &Vec<Option<&Rc<RefCell<TreeNode>>>>,
    res: &mut Vec<Vec<Rc<RefCell<TreeNode>>>>,
) {
    // Проверить, является ли текущее состояние решением
    if is_solution(state) {
        // Записать решение
        record_solution(state, res);
    }
    // Перебор всех вариантов выбора
    for &choice in choices.iter() {
        // Отсечение: проверить допустимость выбора
        if is_valid(state, choice) {
            // Попытка: сделать выбор и обновить состояние
            make_choice(state, choice.unwrap().clone());
            // Перейти к следующему выбору
            backtrack(
                state,
                &vec![
                    choice.unwrap().borrow().left.as_ref(),
                    choice.unwrap().borrow().right.as_ref(),
                ],
                res,
            );
            // Откат: отменить выбор и восстановить предыдущее состояние
            undo_choice(state, choice.unwrap().clone());
        }
    }
}

/* Driver Code */
pub fn main() {
    let root = vec_to_tree([1, 7, 3, 4, 5, 6, 7].map(|x| Some(x)).to_vec());
    println!("Инициализация двоичного дерева");
    print_util::print_tree(root.as_ref().unwrap());

    // Алгоритм бэктрекинга
    let mut res = Vec::new();
    backtrack(&mut Vec::new(), &mut vec![root.as_ref()], &mut res);

    println!("\nВсе пути от корня к узлу 7, в которых путь не содержит узлов со значением 3");
    for path in res {
        let mut vals = Vec::new();
        for node in path {
            vals.push(node.borrow().val)
        }
        println!("{:?}", vals);
    }
}
