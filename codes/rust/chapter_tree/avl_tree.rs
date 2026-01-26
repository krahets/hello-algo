/*
 * File: avl_tree.rs
 * Created Time: 2023-07-14
 * Author: night-cruise (2586447362@qq.com)
 */

use hello_algo_rust::binary_tree::{BinaryTree, TreeNode};
use std::cell::RefCell;
use std::cmp::Ordering;
use std::rc::Rc;

/* AVL 树 */
pub struct AVLTree {
    root: Option<Rc<RefCell<TreeNode<i32>>>>, // 根节点
}

impl AVLTree {
    /* 构造方法 */
    #[allow(clippy::new_without_default)]
    pub fn new() -> Self {
        Self { root: None }
    }

    /* 获取节点高度 */
    pub fn height(node: Option<Rc<RefCell<TreeNode<i32>>>>) -> Option<usize> {
        // 这里我们遵循 Rust 类型系统的惯例，定义空节点高度为 None ，叶节点高度为 Some(0)
        Some(node?.borrow().height)
    }

    /* 更新节点高度 */
    fn update_height(node: Option<Rc<RefCell<TreeNode<i32>>>>) {
        if let Some(node) = node {
            // 节点高度等于最高子树高度 + 1，如果没有子节点，则高度为 0
            let mut height = 0;
            if let Some(left) = &node.borrow().left {
                height = left.borrow().height + 1;
            }
            if let Some(right) = &node.borrow().right {
                height = height.max(right.borrow().height + 1);
            }
            node.borrow_mut().height = height;
        }
    }

    /* 获取平衡因子 */
    fn balance_factor(node: Option<Rc<RefCell<TreeNode<i32>>>>) -> i8 {
        // 节点平衡因子 = 左子树高度 - 右子树高度
        // 平衡时取值为 -1 、 0 或 1，失衡时取值为 -2 或 2，不会出现其他值

        let Some(node) = node else {
            // 空节点的平衡因子为 0
            return 0;
        };

        match (&node.borrow().left, &node.borrow().right) {
            (None, None) => 0,

            (None, Some(right)) => {
                if right.borrow().height == 0 {
                    -1
                } else {
                    -2
                }
            }

            (Some(left), None) => {
                if left.borrow().height == 0 {
                    1
                } else {
                    2
                }
            }

            (Some(left), Some(right)) => {
                let left_height = left.borrow().height;
                let right_height = right.borrow().height;
                if left_height + 1 < right_height {
                    -2
                } else if left_height + 1 == right_height {
                    -1
                } else if left_height == right_height {
                    0
                } else if left_height == right_height + 1 {
                    1
                } else {
                    2
                }
            }
        }
    }

    /* 右旋操作 */
    fn right_rotate(
        node: Option<Rc<RefCell<TreeNode<i32>>>>,
    ) -> Option<Rc<RefCell<TreeNode<i32>>>> {
        let node = node?;
        let child = node
            .borrow_mut()
            .left
            .take()
            .expect("该方法仅可在左子树失衡时调用，左子节点不应为空");
        let grand_child = child.borrow_mut().right.take();
        // 以 child 为原点，将 node 向右旋转
        child.borrow_mut().right = Some(Rc::clone(&node));
        node.borrow_mut().left = grand_child;
        // 更新节点高度
        Self::update_height(Some(node));
        Self::update_height(Some(Rc::clone(&child)));
        // 返回旋转后子树的根节点
        Some(child)
    }

    /* 左旋操作 */
    fn left_rotate(node: Option<Rc<RefCell<TreeNode<i32>>>>) -> Option<Rc<RefCell<TreeNode<i32>>>> {
        let node = node?;
        let child = node
            .borrow_mut()
            .right
            .take()
            .expect("该方法仅可在右子树失衡时调用，右子节点不应为空");
        let grand_child = child.borrow_mut().left.take();
        // 以 child 为原点，将 node 向左旋转
        child.borrow_mut().left = Some(Rc::clone(&node));
        node.borrow_mut().right = grand_child;
        // 更新节点高度
        Self::update_height(Some(node));
        Self::update_height(Some(Rc::clone(&child)));
        // 返回旋转后子树的根节点
        Some(child)
    }

    /* 执行旋转操作，使该子树重新恢复平衡 */
    fn rotate(node: Option<Rc<RefCell<TreeNode<i32>>>>) -> Option<Rc<RefCell<TreeNode<i32>>>> {
        // 获取节点 node 的平衡因子
        let balance_factor = Self::balance_factor(node.clone());

        // 左偏树
        if balance_factor > 1 {
            // 根据定义，node 仅在平衡因子为 0 的情况下可能为空节点
            let node = node.unwrap_or_else(|| unreachable!());
            if Self::balance_factor(node.borrow().left.clone()) >= 0 {
                // 右旋
                return Self::right_rotate(Some(node));
            }
            // 先左旋后右旋
            let left = node.borrow().left.clone();
            node.borrow_mut().left = Self::left_rotate(left);
            return Self::right_rotate(Some(node));
        }

        // 右偏树
        if balance_factor < -1 {
            // 根据定义，node 仅在平衡因子为 0 的情况下可能为空节点
            let node = node.unwrap_or_else(|| unreachable!());
            if Self::balance_factor(node.borrow().right.clone()) <= 0 {
                // 左旋
                return Self::left_rotate(Some(node));
            }
            // 先右旋后左旋
            let right = node.borrow().right.clone();
            node.borrow_mut().right = Self::right_rotate(right);
            return Self::left_rotate(Some(node));
        }

        // 平衡树，无须旋转，直接返回
        node
    }

