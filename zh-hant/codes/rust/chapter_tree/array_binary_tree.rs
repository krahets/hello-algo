/*
 * File: array_binary_tree.rs
 * Created Time: 2023-07-25
 * Author: night-cruise (2586447362@qq.com)
 */

use hello_algo_rust::include::{print_util, tree_node};

/* 陣列表示下的二元樹類別 */
struct ArrayBinaryTree {
    tree: Vec<Option<i32>>,
}

impl ArrayBinaryTree {
    /* 建構子 */
    fn new(arr: Vec<Option<i32>>) -> Self {
        Self { tree: arr }
    }

    /* 串列容量 */
    fn size(&self) -> i32 {
        self.tree.len() as i32
    }

    /* 獲取索引為 i 節點的值 */
    fn val(&self, i: i32) -> Option<i32> {
        // 若索引越界，則返回 None ，代表空位
        if i < 0 || i >= self.size() {
            None
        } else {
            self.tree[i as usize]
        }
    }

    /* 獲取索引為 i 節點的左子節點的索引 */
    fn left(&self, i: i32) -> i32 {
        2 * i + 1
    }

    /* 獲取索引為 i 節點的右子節點的索引 */
    fn right(&self, i: i32) -> i32 {
        2 * i + 2
    }

    /* 獲取索引為 i 節點的父節點的索引 */
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

/* Driver Code */
fn main() {
    // 初始化二元樹
    // 這裡藉助了一個從陣列直接生成二元樹的函式
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
    println!("二元樹的陣列表示：");
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
    println!("二元樹的鏈結串列表示：");
    print_util::print_tree(&root);

    // 陣列表示下的二元樹類別
    let abt = ArrayBinaryTree::new(arr);

    // 訪問節點
    let i = 1;
    let l = abt.left(i);
    let r = abt.right(i);
    let p = abt.parent(i);
    println!(
        "\n當前節點的索引為 {} ，值為 {}",
        i,
        if let Some(val) = abt.val(i) {
            format!("{val}")
        } else {
            "null".to_string()
        }
    );
    println!(
        "其左子節點的索引為 {} ，值為 {}",
        l,
        if let Some(val) = abt.val(l) {
            format!("{val}")
        } else {
            "null".to_string()
        }
    );
    println!(
        "其右子節點的索引為 {} ，值為 {}",
        r,
        if let Some(val) = abt.val(r) {
            format!("{val}")
        } else {
            "null".to_string()
        }
    );
    println!(
        "其父節點的索引為 {} ，值為 {}",
        p,
        if let Some(val) = abt.val(p) {
            format!("{val}")
        } else {
            "null".to_string()
        }
    );

    // 走訪樹
    let mut res = abt.level_order();
    println!("\n層序走訪為：{:?}", res);
    res = abt.pre_order();
    println!("前序走訪為：{:?}", res);
    res = abt.in_order();
    println!("中序走訪為：{:?}", res);
    res = abt.post_order();
    println!("後序走訪為：{:?}", res);
}
