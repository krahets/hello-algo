/*
 * File: binary_search_tree.rs
 * Created Time: 2023-04-20
 * Author: xBLACKICEx (xBLACKICE@outlook.com)、night-cruise (2586447362@qq.com)
 */

use hello_algo_rust::include::print_util;

use std::cell::RefCell;
use std::cmp::Ordering;
use std::rc::Rc;

use hello_algo_rust::include::TreeNode;

type OptionTreeNodeRc = Option<Rc<RefCell<TreeNode>>>;

/* Двоичное дерево поиска */
pub struct BinarySearchTree {
    root: OptionTreeNodeRc,
}

impl BinarySearchTree {
    /* Конструктор */
    pub fn new() -> Self {
        // Инициализировать пустое дерево
        Self { root: None }
    }

    /* Получить корневой узел двоичного дерева */
    pub fn get_root(&self) -> OptionTreeNodeRc {
        self.root.clone()
    }

    /* Поиск узла */
    pub fn search(&self, num: i32) -> OptionTreeNodeRc {
        let mut cur = self.root.clone();
        // Искать в цикле и выйти после прохода за листовой узел
        while let Some(node) = cur.clone() {
            match num.cmp(&node.borrow().val) {
                // Целевой узел находится в правом поддереве cur
                Ordering::Greater => cur = node.borrow().right.clone(),
                // Целевой узел находится в левом поддереве cur
                Ordering::Less => cur = node.borrow().left.clone(),
                // Найти целевой узел и выйти из цикла
                Ordering::Equal => break,
            }
        }

        // Вернуть целевой узел
        cur
    }

    /* Вставка узла */
    pub fn insert(&mut self, num: i32) {
        // Если дерево пусто, инициализировать корневой узел
        if self.root.is_none() {
            self.root = Some(TreeNode::new(num));
            return;
        }
        let mut cur = self.root.clone();
        let mut pre = None;
        // Искать в цикле и выйти после прохода за листовой узел
        while let Some(node) = cur.clone() {
            match num.cmp(&node.borrow().val) {
                // Найти повторяющийся узел и сразу вернуть
                Ordering::Equal => return,
                // Позиция вставки находится в правом поддереве cur
                Ordering::Greater => {
                    pre = cur.clone();
                    cur = node.borrow().right.clone();
                }
                // Позиция вставки находится в левом поддереве cur
                Ordering::Less => {
                    pre = cur.clone();
                    cur = node.borrow().left.clone();
                }
            }
        }
        // Вставка узла
        let pre = pre.unwrap();
        let node = Some(TreeNode::new(num));
        if num > pre.borrow().val {
            pre.borrow_mut().right = node;
        } else {
            pre.borrow_mut().left = node;
        }
    }

    /* Удаление узла */
    pub fn remove(&mut self, num: i32) {
        // Если дерево пусто, сразу вернуть
        if self.root.is_none() {
            return;
        }
        let mut cur = self.root.clone();
        let mut pre = None;
        // Искать в цикле и выйти после прохода за листовой узел
        while let Some(node) = cur.clone() {
            match num.cmp(&node.borrow().val) {
                // Найти узел для удаления и выйти из цикла
                Ordering::Equal => break,
                // Узел для удаления находится в правом поддереве cur
                Ordering::Greater => {
                    pre = cur.clone();
                    cur = node.borrow().right.clone();
                }
                // Узел для удаления находится в левом поддереве cur
                Ordering::Less => {
                    pre = cur.clone();
                    cur = node.borrow().left.clone();
                }
            }
        }
        // Если узел для удаления отсутствует, сразу вернуть
        if cur.is_none() {
            return;
        }
        let cur = cur.unwrap();
        let (left_child, right_child) = (cur.borrow().left.clone(), cur.borrow().right.clone());
        match (left_child.clone(), right_child.clone()) {
            // Число дочерних узлов = 0 или 1
            (None, None) | (Some(_), None) | (None, Some(_)) => {
                // Когда число дочерних узлов = 0 / 1, child = nullptr / этот дочерний узел
                let child = left_child.or(right_child);
                let pre = pre.unwrap();
                // Удалить узел cur
                if !Rc::ptr_eq(&cur, self.root.as_ref().unwrap()) {
                    let left = pre.borrow().left.clone();
                    if left.is_some() && Rc::ptr_eq(left.as_ref().unwrap(), &cur) {
                        pre.borrow_mut().left = child;
                    } else {
                        pre.borrow_mut().right = child;
                    }
                } else {
                    // Если удаляемый узел является корнем, заново назначить корневой узел
                    self.root = child;
                }
            }
            // Число дочерних узлов = 2
            (Some(_), Some(_)) => {
                // Получить следующий узел после cur в симметричном обходе
                let mut tmp = cur.borrow().right.clone();
                while let Some(node) = tmp.clone() {
                    if node.borrow().left.is_some() {
                        tmp = node.borrow().left.clone();
                    } else {
                        break;
                    }
                }
                let tmp_val = tmp.unwrap().borrow().val;
                // Рекурсивно удалить узел tmp
                self.remove(tmp_val);
                // Перезаписать cur значением tmp
                cur.borrow_mut().val = tmp_val;
            }
        }
    }
}

/* Driver Code */
fn main() {
    /* Инициализация двоичного дерева поиска */
    let mut bst = BinarySearchTree::new();
    // Обратите внимание: разные порядки вставки порождают разные двоичные деревья; данная последовательность может построить совершенное двоичное дерево
    let nums = [8, 4, 12, 2, 6, 10, 14, 1, 3, 5, 7, 9, 11, 13, 15];
    for &num in &nums {
        bst.insert(num);
    }
    println!("\nИсходное двоичное дерево\n");
    print_util::print_tree(bst.get_root().as_ref().unwrap());

    /* Найти узел */
    let node = bst.search(7);
    println!(
        "\nНайденный объект узла = {:?}, значение узла = {}",\nnode.clone().unwrap(),\nnode.clone().unwrap().borrow().val
    );

    /* Вставка узла */
    bst.insert(16);
    println!("\nПосле вставки узла 16 двоичное дерево имеет вид\n");
    print_util::print_tree(bst.get_root().as_ref().unwrap());

    /* Удаление узла */
    bst.remove(1);
    println!("\nПосле удаления узла 1 двоичное дерево имеет вид\n");
    print_util::print_tree(bst.get_root().as_ref().unwrap());
    bst.remove(2);
    println!("\nПосле удаления узла 2 двоичное дерево имеет вид\n");
    print_util::print_tree(bst.get_root().as_ref().unwrap());
    bst.remove(4);
    println!("\nПосле удаления узла 4 двоичное дерево имеет вид\n");
    print_util::print_tree(bst.get_root().as_ref().unwrap());
}
