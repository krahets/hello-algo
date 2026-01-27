use super::traverse::{InOrder, LevelOrder, LevelOrderIncludeNulls, PostOrder, PreOrder};
use super::{BinaryTree, TreeLink, TreeNode};
use crate::fmt::Write;
use std::convert::Infallible;
use std::fmt;
use std::rc::Rc;

impl<T> BinaryTree for TreeLink<T> {
    type Element = T;
    type Error = &'static str;
    type TraverseItem = Self;

    fn len(&self) -> usize {
        // 中序遍历内存压力最小。
        Rc::clone(self).traverse_in_order().count()
    }

    fn is_empty(&self) -> bool {
        false
    }

    fn height(&self) -> Option<usize> {
        Some(self.borrow().height)
    }

    fn update_height(&self) {
        for link in Rc::clone(self).traverse_post_order() {
            let borrow = link.borrow();
            let mut height = 0;
            if let Some(left) = &borrow.left {
                height = left.borrow().height + 1;
            }
            if let Some(right) = &borrow.right {
                height = height.max(right.borrow().height + 1);
            }
            drop(borrow);
            link.borrow_mut().height = height;
        }
    }

    fn try_from_slice(slice: &[Option<Self::Element>]) -> Result<Self, Self::Error>
    where
        Self::Element: Clone,
    {
        let iter = slice.iter().cloned();
        TreeNode::try_from_iter(iter).ok_or("切片为空")
    }

    fn try_from_array<const N: usize>(
        array: [Option<Self::Element>; N],
    ) -> Result<Self, Self::Error> {
        let iter = array.into_iter();
        TreeNode::try_from_iter(iter).ok_or("数组为空")
    }

    fn try_from_vec(vec: Vec<Option<Self::Element>>) -> Result<Self, Self::Error> {
        let iter = vec.into_iter();
        TreeNode::try_from_iter(iter).ok_or("向量为空")
    }

    fn traverse_level_order(self) -> impl Iterator<Item = Self::TraverseItem> {
        LevelOrder::new(self)
    }

    fn traverse_pre_order(self) -> impl Iterator<Item = Self::TraverseItem> {
        PreOrder::new(self)
    }

    fn traverse_in_order(self) -> impl Iterator<Item = Self::TraverseItem> {
        InOrder::new(self)
    }

    fn traverse_post_order(self) -> impl Iterator<Item = Self::TraverseItem> {
        PostOrder::new(self)
    }

    fn display(&self) -> impl fmt::Display
    where
        Self::Element: fmt::Display,
    {
        let root = Some(self);
        TreeDisplay { root }
    }
}

impl<T> BinaryTree for Option<TreeLink<T>> {
    type Element = T;
    type Error = Infallible;
    type TraverseItem = TreeLink<T>;

    fn len(&self) -> usize {
        self.as_ref().map_or(0, TreeLink::len)
    }

    fn is_empty(&self) -> bool {
        self.is_none()
    }

    fn height(&self) -> Option<usize> {
        self.as_ref()?.height()
    }

    fn update_height(&self) {
        if let Some(link) = &self {
            link.update_height();
        }
    }

    fn try_from_slice(slice: &[Option<Self::Element>]) -> Result<Self, Self::Error>
    where
        Self::Element: Clone,
    {
        let iter = slice.iter().cloned();
        Ok(TreeNode::try_from_iter(iter))
    }

    fn try_from_array<const N: usize>(
        array: [Option<Self::Element>; N],
    ) -> Result<Self, Self::Error> {
        let iter = array.into_iter();
        Ok(TreeNode::try_from_iter(iter))
    }

    fn try_from_vec(vec: Vec<Option<Self::Element>>) -> Result<Self, Self::Error> {
        let iter = vec.into_iter();
        Ok(TreeNode::try_from_iter(iter))
    }

    fn traverse_level_order(self) -> impl Iterator<Item = Self::TraverseItem> {
        self.into_iter().flat_map(TreeLink::traverse_level_order)
    }

    fn traverse_pre_order(self) -> impl Iterator<Item = Self::TraverseItem> {
        self.into_iter().flat_map(TreeLink::traverse_pre_order)
    }

    fn traverse_in_order(self) -> impl Iterator<Item = Self::TraverseItem> {
        self.into_iter().flat_map(TreeLink::traverse_in_order)
    }

    fn traverse_post_order(self) -> impl Iterator<Item = Self::TraverseItem> {
        self.into_iter().flat_map(TreeLink::traverse_post_order)
    }

    fn display(&self) -> impl fmt::Display
    where
        Self::Element: fmt::Display,
    {
        let root = self.as_ref();
        TreeDisplay { root }
    }
}

struct TreeDisplay<'a, T> {
    root: Option<&'a TreeLink<T>>,
}

impl<T> fmt::Display for TreeDisplay<'_, T>
where
    T: fmt::Display,
{
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        let Some(root) = self.root.cloned() else {
            return Ok(());
        };
        let iter = LevelOrderIncludeNulls::new(root).map(|node| {
            if let Some(node) = node {
                format!("Some({})", node.borrow().val)
            } else {
                String::from("None")
            }
        });
        f.write_complete_binary_tree(iter)
    }
}
