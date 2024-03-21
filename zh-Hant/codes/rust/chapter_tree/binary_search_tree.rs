/*
 * File: binary_search_tree.rs
 * Created Time: 2023-04-20
 * Author: xBLACKICEx (xBLACKICE@outlook.com)、night-cruise (2586447362@qq.com)
 */

include!("../include/include.rs");

use std::cell::RefCell;
use std::cmp::Ordering;
use std::rc::Rc;

use tree_node::TreeNode;

type OptionTreeNodeRc = Option<Rc<RefCell<TreeNode>>>;

/* 二叉搜索树 */
pub struct BinarySearchTree {
    root: OptionTreeNodeRc,
}

impl BinarySearchTree {
    /* 构造方法 */
    pub fn new() -> Self {
        // 初始化空树
        Self { root: None }
    }

    /* 获取二叉树根节点 */
    pub fn get_root(&self) -> OptionTreeNodeRc {
        self.root.clone()
    }

    /* 查找节点 */
    pub fn search(&self, num: i32) -> OptionTreeNodeRc {
        let mut cur = self.root.clone();
        // 循环查找，越过叶节点后跳出
        while let Some(node) = cur.clone() {
            match num.cmp(&node.borrow().val) {
                // 目标节点在 cur 的右子树中
                Ordering::Greater => cur = node.borrow().right.clone(),
                // 目标节点在 cur 的左子树中
                Ordering::Less => cur = node.borrow().left.clone(),
                // 找到目标节点，跳出循环
                Ordering::Equal => break,
            }
        }

        // 返回目标节点
        cur
    }

    /* 插入节点 */
    pub fn insert(&mut self, num: i32) {
        // 若树为空，则初始化根节点
        if self.root.is_none() {
            self.root = Some(TreeNode::new(num));
            return;
        }
        let mut cur = self.root.clone();
        let mut pre = None;
        // 循环查找，越过叶节点后跳出
        while let Some(node) = cur.clone() {
            match num.cmp(&node.borrow().val) {
                // 找到重复节点，直接返回
                Ordering::Equal => return,
                // 插入位置在 cur 的右子树中
                Ordering::Greater => {
                    pre = cur.clone();
                    cur = node.borrow().right.clone();
                }
                // 插入位置在 cur 的左子树中
                Ordering::Less => {
                    pre = cur.clone();
                    cur = node.borrow().left.clone();
                }
            }
        }
        // 插入节点
        let pre = pre.unwrap();
        let node = Some(TreeNode::new(num));
        if num > pre.borrow().val {
            pre.borrow_mut().right = node;
        } else {
            pre.borrow_mut().left = node;
        }
    }

    /* 删除节点 */
    pub fn remove(&mut self, num: i32) {
        // 若树为空，直接提前返回
        if self.root.is_none() {
            return;
        }
        let mut cur = self.root.clone();
        let mut pre = None;
        // 循环查找，越过叶节点后跳出
        while let Some(node) = cur.clone() {
            match num.cmp(&node.borrow().val) {
                // 找到待删除节点，跳出循环
                Ordering::Equal => break,
                // 待删除节点在 cur 的右子树中
                Ordering::Greater => {
                    pre = cur.clone();
                    cur = node.borrow().right.clone();
                }
                // 待删除节点在 cur 的左子树中
                Ordering::Less => {
                    pre = cur.clone();
                    cur = node.borrow().left.clone();
                }
            }
        }
        // 若无待删除节点，则直接返回
        if cur.is_none() {
            return;
        }
        let cur = cur.unwrap();
        let (left_child, right_child) = (cur.borrow().left.clone(), cur.borrow().right.clone());
        match (left_child.clone(), right_child.clone()) {
            // 子节点数量 = 0 or 1
            (None, None) | (Some(_), None) | (None, Some(_)) => {
                // 当子节点数量 = 0 / 1 时， child = nullptr / 该子节点
                let child = left_child.or(right_child);
                let pre = pre.unwrap();
                // 删除节点 cur
                if !Rc::ptr_eq(&cur, self.root.as_ref().unwrap()) {
                    let left = pre.borrow().left.clone();
                    if left.is_some() && Rc::ptr_eq(&left.as_ref().unwrap(), &cur) {
                        pre.borrow_mut().left = child;
                    } else {
                        pre.borrow_mut().right = child;
                    }
                } else {
                    // 若删除节点为根节点，则重新指定根节点
                    self.root = child;
                }
            }
            // 子节点数量 = 2
            (Some(_), Some(_)) => {
                // 获取中序遍历中 cur 的下一个节点
                let mut tmp = cur.borrow().right.clone();
                while let Some(node) = tmp.clone() {
                    if node.borrow().left.is_some() {
                        tmp = node.borrow().left.clone();
                    } else {
                        break;
                    }
                }
                let tmpval = tmp.unwrap().borrow().val;
                // 递归删除节点 tmp
                self.remove(tmpval);
                // 用 tmp 覆盖 cur
                cur.borrow_mut().val = tmpval;
            }
        }
    }
}

/* Driver Code */
fn main() {
    /* 初始化二叉搜索树 */
    let mut bst = BinarySearchTree::new();
    // 请注意，不同的插入顺序会生成不同的二叉树，该序列可以生成一个完美二叉树
    let nums = [8, 4, 12, 2, 6, 10, 14, 1, 3, 5, 7, 9, 11, 13, 15];
    for &num in &nums {
        bst.insert(num);
    }
    println!("\n初始化的二叉树为\n");
    print_util::print_tree(bst.get_root().as_ref().unwrap());

    /* 查找结点 */
    let node = bst.search(7);
    println!(
        "\n查找到的节点对象为 {:?}，节点值 = {}",
        node.clone().unwrap(),
        node.clone().unwrap().borrow().val
    );

    /* 插入节点 */
    bst.insert(16);
    println!("\n插入节点 16 后，二叉树为\n");
    print_util::print_tree(bst.get_root().as_ref().unwrap());

    /* 删除节点 */
    bst.remove(1);
    println!("\n删除节点 1 后，二叉树为\n");
    print_util::print_tree(bst.get_root().as_ref().unwrap());
    bst.remove(2);
    println!("\n删除节点 2 后，二叉树为\n");
    print_util::print_tree(bst.get_root().as_ref().unwrap());
    bst.remove(4);
    println!("\n删除节点 4 后，二叉树为\n");
    print_util::print_tree(bst.get_root().as_ref().unwrap());
}
