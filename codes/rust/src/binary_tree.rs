//! 本模块仅用于示例代码，不建议在生产环境中使用。
//!
//! 为了与示例代码中 `Rc<RefCell<TreeNode>>` 保持一致，本模块中的 [`TreeLink`] 是前者的
//! 类型别名而非包装类型。由于孤儿法则，本模块额外定义了 [`BinaryTree`] trait 以为其实现关
//! 联函数和方法，你不必为自己的链表类型定义或实现类似的 trait。为了方便示例代码的编写和阅读，
//! 在本模块中，实现了 [`BinaryTree`] 的类型有：
//!
//! - [`TreeLink`]
//! - `Option<TreeLink>`
//!
//! 它们都被视为二叉树。参考实现时，以上类型作为实现细节不应暴露为公共接口，否则可能发生二叉树成环，
//! 这会导致内存泄露、迭代无法终止等系列问题。
//!
//! # 二叉树的遍历
//!
//! 本模块提供了二叉树四种遍历方式的迭代器实现，分别是：
//!
//! - `LevelOrder`（层序遍历）
//! - `PreOrder`（前序遍历）
//! - `InOrder`（中序遍历）
//! - `PostOrder`（后序遍历）
//!
//! 这些迭代器都是私有的，只可通过匿名类型使用它们。你可以通过 [`BinaryTree`] trait 提供的相关方法
//! 来获取这些迭代器。

use std::cell::RefCell;
use std::fmt;
use std::rc::Rc;

mod link_impl;
mod traverse;

pub trait BinaryTree {
    type Element;
    type Error;
    type TraverseItem;

    fn len(&self) -> usize;

    fn is_empty(&self) -> bool {
        self.len() == 0
    }

    fn height(&self) -> Option<usize>;

    fn update_height(&self);

    fn try_from_slice(slice: &[Option<Self::Element>]) -> Result<Self, Self::Error>
    where
        Self: Sized,
        Self::Element: Clone;

    fn try_from_array<const N: usize>(
        array: [Option<Self::Element>; N],
    ) -> Result<Self, Self::Error>
    where
        Self: Sized;

    fn try_from_vec(vec: Vec<Option<Self::Element>>) -> Result<Self, Self::Error>
    where
        Self: Sized;

    fn traverse_level_order(self) -> impl Iterator<Item = Self::TraverseItem>;

    fn traverse_pre_order(self) -> impl Iterator<Item = Self::TraverseItem>;

    fn traverse_in_order(self) -> impl Iterator<Item = Self::TraverseItem>;

    fn traverse_post_order(self) -> impl Iterator<Item = Self::TraverseItem>;

    fn display(&self) -> impl fmt::Display
    where
        Self::Element: fmt::Display;
}

#[derive(Debug, Clone)]
pub struct TreeNode<T> {
    pub val: T,
    pub height: usize,
    pub parent: Option<TreeLink<T>>,
    pub left: Option<TreeLink<T>>,
    pub right: Option<TreeLink<T>>,
}

pub type TreeLink<T> = Rc<RefCell<TreeNode<T>>>;

impl<T> TreeNode<T> {
    pub fn new(val: T) -> TreeLink<T> {
        TreeLink::from(Self {
            val,
            height: 0,
            parent: None,
            left: None,
            right: None,
        })
    }

    /// 注意：当前实现中，无法链接的节点会被忽略。
    fn try_from_iter<I>(iter: I) -> Option<TreeLink<T>>
    where
        I: IntoIterator<Item = Option<T>>,
    {
        let mut links = Vec::new();

        let mut level_empty = true;
        let mut offset: usize = 0;
        let mut width: usize = 1;
        for val in iter {
            match val {
                None => {
                    // 元素数量超过 isize::MAX as usize / size_of::<Option<TreeLink<T>>>()
                    // 时恐慌。在此之前，程序更可能因为内存不足而崩溃。
                    links.push(None);
                }
                Some(val) => {
                    level_empty = false;
                    let node = Self {
                        val,
                        height: 0,
                        parent: None,
                        left: None,
                        right: None,
                    };
                    let link = TreeLink::from(node);
                    links.push(Some(link));
                }
            }
            if offset < width - 1 {
                offset += 1;
            } else {
                if level_empty {
                    // 此实现会在层空时熔断，忽略后续无法链接的有效节点。
                    break;
                }
                level_empty = true;
                offset = 0;
                // 深度达到 usize::BITS 时，层宽溢出；此状态不可达，因为此时至少需要
                // 分配 usize::MAX + 1 个元素。即使不考虑内存耗尽，links 会在分配
                // isize::MAX as usize / size_of::<Option<TreeLink<T>>>()
                // 个元素后容量溢出并恐慌，这个数量远小于 usize::MAX + 1。此外，从类
                // 型上看，usize::MAX + 1 也无法被 Vec::len 的返回类型 usize 表达。
                width *= 2;
            }
        }

        for index in (0..links.len()).rev() {
            let Some(Some(link)) = links.get(index) else {
                continue;
            };

            let Some(left) = index.checked_mul(2).and_then(|x| x.checked_add(1)) else {
                continue;
            };
            if let Some(Some(left)) = links.get(left) {
                let mut borrow_link = link.borrow_mut();
                let mut borrow_left = left.borrow_mut();
                borrow_link.height = borrow_left.height + 1;
                borrow_link.left = Some(Rc::clone(left));
                borrow_left.parent = Some(Rc::clone(link));
            }

            let Some(right) = left.checked_add(1) else {
                continue;
            };
            if let Some(Some(right)) = links.get(right) {
                let mut borrow_link = link.borrow_mut();
                let mut borrow_right = right.borrow_mut();
                borrow_link.height = borrow_link.height.max(borrow_right.height + 1);
                borrow_link.right = Some(Rc::clone(right));
                borrow_right.parent = Some(Rc::clone(link));
            }
        }

        links.into_iter().next().unwrap_or(None)
    }
}

