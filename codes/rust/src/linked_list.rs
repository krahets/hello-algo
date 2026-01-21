use std::cell::RefCell;
use std::collections::HashMap;
use std::fmt;
use std::hash::Hash;
use std::rc::Rc;

#[derive(Debug)]
pub struct ListNode<T> {
    pub val: T,
    pub next: Option<ListLink<T>>,
}

pub type ListLink<T> = Rc<RefCell<ListNode<T>>>;

impl<T> ListNode<T> {
    pub fn new(val: T) -> ListLink<T> {
        let node = Self { val, next: None };
        ListLink::from(node)
    }

    pub fn from_slice(slice: &[T]) -> Option<ListLink<T>>
    where
        T: Clone,
    {
        let iter = slice.iter().cloned();
        Self::from_de_iter(iter)
    }

    pub fn from_array<const N: usize>(array: [T; N]) -> Option<ListLink<T>> {
        let iter = array.into_iter();
        Self::from_de_iter(iter)
    }

    pub fn from_vec(vec: Vec<T>) -> Option<ListLink<T>> {
        let iter = vec.into_iter();
        Self::from_de_iter(iter)
    }

    fn from_de_iter<I>(mut iter: I) -> Option<ListLink<T>>
    where
        I: DoubleEndedIterator<Item = T>,
    {
        let head = iter.next()?;

        let mut next = None;
        for val in iter.rev() {
            let node = Self { val, next };
            next = Some(ListLink::from(node));
        }

        let head = Self { val: head, next };
        Some(ListLink::from(head))
    }
}

impl<T> From<ListNode<T>> for ListLink<T> {
    fn from(value: ListNode<T>) -> Self {
        Rc::new(RefCell::new(value))
    }
}

impl<T> From<ListNode<T>> for HashMap<T, ListLink<T>>
where
    T: Clone + Eq + Hash,
{
    fn from(value: ListNode<T>) -> Self {
        let mut map = HashMap::new();

        let val = value.val.clone();
        let mut next = value.next.clone();
        let link = ListLink::from(value);
        map.insert(val, link);

        while let Some(link) = next {
            let borrow = link.borrow();
            let val = borrow.val.clone();
            next = borrow.next.clone();
            drop(borrow);
            map.insert(val, link);
        }

        map
    }
}

impl<T> fmt::Display for ListNode<T>
where
    T: fmt::Display,
{
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        write!(f, "{}", self.val)?;
        let mut next = self.next.clone();
        while let Some(link) = next {
            let borrow = link.borrow();
            write!(f, " -> {}", borrow.val)?;
            next = borrow.next.clone();
        }
        Ok(())
    }
}
