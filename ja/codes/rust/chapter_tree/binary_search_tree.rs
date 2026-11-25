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

    /* 二分木の根を取得する */
    pub fn get_root(&self) -> OptionTreeNodeRc {
        self.root.clone()
    }

    /* ノードを探索する */
    pub fn search(&self, num: i32) -> OptionTreeNodeRc {
        let mut cur = self.root.clone();
        // ループで探索し、葉を越えたら終了する
        while let Some(node) = cur.clone() {
            match num.cmp(&node.borrow().val) {
                // 目的のノードは cur の右部分木にある
                Ordering::Greater => cur = node.borrow().right.clone(),
                // 目的のノードは cur の左部分木にある
                Ordering::Less => cur = node.borrow().left.clone(),
                // 目的のノードが見つかったのでループを抜ける
                Ordering::Equal => break,
            }
        }

        // 目的のノードを返す
        cur
    }

    /* ノードを挿入する */
    pub fn insert(&mut self, num: i32) {
        // 木が空なら根を初期化する
        if self.root.is_none() {
            self.root = Some(TreeNode::new(num));
            return;
        }
        let mut cur = self.root.clone();
        let mut pre = None;
        // ループで探索し、葉を越えたら終了する
        while let Some(node) = cur.clone() {
            match num.cmp(&node.borrow().val) {
                // 値が重複するノードが見つかったらそのまま戻る
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
        // ノードを挿入する
        let pre = pre.unwrap();
        let node = Some(TreeNode::new(num));
        if num > pre.borrow().val {
            pre.borrow_mut().right = node;
        } else {
            pre.borrow_mut().left = node;
        }
    }

    /* ノードを削除する */
    pub fn remove(&mut self, num: i32) {
        // 木が空ならすぐに戻る
        if self.root.is_none() {
            return;
        }
        let mut cur = self.root.clone();
        let mut pre = None;
        // ループで探索し、葉を越えたら終了する
        while let Some(node) = cur.clone() {
            match num.cmp(&node.borrow().val) {
                // 削除対象のノードが見つかったのでループを抜ける
                Ordering::Equal => break,
                // 削除対象は cur の右部分木にある
                Ordering::Greater => {
                    pre = cur.clone();
                    cur = node.borrow().right.clone();
                }
                // 削除対象は cur の左部分木にある
                Ordering::Less => {
                    pre = cur.clone();
                    cur = node.borrow().left.clone();
                }
            }
        }
        // 削除対象が見つからなければそのまま戻る
        if cur.is_none() {
            return;
        }
        let cur = cur.unwrap();
        let (left_child, right_child) = (cur.borrow().left.clone(), cur.borrow().right.clone());
        match (left_child.clone(), right_child.clone()) {
            // 子が 0 個または 1 個
            (None, None) | (Some(_), None) | (None, Some(_)) => {
                // 子が 0 個なら child = nullptr、1 個なら child はその子
                let child = left_child.or(right_child);
                // ノード cur を削除する
                if !Rc::ptr_eq(&cur, self.root.as_ref().unwrap()) {
                    let pre = pre.unwrap();
                    let left = pre.borrow().left.clone();
                    if left.is_some() && Rc::ptr_eq(left.as_ref().unwrap(), &cur) {
                        pre.borrow_mut().left = child;
                    } else {
                        pre.borrow_mut().right = child;
                    }
                } else {
                    // 削除対象が根なら根を設定し直す
                    self.root = child;
                }
            }
            // 子が 2 個
            (Some(_), Some(_)) => {
                // 通りがけ順で cur の次に来るノードを取得する
                let mut tmp = cur.borrow().right.clone();
                while let Some(node) = tmp.clone() {
                    if node.borrow().left.is_some() {
                        tmp = node.borrow().left.clone();
                    } else {
                        break;
                    }
                }
                let tmp_val = tmp.unwrap().borrow().val;
                // ノード tmp を再帰的に削除する
                self.remove(tmp_val);
                // tmp の値で cur の値を上書きする
                cur.borrow_mut().val = tmp_val;
            }
        }
    }
}

/* 実行例 */
fn main() {
    /* 二分探索木を初期化する */
    let mut bst = BinarySearchTree::new();
    // 挿入順によって木の形は変わる。この順に挿入すると完璧二分木になる
    let nums = [8, 4, 12, 2, 6, 10, 14, 1, 3, 5, 7, 9, 11, 13, 15];
    for &num in &nums {
        bst.insert(num);
    }
    println!("\n初期化した二分木：\n");
    print_util::print_tree(bst.get_root().as_ref().unwrap());

    /* ノードを探索する */
    let node = bst.search(7);
    println!(
        "\n見つかったノードのオブジェクト：{:?}、値 = {}",
        node.clone().unwrap(),
        node.clone().unwrap().borrow().val
    );

    /* ノードを挿入する */
    bst.insert(16);
    println!("\nノード 16 を挿入した後の二分木：\n");
    print_util::print_tree(bst.get_root().as_ref().unwrap());

    /* ノードを削除する */
    bst.remove(1);
    println!("\nノード 1 を削除した後の二分木：\n");
    print_util::print_tree(bst.get_root().as_ref().unwrap());
    bst.remove(2);
    println!("\nノード 2 を削除した後の二分木：\n");
    print_util::print_tree(bst.get_root().as_ref().unwrap());
    bst.remove(4);
    println!("\nノード 4 を削除した後の二分木：\n");
    print_util::print_tree(bst.get_root().as_ref().unwrap());
}
