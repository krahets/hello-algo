use super::super::TreeLink;

#[derive(Debug, Clone)]
pub(crate) struct PostOrder<T> {
    stack: Vec<Frame<T>>,
}

#[derive(Debug, Clone)]
struct Frame<T> {
    link: TreeLink<T>,
    visited: bool,
}

impl<T> PostOrder<T> {
    pub(crate) fn new(root: TreeLink<T>) -> Self {
        let frame = Frame {
            link: root,
            visited: false,
        };
        let stack = vec![frame];
        Self { stack }
    }
}

impl<T> Iterator for PostOrder<T> {
    type Item = TreeLink<T>;

    fn next(&mut self) -> Option<Self::Item> {
        while let Some(mut frame) = self.stack.pop() {
            if frame.visited {
                return Some(frame.link);
            }

            let borrow = frame.link.borrow();
            let right = borrow.right.clone();
            let left = borrow.left.clone();
            drop(borrow);

            frame.visited = true;
            self.stack.push(frame);

            if let Some(right) = right {
                let right = Frame {
                    link: right,
                    visited: false,
                };
                self.stack.push(right);
            }

            if let Some(left) = left {
                let left = Frame {
                    link: left,
                    visited: false,
                };
                self.stack.push(left);
            }
        }

        None
    }
}
