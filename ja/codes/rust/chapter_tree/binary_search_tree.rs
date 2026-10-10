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

/* 二分探索木 */
pub struct BinarySearchTree {
    root: OptionTreeNodeRc,
}

impl BinarySearchTree {
    /* コンストラクタ */
    pub fn new() -> Self {
        // 空の木を初期化する
        Self { root: None }
    }

    /* 二分木の根ノードを取得 */
    pub fn get_root(&self) -> OptionTreeNodeRc {
        self.root.clone()
    }

    /* ノードを探索 */
    pub fn search(&self, num: i32) -> OptionTreeNodeRc {
        let mut cur = self.root.clone();
        // ループで探索し、葉ノードを越えたら抜ける
        while let Some(node) = cur.clone() {
            match num.cmp(&node.borrow().val) {
                // 目標ノードは cur の右部分木にある
                Ordering::Greater => cur = node.borrow().right.clone(),
                // 目標ノードは cur の左部分木にある
                Ordering::Less => cur = node.borrow().left.clone(),
                // 目標ノードが見つかったらループを抜ける
                Ordering::Equal => break,
            }
        }

        // 目標ノードを返す
        cur
    }

    /* ノードを挿入 */
    pub fn insert(&mut self, num: i32) {
        // 木が空なら、根ノードを初期化する
        if self.root.is_none() {
            self.root = Some(TreeNode::new(num));
            return;
        }
        let mut cur = self.root.clone();
        let mut pre = None;
        // ループで探索し、葉ノードを越えたら抜ける
        while let Some(node) = cur.clone() {
            match num.cmp(&node.borrow().val) {
                // 重複ノードが見つかったら、直ちに返す
                Ordering::Equal => return,
                // 挿入位置は cur の右部分木にある
                Ordering::Greater => {
                    pre = cur.clone();
                    cur = node.borrow().right.clone();
                }
                // 挿入位置は cur の左部分木にある
                Ordering::Less => {
                    pre = cur.clone();
                    cur = node.borrow().left.clone();
                }
            }
        }
        // ノードを挿入
        let pre = pre.unwrap();
        let node = Some(TreeNode::new(num));
        if num > pre.borrow().val {
            pre.borrow_mut().right = node;
        } else {
            pre.borrow_mut().left = node;
        }
    }

    /* ノードを削除 */
    pub fn remove(&mut self, num: i32) {
        // 木が空なら、そのまま早期リターンする
        if self.root.is_none() {
            return;
        }
        let mut cur = self.root.clone();
        let mut pre = None;
        // ループで探索し、葉ノードを越えたら抜ける
        while let Some(node) = cur.clone() {
            match num.cmp(&node.borrow().val) {
                // 削除対象のノードが見つかったら、ループを抜ける
                Ordering::Equal => break,
                // 削除対象ノードは cur の右部分木にある
                Ordering::Greater => {
                    pre = cur.clone();
                    cur = node.borrow().right.clone();
                }
                // 削除対象ノードは cur の左部分木にある
                Ordering::Less => {
                    pre = cur.clone();
                    cur = node.borrow().left.clone();
                }
            }
        }
        // 削除対象ノードがなければそのまま返す
        if cur.is_none() {
            return;
        }
        let cur = cur.unwrap();
        let (left_child, right_child) = (cur.borrow().left.clone(), cur.borrow().right.clone());
        match (left_child.clone(), right_child.clone()) {
            // 子ノード数 = 0 or 1
            (None, None) | (Some(_), None) | (None, Some(_)) => {
                // 子ノード数 = 0 / 1 のとき、child = nullptr / その子ノード
                let child = left_child.or(right_child);
                let pre = pre.unwrap();
                // ノード cur を削除する
                if !Rc::ptr_eq(&cur, self.root.as_ref().unwrap()) {
                    let left = pre.borrow().left.clone();
                    if left.is_some() && Rc::ptr_eq(left.as_ref().unwrap(), &cur) {
                        pre.borrow_mut().left = child;
                    } else {
                        pre.borrow_mut().right = child;
                    }
                } else {
                    // 削除ノードが根ノードなら、根ノードを再設定
                    self.root = child;
                }
            }
            // 子ノード数 = 2
            (Some(_), Some(_)) => {
                // 中順走査における cur の次ノードを取得
                let mut tmp = cur.borrow().right.clone();
                while let Some(node) = tmp.clone() {
                    if node.borrow().left.is_some() {
                        tmp = node.borrow().left.clone();
                    } else {
                        break;
                    }
                }
                let tmp_val = tmp.unwrap().borrow().val;
                // ノード tmp を再帰的に削除
                self.remove(tmp_val);
                // tmp で cur を上書きする
                cur.borrow_mut().val = tmp_val;
            }
        }
    }
}

/* Driver Code */
fn main() {
    /* 二分探索木を初期化 */
    let mut bst = BinarySearchTree::new();
    // 注意：挿入順序が異なると異なる二分木が生成される。このシーケンスからは完全二分木を生成できる
    let nums = [8, 4, 12, 2, 6, 10, 14, 1, 3, 5, 7, 9, 11, 13, 15];
    for &num in &nums {
        bst.insert(num);
    }
    println!("\n初期化した二分木は\n");
    print_util::print_tree(bst.get_root().as_ref().unwrap());

    /* ノードを検索 */
    let node = bst.search(7);
    println!(
        "\n見つかったノードオブジェクトは {:?}、ノードの値 = {}",
        node.clone().unwrap(),
        node.clone().unwrap().borrow().val
    );

    /* ノードを挿入 */
    bst.insert(16);
    println!("\nノード 16 を挿入した後、二分木は\n");
    print_util::print_tree(bst.get_root().as_ref().unwrap());

    /* ノードを削除 */
    bst.remove(1);
    println!("\nノード 1 を削除した後、二分木は\n");
    print_util::print_tree(bst.get_root().as_ref().unwrap());
    bst.remove(2);
    println!("\nノード 2 を削除した後、二分木は\n");
    print_util::print_tree(bst.get_root().as_ref().unwrap());
    bst.remove(4);
    println!("\nノード 4 を削除した後、二分木は\n");
    print_util::print_tree(bst.get_root().as_ref().unwrap());
}
