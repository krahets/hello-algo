use super::{LinkedList, ListNode};
use std::convert::Infallible;
use std::fmt;

impl<T> LinkedList for ListNode<T> {
    type Element = T;
    type Error = &'static str;

    fn len(&self) -> usize {
        let mut count = 1;
        let mut next = self.next.clone();
        while let Some(link) = next {
            count += 1;
            next = link.borrow().next.clone();
        }
        count
    }

    fn try_from_slice(slice: &[Self::Element]) -> Result<Self, Self::Error>
    where
        Self::Element: Clone,
    {
        let iter = slice.iter().cloned();
        Self::try_from_iter(iter).ok_or("切片为空")
    }

    fn try_from_array<const N: usize>(array: [Self::Element; N]) -> Result<Self, Self::Error> {
        let iter = array.into_iter();
        Self::try_from_iter(iter).ok_or("数组为空")
    }

    fn try_from_vec(vec: Vec<Self::Element>) -> Result<Self, Self::Error> {
        let iter = vec.into_iter();
        Self::try_from_iter(iter).ok_or("向量为空")
    }

    fn display_as_list(&self) -> impl fmt::Display
    where
        Self::Element: fmt::Display,
    {
        let head = Some(self);
        ListDisplay { head }
    }

    fn display_as_array(&self) -> impl fmt::Display
    where
        Self::Element: fmt::Display,
    {
        let head = Some(self);
        ArrayDisplay { head }
    }
}

impl<T> LinkedList for Option<ListNode<T>> {
    type Element = T;
    type Error = Infallible;

    fn len(&self) -> usize {
        self.as_ref().map_or(0, ListNode::len)
    }

    fn try_from_slice(slice: &[Self::Element]) -> Result<Self, Self::Error>
    where
        Self::Element: Clone,
    {
        let iter = slice.iter().cloned();
        Ok(ListNode::try_from_iter(iter))
    }

    fn try_from_array<const N: usize>(array: [Self::Element; N]) -> Result<Self, Self::Error> {
        let iter = array.into_iter();
        Ok(ListNode::try_from_iter(iter))
    }

    fn try_from_vec(vec: Vec<Self::Element>) -> Result<Self, Self::Error> {
        let iter = vec.into_iter();
        Ok(ListNode::try_from_iter(iter))
    }

    fn display_as_list(&self) -> impl fmt::Display
    where
        Self::Element: fmt::Display,
    {
        let head = self.as_ref();
        ListDisplay { head }
    }

    fn display_as_array(&self) -> impl fmt::Display
    where
        Self::Element: fmt::Display,
    {
        let head = self.as_ref();
        ArrayDisplay { head }
    }
}

struct ListDisplay<'a, T> {
    head: Option<&'a ListNode<T>>,
}

impl<T> fmt::Display for ListDisplay<'_, T>
where
    T: fmt::Display,
{
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        let Some(head) = self.head else {
            return Ok(());
        };
        write!(f, "{}", head.val)?;
        let mut next = head.next.clone();
        while let Some(link) = next {
            let borrow = link.borrow();
            write!(f, " -> {}", borrow.val)?;
            next = borrow.next.clone();
        }
        Ok(())
    }
}

struct ArrayDisplay<'a, T> {
    head: Option<&'a ListNode<T>>,
}

impl<T> fmt::Display for ArrayDisplay<'_, T>
where
    T: fmt::Display,
{
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        let Some(head) = self.head else {
            return write!(f, "[]");
        };
        write!(f, "[{}", head.val)?;
        let mut next = head.next.clone();
        while let Some(link) = next {
            let borrow = link.borrow();
            write!(f, ", {}", borrow.val)?;
            next = borrow.next.clone();
        }
        write!(f, "]")
    }
}
