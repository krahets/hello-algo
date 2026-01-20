use std::cell::RefCell;
use std::collections::HashMap;
use std::hash::Hash;
use std::rc::Rc;

#[derive(Debug)]
pub struct LinkedList<T> {
    pub head: Option<ListNode<T>>,
}

#[derive(Debug)]
pub struct ListNode<T> {
    pub val: T,
    pub next: Option<ListLink<T>>,
}

pub type ListLink<T> = Rc<RefCell<ListNode<T>>>;

impl<T> LinkedList<T> {
    fn from_iter<I>(mut iter: I) -> Self
    where
        I: DoubleEndedIterator<Item = T>,
    {
        let Some(head) = iter.next() else {
            return Self { head: None };
        };

        let mut next = None;
        for val in iter.rev() {
            let node = ListNode { val, next };
            next = Some(ListLink::from(node));
        }

        Self {
            head: Some(ListNode { val: head, next }),
        }
    }
}

impl<T> From<&[T]> for LinkedList<T>
where
    T: Clone,
{
    fn from(value: &[T]) -> Self {
        let iter = value.iter().cloned();
        Self::from_iter(iter)
    }
}

impl<T, const N: usize> From<[T; N]> for LinkedList<T> {
    fn from(value: [T; N]) -> Self {
        let iter = value.into_iter();
        Self::from_iter(iter)
    }
}

impl<T> From<Vec<T>> for LinkedList<T> {
    fn from(value: Vec<T>) -> Self {
        let iter = value.into_iter();
        Self::from_iter(iter)
    }
}

impl<T> From<LinkedList<T>> for HashMap<T, ListLink<T>>
where
    T: Clone + Eq + Hash,
{
    fn from(value: LinkedList<T>) -> Self {
        let mut map = HashMap::new();
        let Some(head) = value.head else {
            return map;
        };

        let val = head.val.clone();
        let mut current = match &head.next {
            None => {
                map.insert(val, ListLink::from(head));
                return map;
            }
            Some(next) => {
                let next = Rc::clone(next);
                map.insert(val, ListLink::from(head));
                next
            }
        };

        loop {
            let borrow = current.borrow();
            let val = borrow.val.clone();
            match &borrow.next {
                None => {
                    drop(borrow);
                    map.insert(val, current);
                    break;
                }
                Some(next) => {
                    let next = Rc::clone(next);
                    drop(borrow);
                    map.insert(val, current);
                    current = next;
                }
            };
        }

        map
    }
}

impl<T> ListNode<T> {
    pub fn new(val: T) -> Self {
        Self { val, next: None }
    }
}

impl<T> From<ListNode<T>> for ListLink<T> {
    fn from(value: ListNode<T>) -> Self {
        Rc::new(RefCell::new(value))
    }
}
