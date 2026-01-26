//! 本模块仅用于示例代码，不建议在生产环境中使用。
//!
//! 为了与示例代码中 `Rc<RefCell<ListNode>>` 保持一致，本模块中的 [`ListLink`] 是前者的
//! 类型别名而非包装类型。由于孤儿法则，本模块额外定义了 [`LinkedList`] trait 以为其实现关
//! 联函数和方法，你不必为自己的链表类型定义或实现类似的 trait。为了方便示例代码的编写和阅读，
//! 在本模块中，实现了 [`LinkedList`] 的类型有：
//!
//! - [`ListNode`]
//! - [`ListLink`]
//! - `Option<ListNode>`
//! - `Option<ListLink>`
//!
//! 它们都被视为链表。参考实现时，以上类型作为实现细节不应暴露为公共接口，否则可能发生链表成环，
//! 这会导致内存泄露、迭代无法终止等系列问题。

use std::cell::RefCell;
use std::fmt;
use std::rc::Rc;

mod link_impl;
mod node_impl;

pub trait LinkedList {
    type Element;
    type Error;

    fn len(&self) -> usize;

    fn is_empty(&self) -> bool {
        self.len() == 0
    }

    fn try_from_slice(slice: &[Self::Element]) -> Result<Self, Self::Error>
    where
        Self: Sized,
        Self::Element: Clone;

    fn try_from_array<const N: usize>(array: [Self::Element; N]) -> Result<Self, Self::Error>
    where
        Self: Sized;

    fn try_from_vec(vec: Vec<Self::Element>) -> Result<Self, Self::Error>
    where
        Self: Sized;

    fn display_as_list(&self) -> impl fmt::Display
    where
        Self::Element: fmt::Display;

    fn display_as_array(&self) -> impl fmt::Display
    where
        Self::Element: fmt::Display;
}

#[derive(Debug, Clone)]
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

    fn try_from_iter<I>(mut iter: I) -> Option<Self>
    where
        I: DoubleEndedIterator<Item = T>,
    {
        let head = iter.next()?;

        let mut next = None;
        for val in iter.rev() {
            let node = Self { val, next };
            next = Some(ListLink::from(node));
        }

        Some(Self { val: head, next })
    }
}

impl<T> From<ListNode<T>> for ListLink<T> {
    fn from(value: ListNode<T>) -> Self {
        Rc::new(RefCell::new(value))
    }
}
