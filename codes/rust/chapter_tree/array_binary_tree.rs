/*
 * File: array_binary_tree.rs
 * Created Time: 2023-07-25
 * Author: night-cruise (2586447362@qq.com)
 */

// TreeLink 不推荐在示例中直接使用，原因请参考维护指南
use hello_algo_rust::binary_tree::{BinaryTree, TreeLink};
use std::borrow::Cow;

/* 数组表示下的二叉树类 */
pub struct ArrayBinaryTree {
    tree: Vec<Option<i32>>,
}

#[derive(Clone, Copy)]
enum Order {
    Pre,
    In,
    Post,
}

impl ArrayBinaryTree {
    /* 构造方法 */
    pub fn new(arr: Vec<Option<i32>>) -> Self {
        Self { tree: arr }
    }

    /* 列表容量 */
    pub fn size(&self) -> usize {
        self.tree.len()
    }

    /* 获取索引为 i 节点的值 */
    pub fn val(&self, i: usize) -> Option<i32> {
        // 若索引越界，则返回 None ，代表空位
        if i >= self.size() { None } else { self.tree[i] }
    }

    /* 获取索引为 i 节点的左子节点的索引 */
    pub fn left(&self, i: usize) -> usize {
        2 * i + 1
    }

    /* 获取索引为 i 节点的右子节点的索引 */
    pub fn right(&self, i: usize) -> usize {
        2 * i + 2
    }

    /* 获取索引为 i 节点的父节点的索引 */
    pub fn parent(&self, i: usize) -> usize {
        (i - 1) / 2
    }

    /* 层序遍历 */
    pub fn level_order(&self) -> Vec<i32> {
        self.tree.iter().filter_map(|x| *x).collect()
    }

    /* 深度优先遍历 */
    fn dfs(&self, i: usize, order: Order, res: &mut Vec<i32>) {
        let Some(val) = self.val(i) else {
            return;
        };

        match order {
            // 前序遍历
            Order::Pre => {
                res.push(val);
                self.dfs(self.left(i), order, res);
                self.dfs(self.right(i), order, res);
            }

            // 中序遍历
            Order::In => {
                self.dfs(self.left(i), order, res);
                res.push(val);
                self.dfs(self.right(i), order, res);
            }

            // 后序遍历
            Order::Post => {
                self.dfs(self.left(i), order, res);
                self.dfs(self.right(i), order, res);
                res.push(val);
            }
        }
    }

    /* 前序遍历 */
    pub fn pre_order(&self) -> Vec<i32> {
        let mut res = vec![];
        self.dfs(0, Order::Pre, &mut res);
        res
    }

    /* 中序遍历 */
    pub fn in_order(&self) -> Vec<i32> {
        let mut res = vec![];
        self.dfs(0, Order::In, &mut res);
        res
    }

    /* 后序遍历 */
    pub fn post_order(&self) -> Vec<i32> {
        let mut res = vec![];
        self.dfs(0, Order::Post, &mut res);
        res
    }
}

/* Driver Code */
fn main() {
    // 初始化二叉树
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

    let root = TreeLink::try_from_slice(&arr).ok();

    fn repr(val: &Option<i32>) -> Cow<'static, str> {
        if let Some(v) = val {
            Cow::Owned(v.to_string())
        } else {
            Cow::Borrowed("null")
        }
    }

    println!("初始化二叉树");
    println!("二叉树的数组表示：");
    println!("[{}]", arr.iter().map(repr).collect::<Vec<_>>().join(", "));
    println!("二叉树的链表表示：");
    println!("{}", root.display());

    // 数组表示下的二叉树类
    let abt = ArrayBinaryTree::new(arr);

    // 访问节点
    let i = 1;
    let l = abt.left(i);
    let r = abt.right(i);
    let p = abt.parent(i);
    println!("当前节点的索引为 {i} ，值为 {}", repr(&abt.val(i)));
    println!("其左子节点的索引为 {l} ，值为 {}", repr(&abt.val(l)));
    println!("其右子节点的索引为 {r} ，值为 {}", repr(&abt.val(r)));
    println!("其父节点的索引为 {p} ，值为 {}", repr(&abt.val(p)));
    println!();

    // 遍历树
    println!("层序遍历为：{:?}", abt.level_order());
    println!("前序遍历为：{:?}", abt.pre_order());
    println!("中序遍历为：{:?}", abt.in_order());
    println!("后序遍历为：{:?}", abt.post_order());
}
