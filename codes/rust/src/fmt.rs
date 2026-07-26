use std::fmt;

pub trait Write {
    fn write_array<I>(&mut self, iter: I) -> fmt::Result
    where
        I: IntoIterator<Item: fmt::Display>;

    fn write_linked_list<I>(&mut self, iter: I) -> fmt::Result
    where
        I: IntoIterator<Item: fmt::Display>;

    fn write_complete_binary_tree<I>(&mut self, iter: I) -> fmt::Result
    where
        I: IntoIterator<Item: fmt::Display>;
}

impl<W> Write for W
where
    W: fmt::Write,
{
    fn write_array<I>(&mut self, iter: I) -> fmt::Result
    where
        I: IntoIterator<Item: fmt::Display>,
    {
        let mut iter = iter.into_iter();
        let Some(first) = iter.next() else {
            return write!(self, "[]");
        };
        write!(self, "[{first}")?;
        for item in iter {
            write!(self, ", {item}")?;
        }
        write!(self, "]")
    }

    fn write_linked_list<I>(&mut self, iter: I) -> fmt::Result
    where
        I: IntoIterator<Item: fmt::Display>,
    {
        let mut iter = iter.into_iter();
        let Some(first) = iter.next() else {
            return Ok(());
        };
        write!(self, "{first}")?;
        for item in iter {
            write!(self, "-> {item}")?;
        }
        Ok(())
    }

    fn write_complete_binary_tree<I>(&mut self, iter: I) -> fmt::Result
    where
        I: IntoIterator<Item: fmt::Display>,
    {
        // 此实现暂不考虑节点值的字符串表示存在多行的情况。

        let mut cache = Vec::new();
        let mut current_level = Vec::new();
        let mut current_depth = 0;
        let mut node_width = 0;

        for (index, node) in iter.into_iter().enumerate() {
            let depth = if index == usize::MAX {
                usize::BITS as usize
            } else {
                (usize::BITS - 1 - (index + 1).leading_zeros()) as usize
            };
            if current_depth != depth {
                cache.push(current_level);
                current_level = Vec::new();
                current_depth = depth;
            }
            let node = format!("{node}");
            node_width = node.len().max(node_width);
            current_level.push(node);
        }

        if cache.is_empty() && current_level.is_empty() {
            return Ok(());
        }

        cache.push(current_level);

        let tree_height = current_depth;
        let half_node_width_left = node_width / 2;
        let half_node_width_right = node_width - half_node_width_left;

        #[derive(Default)]
        struct Level {
            branches: String,
            nodes: String,
        }

        let mut margin = 0;
        let mut gap = 2;
        let mut levels: Vec<Level> = (0..=tree_height).map(|_| Level::default()).collect();

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
                writeln!(self, "{}", level.branches)?;
            }
            writeln!(self, "{}", level.nodes)?;
        }

        Ok(())
    }
}
