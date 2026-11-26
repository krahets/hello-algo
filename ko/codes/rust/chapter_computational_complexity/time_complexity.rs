/*
 * File: time_complexity.rs
 * Created Time: 2023-01-10
 * Author: xBLACICEx (xBLACKICEx@outlook.com), codingonion (coderonion@gmail.com)
 */

/* 상수 차수 */
fn constant(n: i32) -> i32 {
    _ = n;
    let mut count = 0;
    let size = 100_000;
    for _ in 0..size {
        count += 1;
    }
    count
}

/* 선형 차수 */
fn linear(n: i32) -> i32 {
    let mut count = 0;
    for _ in 0..n {
        count += 1;
    }
    count
}

/* 선형 차수(배열 순회) */
fn array_traversal(nums: &[i32]) -> i32 {
    let mut count = 0;
    // 반복 횟수는 배열 길이에 비례한다
    for _ in nums {
        count += 1;
    }
    count
}

/* 이차 차수 */
fn quadratic(n: i32) -> i32 {
    let mut count = 0;
    // 반복 횟수는 데이터 크기 n의 제곱에 비례한다
    for _ in 0..n {
        for _ in 0..n {
            count += 1;
        }
    }
    count
}

/* 이차 차수(버블 정렬) */
fn bubble_sort(nums: &mut [i32]) -> i32 {
    let mut count = 0; // 카운터

    // 바깥 반복문: 정렬되지 않은 구간은 [0, i]이다
    for i in (1..nums.len()).rev() {
        // 안쪽 반복문: 정렬되지 않은 구간 [0, i]에서 가장 큰 원소를 교환을 통해 맨 오른쪽으로 보낸다
        for j in 0..i {
            if nums[j] > nums[j + 1] {
                // nums[j]와 nums[j + 1]의 값을 맞바꾼다
                let tmp = nums[j];
                nums[j] = nums[j + 1];
                nums[j + 1] = tmp;
                count += 3; // 두 원소를 교환하는 데는 기본 연산 3회가 필요하다
            }
        }
    }
    count
}

/* 지수 차수(반복 구현) */
fn exponential(n: i32) -> i32 {
    let mut count = 0;
    let mut base = 1;
    // 세포가 매번 둘로 분열하여 그 수가 1, 2, 4, 8, ..., 2^(n-1)이 된다
    for _ in 0..n {
        for _ in 0..base {
            count += 1
        }
        base *= 2;
    }
    // count = 1 + 2 + 4 + 8 + .. + 2^(n-1) = 2^n - 1
    count
}

/* 지수 차수(재귀 구현) */
fn exp_recur(n: i32) -> i32 {
    if n == 1 {
        return 1;
    }
    exp_recur(n - 1) + exp_recur(n - 1) + 1
}

/* 로그 차수(반복 구현) */
fn logarithmic(mut n: i32) -> i32 {
    let mut count = 0;
    while n > 1 {
        n = n / 2;
        count += 1;
    }
    count
}

/* 로그 차수(재귀 구현) */
fn log_recur(n: i32) -> i32 {
    if n <= 1 {
        return 0;
    }
    log_recur(n / 2) + 1
}

/* 선형 로그 차수 */
fn linear_log_recur(n: i32) -> i32 {
    if n <= 1 {
        return 1;
    }
    let mut count = linear_log_recur(n / 2) + linear_log_recur(n / 2);
    for _ in 0..n {
        count += 1;
    }
    return count;
}

/* 팩토리얼 차수(재귀 구현) */
fn factorial_recur(n: i32) -> i32 {
    if n == 0 {
        return 1;
    }
    let mut count = 0;
    // 하나가 n개로 나뉜다
    for _ in 0..n {
        count += factorial_recur(n - 1);
    }
    count
}

/* 실행 예제 */
fn main() {
    // n을 바꿔 실행하며 복잡도에 따라 연산 횟수가 어떻게 변하는지 살펴보자
    let n: i32 = 8;
    println!("입력 크기 n = {}", n);

    let mut count = constant(n);
    println!("상수 차수 연산 횟수 = {}", count);

    count = linear(n);
    println!("선형 차수 연산 횟수 = {}", count);
    count = array_traversal(&vec![0; n as usize]);
    println!("선형 차수(배열 순회) 연산 횟수 = {}", count);

    count = quadratic(n);
    println!("이차 차수 연산 횟수 = {}", count);
    let mut nums = (1..=n).rev().collect::<Vec<_>>(); // [n,n-1,...,2,1]
    count = bubble_sort(&mut nums);
    println!("이차 차수(버블 정렬) 연산 횟수 = {}", count);

    count = exponential(n);
    println!("지수 차수(반복 구현) 연산 횟수 = {}", count);
    count = exp_recur(n);
    println!("지수 차수(재귀 구현) 연산 횟수 = {}", count);

    count = logarithmic(n);
    println!("로그 차수(반복 구현) 연산 횟수 = {}", count);
    count = log_recur(n);
    println!("로그 차수(재귀 구현) 연산 횟수 = {}", count);

    count = linear_log_recur(n);
    println!("선형 로그 차수(재귀 구현) 연산 횟수 = {}", count);

    count = factorial_recur(n);
    println!("팩토리얼 차수(재귀 구현) 연산 횟수 = {}", count);
}
