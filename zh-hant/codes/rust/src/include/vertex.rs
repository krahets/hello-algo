/*
 * File: vertex.rs
 * Created Time: 2023-07-13
 * Author: night-cruise (2586447362@qq.com)
 */

/* 頂點型別 */
#[derive(Copy, Clone, Hash, PartialEq, Eq)]
pub struct Vertex {
    pub val: i32,
}

impl From<i32> for Vertex {
    fn from(value: i32) -> Self {
        Self { val: value }
    }
}

/* 傳入數值向量 vals，回傳頂點向量 vets */
pub fn vals_to_vets(vals: Vec<i32>) -> Vec<Vertex> {
    vals.into_iter().map(|val| val.into()).collect()
}

/* 傳入頂點向量 vets，回傳數值向量 vals */
pub fn vets_to_vals(vets: Vec<Vertex>) -> Vec<i32> {
    vets.into_iter().map(|vet| vet.val).collect()
}
