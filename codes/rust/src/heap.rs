//! 本模块定义了 [`Heap`] trait 以辅助堆的格式化输出。请注意，此 trait 不涉及任何实际的堆操作。
 //!
 //! 实现了 [`Heap`] 的类型有：
 //!
 //! - 标准库的 [`BinaryHeap<T>`]
 //! - 任意切片类型 `[T]`
 //!
 //! 此外，你可以在数组 `[T; N]`、向量 `Vec<T>` 及其他任何可以 unsize 为切片的类型上使用
 //! `<[T] as Heap>` 的所有方法，这得益于 Rust 的点操作符语法糖。详见 *[nomicon]*。
 //!
 //! [nomicon]: https://doc.rust-lang.org/stable/nomicon/dot-operator.html

use std::collections::BinaryHeap;
use std::fmt;

pub trait Heap {
    type Element;

    fn display_as_array(&self) -> impl fmt::Display
    where
        Self::Element: fmt::Display;

    fn display_as_tree(&self) -> impl fmt::Display
    where
        Self::Element: fmt::Display;
}

impl<T> Heap for BinaryHeap<T> {
    type Element = T;

    fn display_as_array(&self) -> impl fmt::Display
    where
        Self::Element: fmt::Display,
    {
        let slice = self.as_slice();
        ArrayDisplay { slice }
    }

    fn display_as_tree(&self) -> impl fmt::Display
    where
        Self::Element: fmt::Display,
    {
        let slice = self.as_slice();
        TreeDisplay { slice }
    }
}

impl<T> Heap for [T] {
    type Element = T;

    fn display_as_array(&self) -> impl fmt::Display
    where
        Self::Element: fmt::Display,
    {
        let slice = self;
        ArrayDisplay { slice }
    }

    fn display_as_tree(&self) -> impl fmt::Display
    where
        Self::Element: fmt::Display,
    {
        let slice = self;
        TreeDisplay { slice }
    }
}

struct ArrayDisplay<'a, T> {
    slice: &'a [T],
}

impl<T> fmt::Display for ArrayDisplay<'_, T>
where
    T: fmt::Display,
{
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        let mut iter = self.slice.iter();
        let Some(first) = iter.next() else {
            return write!(f, "[]");
        };
        write!(f, "[{first}")?;
        for val in iter {
            write!(f, ", {val}")?;
        }
        write!(f, "]")
    }
}

struct TreeDisplay<'a, T> {
    slice: &'a [T],
}

impl<T> fmt::Display for TreeDisplay<'_, T>
where
    T: fmt::Display,
{
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        // 此实现参考自 <crate::binary_tree::link_impl::TreeDisplay as std::fmt::Display>::fmt，
        // 原则上可以将公共逻辑封装为一个辅助函数以避免重复代码。

        if self.slice.is_empty() {
            return Ok(());
        }

        fn depth(index: usize) -> usize {
            if index == usize::MAX {
                // 实际不可达，因为 slice.len() 不会超过 usize::MAX。
                usize::BITS as usize
            } else {
                (usize::BITS - 1 - (index + 1).leading_zeros()) as usize
            }
        }

        let tree_height = depth(self.slice.len() - 1);
        let mut node_width = 0;
        let mut cache = vec![Vec::new(); tree_height + 1];
        for (index, node) in self.slice.iter().enumerate() {
            let depth = depth(index);
            let node = format!("{node}");
            node_width = node.len().max(node_width);
            cache[depth].push(node);
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
                level.branches.push('┘');

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
                    level.branches.push('┘');
                } else {
                    // 弹出上一个左子节点多加的 '┘'。
                    level.branches.pop();
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
