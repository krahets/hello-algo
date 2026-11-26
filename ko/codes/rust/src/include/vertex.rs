/*
 * File: vertex.rs
 * Created Time: 2023-07-13
 * Author: night-cruise (2586447362@qq.com)
 */

/* 정점 타입 */
#[derive(Copy, Clone, Hash, PartialEq, Eq)]
pub struct Vertex {
    pub val: i32,
}

impl From<i32> for Vertex {
    fn from(value: i32) -> Self {
        Self { val: value }
    }
}

/* 값 리스트 vals를 받아 정점 리스트 vets를 반환한다. */
pub fn vals_to_vets(vals: Vec<i32>) -> Vec<Vertex> {
    vals.into_iter().map(|val| val.into()).collect()
}

/* 정점 리스트 vets를 받아 값 리스트 vals를 반환한다. */
pub fn vets_to_vals(vets: Vec<Vertex>) -> Vec<i32> {
    vets.into_iter().map(|vet| vet.val).collect()
}
