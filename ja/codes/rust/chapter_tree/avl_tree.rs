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

    /* ノードの高さを取得 */
    fn height(node: OptionTreeNodeRc) -> i32 {
        // 空ノードの高さは -1、葉ノードの高さは 0
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
            // ノードの高さは最も高い部分木の高さ + 1 に等しい
            node.borrow_mut().height = std::cmp::max(Self::height(left), Self::height(right)) + 1;
        }
    }

    /* 平衡係数を取得 */
    fn balance_factor(node: OptionTreeNodeRc) -> i32 {
        match node {
            // 空ノードの平衡係数は 0
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
                // child を支点として node を右回転させる
                child.borrow_mut().right = Some(node.clone());
                node.borrow_mut().left = grand_child;
                // ノードの高さを更新する
                Self::update_height(Some(node));
                Self::update_height(Some(child.clone()));
                // 回転後の部分木の根ノードを返す
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
                // child を支点として node を左回転させる
                child.borrow_mut().left = Some(node.clone());
                node.borrow_mut().right = grand_child;
                // ノードの高さを更新する
                Self::update_height(Some(node));
                Self::update_height(Some(child.clone()));
                // 回転後の部分木の根ノードを返す
                Some(child)
            }
            None => None,
        }
    }

    /* 回転操作を行い、この部分木の平衡を回復する */
    fn rotate(node: OptionTreeNodeRc) -> OptionTreeNodeRc {
        // ノード node の平衡係数を取得
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
            // 平衡木なので回転不要、そのまま返す
            node
        }
    }

    /* ノードを挿入 */
    fn insert(&mut self, val: i32) {
        self.root = Self::insert_helper(self.root.clone(), val);
    }

    /* ノードを再帰的に挿入する（補助メソッド） */
    fn insert_helper(node: OptionTreeNodeRc, val: i32) -> OptionTreeNodeRc {
        match node {
            Some(mut node) => {
                /* 1. 挿入位置を探索してノードを挿入 */
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
                        return Some(node); // 重複ノードは挿入せず、そのまま返す
                    }
                }
                Self::update_height(Some(node.clone())); // ノードの高さを更新する

                /* 2. 回転操作を行い、部分木の平衡を回復する */
                node = Self::rotate(Some(node)).unwrap();
                // 部分木の根ノードを返す
                Some(node)
            }
            None => Some(TreeNode::new(val)),
        }
    }

    /* ノードを削除 */
    fn remove(&self, val: i32) {
        Self::remove_helper(self.root.clone(), val);
    }

    /* ノードを再帰的に削除する（補助メソッド） */
    fn remove_helper(node: OptionTreeNodeRc, val: i32) -> OptionTreeNodeRc {
        match node {
            Some(mut node) => {
                /* 1. ノードを探索して削除 */
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
                        // 子ノード数 = 0 の場合、node をそのまま削除して返す
                        None => {
                            return None;
                        }
                        // 子ノード数 = 1 の場合、node をそのまま削除する
                        Some(child) => node = child,
                    }
                } else {
                    // 子ノード数 = 2 の場合、中順走査の次のノードを削除し、そのノードで現在のノードを置き換える
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

                /* 2. 回転操作を行い、部分木の平衡を回復する */
                node = Self::rotate(Some(node)).unwrap();
                // 部分木の根ノードを返す
                Some(node)
            }
            None => None,
        }
    }

    /* ノードを探索 */
    fn search(&self, val: i32) -> OptionTreeNodeRc {
        let mut cur = self.root.clone();
        // ループで探索し、葉ノードを越えたら抜ける
        while let Some(current) = cur.clone() {
            match current.borrow().val.cmp(&val) {
                // 目標ノードは cur の右部分木にある
                Ordering::Less => {
                    cur = current.borrow().right.clone();
                }
                // 目標ノードは cur の左部分木にある
                Ordering::Greater => {
                    cur = current.borrow().left.clone();
                }
                // 目標ノードが見つかったらループを抜ける
                Ordering::Equal => {
                    break;
                }
            }
        }
        // 目標ノードを返す
        cur
    }
}

/* Driver Code */
fn main() {
    fn test_insert(tree: &mut AVLTree, val: i32) {
        tree.insert(val);
        println!("\nノード {} を挿入した後、AVL 木は", val);
        print_util::print_tree(&tree.root.clone().unwrap());
    }

    fn test_remove(tree: &mut AVLTree, val: i32) {
        tree.remove(val);
        println!("\nノード {} を削除した後、AVL 木は", val);
        print_util::print_tree(&tree.root.clone().unwrap());
    }

    /* 空の AVL 木を初期化する */
    let mut avl_tree = AVLTree::new();

    /* ノードを挿入 */
    // ノード挿入後に AVL 木がどのように平衡を保つかに注目してほしい
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

    /* 重複ノードを挿入する */
    test_insert(&mut avl_tree, 7);

    /* ノードを削除 */
    // ノード削除後に AVL 木がどのように平衡を保つかに注目してほしい
    test_remove(&mut avl_tree, 8); // 次数 0 のノードを削除する
    test_remove(&mut avl_tree, 5); // 次数 1 のノードを削除する
    test_remove(&mut avl_tree, 4); // 次数 2 のノードを削除する

    /* ノードを検索 */
    let node = avl_tree.search(7);
    if let Some(node) = node {
        println!(
            "\n見つかったノードオブジェクトは {:?}、ノードの値 = {}",
            &*node.borrow(),
            node.borrow().val
        );
    }
}
