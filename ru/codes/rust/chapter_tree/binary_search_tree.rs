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
        // Инициализация пустого дерева
        Self { root: None }
    }

    /* Получить корень двоичного дерева */
    pub fn get_root(&self) -> OptionTreeNodeRc {
        self.root.clone()
    }

    /* Поиск узла */
    pub fn search(&self, num: i32) -> OptionTreeNodeRc {
        let mut cur = self.root.clone();
        // Искать в цикле до выхода за пределы листа
        while let Some(node) = cur.clone() {
            match num.cmp(&node.borrow().val) {
                // Искомый узел в правом поддереве cur
                Ordering::Greater => cur = node.borrow().right.clone(),
                // Искомый узел в левом поддереве cur
                Ordering::Less => cur = node.borrow().left.clone(),
                // Узел найден: выйти из цикла
                Ordering::Equal => break,
            }
        }

        // Вернуть искомый узел
        cur
    }

    /* Вставка узла */
    pub fn insert(&mut self, num: i32) {
        // Если дерево пусто, создать корень
        if self.root.is_none() {
            self.root = Some(TreeNode::new(num));
            return;
        }
        let mut cur = self.root.clone();
        let mut pre = None;
        // Искать в цикле до выхода за пределы листа
        while let Some(node) = cur.clone() {
            match num.cmp(&node.borrow().val) {
                // Такой узел уже есть: завершить вызов
                Ordering::Equal => return,
                // Место вставки в правом поддереве cur
                Ordering::Greater => {
                    pre = cur.clone();
                    cur = node.borrow().right.clone();
                }
                // Место вставки в левом поддереве cur
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
        // Если дерево пусто, сразу завершить вызов
        if self.root.is_none() {
            return;
        }
        let mut cur = self.root.clone();
        let mut pre = None;
        // Искать в цикле до выхода за пределы листа
        while let Some(node) = cur.clone() {
            match num.cmp(&node.borrow().val) {
                // Узел для удаления найден: выйти из цикла
                Ordering::Equal => break,
                // Узел для удаления в правом поддереве cur
                Ordering::Greater => {
                    pre = cur.clone();
                    cur = node.borrow().right.clone();
                }
                // Узел для удаления в левом поддереве cur
                Ordering::Less => {
                    pre = cur.clone();
                    cur = node.borrow().left.clone();
                }
            }
        }
        // Если узел для удаления не найден, завершить вызов
        if cur.is_none() {
            return;
        }
        let cur = cur.unwrap();
        let (left_child, right_child) = (cur.borrow().left.clone(), cur.borrow().right.clone());
        match (left_child.clone(), right_child.clone()) {
            // Число потомков равно 0 или 1
            (None, None) | (Some(_), None) | (None, Some(_)) => {
                // Если потомков нет, child = nullptr, если потомок один, child указывает на него
                let child = left_child.or(right_child);
                // Удалить узел cur
                if !Rc::ptr_eq(&cur, self.root.as_ref().unwrap()) {
                    let pre = pre.unwrap();
                    let left = pre.borrow().left.clone();
                    if left.is_some() && Rc::ptr_eq(left.as_ref().unwrap(), &cur) {
                        pre.borrow_mut().left = child;
                    } else {
                        pre.borrow_mut().right = child;
                    }
                } else {
                    // Если удаляется корень, назначить новый корень
                    self.root = child;
                }
            }
            // Число потомков равно 2
            (Some(_), Some(_)) => {
                // Найти следующий за cur узел в порядке симметричного обхода
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
                // Заменить значение cur значением tmp
                cur.borrow_mut().val = tmp_val;
            }
        }
    }
}

/* Основная программа */
fn main() {
    /* Инициализация двоичного дерева поиска */
    let mut bst = BinarySearchTree::new();
    // От порядка вставки зависит форма дерева. Эта последовательность даёт совершенное двоичное дерево
    let nums = [8, 4, 12, 2, 6, 10, 14, 1, 3, 5, 7, 9, 11, 13, 15];
    for &num in &nums {
        bst.insert(num);
    }
    println!("\nИсходное двоичное дерево:\n");
    print_util::print_tree(bst.get_root().as_ref().unwrap());

    /* Поиск узла */
    let node = bst.search(7);
    println!(
        "\nНайденный узел: {:?}, значение узла = {}",
        node.clone().unwrap(),
        node.clone().unwrap().borrow().val
    );

    /* Вставка узла */
    bst.insert(16);
    println!("\nДвоичное дерево после вставки узла 16:\n");
    print_util::print_tree(bst.get_root().as_ref().unwrap());

    /* Удаление узла */
    bst.remove(1);
    println!("\nДвоичное дерево после удаления узла 1:\n");
    print_util::print_tree(bst.get_root().as_ref().unwrap());
    bst.remove(2);
    println!("\nДвоичное дерево после удаления узла 2:\n");
    print_util::print_tree(bst.get_root().as_ref().unwrap());
    bst.remove(4);
    println!("\nДвоичное дерево после удаления узла 4:\n");
    print_util::print_tree(bst.get_root().as_ref().unwrap());
}
