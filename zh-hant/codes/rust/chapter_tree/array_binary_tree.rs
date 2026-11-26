/*
 * File: array_binary_tree.rs
 * Created Time: 2023-07-25
 * Author: night-cruise (2586447362@qq.com)
 */

use hello_algo_rust::include::{print_util, tree_node};

/* 以陣列表示二元樹的類別 */
struct ArrayBinaryTree {
    tree: Vec<Option<i32>>,
}

impl ArrayBinaryTree {
    /* 建構方法 */
    fn new(arr: Vec<Option<i32>>) -> Self {
        Self { tree: arr }
    }

    /* 串列長度 */
    fn size(&self) -> i32 {
        self.tree.len() as i32
    }

    /* 取得索引 i 處的節點值 */
    fn val(&self, i: i32) -> Option<i32> {
        // 若索引超出範圍，回傳 None 表示空位
        if i < 0 || i >= self.size() {
            None
        } else {
            self.tree[i as usize]
        }
    }

    /* 取得索引 i 處節點的左子節點索引 */
    fn left(&self, i: i32) -> i32 {
        2 * i + 1
    }

    /* 取得索引 i 處節點的右子節點索引 */
    fn right(&self, i: i32) -> i32 {
        2 * i + 2
    }

    /* 取得索引 i 處節點的父節點索引 */
    fn parent(&self, i: i32) -> i32 {
        (i - 1) / 2
    }

    /* 層序走訪 */
    fn level_order(&self) -> Vec<i32> {
        self.tree.iter().filter_map(|&x| x).collect()
    }

    /* 深度優先走訪 */
    fn dfs(&self, i: i32, order: &'static str, res: &mut Vec<i32>) {
        if self.val(i).is_none() {
            return;
        }
        let val = self.val(i).unwrap();
        // 前序走訪
        if order == "pre" {
            res.push(val);
        }
        self.dfs(self.left(i), order, res);
        // 中序走訪
        if order == "in" {
            res.push(val);
        }
        self.dfs(self.right(i), order, res);
        // 後序走訪
        if order == "post" {
            res.push(val);
        }
    }

    /* 前序走訪 */
    fn pre_order(&self) -> Vec<i32> {
        let mut res = vec![];
        self.dfs(0, "pre", &mut res);
        res
    }

    /* 中序走訪 */
    fn in_order(&self) -> Vec<i32> {
        let mut res = vec![];
        self.dfs(0, "in", &mut res);
        res
    }

    /* 後序走訪 */
    fn post_order(&self) -> Vec<i32> {
        let mut res = vec![];
        self.dfs(0, "post", &mut res);
        res
    }
}

/* 主程式 */
fn main() {
    // 初始化二元樹
    // 這裡使用能從陣列直接建立二元樹的函式
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
    println!("\n初始化二元樹\n");
    println!("二元樹的陣列表示法：");
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
    println!("二元樹的鏈結串列表示法：");
    print_util::print_tree(&root);

    // 以陣列表示二元樹的類別
    let abt = ArrayBinaryTree::new(arr);

    // 存取節點
    let i = 1;
    let l = abt.left(i);
    let r = abt.right(i);
    let p = abt.parent(i);
    println!(
        "\n目前節點的索引為 {}，值為 {}",
        i,
        if let Some(val) = abt.val(i) {
            format!("{val}")
        } else {
            "null".to_string()
        }
    );
    println!(
        "其左子節點的索引為 {}，值為 {}",
        l,
        if let Some(val) = abt.val(l) {
            format!("{val}")
        } else {
            "null".to_string()
        }
    );
    println!(
        "其右子節點的索引為 {}，值為 {}",
        r,
        if let Some(val) = abt.val(r) {
            format!("{val}")
        } else {
            "null".to_string()
        }
    );
    println!(
        "其父節點的索引為 {}，值為 {}",
        p,
        if let Some(val) = abt.val(p) {
            format!("{val}")
        } else {
            "null".to_string()
        }
    );

    // 走訪樹
    let mut res = abt.level_order();
    println!("\n層序走訪的結果：{:?}", res);
    res = abt.pre_order();
    println!("前序走訪的結果：{:?}", res);
    res = abt.in_order();
    println!("中序走訪的結果：{:?}", res);
    res = abt.post_order();
    println!("後序走訪的結果：{:?}", res);
}
