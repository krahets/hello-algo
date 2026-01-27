use super::super::{BinaryTree, TreeLink};
use std::collections::VecDeque;

#[derive(Debug, Clone)]
pub(crate) struct LevelOrder<T> {
    queue: VecDeque<TreeLink<T>>,
}

impl<T> LevelOrder<T> {
    pub(crate) fn new(root: TreeLink<T>) -> Self {
        let mut queue = VecDeque::new();
        queue.push_back(root);
        Self { queue }
    }
}

impl<T> Iterator for LevelOrder<T> {
    type Item = TreeLink<T>;

    fn next(&mut self) -> Option<Self::Item> {
        let link = self.queue.pop_front()?;
        let borrow = link.borrow();
        if let Some(left) = borrow.left.clone() {
            self.queue.push_back(left);
        }
        if let Some(right) = borrow.right.clone() {
            self.queue.push_back(right);
        }
        drop(borrow);
        Some(link)
    }
}

#[derive(Debug, Clone)]
pub(crate) struct LevelOrderIncludeNulls<T> {
    len: usize,
    queue: VecDeque<Option<TreeLink<T>>>,
}

impl<T> LevelOrderIncludeNulls<T> {
    pub(crate) fn new(root: TreeLink<T>) -> Self {
        // 需要额外一次后序遍历的开销。
        // 如果不对外暴露节点并保证不变量被维护，这行代码可以删除。
        root.update_height();
        let height = root.borrow().height;
        let len = (1 << (height + 1)) - 1;
        let mut queue = VecDeque::new();
        queue.push_back(Some(root));
        Self { len, queue }
    }
}

impl<T> Iterator for LevelOrderIncludeNulls<T> {
    type Item = Option<TreeLink<T>>;

    fn next(&mut self) -> Option<Self::Item> {
        let link = self.queue.pop_front()?;
        self.len -= 1;
        if let Some(link) = &link {
            let borrow = link.borrow();
            if let Some(left) = borrow.left.clone() {
                self.queue.push_back(Some(left));
            } else if self.queue.len() < self.len {
                self.queue.push_back(None);
            }
            if let Some(right) = borrow.right.clone() {
                self.queue.push_back(Some(right));
            } else if self.queue.len() < self.len {
                self.queue.push_back(None);
            }
        } else {
            if self.queue.len() < self.len {
                self.queue.push_back(None);
            }
            if self.queue.len() < self.len {
                self.queue.push_back(None);
            }
        }
        Some(link)
    }
}