    /* 插入节点 */
    pub fn insert(&mut self, val: i32) {
        self.root = Self::insert_helper(self.root.clone(), val);
    }

    /* 递归插入节点（辅助方法） */
    fn insert_helper(
        node: Option<Rc<RefCell<TreeNode<i32>>>>,
        val: i32,
    ) -> Option<Rc<RefCell<TreeNode<i32>>>> {
        let Some(mut node) = node else {
            return Some(TreeNode::new(val));
        };

        // 查找插入位置并插入节点
        let node_val = node.borrow().val;
        match val.cmp(&node_val) {
            Ordering::Less => {
                let left = node.borrow_mut().left.take();
                node.borrow_mut().left = Self::insert_helper(left, val);
            }
            Ordering::Greater => {
                let right = node.borrow_mut().right.take();
                node.borrow_mut().right = Self::insert_helper(right, val);
            }
            // 重复节点不插入，直接返回
            Ordering::Equal => return Some(node),
        }

        // 更新节点高度
        Self::update_height(Some(node.clone()));

        // 执行旋转操作，使该子树重新恢复平衡
        node = Self::rotate(Some(node)).unwrap_or_else(|| unreachable!());

        // 返回子树的根节点
        Some(node)
    }

    /* 删除节点 */
    pub fn remove(&self, val: i32) {
        Self::remove_helper(self.root.clone(), val);
    }

    /* 递归删除节点（辅助方法） */
    fn remove_helper(
        node: Option<Rc<RefCell<TreeNode<i32>>>>,
        val: i32,
    ) -> Option<Rc<RefCell<TreeNode<i32>>>> {
        let mut node = node?;

        // 查找节点并删除
        let node_val = node.borrow().val;
        match val.cmp(&node_val) {
            Ordering::Less => {
                let left = node.borrow().left.clone();
                node.borrow_mut().left = Self::remove_helper(left, val);
            }
            Ordering::Greater => {
                let right = node.borrow().right.clone();
                node.borrow_mut().right = Self::remove_helper(right, val);
            }
            Ordering::Equal => {
                let borrow = node.borrow();
                let left_child = borrow.left.as_ref();
                let right_child = borrow.right.as_ref();
                if left_child.is_none() || right_child.is_none() {
                    let child = left_child.or(right_child).cloned();
                    drop(borrow);
                    match child {
                        // 子节点数量 = 0 ，直接删除 node 并返回
                        None => return None,
                        // 子节点数量 = 1 ，直接删除 node
                        Some(child) => node = child,
                    }
                } else {
                    // 子节点数量 = 2 ，则将中序遍历的下个节点删除，并用该节点替换当前节点
                    let Some(mut temp) = node.borrow().right.clone() else {
                        unreachable!()
                    };
                    loop {
                        temp = if let Some(temp_left) = &temp.borrow().left {
                            Rc::clone(temp_left)
                        } else {
                            break;
                        };
                    }
                    drop(borrow);
                    let right = node.borrow_mut().right.take();
                    node.borrow_mut().right = Self::remove_helper(right, temp.borrow().val);
                    node.borrow_mut().val = temp.borrow().val;
                }
            }
        }

        // 更新节点高度
        Self::update_height(Some(node.clone()));

        // 执行旋转操作，使该子树重新恢复平衡
        node = Self::rotate(Some(node)).unwrap_or_else(|| unreachable!());

        // 返回子树的根节点
        Some(node)
    }

    /* 查找节点 */
    pub fn search(&self, val: i32) -> Option<Rc<RefCell<TreeNode<i32>>>> {
        let mut cur = self.root.clone();
        // 循环查找，越过叶节点后跳出
        while let Some(current) = cur.clone() {
            match val.cmp(&current.borrow().val) {
                // 目标节点在 cur 的左子树中
                Ordering::Less => {
                    cur = current.borrow().left.clone();
                }
                // 目标节点在 cur 的右子树中
                Ordering::Greater => {
                    cur = current.borrow().right.clone();
                }
                // 找到目标节点，跳出循环
                Ordering::Equal => break,
            }
        }
        // 返回目标节点
        cur
    }
}

/* Driver Code */
fn main() {
    fn test_insert(tree: &mut AVLTree, val: i32) {
        tree.insert(val);
        println!("插入节点 {val} 后，AVL 树为\n{}", tree.root.display());
    }

    fn test_remove(tree: &mut AVLTree, val: i32) {
        tree.remove(val);
        println!("删除节点 {val} 后，AVL 树为\n{}", tree.root.display());
    }

    /* 初始化空 AVL 树 */
    let mut avl_tree = AVLTree::new();

    /* 插入节点 */
    // 请关注插入节点后，AVL 树是如何保持平衡的
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

    /* 插入重复节点 */
    test_insert(&mut avl_tree, 7);

    /* 删除节点 */
    // 请关注删除节点后，AVL 树是如何保持平衡的
    test_remove(&mut avl_tree, 8); // 删除度为 0 的节点
    test_remove(&mut avl_tree, 5); // 删除度为 1 的节点
    test_remove(&mut avl_tree, 4); // 删除度为 2 的节点

    /* 查询节点 */
    let node = avl_tree.search(7);
    if let Some(node) = node {
        println!(
            "查找到的节点对象为 {:?}，节点值 = {}",
            node.borrow(),
            node.borrow().val
        );
    }
}
