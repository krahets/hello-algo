/*
 * File: binary_search_tree.rs
 * Created Time: 2023-04-20
 * Author: xBLACKICEx (xBLACKICE@outlook.com)、night-cruise (2586447362@qq.com)
 */

use hello_algo_rust::binary_tree::BinaryTree;
use std::cell::RefCell;
use std::cmp::Ordering;
use std::rc::Rc;

pub type TreeNode = hello_algo_rust::binary_tree::TreeNode<i32>;

/* 二叉搜索树 */
pub struct BinarySearchTree {
    root: Option<Rc<RefCell<TreeNode>>>,
}

impl BinarySearchTree {
    /* 构造方法 */
    #[allow(clippy::new_without_default)]
    pub fn new() -> Self {
        // 初始化空树
        Self { root: None }
    }

    /* 获取二叉树根节点 */
    pub fn get_root(&self) -> &Option<Rc<RefCell<TreeNode>>> {
        &self.root
    }

    /* 查找节点 */
    pub fn search(&self, num: i32) -> Option<Rc<RefCell<TreeNode>>> {
        let mut cur = self.root.clone();
        // 循环查找，越过叶节点后跳出
        while let Some(node) = cur.clone() {
            match num.cmp(&node.borrow().val) {
                // 目标节点在 cur 的左子树中
                Ordering::Less => cur = node.borrow().left.clone(),
                // 目标节点在 cur 的右子树中
                Ordering::Greater => cur = node.borrow().right.clone(),
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
                // 插入位置在 cur 的左子树中
                Ordering::Less => {
                    pre = cur.take();
                    cur = node.borrow().left.clone();
                }
                // 插入位置在 cur 的右子树中
                Ordering::Greater => {
                    pre = cur.take();
                    cur = node.borrow().right.clone();
                }
                // 找到重复节点，直接返回
                Ordering::Equal => return,
            }
        }
        // 插入节点
        let pre = pre.unwrap_or_else(|| unreachable!());
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
                // 待删除节点在 cur 的左子树中
                Ordering::Less => {
                    pre = cur.take();
                    cur = node.borrow().left.clone();
                }
                // 待删除节点在 cur 的右子树中
                Ordering::Greater => {
                    pre = cur.take();
                    cur = node.borrow().right.clone();
                }
                // 找到待删除节点，跳出循环
                Ordering::Equal => break,
            }
        }
        // 若无待删除节点，则直接返回
        let Some(cur) = cur else { return };
        let borrow = cur.borrow();
        let left_child = borrow.left.as_ref();
        let right_child = borrow.right.as_ref();
        // 当子节点的数量为 0 或 1 时
        if left_child.is_none() || right_child.is_none() {
            // 此时 child 为空或 cur 的唯一子节点
            let child = left_child.or(right_child).cloned();
            let Some(pre) = pre else {
                // 若 pre 为空，则查找节点的第一轮循环里发生了 break，
                // 此时待删除的节点为根节点，应重新指定根节点
                self.root = child;
                return;
            };
            if borrow.val < pre.borrow().val {
                pre.borrow_mut().left = child;
            } else {
                pre.borrow_mut().right = child;
            }
        }
        // 子节点的数量为 2 时
        else {
            // 获取中序遍历中 cur 的下一个节点
            let Some(mut tmp) = right_child.cloned() else {
                // cur 的子节点数量为 2，一定存在右子节点，该分支不可达
                unreachable!()
            };
            // 相比于 while let，此代码能绕开 tmp 借用的生命周期并减少一次共享指针的克隆；
            // 考虑到可读性，也许应该恢复 while let 写法
            loop {
                tmp = if let Some(left) = &tmp.borrow().left {
                    Rc::clone(left)
                } else {
                    break;
                };
            }
            // 这是当前作用域内仍然存活的借用，需要在递归前丢弃，如果保留在调用栈中，
            // 可能会因同一节点的可变借用而触发 panic；即使没有发生这种情况，下面对
            // cur 节点的可变借用也会导致 panic
            drop(borrow);
            let tmp_val = tmp.borrow().val;
            // 递归删除节点 tmp
            self.remove(tmp_val);
            // 用 tmp 覆盖 cur
            cur.borrow_mut().val = tmp_val;
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
    println!("初始化的二叉树为\n{}", bst.get_root().display());

    /* 查找结点 */
    let node = bst.search(7).unwrap();
    let val = node.borrow().val;
    println!("查找到的节点对象为 {node:?}，节点值 = {val}");

    /* 插入节点 */
    bst.insert(16);
    println!("插入节点 16 后，二叉树为\n{}", bst.get_root().display());

    /* 删除节点 */
    bst.remove(1);
    println!("删除节点 1 后，二叉树为\n{}", bst.get_root().display());
    bst.remove(2);
    println!("删除节点 2 后，二叉树为\n{}", bst.get_root().display());
    bst.remove(4);
    println!("删除节点 4 后，二叉树为\n{}", bst.get_root().display());
}
