/*
 * File: array_binary_tree.rs
 * Created Time: 2023-07-25
 * Author: night-cruise (2586447362@qq.com)
 */

include!("../include/include.rs");

/* 数组表示下的二叉树类 */
struct ArrayBinaryTree {
    tree: Vec<Option<i32>>,
}

impl ArrayBinaryTree {
    /* 构造方法 */
    fn new(arr: Vec<Option<i32>>) -> Self {
        Self { tree: arr }
    }

    /* 列表容量 */
    fn size(&self) -> i32 {
        self.tree.len() as i32
    }

    /* 获取索引为 i 节点的值 */
    fn val(&self, i: i32) -> Option<i32> {
        // 若索引越界，则返回 None ，代表空位
        if i < 0 || i >= self.size() {
            None
        } else {
            self.tree[i as usize]
        }
    }

    /* 获取索引为 i 节点的左子节点的索引 */
    fn left(&self, i: i32) -> i32 {
        2 * i + 1
    }

    /* 获取索引为 i 节点的右子节点的索引 */
    fn right(&self, i: i32) -> i32 {
        2 * i + 2
    }

    /* 获取索引为 i 节点的父节点的索引 */
    fn parent(&self, i: i32) -> i32 {
        (i - 1) / 2
    }

    /* 层序遍历 */
    fn level_order(&self) -> Vec<i32> {
        let mut res = vec![];
        // 直接遍历数组
        for i in 0..self.size() {
            if let Some(val) = self.val(i) {
                res.push(val)
            }
        }
        res
    }

    /* 深度优先遍历 */
    fn dfs(&self, i: i32, order: &str, res: &mut Vec<i32>) {
        if self.val(i).is_none() {
            return;
        }
        let val = self.val(i).unwrap();
        // 前序遍历
        if order == "pre" {
            res.push(val);
        }
        self.dfs(self.left(i), order, res);
        // 中序遍历
        if order == "in" {
            res.push(val);
        }
        self.dfs(self.right(i), order, res);
        // 后序遍历
        if order == "post" {
            res.push(val);
        }
    }

    /* 前序遍历 */
    fn pre_order(&self) -> Vec<i32> {
        let mut res = vec![];
        self.dfs(0, "pre", &mut res);
        res
    }

    /* 中序遍历 */
    fn in_order(&self) -> Vec<i32> {
        let mut res = vec![];
        self.dfs(0, "in", &mut res);
        res
    }

    /* 后序遍历 */
    fn post_order(&self) -> Vec<i32> {
        let mut res = vec![];
        self.dfs(0, "post", &mut res);
        res
    }
}

/* Driver Code */
fn main() {
    // 初始化二叉树
    // 这里借助了一个从数组直接生成二叉树的函数
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
    println!("\n初始化二叉树\n");
    println!("二叉树的数组表示：");
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
    println!("二叉树的链表表示：");
    print_util::print_tree(&root);

    // 数组表示下的二叉树类
    let abt = ArrayBinaryTree::new(arr);

    // 访问节点
    let i = 1;
    let l = abt.left(i);
    let r = abt.right(i);
    let p = abt.parent(i);
    println!(
        "\n当前节点的索引为 {} ，值为 {}",
        i,
        if let Some(val) = abt.val(i) {
            format!("{val}")
        } else {
            "null".to_string()
        }
    );
    println!(
        "其左子节点的索引为 {} ，值为 {}",
        l,
        if let Some(val) = abt.val(l) {
            format!("{val}")
        } else {
            "null".to_string()
        }
    );
    println!(
        "其右子节点的索引为 {} ，值为 {}",
        r,
        if let Some(val) = abt.val(r) {
            format!("{val}")
        } else {
            "null".to_string()
        }
    );
    println!(
        "其父节点的索引为 {} ，值为 {}",
        p,
        if let Some(val) = abt.val(p) {
            format!("{val}")
        } else {
            "null".to_string()
        }
    );

    // 遍历树
    let mut res = abt.level_order();
    println!("\n层序遍历为：{:?}", res);
    res = abt.pre_order();
    println!("前序遍历为：{:?}", res);
    res = abt.in_order();
    println!("中序遍历为：{:?}", res);
    res = abt.post_order();
    println!("后序遍历为：{:?}", res);
}
