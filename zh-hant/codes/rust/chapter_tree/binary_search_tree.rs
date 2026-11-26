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

/* 二元搜尋樹 */
pub struct BinarySearchTree {
    root: OptionTreeNodeRc,
}

impl BinarySearchTree {
    /* 建構方法 */
    pub fn new() -> Self {
        // 初始化空樹
        Self { root: None }
    }

    /* 取得二元樹的根節點 */
    pub fn get_root(&self) -> OptionTreeNodeRc {
        self.root.clone()
    }

    /* 搜尋節點 */
    pub fn search(&self, num: i32) -> OptionTreeNodeRc {
        let mut cur = self.root.clone();
        // 用迴圈搜尋，越過葉節點後跳出迴圈
        while let Some(node) = cur.clone() {
            match num.cmp(&node.borrow().val) {
                // 目標節點在 cur 的右子樹中
                Ordering::Greater => cur = node.borrow().right.clone(),
                // 目標節點在 cur 的左子樹中
                Ordering::Less => cur = node.borrow().left.clone(),
                // 找到目標節點，跳出迴圈
                Ordering::Equal => break,
            }
        }

        // 回傳目標節點
        cur
    }

    /* 插入節點 */
    pub fn insert(&mut self, num: i32) {
        // 若樹為空，則初始化根節點
        if self.root.is_none() {
            self.root = Some(TreeNode::new(num));
            return;
        }
        let mut cur = self.root.clone();
        let mut pre = None;
        // 用迴圈搜尋，越過葉節點後跳出迴圈
        while let Some(node) = cur.clone() {
            match num.cmp(&node.borrow().val) {
                // 找到重複節點，直接返回
                Ordering::Equal => return,
                // 插入位置在 cur 的右子樹中
                Ordering::Greater => {
                    pre = cur.clone();
                    cur = node.borrow().right.clone();
                }
                // 插入位置在 cur 的左子樹中
                Ordering::Less => {
                    pre = cur.clone();
                    cur = node.borrow().left.clone();
                }
            }
        }
        // 插入節點
        let pre = pre.unwrap();
        let node = Some(TreeNode::new(num));
        if num > pre.borrow().val {
            pre.borrow_mut().right = node;
        } else {
            pre.borrow_mut().left = node;
        }
    }

    /* 刪除節點 */
    pub fn remove(&mut self, num: i32) {
        // 若樹為空，直接返回
        if self.root.is_none() {
            return;
        }
        let mut cur = self.root.clone();
        let mut pre = None;
        // 用迴圈搜尋，越過葉節點後跳出迴圈
        while let Some(node) = cur.clone() {
            match num.cmp(&node.borrow().val) {
                // 找到要刪除的節點，跳出迴圈
                Ordering::Equal => break,
                // 要刪除的節點在 cur 的右子樹中
                Ordering::Greater => {
                    pre = cur.clone();
                    cur = node.borrow().right.clone();
                }
                // 要刪除的節點在 cur 的左子樹中
                Ordering::Less => {
                    pre = cur.clone();
                    cur = node.borrow().left.clone();
                }
            }
        }
        // 若找不到要刪除的節點，直接返回
        if cur.is_none() {
            return;
        }
        let cur = cur.unwrap();
        let (left_child, right_child) = (cur.borrow().left.clone(), cur.borrow().right.clone());
        match (left_child.clone(), right_child.clone()) {
            // 子節點數為 0 或 1
            (None, None) | (Some(_), None) | (None, Some(_)) => {
                // 有 0 個子節點時，child = nullptr；只有 1 個時，child 指向該子節點
                let child = left_child.or(right_child);
                // 刪除節點 cur
                if !Rc::ptr_eq(&cur, self.root.as_ref().unwrap()) {
                    let pre = pre.unwrap();
                    let left = pre.borrow().left.clone();
                    if left.is_some() && Rc::ptr_eq(left.as_ref().unwrap(), &cur) {
                        pre.borrow_mut().left = child;
                    } else {
                        pre.borrow_mut().right = child;
                    }
                } else {
                    // 若刪除的是根節點，則重新指定根節點
                    self.root = child;
                }
            }
            // 子節點數為 2
            (Some(_), Some(_)) => {
                // 取得中序走訪中 cur 的下一個節點
                let mut tmp = cur.borrow().right.clone();
                while let Some(node) = tmp.clone() {
                    if node.borrow().left.is_some() {
                        tmp = node.borrow().left.clone();
                    } else {
                        break;
                    }
                }
                let tmp_val = tmp.unwrap().borrow().val;
                // 以遞迴刪除節點 tmp
                self.remove(tmp_val);
                // 用 tmp 的值覆寫 cur 的值
                cur.borrow_mut().val = tmp_val;
            }
        }
    }
}

/* 主程式 */
fn main() {
    /* 初始化二元搜尋樹 */
    let mut bst = BinarySearchTree::new();
    // 請留意，插入順序不同，建成的二元樹也可能不同。這組序列會建成一棵完美二元樹
    let nums = [8, 4, 12, 2, 6, 10, 14, 1, 3, 5, 7, 9, 11, 13, 15];
    for &num in &nums {
        bst.insert(num);
    }
    println!("\n初始化後的二元樹為\n");
    print_util::print_tree(bst.get_root().as_ref().unwrap());

    /* 搜尋節點 */
    let node = bst.search(7);
    println!(
        "\n找到的節點物件為 {:?}，節點值 = {}",
        node.clone().unwrap(),
        node.clone().unwrap().borrow().val
    );

    /* 插入節點 */
    bst.insert(16);
    println!("\n插入節點 16 後的二元樹為\n");
    print_util::print_tree(bst.get_root().as_ref().unwrap());

    /* 刪除節點 */
    bst.remove(1);
    println!("\n刪除節點 1 後的二元樹為\n");
    print_util::print_tree(bst.get_root().as_ref().unwrap());
    bst.remove(2);
    println!("\n刪除節點 2 後的二元樹為\n");
    print_util::print_tree(bst.get_root().as_ref().unwrap());
    bst.remove(4);
    println!("\n刪除節點 4 後的二元樹為\n");
    print_util::print_tree(bst.get_root().as_ref().unwrap());
}
