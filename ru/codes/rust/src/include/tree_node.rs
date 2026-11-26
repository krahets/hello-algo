/*
 * File: tree_node.rs
 * Created Time: 2023-02-27
 * Author: xBLACKICEx (xBLACKICE@outlook.com), night-cruise (2586447362@qq.com)
 */

use std::cell::RefCell;
use std::rc::Rc;

/* Тип узла двоичного дерева */
#[derive(Debug)]
pub struct TreeNode {
    pub val: i32,
    pub height: i32,
    pub parent: Option<Rc<RefCell<TreeNode>>>,
    pub left: Option<Rc<RefCell<TreeNode>>>,
    pub right: Option<Rc<RefCell<TreeNode>>>,
}

impl TreeNode {
    /* Конструктор */
    pub fn new(val: i32) -> Rc<RefCell<Self>> {
        Rc::new(RefCell::new(Self {
            val,
            height: 0,
            parent: None,
            left: None,
            right: None,
        }))
    }
}

#[macro_export]
macro_rules! op_vec {
    ( $( $x:expr ),* ) => {
        vec![
            $(Option::from($x)),*
        ]
    };
}

// Правила кодирования при сериализации описаны здесь:
// https://www.hello-algo.com/ru/chapter_tree/array_representation_of_tree/
// Двоичное дерево в виде массива:
// [1, 2, 3, 4, None, 6, 7, 8, 9, None, None, 12, None, None, 15]
// Двоичное дерево в виде связанных узлов:
//             /——— 15
//         /——— 7
//     /——— 3
//    |    \——— 6
//    |        \——— 12
// ——— 1
//     \——— 2
//        |    /——— 9
//         \——— 4
//             \——— 8

/* Рекурсивно восстановить двоичное дерево из списка */
fn vec_to_tree_dfs(arr: &[Option<i32>], i: usize) -> Option<Rc<RefCell<TreeNode>>> {
    if i >= arr.len() || arr[i].is_none() {
        return None;
    }
    let root = TreeNode::new(arr[i].unwrap());
    root.borrow_mut().left = vec_to_tree_dfs(arr, 2 * i + 1);
    root.borrow_mut().right = vec_to_tree_dfs(arr, 2 * i + 2);
    Some(root)
}

/* Восстановить двоичное дерево из списка */
pub fn vec_to_tree(arr: Vec<Option<i32>>) -> Option<Rc<RefCell<TreeNode>>> {
    vec_to_tree_dfs(&arr, 0)
}

/* Рекурсивно сериализовать двоичное дерево в список */
fn tree_to_vec_dfs(root: Option<&Rc<RefCell<TreeNode>>>, i: usize, res: &mut Vec<Option<i32>>) {
    if let Some(root) = root {
        // Для доступа к элементу с индексом i размер должен быть не меньше i + 1
        while res.len() < i + 1 {
            res.push(None);
        }
        res[i] = Some(root.borrow().val);
        tree_to_vec_dfs(root.borrow().left.as_ref(), 2 * i + 1, res);
        tree_to_vec_dfs(root.borrow().right.as_ref(), 2 * i + 2, res);
    }
}

/* Сериализовать двоичное дерево в список */
pub fn tree_to_vec(root: Option<Rc<RefCell<TreeNode>>>) -> Vec<Option<i32>> {
    let mut res = vec![];
    tree_to_vec_dfs(root.as_ref(), 0, &mut res);
    res
}
