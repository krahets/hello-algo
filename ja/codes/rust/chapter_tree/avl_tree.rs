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

/* AVL 木 */
struct AVLTree {
    root: OptionTreeNodeRc, // 根ノード
}

impl AVLTree {
    /* コンストラクタ */
    fn new() -> Self {
        Self { root: None }
    }

    /* ノードの高さを取得する */
    fn height(node: OptionTreeNodeRc) -> i32 {
        // 空のノードの高さは -1、葉の高さは 0
        match node {
            Some(node) => node.borrow().height,
            None => -1,
        }
    }

    /* ノードの高さを更新する */
    fn update_height(node: OptionTreeNodeRc) {
        if let Some(node) = node {
            let left = node.borrow().left.clone();
            let right = node.borrow().right.clone();
            // ノードの高さは、左右の部分木の高さの最大値 + 1
            node.borrow_mut().height = std::cmp::max(Self::height(left), Self::height(right)) + 1;
        }
    }

    /* 平衡係数を取得する */
    fn balance_factor(node: OptionTreeNodeRc) -> i32 {
        match node {
            // 空のノードの平衡係数は 0
            None => 0,
            // ノードの平衡係数 = 左部分木の高さ - 右部分木の高さ
            Some(node) => {
                Self::height(node.borrow().left.clone()) - Self::height(node.borrow().right.clone())
            }
        }
    }

    /* 右回転 */
    fn right_rotate(node: OptionTreeNodeRc) -> OptionTreeNodeRc {
        match node {
            Some(node) => {
                let child = node.borrow().left.clone().unwrap();
                let grand_child = child.borrow().right.clone();
                // child を軸に node を右回転する
                child.borrow_mut().right = Some(node.clone());
                node.borrow_mut().left = grand_child;
                // ノードの高さを更新する
                Self::update_height(Some(node));
                Self::update_height(Some(child.clone()));
                // 回転後の部分木の根を返す
                Some(child)
            }
            None => None,
        }
    }

    /* 左回転 */
    fn left_rotate(node: OptionTreeNodeRc) -> OptionTreeNodeRc {
        match node {
            Some(node) => {
                let child = node.borrow().right.clone().unwrap();
                let grand_child = child.borrow().left.clone();
                // child を軸に node を左回転する
                child.borrow_mut().left = Some(node.clone());
                node.borrow_mut().right = grand_child;
                // ノードの高さを更新する
                Self::update_height(Some(node));
                Self::update_height(Some(child.clone()));
                // 回転後の部分木の根を返す
                Some(child)
            }
            None => None,
        }
    }

    /* 回転して部分木の平衡を回復する */
    fn rotate(node: OptionTreeNodeRc) -> OptionTreeNodeRc {
        // ノード node の平衡係数を取得する
        let balance_factor = Self::balance_factor(node.clone());
        // 左に偏った木
        if balance_factor > 1 {
            let node = node.unwrap();
            if Self::balance_factor(node.borrow().left.clone()) >= 0 {
                // 右回転
                Self::right_rotate(Some(node))
            } else {
                // 左回転してから右回転
                let left = node.borrow().left.clone();
                node.borrow_mut().left = Self::left_rotate(left);
                Self::right_rotate(Some(node))
            }
        }
        // 右に偏った木
        else if balance_factor < -1 {
            let node = node.unwrap();
            if Self::balance_factor(node.borrow().right.clone()) <= 0 {
                // 左回転
                Self::left_rotate(Some(node))
            } else {
                // 右回転してから左回転
                let right = node.borrow().right.clone();
                node.borrow_mut().right = Self::right_rotate(right);
                Self::left_rotate(Some(node))
            }
        } else {
            // 平衡なので回転せずに戻る
            node
        }
    }

    /* ノードを挿入する */
    fn insert(&mut self, val: i32) {
        self.root = Self::insert_helper(self.root.clone(), val);
    }

    /* 再帰によるノードの挿入（補助メソッド） */
    fn insert_helper(node: OptionTreeNodeRc, val: i32) -> OptionTreeNodeRc {
        match node {
            Some(mut node) => {
                /* 1. 挿入位置を探してノードを挿入する */
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
                        return Some(node); // 値が重複する場合は挿入せずに戻る
                    }
                }
                Self::update_height(Some(node.clone())); // ノードの高さを更新する

                /* 2. 回転して部分木の平衡を回復する */
                node = Self::rotate(Some(node)).unwrap();
                // 部分木の根を返す
                Some(node)
            }
            None => Some(TreeNode::new(val)),
        }
    }

    /* ノードを削除する */
    fn remove(&self, val: i32) {
        Self::remove_helper(self.root.clone(), val);
    }

    /* 再帰によるノードの削除（補助メソッド） */
    fn remove_helper(node: OptionTreeNodeRc, val: i32) -> OptionTreeNodeRc {
        match node {
            Some(mut node) => {
                /* 1. ノードを探して削除する */
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
                        // 子が 0 個なら node を削除して戻る
                        None => {
                            return None;
                        }
                        // 子が 1 個なら node を削除する
                        Some(child) => node = child,
                    }
                } else {
                    // 子が 2 個なら通りがけ順で次のノードを削除し、その値で現在のノードの値を置き換える
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
                Self::update_height(Some(node.clone())); // ノードの高さを更新する

                /* 2. 回転して部分木の平衡を回復する */
                node = Self::rotate(Some(node)).unwrap();
                // 部分木の根を返す
                Some(node)
            }
            None => None,
        }
    }

    /* ノードを探索する */
    fn search(&self, val: i32) -> OptionTreeNodeRc {
        let mut cur = self.root.clone();
        // ループで探索し、葉を越えたら終了する
        while let Some(current) = cur.clone() {
            match current.borrow().val.cmp(&val) {
                // 目的のノードは cur の右部分木にある
                Ordering::Less => {
                    cur = current.borrow().right.clone();
                }
                // 目的のノードは cur の左部分木にある
                Ordering::Greater => {
                    cur = current.borrow().left.clone();
                }
                // 目的のノードが見つかったのでループを抜ける
                Ordering::Equal => {
                    break;
                }
            }
        }
        // 目的のノードを返す
        cur
    }
}

/* 実行例 */
fn main() {
    fn test_insert(tree: &mut AVLTree, val: i32) {
        tree.insert(val);
        println!("\nノード {} を挿入した後の AVL 木：", val);
        print_util::print_tree(&tree.root.clone().unwrap());
    }

    fn test_remove(tree: &mut AVLTree, val: i32) {
        tree.remove(val);
        println!("\nノード {} を削除した後の AVL 木：", val);
        print_util::print_tree(&tree.root.clone().unwrap());
    }

    /* 空の AVL 木を初期化する */
    let mut avl_tree = AVLTree::new();

    /* ノードを挿入する */
    // 挿入後に AVL 木がどのように平衡を保つかに注目
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

    /* 重複するノードを挿入する */
    test_insert(&mut avl_tree, 7);

    /* ノードを削除する */
    // 削除後に AVL 木がどのように平衡を保つかに注目
    test_remove(&mut avl_tree, 8); // 子が 0 個のノードを削除する
    test_remove(&mut avl_tree, 5); // 子が 1 個のノードを削除する
    test_remove(&mut avl_tree, 4); // 子が 2 個のノードを削除する

    /* ノードを検索する */
    let node = avl_tree.search(7);
    if let Some(node) = node {
        println!(
            "\n見つかったノードのオブジェクト：{:?}、値 = {}",
            &*node.borrow(),
            node.borrow().val
        );
    }
}
