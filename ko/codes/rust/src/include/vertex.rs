/*
 * File: vertex.rs
 * Created Time: 2023-07-13
 * Author: night-cruise (2586447362@qq.com)
 */

/* 정점 자료형 */
#[derive(Copy, Clone, Hash, PartialEq, Eq)]
pub struct Vertex {
    pub val: i32,
}

impl From<i32> for Vertex {
    fn from(value: i32) -> Self {
        Self { val: value }
    }
}

/* 값의 리스트 vals를 입력받아 정점 리스트 vets 반환 */
pub fn vals_to_vets(vals: Vec<i32>) -> Vec<Vertex> {
    vals.into_iter().map(|val| val.into()).collect()
}

/* 정점 리스트 vets를 입력받아 값의 리스트 vals 반환 */
pub fn vets_to_vals(vets: Vec<Vertex>) -> Vec<i32> {
    vets.into_iter().map(|vet| vet.val).collect()
}
