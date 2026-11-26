/*
 * File: vertex.rs
 * Created Time: 2023-07-13
 * Author: night-cruise (2586447362@qq.com)
 */

/* Тип вершины */
#[derive(Copy, Clone, Hash, PartialEq, Eq)]
pub struct Vertex {
    pub val: i32,
}

impl From<i32> for Vertex {
    fn from(value: i32) -> Self {
        Self { val: value }
    }
}

/* Принять список значений vals и вернуть список вершин vets */
pub fn vals_to_vets(vals: Vec<i32>) -> Vec<Vertex> {
    vals.into_iter().map(|val| val.into()).collect()
}

/* Принять список вершин vets и вернуть список значений vals */
pub fn vets_to_vals(vets: Vec<Vertex>) -> Vec<i32> {
    vets.into_iter().map(|vet| vet.val).collect()
}
