/**
 * File: max_product_cutting.ts
 * Created Time: 2023-09-02
 * Author: Justin (xiefahit@gmail.com)
 */

/* 분할 후의 최대 곱: 탐욕 */
function maxProductCutting(n: number): number {
    // n <= 3이면 반드시 1 하나가 나오도록 분할해야 한다
    if (n <= 3) {
        return 1 * (n - 1);
    }
    // 탐욕적으로 3을 떼어 낸다. a는 3의 개수이고 b는 나머지이다
    let a: number = Math.floor(n / 3);
    let b: number = n % 3;
    if (b === 1) {
        // 나머지가 1이면 1 * 3 한 쌍을 2 * 2로 바꾼다
        return Math.pow(3, a - 1) * 2 * 2;
    }
    if (b === 2) {
        // 나머지가 2이면 별도로 처리하지 않는다
        return Math.pow(3, a) * 2;
    }
    // 나머지가 0이면 별도로 처리하지 않는다
    return Math.pow(3, a);
}

/* 실행 코드 */
let n: number = 58;

// 탐욕 알고리즘
let res: number = maxProductCutting(n);
console.log(`나눈 조각 길이의 최대 곱은 ${res}이다`);

export {};
