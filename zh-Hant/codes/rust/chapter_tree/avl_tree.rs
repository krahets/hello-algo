/*
 * File: avl_tree.rs
 * Created Time: 2023-07-14
 * Author: night-cruise (2586447362@qq.com)
 */

include!("../include/include.rs");

use std::cell::RefCell;
use std::cmp::Ordering;
use std::rc::Rc;
use tree_node::TreeNode;

type OptionTreeNodeRc = Option<Rc<RefCell<TreeNode>>>;

/* AVL 树 */
struct AVLTree {
    root: OptionTreeNodeRc, // 根节点
}

impl AVLTree {
    /* 构造方法 */
    fn new() -> Self {
        Self { root: None }
    }

    /* 获取节点高度 */
    fn height(node: OptionTreeNodeRc) -> i32 {
        // 空节点高度为 -1 ，叶节点高度为 0
        match node {
            Some(node) => node.borrow().height,
            None => -1,
        }
    }

    /* 更新节点高度 */
    fn update_height(node: OptionTreeNodeRc) {
        if let Some(node) = node {
            let left = node.borrow().left.clone();
            let right = node.borrow().right.clone();
            // 节点高度等于最高子树高度 + 1
            node.borrow_mut().height = std::cmp::max(Self::height(left), Self::height(right)) + 1;
        }
    }

    /* 获取平衡因子 */
    fn balance_factor(node: OptionTreeNodeRc) -> i32 {
        match node {
            // 空节点平衡因子为 0
            None => 0,
            // 节点平衡因子 = 左子树高度 - 右子树高度
            Some(node) => {
                Self::height(node.borrow().left.clone()) - Self::height(node.borrow().right.clone())
            }
        }
    }

    /* 右旋操作 */
    fn right_rotate(node: OptionTreeNodeRc) -> OptionTreeNodeRc {
        match node {
            Some(node) => {
                let child = node.borrow().left.clone().unwrap();
                let grand_child = child.borrow().right.clone();
                // 以 child 为原点，将 node 向右旋转
                child.borrow_mut().right = Some(node.clone());
                node.borrow_mut().left = grand_child;
                // 更新节点高度
                Self::update_height(Some(node));
                Self::update_height(Some(child.clone()));
                // 返回旋转后子树的根节点
                Some(child)
            }
            None => None,
        }
    }

    /* 左旋操作 */
    fn left_rotate(node: OptionTreeNodeRc) -> OptionTreeNodeRc {
        match node {
            Some(node) => {
                let child = node.borrow().right.clone().unwrap();
                let grand_child = child.borrow().left.clone();
                // 以 child 为原点，将 node 向左旋转
                child.borrow_mut().left = Some(node.clone());
                node.borrow_mut().right = grand_child;
                // 更新节点高度
                Self::update_height(Some(node));
                Self::update_height(Some(child.clone()));
                // 返回旋转后子树的根节点
                Some(child)
            }
            None => None,
        }
    }

    /* 执行旋转操作，使该子树重新恢复平衡 */
    fn rotate(node: OptionTreeNodeRc) -> OptionTreeNodeRc {
        // 获取节点 node 的平衡因子
        let balance_factor = Self::balance_factor(node.clone());
        // 左偏树
        if balance_factor > 1 {
            let node = node.unwrap();
            if Self::balance_factor(node.borrow().left.clone()) >= 0 {
                // 右旋
                Self::right_rotate(Some(node))
            } else {
                // 先左旋后右旋
                let left = node.borrow().left.clone();
                node.borrow_mut().left = Self::left_rotate(left);
                Self::right_rotate(Some(node))
            }
        }
        // 右偏树
        else if balance_factor < -1 {
            let node = node.unwrap();
            if Self::balance_factor(node.borrow().right.clone()) <= 0 {
                // 左旋
                Self::left_rotate(Some(node))
            } else {
                // 先右旋后左旋
                let right = node.borrow().right.clone();
                node.borrow_mut().right = Self::right_rotate(right);
                Self::left_rotate(Some(node))
            }
        } else {
            // 平衡树，无须旋转，直接返回
            node
        }
    }

    /* 插入节点 */
    fn insert(&mut self, val: i32) {
        self.root = Self::insert_helper(self.root.clone(), val);
    }

    /* 递归插入节点（辅助方法） */
    fn insert_helper(node: OptionTreeNodeRc, val: i32) -> OptionTreeNodeRc {
        match node {
            Some(mut node) => {
                /* 1. 查找插入位置并插入节点 */
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
                        return Some(node); // 重复节点不插入，直接返回
                    }
                }
                Self::update_height(Some(node.clone())); // 更新节点高度

                /* 2. 执行旋转操作，使该子树重新恢复平衡 */
                node = Self::rotate(Some(node)).unwrap();
                // 返回子树的根节点
                Some(node)
            }
            None => Some(TreeNode::new(val)),
        }
    }

    /* 删除节点 */
    fn remove(&self, val: i32) {
        Self::remove_helper(self.root.clone(), val);
    }

    /* 递归删除节点（辅助方法） */
    fn remove_helper(node: OptionTreeNodeRc, val: i32) -> OptionTreeNodeRc {
        match node {
            Some(mut node) => {
                /* 1. 查找节点并删除 */
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
                        // 子节点数量 = 0 ，直接删除 node 并返回
                        None => {
                            return None;
                        }
                        // 子节点数量 = 1 ，直接删除 node
                        Some(child) => node = child,
                    }
                } else {
                    // 子节点数量 = 2 ，则将中序遍历的下个节点删除，并用该节点替换当前节点
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
                Self::update_height(Some(node.clone())); // 更新节点高度

                /* 2. 执行旋转操作，使该子树重新恢复平衡 */
                node = Self::rotate(Some(node)).unwrap();
                // 返回子树的根节点
                Some(node)
            }
            None => None,
        }
    }

    /* 查找节点 */
    fn search(&self, val: i32) -> OptionTreeNodeRc {
        let mut cur = self.root.clone();
        // 循环查找，越过叶节点后跳出
        while let Some(current) = cur.clone() {
            match current.borrow().val.cmp(&val) {
                // 目标节点在 cur 的右子树中
                Ordering::Less => {
                    cur = current.borrow().right.clone();
                }
                // 目标节点在 cur 的左子树中
                Ordering::Greater => {
                    cur = current.borrow().left.clone();
                }
                // 找到目标节点，跳出循环
                Ordering::Equal => {
                    break;
                }
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
        println!("\n插入节点 {} 后，AVL 树为", val);
        print_util::print_tree(&tree.root.clone().unwrap());
    }

    fn test_remove(tree: &mut AVLTree, val: i32) {
        tree.remove(val);
        println!("\n删除节点 {} 后，AVL 树为", val);
        print_util::print_tree(&tree.root.clone().unwrap());
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
            "\n查找到的节点对象为 {:?}，节点值 = {}",
            &*node.borrow(),
            node.borrow().val
        );
    }
}