impl<T> From<TreeNode<T>> for TreeLink<T> {
    fn from(value: TreeNode<T>) -> Self {
        Rc::new(RefCell::new(value))
    }
}

#[cfg(test)]
mod tests {
    use super::traverse::LevelOrderIncludeNulls;
    use super::*;
    use rand::Rng;

    // 样本二叉树:
    //                                    Some(0)
    //                    ┌───────────────────┴───────────────────┐
    //                Some(1)                                 Some(2)
    //          ┌─────────┴─────────┐                   ┌─────────┴─────────┐
    //      Some(3)               None              Some(5)             Some(6)
    //     ┌────┴────┐         ┌────┴────┐         ┌────┴────┐         ┌────┴────┐
    // Some(7)   Some(8)     None      None    Some(11)    None      None    Some(14)
    const SAMPLE: [Option<i32>; 15] = [
        Some(0),
        Some(1),
        Some(2),
        Some(3),
        None,
        Some(5),
        Some(6),
        Some(7),
        Some(8),
        None,
        None,
        Some(11),
        None,
        None,
        Some(14),
    ];

    #[test]
    fn test_update_height() {
        //                                 Some(0)
        //                  ┌─────────────────┴─────────────────┐
        //               Some(1)                             Some(2)
        //         ┌────────┴────────┐                 ┌────────┴────────┐
        //      Some(3)           Some(4)            None              None
        //    ┌────┴───┐        ┌────┴───┐        ┌────┴───┐        ┌────┴───┐
        // Some(5)   None     None     None     None     None     None     None

        let n0 = TreeNode::new(0);
        let n1 = TreeNode::new(1);
        let n2 = TreeNode::new(2);
        let n3 = TreeNode::new(3);
        let n4 = TreeNode::new(4);
        let n5 = TreeNode::new(5);

        // 构建二叉树并随机设置节点高度。
        // 离开作用域后，所有 RefMut 全部 drop。
        {
            let mut borrow_n0 = n0.borrow_mut();
            borrow_n0.height = rand::rng().random_range(0..100);
            borrow_n0.left = Some(Rc::clone(&n1));
            borrow_n0.right = Some(Rc::clone(&n2));

            let mut borrow_n1 = n1.borrow_mut();
            borrow_n1.height = rand::rng().random_range(0..100);
            borrow_n1.left = Some(Rc::clone(&n3));
            borrow_n1.right = Some(Rc::clone(&n4));

            let mut borrow_n2 = n2.borrow_mut();
            borrow_n2.height = rand::rng().random_range(0..100);

            let mut borrow_n3 = n3.borrow_mut();
            borrow_n3.height = rand::rng().random_range(0..100);
            borrow_n3.left = Some(Rc::clone(&n5));

            let mut borrow_n4 = n4.borrow_mut();
            borrow_n4.height = rand::rng().random_range(0..100);

            let mut borrow_n5 = n5.borrow_mut();
            borrow_n5.height = rand::rng().random_range(0..100);
        }

        n0.update_height();
        assert_eq!(n0.borrow().height, 3);
        assert_eq!(n1.borrow().height, 2);
        assert_eq!(n2.borrow().height, 0);
        assert_eq!(n3.borrow().height, 1);
        assert_eq!(n4.borrow().height, 0);
        assert_eq!(n5.borrow().height, 0);
    }

