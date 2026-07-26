use super::{LinkedList, ListLink, ListNode};
use std::convert::Infallible;
use std::fmt;

impl<T> LinkedList for ListLink<T> {
    type Element = T;
    type Error = &'static str;

    fn len(&self) -> usize {
        let mut count = 1;
        let mut next = self.borrow().next.clone();
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
        ListNode::try_from_iter(iter)
            .map(Self::from)
            .ok_or("切片为空")
    }

    fn try_from_array<const N: usize>(array: [Self::Element; N]) -> Result<Self, Self::Error> {
        let iter = array.into_iter();
        ListNode::try_from_iter(iter)
            .map(Self::from)
            .ok_or("数组为空")
    }

    fn try_from_vec(vec: Vec<Self::Element>) -> Result<Self, Self::Error> {
        let iter = vec.into_iter();
        ListNode::try_from_iter(iter)
            .map(Self::from)
            .ok_or("向量为空")
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

impl<T> LinkedList for Option<ListLink<T>> {
    type Element = T;
    type Error = Infallible;

    fn len(&self) -> usize {
        self.as_ref().map_or(0, ListLink::len)
    }

    fn try_from_slice(slice: &[Self::Element]) -> Result<Self, Self::Error>
    where
        Self::Element: Clone,
    {
        let iter = slice.iter().cloned();
        Ok(ListNode::try_from_iter(iter).map(ListLink::from))
    }

    fn try_from_array<const N: usize>(array: [Self::Element; N]) -> Result<Self, Self::Error> {
        let iter = array.into_iter();
        Ok(ListNode::try_from_iter(iter).map(ListLink::from))
    }

    fn try_from_vec(vec: Vec<Self::Element>) -> Result<Self, Self::Error> {
        let iter = vec.into_iter();
        Ok(ListNode::try_from_iter(iter).map(ListLink::from))
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
    head: Option<&'a ListLink<T>>,
}

impl<T> fmt::Display for ListDisplay<'_, T>
where
    T: fmt::Display,
{
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        let Some(head) = self.head else {
            return Ok(());
        };
        let borrow = head.borrow();
        write!(f, "{}", borrow.val)?;
        let mut next = borrow.next.clone();
        while let Some(link) = next {
            let borrow = link.borrow();
            write!(f, " -> {}", borrow.val)?;
            next = borrow.next.clone();
        }
        Ok(())
    }
}

struct ArrayDisplay<'a, T> {
    head: Option<&'a ListLink<T>>,
}

impl<T> fmt::Display for ArrayDisplay<'_, T>
where
    T: fmt::Display,
{
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        let Some(head) = self.head else {
            return write!(f, "[]");
        };
        let borrow = head.borrow();
        write!(f, "[{}", borrow.val)?;
        let mut next = borrow.next.clone();
        while let Some(link) = next {
            let borrow = link.borrow();
            write!(f, ", {}", borrow.val)?;
            next = borrow.next.clone();
        }
        write!(f, "]")
    }
}
