/*
 * File: avl_tree.rs
 * Created Time: 2023-07-14
 * Author: night-cruise (2586447362@qq.com)
 */

use hello_algo_rust::include::{print_util, TreeNode};

use std::cell::RefCell;
use std::cmp::Ordering;
use std::rc::Rc;

type OptionTreeNodeRc = Option<Rc<RefCell<TreeNode>>>;

/* AVL-дерево */
struct AVLTree {
    root: OptionTreeNodeRc, // корневой узел
}

impl AVLTree {
    /* Конструктор */
    fn new() -> Self {
        Self { root: None }
    }

    /* Получить высоту узла */
    fn height(node: OptionTreeNodeRc) -> i32 {
        // Высота пустого узла равна -1, а высота листа равна 0
        match node {
            Some(node) => node.borrow().height,
            None => -1,
        }
    }

    /* Обновить высоту узла */
    fn update_height(node: OptionTreeNodeRc) {
        if let Some(node) = node {
            let left = node.borrow().left.clone();
            let right = node.borrow().right.clone();
            // Высота узла равна высоте более высокого поддерева + 1
            node.borrow_mut().height = std::cmp::max(Self::height(left), Self::height(right)) + 1;
        }
    }

    /* Получить коэффициент баланса */
    fn balance_factor(node: OptionTreeNodeRc) -> i32 {
        match node {
            // Баланс-фактор пустого узла равен 0
            None => 0,
            // Баланс-фактор узла = высота левого поддерева - высота правого поддерева
            Some(node) => {
                Self::height(node.borrow().left.clone()) - Self::height(node.borrow().right.clone())
            }
        }
    }

    /* Операция правого поворота */
    fn right_rotate(node: OptionTreeNodeRc) -> OptionTreeNodeRc {
        match node {
            Some(node) => {
                let child = node.borrow().left.clone().unwrap();
                let grand_child = child.borrow().right.clone();
                // Используя child как опорную точку, выполнить правый поворот node
                child.borrow_mut().right = Some(node.clone());
                node.borrow_mut().left = grand_child;
                // Обновить высоту узла
                Self::update_height(Some(node));
                Self::update_height(Some(child.clone()));
                // Вернуть корневой узел поддерева после вращения
                Some(child)
            }
            None => None,
        }
    }

    /* Операция левого поворота */
    fn left_rotate(node: OptionTreeNodeRc) -> OptionTreeNodeRc {
        match node {
            Some(node) => {
                let child = node.borrow().right.clone().unwrap();
                let grand_child = child.borrow().left.clone();
                // Используя child как опорную точку, выполнить левый поворот node
                child.borrow_mut().left = Some(node.clone());
                node.borrow_mut().right = grand_child;
                // Обновить высоту узла
                Self::update_height(Some(node));
                Self::update_height(Some(child.clone()));
                // Вернуть корневой узел поддерева после вращения
                Some(child)
            }
            None => None,
        }
    }

    /* Выполнить поворот, чтобы восстановить баланс этого поддерева */
    fn rotate(node: OptionTreeNodeRc) -> OptionTreeNodeRc {
        // Получить коэффициент баланса узла node
        let balance_factor = Self::balance_factor(node.clone());
        // Левосторонне перекошенное дерево
        if balance_factor > 1 {
            let node = node.unwrap();
            if Self::balance_factor(node.borrow().left.clone()) >= 0 {
                // Правый поворот
                Self::right_rotate(Some(node))
            } else {
                // Сначала выполнить левый поворот, затем правый
                let left = node.borrow().left.clone();
                node.borrow_mut().left = Self::left_rotate(left);
                Self::right_rotate(Some(node))
            }
        }
        // Правосторонне перекошенное дерево
        else if balance_factor < -1 {
            let node = node.unwrap();
            if Self::balance_factor(node.borrow().right.clone()) <= 0 {
                // Левый поворот
                Self::left_rotate(Some(node))
            } else {
                // Сначала выполнить правый поворот, затем левый
                let right = node.borrow().right.clone();
                node.borrow_mut().right = Self::right_rotate(right);
                Self::left_rotate(Some(node))
            }
        } else {
            // Дерево сбалансировано, вращение не требуется, можно сразу вернуть результат
            node
        }
    }

    /* Вставить узел */
    fn insert(&mut self, val: i32) {
        self.root = Self::insert_helper(self.root.clone(), val);
    }

    /* Рекурсивная вставка узла (вспомогательный метод) */
    fn insert_helper(node: OptionTreeNodeRc, val: i32) -> OptionTreeNodeRc {
        match node {
            Some(mut node) => {
                /* 1. Найти позицию вставки и вставить узел */
                match {
                    let node_val = node.borrow().val;
                    node_val
                }
                .cmp(&val)
                {
                    Ordering::Greater => {
                        let left = node.borrow().left.clone();
                        node.borrow_mut().left = Self::insert_helper(left, val);
                    }
                    Ordering::Less => {
                        let right = node.borrow().right.clone();
                        node.borrow_mut().right = Self::insert_helper(right, val);
                    }
                    Ordering::Equal => {
                        return Some(node); // Дублирующийся узел не вставлять, сразу вернуть результат
                    }
                }
                Self::update_height(Some(node.clone())); // Обновить высоту узла

                /* 2. Выполнить вращение, чтобы снова сбалансировать это поддерево */
                node = Self::rotate(Some(node)).unwrap();
                // Вернуть корневой узел поддерева
                Some(node)
            }
            None => Some(TreeNode::new(val)),
        }
    }

