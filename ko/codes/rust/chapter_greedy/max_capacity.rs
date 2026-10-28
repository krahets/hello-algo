/*
 * File: coin_change_greedy.rs
 * Created Time: 2023-07-22
 * Author: night-cruise (2586447362@qq.com)
 */

/* 최대 용량: 탐욕 */
fn max_capacity(ht: &[i32]) -> i32 {
    // i와 j가 각각 배열의 양 끝을 가리키도록 초기화한다
    let mut i = 0;
    let mut j = ht.len() - 1;
    // 최대 용량의 초깃값은 0이다
    let mut res = 0;
    // 두 칸막이가 만날 때까지 탐욕적 선택을 반복한다
    while i < j {
        // 최대 용량을 갱신한다
        let cap = std::cmp::min(ht[i], ht[j]) * (j - i) as i32;
        res = std::cmp::max(res, cap);
        // 낮은 칸막이를 안쪽으로 이동한다
        if ht[i] < ht[j] {
            i += 1;
        } else {
            j -= 1;
        }
    }
    res
}

/* 실행 코드 */
fn main() {
    let ht = [3, 8, 5, 2, 7, 7, 3, 4];

    // 탐욕 알고리즘
    let res = max_capacity(&ht);
    println!("최대 용량은 {}이다", res);
}
