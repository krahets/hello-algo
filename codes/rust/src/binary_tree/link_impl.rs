use super::traverse::{InOrder, LevelOrder, LevelOrderIncludeNulls, PostOrder, PreOrder};
use super::{BinaryTree, TreeLink, TreeNode};
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
        // 此实现不考虑节点值的字符串表示存在多行的情况。

        let Some(root) = self.root.cloned() else {
            return Ok(());
        };

        // 需要额外一次后序遍历的开销。
        // 如果不对外暴露节点并维持不变量，这行代码可以删除。
        root.update_height();
        let tree_height = root.borrow().height;
        let mut node_width = 0;
        let mut cache = vec![Vec::new(); tree_height + 1];
        for (index, link) in LevelOrderIncludeNulls::new(root).enumerate() {
            let depth = if index == usize::MAX {
                usize::BITS as usize
            } else {
                (usize::BITS - 1 - (index + 1).leading_zeros()) as usize
            };
            if let Some(link) = link {
                let borrow = link.borrow();
                let node = format!("Some({})", borrow.val);
                node_width = node.len().max(node_width);
                cache[depth].push(node);
            } else {
                cache[depth].push(String::from("None"));
            }
        }
        let half_node_width_left = node_width / 2;
        let half_node_width_right = node_width - half_node_width_left;

        #[derive(Clone, Default)]
        struct Level {
            branches: String,
            nodes: String,
        }

        let mut margin = 0;
        let mut gap = 2;
        let mut levels = vec![Level::default(); tree_height + 1];
        for (level, nodes) in levels.iter_mut().zip(cache).rev() {
            if nodes.len() == 1 {
                let root = &nodes[0];
                let half_padding_left = (node_width - root.len()) / 2;
                for _ in 0..(margin + half_padding_left) {
                    level.nodes.push(' ');
                }
                level.nodes.push_str(root);
                break;
            }

            let half_gap_left = gap / 2;
            let half_gap_right = gap - half_gap_left;

            let mut node_iter = nodes.iter();
            let mut is_left;

            // 处理当前层的第一个节点。
            {
                let node = node_iter.next().unwrap_or_else(|| unreachable!());
                let padding = node_width - node.len();
                let half_padding_left = padding / 2;
                let half_padding_right = padding - half_padding_left;

                for _ in 0..(margin + half_node_width_left) {
                    level.branches.push(' ');
                }
                level.branches.push('┌');
                for _ in 1..(half_node_width_right + half_gap_left) {
                    level.branches.push('─');
                }

                for _ in 0..(margin + half_padding_left) {
                    level.nodes.push(' ');
                }
                level.nodes.push_str(node);
                for _ in 0..half_padding_right {
                    level.nodes.push(' ');
                }

                is_left = false;
            }

            for node in node_iter {
                let padding = node_width - node.len();
                let half_padding_left = padding / 2;
                let half_padding_right = padding - half_padding_left;

                if is_left {
                    for _ in 1..(half_node_width_right + gap + half_node_width_left) {
                        level.branches.push(' ');
                    }
                    level.branches.push('┌');
                    for _ in 1..(half_node_width_right + half_gap_left) {
                        level.branches.push('─');
                    }
                } else {
                    level.branches.push('┴');
                    for _ in 1..(half_gap_right + half_node_width_left) {
                        level.branches.push('─');
                    }
                    level.branches.push('┐');
                }

                for _ in 0..(gap + half_padding_left) {
                    level.nodes.push(' ');
                }
                level.nodes.push_str(node);
                for _ in 0..half_padding_right {
                    level.nodes.push(' ');
                }

                is_left = !is_left;
            }

            margin += half_node_width_right + half_gap_left;
            gap = gap * 2 + node_width;
        }

        for (depth, level) in levels.iter().enumerate() {
            if depth > 0 {
                writeln!(f, "{}", level.branches)?;
            }
            writeln!(f, "{}", level.nodes)?;
        }

        Ok(())
    }
}