    /* Удалить узел */
    fn remove(&self, val: i32) {
        Self::remove_helper(self.root.clone(), val);
    }

    /* Рекурсивное удаление узла (вспомогательный метод) */
    fn remove_helper(node: OptionTreeNodeRc, val: i32) -> OptionTreeNodeRc {
        match node {
            Some(mut node) => {
                /* 1. Найти узел и удалить его */
                if val < node.borrow().val {
                    let left = node.borrow().left.clone();
                    node.borrow_mut().left = Self::remove_helper(left, val);
                } else if val > node.borrow().val {
                    let right = node.borrow().right.clone();
                    node.borrow_mut().right = Self::remove_helper(right, val);
                } else if node.borrow().left.is_none() || node.borrow().right.is_none() {
                    let child = if node.borrow().left.is_some() {
                        node.borrow().left.clone()
                    } else {
                        node.borrow().right.clone()
                    };
                    match child {
                        // Если число дочерних узлов равно 0, сразу удалить node и вернуть результат
                        None => {
                            return None;
                        }
                        // Если число дочерних узлов равно 1, сразу удалить node
                        Some(child) => node = child,
                    }
                } else {
                    // Если число дочерних узлов равно 2, удалить следующий узел симметричного обхода и заменить им текущий узел
                    let mut temp = node.borrow().right.clone().unwrap();
                    loop {
                        let temp_left = temp.borrow().left.clone();
                        if temp_left.is_none() {
                            break;
                        }
                        temp = temp_left.unwrap();
                    }
                    let right = node.borrow().right.clone();
                    node.borrow_mut().right = Self::remove_helper(right, temp.borrow().val);
                    node.borrow_mut().val = temp.borrow().val;
                }
                Self::update_height(Some(node.clone())); // Обновить высоту узла

                /* 2. Выполнить вращение, чтобы снова сбалансировать это поддерево */
                node = Self::rotate(Some(node)).unwrap();
                // Вернуть корневой узел поддерева
                Some(node)
            }
            None => None,
        }
    }

    /* Найти узел */
    fn search(&self, val: i32) -> OptionTreeNodeRc {
        let mut cur = self.root.clone();
        // Выполнять поиск в цикле и выйти после прохождения листового узла
        while let Some(current) = cur.clone() {
            match current.borrow().val.cmp(&val) {
                // Целевой узел находится в правом поддереве cur
                Ordering::Less => {
                    cur = current.borrow().right.clone();
                }
                // Целевой узел находится в левом поддереве cur
                Ordering::Greater => {
                    cur = current.borrow().left.clone();
                }
                // Найти целевой узел и выйти из цикла
                Ordering::Equal => {
                    break;
                }
            }
        }
        // Вернуть целевой узел
        cur
    }
}

/* Driver Code */
fn main() {
    fn test_insert(tree: &mut AVLTree, val: i32) {
        tree.insert(val);
        println!("\nПосле вставки узла {} AVL-дерево имеет вид", val);
        print_util::print_tree(&tree.root.clone().unwrap());
    }

    fn test_remove(tree: &mut AVLTree, val: i32) {
        tree.remove(val);
        println!("\nПосле удаления узла {} AVL-дерево имеет вид", val);
        print_util::print_tree(&tree.root.clone().unwrap());
    }

    /* Инициализировать пустое AVL-дерево */
    let mut avl_tree = AVLTree::new();

    /* Вставить узел */
    // Обратите внимание на то, как AVL-дерево сохраняет баланс после вставки узла
    test_insert(&mut avl_tree, 1);
    test_insert(&mut avl_tree, 2);
    test_insert(&mut avl_tree, 3);
    test_insert(&mut avl_tree, 4);
    test_insert(&mut avl_tree, 5);
    test_insert(&mut avl_tree, 8);
    test_insert(&mut avl_tree, 7);
    test_insert(&mut avl_tree, 9);
    test_insert(&mut avl_tree, 10);
    test_insert(&mut avl_tree, 6);

    /* Вставить повторяющийся узел */
    test_insert(&mut avl_tree, 7);

    /* Удалить узел */
    // Обратите внимание на то, как AVL-дерево сохраняет баланс после удаления узла
    test_remove(&mut avl_tree, 8); // Удалить узел степени 0
    test_remove(&mut avl_tree, 5); // Удалить узел степени 1
    test_remove(&mut avl_tree, 4); // Удалить узел степени 2

    /* Найти узел */
    let node = avl_tree.search(7);
    if let Some(node) = node {
        println!(
            "\nНайденный объект узла равен {:?}, значение узла = {}",
            &*node.borrow(),
            node.borrow().val
        );
    }
}
