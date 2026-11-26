/*
 * File: coin_change_greedy.rs
 * Created Time: 2023-07-22
 * Author: night-cruise (2586447362@qq.com)
 */

/* 물건 */
struct Item {
    w: i32, // 물건의 무게
    v: i32, // 물건의 가치
}

impl Item {
    fn new(w: i32, v: i32) -> Self {
        Self { w, v }
    }
}

/* 탐욕 알고리즘으로 분할 가능 배낭 풀기 */
fn fractional_knapsack(wgt: &[i32], val: &[i32], mut cap: i32) -> f64 {
    // 무게와 가치를 속성으로 갖는 물건의 리스트를 만든다
    let mut items = wgt
        .iter()
        .zip(val.iter())
        .map(|(&w, &v)| Item::new(w, v))
        .collect::<Vec<Item>>();
    // 단위 가치 item.v / item.w를 기준으로 내림차순 정렬한다
    items.sort_by(|a, b| {
        (b.v as f64 / b.w as f64)
            .partial_cmp(&(a.v as f64 / a.w as f64))
            .unwrap()
    });
    // 탐욕 선택을 반복한다
    let mut res = 0.0;
    for item in &items {
        if item.w <= cap {
            // 남은 용량이 충분하면 현재 물건을 통째로 배낭에 담는다
            res += item.v as f64;
            cap -= item.w;
        } else {
            // 남은 용량이 부족하면 현재 물건의 일부만 배낭에 담는다
            res += item.v as f64 / item.w as f64 * cap as f64;
            // 남은 용량이 없으므로 반복문을 빠져나온다
            break;
        }
    }
    res
}

/* 실행 예제 */
fn main() {
    let wgt = [10, 20, 30, 40, 50];
    let val = [50, 120, 150, 210, 240];
    let cap = 50;

    // 탐욕 알고리즘
    let res = fractional_knapsack(&wgt, &val, cap);
    println!("배낭 용량 안에서 얻는 최대 가치: {}", res);
}
