use crate::fmt::Write;
use std::borrow::Borrow;
use std::collections::{HashMap, HashSet};
use std::fmt;
use std::hash::Hash;

#[derive(Debug, Clone)]
pub struct GraphAdjList<V>(HashMap<V, HashSet<V>>);

impl<V> GraphAdjList<V>
where
    V: Eq + Hash,
{
    pub fn new<I>(edges: I) -> Self
    where
        I: IntoIterator<Item = [V; 2]>,
        V: Clone,
    {
        edges.into_iter().collect()
    }

    pub fn size(&self) -> usize {
        self.0.len()
    }

    pub fn is_empty(&self) -> bool {
        self.0.is_empty()
    }

    pub fn get<U>(&self, v: &U) -> Option<&HashSet<V>>
    where
        U: ?Sized + Eq + Hash,
        V: Borrow<U>,
    {
        self.0.get(v)
    }

    pub fn get_mut<U>(&mut self, v: &U) -> Option<&mut HashSet<V>>
    where
        U: ?Sized + Eq + Hash,
        V: Borrow<U>,
    {
        self.0.get_mut(v)
    }

    pub fn add_edge(&mut self, v1: V, v2: V)
    where
        V: Clone,
    {
        if v1 == v2 {
            return;
        }
        self.0.entry(v1.clone()).or_default().insert(v2.clone());
        self.0.entry(v2).or_default().insert(v1);
    }

    pub fn remove_edge<U, W>(&mut self, v1: &U, v2: &W)
    where
        U: ?Sized + PartialEq<W> + Eq + Hash,
        W: ?Sized + Eq + Hash,
        V: Borrow<U> + Borrow<W>,
    {
        if v1 == v2 {
            return;
        }
        if let Some(neighbors) = self.0.get_mut(v1) {
            neighbors.remove(v2);
        }
        if let Some(neighbors) = self.0.get_mut(v2) {
            neighbors.remove(v1);
        }
    }

    pub fn add_vertex(&mut self, v: V) {
        self.0.entry(v).or_default();
    }

    pub fn remove_vertex<U>(&mut self, v: &U)
    where
        U: ?Sized + Eq + Hash,
        V: Borrow<U>,
    {
        if let Some(neighbors) = self.0.remove(v) {
            for neighbor in &neighbors {
                // 这里 get_mut 的类型推导失败，可能是类型系统的一个 bug。
                if let Some(neighbors) = self.0.get_mut::<V>(neighbor) {
                    neighbors.remove(v);
                }
            }
        }
    }
}

impl<V> FromIterator<(V, V)> for GraphAdjList<V>
where
    V: Clone + Eq + Hash,
{
    fn from_iter<I: IntoIterator<Item = (V, V)>>(iter: I) -> Self {
        let mut graph = Self(HashMap::new());
        for (v1, v2) in iter {
            graph.add_edge(v1, v2);
        }
        graph
    }
}

impl<V> FromIterator<[V; 2]> for GraphAdjList<V>
where
    V: Clone + Eq + Hash,
{
    fn from_iter<I: IntoIterator<Item = [V; 2]>>(iter: I) -> Self {
        iter.into_iter().map(|[v1, v2]| (v1, v2)).collect()
    }
}

impl<V> fmt::Display for GraphAdjList<V>
where
    V: fmt::Display + Eq + Hash,
{
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        if self.0.is_empty() {
            return writeln!(f, "[]");
        }
        writeln!(f, "[")?;
        for (v, neighbors) in &self.0 {
            write!(f, "  {v}: ")?;
            f.write_array(neighbors.iter())?;
            writeln!(f, ",")?;
        }
        writeln!(f, "]")
    }
}
