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

use crate::fmt::Write;
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
        f.write_array(self.slice)
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
        f.write_complete_binary_tree(self.slice)
    }
}
