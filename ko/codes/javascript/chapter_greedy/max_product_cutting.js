/**
 * File: max_product_cutting.js
 * Created Time: 2023-09-02
 * Author: Justin (xiefahit@gmail.com)
 */

/* 탐욕 알고리즘으로 정수 분할의 최대 곱 구하기 */
function maxProductCutting(n) {
    // n <= 3이면 반드시 1을 하나 떼어 낸다
    if (n <= 3) {
        return 1 * (n - 1);
    }
    // 탐욕적으로 3씩 떼어 낸다. a는 3의 개수이고 b는 나머지이다
    let a = Math.floor(n / 3);
    let b = n % 3;
    if (b === 1) {
        // 나머지가 1이면 1 * 3 한 쌍을 2 * 2로 바꾼다
        return Math.pow(3, a - 1) * 2 * 2;
    }
    if (b === 2) {
        // 나머지가 2이면 그대로 둔다
        return Math.pow(3, a) * 2;
    }
    // 나머지가 0이면 그대로 둔다
    return Math.pow(3, a);
}

/* 실행 예제 */
let n = 58;

// 탐욕 알고리즘
let res = maxProductCutting(n);
console.log(`분할한 수들의 최대 곱: ${res}`);
