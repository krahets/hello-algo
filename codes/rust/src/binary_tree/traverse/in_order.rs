use super::super::TreeLink;
use std::mem;

#[derive(Debug, Clone)]
pub(crate) struct InOrder<T> {
    state: State<T>,
    stack: Vec<TreeLink<T>>,
}

#[derive(Debug, Clone)]
enum State<T> {
    Push(TreeLink<T>),
    Pop,
    Done,
}

impl<T> InOrder<T> {
    pub(crate) fn new(root: TreeLink<T>) -> Self {
        let state = State::Push(root);
        let stack = Vec::new();
        Self { state, stack }
    }
}

impl<T> Iterator for InOrder<T> {
    type Item = TreeLink<T>;

    fn next(&mut self) -> Option<Self::Item> {
        loop {
            match &mut self.state {
                // 处于此状态时，如果当前节点没有左子节点，它不会被推入栈中，而是直接返回。
                // 原则上，没有左子节点的节点也可入栈，并在下一次循环中弹出，但这样会多出
                // 一次不必要的入栈和弹栈操作，降低效率。
                State::Push(link) => {
                    let borrow = link.borrow();
                    let left = borrow.left.clone();
                    let right = borrow.right.clone();
                    drop(borrow);
                    // 如果存在左子节点，继续压栈。
                    if let Some(left) = left {
                        let link = mem::replace(link, left);
                        self.stack.push(link);
                        continue;
                    }
                    // 如果不存在左子节点，但存在右子节点，则压入右子节点，否则弹出当前节点的父节点。
                    let new_state = if let Some(right) = right {
                        State::Push(right)
                    } else {
                        State::Pop
                    };
                    let old_state = mem::replace(&mut self.state, new_state);
                    let State::Push(link) = old_state else {
                        unreachable!()
                    };
                    return Some(link);
                }

                State::Pop => {
                    if let Some(link) = self.stack.pop() {
                        let right = link.borrow().right.clone();
                        if let Some(right) = right {
                            self.state = State::Push(right);
                        }
                        return Some(link);
                    }
                    self.state = State::Done;
                    // 也可在下一循环中返回，但会多出一次分支跳转。
                    return None;
                }

                State::Done => {
                    return None;
                }
            }
        }
    }
}
