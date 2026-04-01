use super::super::TreeLink;

#[derive(Debug, Clone)]
pub(crate) struct PreOrder<T> {
    stack: Vec<TreeLink<T>>,
}

impl<T> PreOrder<T> {
    pub(crate) fn new(root: TreeLink<T>) -> Self {
        let stack = vec![root];
        Self { stack }
    }
}

impl<T> Iterator for PreOrder<T> {
    type Item = TreeLink<T>;

    fn next(&mut self) -> Option<Self::Item> {
        let link = self.stack.pop()?;
        let borrow = link.borrow();
        if let Some(right) = borrow.right.clone() {
            self.stack.push(right);
        }
        if let Some(left) = borrow.left.clone() {
            self.stack.push(left);
        }
        drop(borrow);
        Some(link)
    }
}
