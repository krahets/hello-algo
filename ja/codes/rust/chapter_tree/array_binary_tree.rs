/*
 * File: array_binary_tree.rs
 * Created Time: 2023-07-25
 * Author: night-cruise (2586447362@qq.com)
 */

use hello_algo_rust::include::{print_util, tree_node};

/* 配列で表した二分木クラス */
struct ArrayBinaryTree {
    tree: Vec<Option<i32>>,
}

impl ArrayBinaryTree {
    /* コンストラクタ */
    fn new(arr: Vec<Option<i32>>) -> Self {
        Self { tree: arr }
    }

    /* リストの容量 */
    fn size(&self) -> i32 {
        self.tree.len() as i32
    }

    /* インデックス i のノードの値を取得する */
    fn val(&self, i: i32) -> Option<i32> {
        // インデックスが範囲外の場合、空きを表す None を返す
        if i < 0 || i >= self.size() {
            None
        } else {
            self.tree[i as usize]
        }
    }

    /* インデックス i のノードの左の子ノードのインデックスを取得する */
    fn left(&self, i: i32) -> i32 {
        2 * i + 1
    }

    /* インデックス i のノードの右の子ノードのインデックスを取得する */
    fn right(&self, i: i32) -> i32 {
        2 * i + 2
    }

    /* インデックス i のノードの親ノードのインデックスを取得する */
    fn parent(&self, i: i32) -> i32 {
        (i - 1) / 2
    }

    /* レベル順走査 */
    fn level_order(&self) -> Vec<i32> {
        self.tree.iter().filter_map(|&x| x).collect()
    }

    /* 深さ優先走査 */
    fn dfs(&self, i: i32, order: &'static str, res: &mut Vec<i32>) {
        if self.val(i).is_none() {
            return;
        }
        let val = self.val(i).unwrap();
        // 行きがけ順走査
        if order == "pre" {
            res.push(val);
        }
        self.dfs(self.left(i), order, res);
        // 通りがけ順走査
        if order == "in" {
            res.push(val);
        }
        self.dfs(self.right(i), order, res);
        // 帰りがけ順走査
        if order == "post" {
            res.push(val);
        }
    }

    /* 行きがけ順走査 */
    fn pre_order(&self) -> Vec<i32> {
        let mut res = vec![];
        self.dfs(0, "pre", &mut res);
        res
    }

    /* 通りがけ順走査 */
    fn in_order(&self) -> Vec<i32> {
        let mut res = vec![];
        self.dfs(0, "in", &mut res);
        res
    }

    /* 帰りがけ順走査 */
    fn post_order(&self) -> Vec<i32> {
        let mut res = vec![];
        self.dfs(0, "post", &mut res);
        res
    }
}

/* 実行用コード */
fn main() {
    // 二分木を初期化する
    // ここでは配列から二分木を直接生成する関数を使う
    let arr = vec![
        Some(1),
        Some(2),
        Some(3),
        Some(4),
        None,
        Some(6),
        Some(7),
        Some(8),
        Some(9),
        None,
        None,
        Some(12),
        None,
        None,
        Some(15),
    ];

    let root = tree_node::vec_to_tree(arr.clone()).unwrap();
    println!("\n二分木を初期化する\n");
    println!("二分木の配列表現：");
    println!(
        "[{}]",
        arr.iter()
            .map(|&val| if let Some(val) = val {
                format!("{val}")
            } else {
                "null".to_string()
            })
            .collect::<Vec<String>>()
            .join(", ")
    );
    println!("二分木の連結リスト表現：");
    print_util::print_tree(&root);

    // 配列で表した二分木クラス
    let abt = ArrayBinaryTree::new(arr);

    // ノードにアクセスする
    let i = 1;
    let l = abt.left(i);
    let r = abt.right(i);
    let p = abt.parent(i);
    println!(
        "\n現在のノードのインデックスは {} 、値は {}",
        i,
        if let Some(val) = abt.val(i) {
            format!("{val}")
        } else {
            "null".to_string()
        }
    );
    println!(
        "左の子ノードのインデックスは {} 、値は {}",
        l,
        if let Some(val) = abt.val(l) {
            format!("{val}")
        } else {
            "null".to_string()
        }
    );
    println!(
        "右の子ノードのインデックスは {} 、値は {}",
        r,
        if let Some(val) = abt.val(r) {
            format!("{val}")
        } else {
            "null".to_string()
        }
    );
    println!(
        "親ノードのインデックスは {} 、値は {}",
        p,
        if let Some(val) = abt.val(p) {
            format!("{val}")
        } else {
            "null".to_string()
        }
    );

    // 木を走査する
    let mut res = abt.level_order();
    println!("\nレベル順走査：{:?}", res);
    res = abt.pre_order();
    println!("行きがけ順走査：{:?}", res);
    res = abt.in_order();
    println!("通りがけ順走査：{:?}", res);
    res = abt.post_order();
    println!("帰りがけ順走査：{:?}", res);
}
