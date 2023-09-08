/*
 * File: binary_search_tree.rs
 * Created Time: 2023-04-20
 * Author: xBLACKICEx (xBLACKICE@outlook.com)
 */

include!("../include/include.rs");

use std::{cell::RefCell, rc::Rc};
use tree_node::TreeNode;

type TreeNodeRc = Rc<RefCell<TreeNode>>;

/* 二叉搜索树 */
pub struct BinarySearchTree {
    root: Option<TreeNodeRc>,
}

impl BinarySearchTree {
    /* 构造方法 */
    pub fn new(mut nums: Vec<i32>) -> Self {
        // 排序数组
        nums.sort();
        // 构建二叉搜索树
        if nums.is_empty() {
            Self { root: None }
        } else {  
            Self { root: Some(Self::build_tree(&nums)) }
        }
    }

    /* 获取二叉树根节点 */
    pub fn get_root(&self) -> Option<TreeNodeRc> {
        self.root.clone() // RC 克隆
    }

    /* 构建二叉搜索树 */
    fn build_tree(num: &[i32]) -> TreeNodeRc {
        // 将数组中间节点作为根节点
        let mid = num.len() / 2;
        let root = TreeNode::new(num[mid]);
        // 递归建立左子树和右子树
        if mid > 0 {
            root.borrow_mut().left = Some(Self::build_tree(&num[..mid]));
        }
        if mid < num.len() - 1 {
            root.borrow_mut().right = Some(Self::build_tree(&num[mid + 1..]));
        }  
        root
    }

    /* 查找节点 */
    pub fn search(&self, num: i32) -> Option<TreeNodeRc> {
        let mut cur = self.root.clone();

        // 循环查找，越过叶节点后跳出
        while let Some(node) = cur.clone() {
            // 目标节点在 cur 的右子树中
            if node.borrow().val < num {
                cur = node.borrow().right.clone();
            }
            // 目标节点在 cur 的左子树中
            else if node.borrow().val > num {
                cur = node.borrow().left.clone();
            }
            // 找到目标节点，跳出循环
            else {
                break;
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
            // 找到重复节点，直接返回
            if node.borrow().val == num {
                return;
            }
            // 插入位置在 cur 的右子树中
            pre = cur.clone();
            if node.borrow().val < num {
                cur = node.borrow().right.clone();
            }
            // 插入位置在 cur 的左子树中
            else {
                cur = node.borrow().left.clone();
            }
        }
        // 插入节点
        let node = TreeNode::new(num);
        let pre = pre.unwrap();
        if pre.borrow().val < num {
            pre.borrow_mut().right = Some(Rc::clone(&node));
        } else {
            pre.borrow_mut().left = Some(Rc::clone(&node));
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
            // 找到待删除节点，跳出循环
            if node.borrow().val == num {
                break;
            }
            // 待删除节点在 cur 的右子树中
            pre = cur.clone();
            if node.borrow().val < num {
                cur = node.borrow().right.clone();
            }
            // 待删除节点在 cur 的左子树中
            else {
                cur = node.borrow().left.clone();
            }
        }
        // 若无待删除节点，则直接返回
        if cur.is_none() {
            return;
        }
        let cur = cur.unwrap();
        // 子节点数量 = 0 or 1
        if cur.borrow().left.is_none() || cur.borrow().right.is_none() {
            // 当子节点数量 = 0 / 1 时， child = nullptr / 该子节点
            let child = cur.borrow().left.clone().or_else(|| cur.borrow().right.clone());
            let pre = pre.unwrap();
            let left = pre.borrow().left.clone().unwrap();
            // 删除节点 cur
            if !Rc::ptr_eq(&cur, self.root.as_ref().unwrap()) {
                if Rc::ptr_eq(&left, &cur) {
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
        else {
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

/* Driver Code */
fn main() {
    /* 初始化二叉搜索树 */
    let nums = vec![1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15];
    let mut bst = BinarySearchTree::new(nums);
    println!("初始化的二叉树为\n");
    print_util::print_tree(&bst.get_root().unwrap());

    /* 查找节点 */
    let node = bst.search(7).unwrap();
    println!(
        "\n查找到的节点对象为: {:p} 节点值 = {}\n",
        node.as_ref().as_ptr(),
        node.borrow().val
    );

    /* 插入节点 */
    bst.insert(16);
    println!("插入节点 16 后，二叉树为\n");
    print_util::print_tree(&bst.get_root().unwrap());

    /* 删除节点 */
    bst.remove(1);
    println!("\n删除节点 1 后，二叉树为\n");
    print_util::print_tree(&bst.get_root().unwrap());
    bst.remove(2);
    println!("\n删除节点 2 后，二叉树为\n");
    print_util::print_tree(&bst.get_root().unwrap());
    bst.remove(4);
    println!("\n删除节点 4 后，二叉树为\n");
    print_util::print_tree(&bst.get_root().unwrap());
}
