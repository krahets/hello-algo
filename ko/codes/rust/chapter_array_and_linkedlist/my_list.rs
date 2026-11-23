/*
 * File: my_list.rs
 * Created Time: 2023-03-11
 * Author: codingonion (coderonion@gmail.com)
 */

use hello_algo_rust::include::print_util;

/* 리스트 클래스 */
#[allow(dead_code)]
struct MyList {
    arr: Vec<i32>,       // 배열(리스트 원소 저장)
    capacity: usize,     // 리스트 용량
    size: usize,         // 리스트 길이(현재 원소 개수)
    extend_ratio: usize, // 리스트의 용량을 확장할 때마다 적용하는 배수
}

#[allow(unused, unused_comparisons)]
impl MyList {
    /* 생성자 */
    pub fn new(capacity: usize) -> Self {
        let mut vec = vec![0; capacity];
        Self {
            arr: vec,
            capacity,
            size: 0,
            extend_ratio: 2,
        }
    }

    /* 리스트 길이(현재 원소 개수) 반환*/
    pub fn size(&self) -> usize {
        return self.size;
    }

    /* 리스트 용량 반환 */
    pub fn capacity(&self) -> usize {
        return self.capacity;
    }

    /* 원소 접근 */
    pub fn get(&self, index: usize) -> i32 {
        // 인덱스가 범위를 벗어나면 예외를 발생시킨다. 아래에서도 동일하다
        if index >= self.size {
            panic!("인덱스가 범위를 벗어났다")
        };
        return self.arr[index];
    }

    /* 원소 갱신 */
    pub fn set(&mut self, index: usize, num: i32) {
        if index >= self.size {
            panic!("인덱스가 범위를 벗어났다")
        };
        self.arr[index] = num;
    }

    /* 맨 뒤에 원소 추가 */
    pub fn add(&mut self, num: i32) {
        // 원소 개수가 용량을 초과하면 용량 확장을 수행한다
        if self.size == self.capacity() {
            self.extend_capacity();
        }
        self.arr[self.size] = num;
        // 원소 개수를 갱신한다
        self.size += 1;
    }

    /* 중간에 원소 삽입 */
    pub fn insert(&mut self, index: usize, num: i32) {
        if index >= self.size() {
            panic!("인덱스가 범위를 벗어났다")
        };
        // 원소 개수가 용량을 초과하면 용량 확장을 수행한다
        if self.size == self.capacity() {
            self.extend_capacity();
        }
        // 인덱스 index와 그 뒤의 원소를 모두 한 칸씩 뒤로 이동한다
        for j in (index..self.size).rev() {
            self.arr[j + 1] = self.arr[j];
        }
        self.arr[index] = num;
        // 원소 개수를 갱신한다
        self.size += 1;
    }

    /* 원소 삭제 */
    pub fn remove(&mut self, index: usize) -> i32 {
        if index >= self.size() {
            panic!("인덱스가 범위를 벗어났다")
        };
        let num = self.arr[index];
        // 인덱스 index 뒤의 원소를 모두 한 칸씩 앞으로 이동한다
        for j in index..self.size - 1 {
            self.arr[j] = self.arr[j + 1];
        }
        // 원소 개수를 갱신한다
        self.size -= 1;
        // 삭제한 원소를 반환한다
        return num;
    }

    /* 리스트 용량 확장 */
    pub fn extend_capacity(&mut self) {
        // 길이가 원래 배열의 extend_ratio배인 새 배열을 생성하고, 원래 배열을 새 배열에 복사한다
        let new_capacity = self.capacity * self.extend_ratio;
        self.arr.resize(new_capacity, 0);
        // 리스트 용량을 갱신한다
        self.capacity = new_capacity;
    }

    /* 리스트를 배열로 변환 */
    pub fn to_array(&self) -> Vec<i32> {
        // 유효한 길이 범위 안의 리스트 원소만 변환한다
        let mut arr = Vec::new();
        for i in 0..self.size {
            arr.push(self.get(i));
        }
        arr
    }
}

/* 실행 코드 */
fn main() {
    /* 리스트 초기화 */
    let mut nums = MyList::new(10);
    /* 맨 뒤에 원소 추가 */
    nums.add(1);
    nums.add(3);
    nums.add(2);
    nums.add(5);
    nums.add(4);
    print!("리스트 nums = ");
    print_util::print_array(&nums.to_array());
    print!(" , 용량 = {}, 길이 = {}", nums.capacity(), nums.size());

    /* 중간에 원소 삽입 */
    nums.insert(3, 6);
    print!("\n인덱스 3에 숫자 6을 삽입한 후 nums = ");
    print_util::print_array(&nums.to_array());

    /* 원소 삭제 */
    nums.remove(3);
    print!("\n인덱스 3의 원소를 삭제한 후 nums = ");
    print_util::print_array(&nums.to_array());

    /* 원소 접근 */
    let num = nums.get(1);
    println!("\n인덱스 1의 원소에 접근하여 얻은 num = {num}");

    /* 원소 갱신 */
    nums.set(1, 0);
    print!("인덱스 1의 원소를 0으로 갱신한 후 nums = ");
    print_util::print_array(&nums.to_array());

    /* 용량 확장 동작 테스트 */
    for i in 0..10 {
        // i = 5일 때 리스트 길이가 용량을 초과하므로 용량 확장이 수행된다
        nums.add(i);
    }
    print!("\n용량을 늘린 뒤 리스트 nums = ");
    print_util::print_array(&nums.to_array());
    print!(" , 용량 = {}, 길이 = {}", nums.capacity(), nums.size());
}
