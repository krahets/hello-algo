/*
 * File: preorder_traversal_iii_template.rs
 * Created Time: 2023-07-15
 * Author: codingonion (coderonion@gmail.com)
 */

use hello_algo_rust::include::{print_util, vec_to_tree, TreeNode};
use std::{cell::RefCell, rc::Rc};

/* Проверяем, является ли текущее состояние решением */
fn is_solution(state: &mut Vec<Rc<RefCell<TreeNode>>>) -> bool {
    return !state.is_empty() && state.last().unwrap().borrow().val == 7;
}

/* Сохраняем решение */
fn record_solution(
    state: &mut Vec<Rc<RefCell<TreeNode>>>,
    res: &mut Vec<Vec<Rc<RefCell<TreeNode>>>>,
) {
    res.push(state.clone());
}

/* Проверяем, допустим ли выбор в текущем состоянии */
fn is_valid(_: &mut Vec<Rc<RefCell<TreeNode>>>, choice: Option<&Rc<RefCell<TreeNode>>>) -> bool {
    return choice.is_some() && choice.unwrap().borrow().val != 3;
}

/* Обновляем состояние */
fn make_choice(state: &mut Vec<Rc<RefCell<TreeNode>>>, choice: Rc<RefCell<TreeNode>>) {
    state.push(choice);
}

/* Восстанавливаем состояние */
fn undo_choice(state: &mut Vec<Rc<RefCell<TreeNode>>>, _: Rc<RefCell<TreeNode>>) {
    state.pop();
}

/* Поиск с возвратом: пример 3 */
fn backtrack(
    state: &mut Vec<Rc<RefCell<TreeNode>>>,
    choices: &Vec<Option<&Rc<RefCell<TreeNode>>>>,
    res: &mut Vec<Vec<Rc<RefCell<TreeNode>>>>,
) {
    // Проверяем, найдено ли решение
    if is_solution(state) {
        // Сохраняем решение
        record_solution(state, res);
    }
    // Перебираем все варианты
    for &choice in choices.iter() {
        // Отсечение: проверяем допустимость выбора
        if is_valid(state, choice) {
            // Пробуем вариант и обновляем состояние
            make_choice(state, choice.unwrap().clone());
            // Переходим к следующему выбору
            backtrack(
                state,
                &vec![
                    choice.unwrap().borrow().left.as_ref(),
                    choice.unwrap().borrow().right.as_ref(),
                ],
                res,
            );
            // Возврат: отменяем выбор и восстанавливаем прежнее состояние
            undo_choice(state, choice.unwrap().clone());
        }
    }
}

/* Основная программа */
pub fn main() {
    let root = vec_to_tree([1, 7, 3, 4, 5, 6, 7].map(|x| Some(x)).to_vec());
    println!("Создаём двоичное дерево");
    print_util::print_tree(root.as_ref().unwrap());

    // Поиск с возвратом
    let mut res = Vec::new();
    backtrack(&mut Vec::new(), &mut vec![root.as_ref()], &mut res);

    println!("\nВыводим все пути от корня до узлов со значением 7 без узлов со значением 3");
    for path in res {
        let mut vals = Vec::new();
        for node in path {
            vals.push(node.borrow().val)
        }
        println!("{:?}", vals);
    }
}