    #[test]
    fn test_from_iter() {
        let tree = TreeNode::try_from_iter(SAMPLE).unwrap();

        let n0 = tree;
        let borrow_n0 = n0.borrow();
        assert_eq!(borrow_n0.val, 0);
        assert_eq!(borrow_n0.height, 3);

        let n1 = borrow_n0.left.clone().unwrap();
        let borrow_n1 = n1.borrow();
        assert_eq!(borrow_n1.val, 1);
        assert_eq!(borrow_n1.height, 2);

        let n2 = borrow_n0.right.clone().unwrap();
        let borrow_n2 = n2.borrow();
        assert_eq!(borrow_n2.val, 2);
        assert_eq!(borrow_n2.height, 2);

        let n3 = borrow_n1.left.clone().unwrap();
        let borrow_n3 = n3.borrow();
        assert_eq!(borrow_n3.val, 3);
        assert_eq!(borrow_n3.height, 1);

        // n4 不存在。
        assert!(borrow_n1.right.is_none());

        let n5 = borrow_n2.left.clone().unwrap();
        let borrow_n5 = n5.borrow();
        assert_eq!(borrow_n5.val, 5);
        assert_eq!(borrow_n5.height, 1);

        let n6 = borrow_n2.right.clone().unwrap();
        let borrow_n6 = n6.borrow();
        assert_eq!(borrow_n6.val, 6);
        assert_eq!(borrow_n6.height, 1);

        let n7 = borrow_n3.left.clone().unwrap();
        let borrow_n7 = n7.borrow();
        assert_eq!(borrow_n7.val, 7);
        assert_eq!(borrow_n7.height, 0);

        let n8 = borrow_n3.right.clone().unwrap();
        let borrow_n8 = n8.borrow();
        assert_eq!(borrow_n8.val, 8);
        assert_eq!(borrow_n8.height, 0);

        // n9 和 n10 不存在且没有父节点。

        let n11 = borrow_n5.left.clone().unwrap();
        let borrow_n11 = n11.borrow();
        assert_eq!(borrow_n11.val, 11);
        assert_eq!(borrow_n11.height, 0);

        // n12 不存在。
        assert!(borrow_n5.right.is_none());

        // n13 不存在。
        assert!(borrow_n6.left.is_none());

        let n14 = borrow_n6.right.clone().unwrap();
        let borrow_n14 = n14.borrow();
        assert_eq!(borrow_n14.val, 14);
        assert_eq!(borrow_n14.height, 0);

        // 当前实现中，无法链接的节点会被忽略。
        let mut bad_sample = SAMPLE;
        bad_sample[9] = Some(10); // 此节点不会被链接。
        let tree = TreeNode::try_from_iter(bad_sample).unwrap();
        let result = tree
            .traverse_level_order()
            .map(|link| link.borrow().val)
            .collect::<Vec<_>>();
        let expected = vec![0, 1, 2, 3, 5, 6, 7, 8, 11, 14];
        assert_eq!(result, expected);
    }

    #[test]
    fn test_traverse_level_order() {
        let tree = TreeNode::try_from_iter(SAMPLE).unwrap();
        let result = tree
            .traverse_level_order()
            .map(|link| link.borrow().val)
            .collect::<Vec<_>>();
        let expected = vec![0, 1, 2, 3, 5, 6, 7, 8, 11, 14];
        assert_eq!(result, expected);
    }

    #[test]
    fn test_traverse_level_order_include_nulls() {
        let tree = TreeNode::try_from_iter(SAMPLE).unwrap();
        let result = LevelOrderIncludeNulls::new(tree)
            .map(|opt| opt.map(|link| link.borrow().val))
            .collect::<Vec<_>>();
        let expected = SAMPLE;
        assert_eq!(result, expected);
    }

    #[test]
    fn test_traverse_pre_order() {
        let tree = TreeNode::try_from_iter(SAMPLE).unwrap();
        let result = tree
            .traverse_pre_order()
            .map(|link| link.borrow().val)
            .collect::<Vec<_>>();
        let expected = vec![0, 1, 3, 7, 8, 2, 5, 11, 6, 14];
        assert_eq!(result, expected);
    }

    #[test]
    fn test_traverse_in_order() {
        let tree = TreeNode::try_from_iter(SAMPLE).unwrap();
        let result = tree
            .traverse_in_order()
            .map(|link| link.borrow().val)
            .collect::<Vec<_>>();
        let expected = vec![7, 3, 8, 1, 0, 11, 5, 2, 6, 14];
        assert_eq!(result, expected);
    }

    #[test]
    fn test_traverse_post_order() {
        let tree = TreeNode::try_from_iter(SAMPLE).unwrap();
        let result = tree
            .traverse_post_order()
            .map(|link| link.borrow().val)
            .collect::<Vec<_>>();
        let expected = vec![7, 8, 3, 1, 11, 5, 14, 6, 2, 0];
        assert_eq!(result, expected);
    }

    #[test]
    fn test_display() {
        let tree = TreeNode::try_from_iter(SAMPLE).unwrap();
        let display = tree.display().to_string();
        let result = display.lines().map(str::trim_end).collect::<Vec<_>>();
        let expected = "
                                   Some(0)
                   ┌───────────────────┴───────────────────┐
               Some(1)                                 Some(2)
         ┌─────────┴─────────┐                   ┌─────────┴─────────┐
     Some(3)               None              Some(5)             Some(6)
    ┌────┴────┐         ┌────┴────┐         ┌────┴────┐         ┌────┴────┐
Some(7)   Some(8)     None      None    Some(11)    None      None    Some(14)
"[1..] // 去掉开头的换行符
            .lines()
            .map(str::trim_end)
            .collect::<Vec<_>>();
        assert_eq!(result, expected);
    }
}
