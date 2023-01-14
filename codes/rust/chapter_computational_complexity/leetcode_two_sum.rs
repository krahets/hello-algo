/**
 * File: leetcode_two_sum.rs
 * Created Time: 2023-01-14
 * Author: xBLACICEx (xBLACKICEx@outlook.com )
*/

use std::collections::HashMap;
struct SolutionBruteForce;
struct SolutionHashMap;

impl SolutionBruteForce {
    pub fn two_sum(nums: &Vec<i32>, target: i32) -> Vec<i32> {
        for i in 0..nums.len() - 1 {
            for j in i + 1..nums.len() {
                if nums[i] + nums[j] == target {
                    return vec![i as i32, j as i32];
                }
            }
        }
        vec![]
    }
}

impl SolutionHashMap {
    pub fn two_sum(nums: &Vec<i32>, target: i32) -> Vec<i32> {
        let mut hm = HashMap::new();
    
        for (i, n) in nums.iter().enumerate() {
            match hm.get(&(target - n)) {
                Some(v) => return vec![*v as i32, i as i32],
                None => hm.insert(n, i)
            };
        }
        vec![]
    }
}

fn main() {
    let nums = vec![2,7,11,15];
    let target = 9;

    let res = SolutionBruteForce::two_sum(&nums, target);
    println!("方法一 res = {:?}", res);

    let res = SolutionHashMap::two_sum(&nums, target);
    println!("方法二 res = {:?}", res);
}