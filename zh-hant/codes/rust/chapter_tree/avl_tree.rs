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

/* AVL 樹 */
struct AVLTree {
    root: OptionTreeNodeRc, // 根節點
}

impl AVLTree {
    /* 建構方法 */
    fn new() -> Self {
        Self { root: None }
    }

    /* 取得節點高度 */
    fn height(node: OptionTreeNodeRc) -> i32 {
        // 空節點的高度為 -1，葉節點的高度為 0
        match node {
            Some(node) => node.borrow().height,
            None => -1,
        }
    }

    /* 更新節點高度 */
    fn update_height(node: OptionTreeNodeRc) {
        if let Some(node) = node {
            let left = node.borrow().left.clone();
            let right = node.borrow().right.clone();
            // 節點高度等於最高子樹的高度加 1
            node.borrow_mut().height = std::cmp::max(Self::height(left), Self::height(right)) + 1;
        }
    }

    /* 取得平衡因子 */
    fn balance_factor(node: OptionTreeNodeRc) -> i32 {
        match node {
            // 空節點的平衡因子為 0
            None => 0,
            // 節點的平衡因子 = 左子樹高度 - 右子樹高度
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
                // 以 child 為支點，將 node 向右旋轉
                child.borrow_mut().right = Some(node.clone());
                node.borrow_mut().left = grand_child;
                // 更新節點高度
                Self::update_height(Some(node));
                Self::update_height(Some(child.clone()));
                // 回傳旋轉後的子樹根節點
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
                // 以 child 為支點，將 node 向左旋轉
                child.borrow_mut().left = Some(node.clone());
                node.borrow_mut().right = grand_child;
                // 更新節點高度
                Self::update_height(Some(node));
                Self::update_height(Some(child.clone()));
                // 回傳旋轉後的子樹根節點
                Some(child)
            }
            None => None,
        }
    }

    /* 透過旋轉讓這棵子樹恢復平衡 */
    fn rotate(node: OptionTreeNodeRc) -> OptionTreeNodeRc {
        // 取得節點 node 的平衡因子
        let balance_factor = Self::balance_factor(node.clone());
        // 左偏樹
        if balance_factor > 1 {
            let node = node.unwrap();
            if Self::balance_factor(node.borrow().left.clone()) >= 0 {
                // 右旋
                Self::right_rotate(Some(node))
            } else {
                // 先左旋再右旋
                let left = node.borrow().left.clone();
                node.borrow_mut().left = Self::left_rotate(left);
                Self::right_rotate(Some(node))
            }
        }
        // 右偏樹
        else if balance_factor < -1 {
            let node = node.unwrap();
            if Self::balance_factor(node.borrow().right.clone()) <= 0 {
                // 左旋
                Self::left_rotate(Some(node))
            } else {
                // 先右旋再左旋
                let right = node.borrow().right.clone();
                node.borrow_mut().right = Self::right_rotate(right);
                Self::left_rotate(Some(node))
            }
        } else {
            // 樹已平衡，無須旋轉，直接返回
            node
        }
    }

    /* 插入節點 */
    fn insert(&mut self, val: i32) {
        self.root = Self::insert_helper(self.root.clone(), val);
    }

    /* 以遞迴插入節點（輔助方法） */
    fn insert_helper(node: OptionTreeNodeRc, val: i32) -> OptionTreeNodeRc {
        match node {
            Some(mut node) => {
                /* 1. 找出插入位置並插入節點 */
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
                        return Some(node); // 若節點重複，直接返回，略過插入操作
                    }
                }
                Self::update_height(Some(node.clone())); // 更新節點高度

                /* 2. 透過旋轉讓這棵子樹恢復平衡 */
                node = Self::rotate(Some(node)).unwrap();
                // 回傳子樹的根節點
                Some(node)
            }
            None => Some(TreeNode::new(val)),
        }
    }

    /* 刪除節點 */
    fn remove(&self, val: i32) {
        Self::remove_helper(self.root.clone(), val);
    }

    /* 以遞迴刪除節點（輔助方法） */
    fn remove_helper(node: OptionTreeNodeRc, val: i32) -> OptionTreeNodeRc {
        match node {
            Some(mut node) => {
                /* 1. 找出並刪除節點 */
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
                        // 若有 0 個子節點，直接刪除 node 並返回
                        None => {
                            return None;
                        }
                        // 若只有 1 個子節點，直接刪除 node
                        Some(child) => node = child,
                    }
                } else {
                    // 若有 2 個子節點，刪除中序走訪的下一個節點，並用它的值取代目前節點的值
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
                Self::update_height(Some(node.clone())); // 更新節點高度

                /* 2. 透過旋轉讓這棵子樹恢復平衡 */
                node = Self::rotate(Some(node)).unwrap();
                // 回傳子樹的根節點
                Some(node)
            }
            None => None,
        }
    }

    /* 搜尋節點 */
    fn search(&self, val: i32) -> OptionTreeNodeRc {
        let mut cur = self.root.clone();
        // 用迴圈搜尋，越過葉節點後跳出迴圈
        while let Some(current) = cur.clone() {
            match current.borrow().val.cmp(&val) {
                // 目標節點在 cur 的右子樹中
                Ordering::Less => {
                    cur = current.borrow().right.clone();
                }
                // 目標節點在 cur 的左子樹中
                Ordering::Greater => {
                    cur = current.borrow().left.clone();
                }
                // 找到目標節點，跳出迴圈
                Ordering::Equal => {
                    break;
                }
            }
        }
        // 回傳目標節點
        cur
    }
}

/* 主程式 */
fn main() {
    fn test_insert(tree: &mut AVLTree, val: i32) {
        tree.insert(val);
        println!("\n插入節點 {} 後的 AVL 樹為", val);
        print_util::print_tree(&tree.root.clone().unwrap());
    }

    fn test_remove(tree: &mut AVLTree, val: i32) {
        tree.remove(val);
        println!("\n刪除節點 {} 後的 AVL 樹為", val);
        print_util::print_tree(&tree.root.clone().unwrap());
    }

    /* 初始化一棵空的 AVL 樹 */
    let mut avl_tree = AVLTree::new();

    /* 插入節點 */
    // 請觀察插入節點後 AVL 樹如何維持平衡
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

    /* 插入重複節點 */
    test_insert(&mut avl_tree, 7);

    /* 刪除節點 */
    // 請觀察刪除節點後 AVL 樹如何維持平衡
    test_remove(&mut avl_tree, 8); // 刪除分支度為 0 的節點
    test_remove(&mut avl_tree, 5); // 刪除分支度為 1 的節點
    test_remove(&mut avl_tree, 4); // 刪除分支度為 2 的節點

    /* 查詢節點 */
    let node = avl_tree.search(7);
    if let Some(node) = node {
        println!(
            "\n找到的節點物件為 {:?}，節點值 = {}",
            &*node.borrow(),
            node.borrow().val
        );
    }
}
