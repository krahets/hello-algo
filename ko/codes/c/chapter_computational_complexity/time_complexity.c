/**
 * File: time_complexity.c
 * Created Time: 2023-01-03
 * Author: codingonion (coderonion@gmail.com)
 */

#include "../utils/common.h"

/* 상수 차수 */
int constant(int n) {
    int count = 0;
    int size = 100000;
    for (int i = 0; i < size; i++) {
        count++;
    }
    return count;
}

/* 선형 차수 */
int linear(int n) {
    int count = 0;
    for (int i = 0; i < n; i++) {
        count++;
    }
    return count;
}

/* 선형 차수(배열 순회) */
int arrayTraversal(int *nums, int n) {
    int count = 0;
    // 반복 횟수는 배열 길이에 비례한다
    for (int i = 0; i < n; i++) {
        count++;
    }
    return count;
}

/* 제곱 차수 */
int quadratic(int n) {
    int count = 0;
    // 반복 횟수는 데이터 크기 n의 제곱에 비례한다
    for (int i = 0; i < n; i++) {
        for (int j = 0; j < n; j++) {
            count++;
        }
    }
    return count;
}

/* 제곱 차수(버블 정렬) */
int bubbleSort(int *nums, int n) {
    int count = 0; // 카운터
    // 바깥쪽 반복문: 정렬되지 않은 구간은 [0, i]이다
    for (int i = n - 1; i > 0; i--) {
        // 안쪽 반복문: 정렬되지 않은 구간 [0, i]의 최댓값을 교환하여 이 구간의 맨 오른쪽으로 옮긴다
        for (int j = 0; j < i; j++) {
            if (nums[j] > nums[j + 1]) {
                // nums[j]와 nums[j + 1]을 교환한다
                int tmp = nums[j];
                nums[j] = nums[j + 1];
                nums[j + 1] = tmp;
                count += 3; // 원소 교환에는 단위 연산 3회가 포함된다
            }
        }
    }
    return count;
}

/* 지수 차수(반복문 구현) */
int exponential(int n) {
    int count = 0;
    int bas = 1;
    // 세포가 매번 둘로 나뉘어 수열 1, 2, 4, 8, ..., 2^(n-1)을 이룬다
    for (int i = 0; i < n; i++) {
        for (int j = 0; j < bas; j++) {
            count++;
        }
        bas *= 2;
    }
    // count = 1 + 2 + 4 + 8 + .. + 2^(n-1) = 2^n - 1
    return count;
}

/* 지수 차수(재귀 구현) */
int expRecur(int n) {
    if (n == 1)
        return 1;
    return expRecur(n - 1) + expRecur(n - 1) + 1;
}

/* 로그 차수(반복문 구현) */
int logarithmic(int n) {
    int count = 0;
    while (n > 1) {
        n = n / 2;
        count++;
    }
    return count;
}

/* 로그 차수(재귀 구현) */
int logRecur(int n) {
    if (n <= 1)
        return 0;
    return logRecur(n / 2) + 1;
}

/* 선형 로그 차수 */
int linearLogRecur(int n) {
    if (n <= 1)
        return 1;
    int count = linearLogRecur(n / 2) + linearLogRecur(n / 2);
    for (int i = 0; i < n; i++) {
        count++;
    }
    return count;
}

/* 팩토리얼 차수(재귀 구현) */
int factorialRecur(int n) {
    if (n == 0)
        return 1;
    int count = 0;
    for (int i = 0; i < n; i++) {
        count += factorialRecur(n - 1);
    }
    return count;
}

/* 실행 코드 */
int main(int argc, char *argv[]) {
    // n을 바꾸어 실행하면서 각 복잡도에서 연산 횟수가 어떻게 변하는지 살펴볼 수 있다
    int n = 8;
    printf("입력 데이터 크기 n = %d\n", n);

    int count = constant(n);
    printf("상수 차수의 연산 횟수 = %d\n", count);

    count = linear(n);
    printf("선형 차수의 연산 횟수 = %d\n", count);
    // 힙 메모리를 할당한다(원소 개수가 n이고 원소 타입이 int인 1차원 가변 길이 배열을 생성한다)
    int *nums = (int *)malloc(n * sizeof(int));
    count = arrayTraversal(nums, n);
    printf("선형 차수(배열 순회)의 연산 횟수 = %d\n", count);

    count = quadratic(n);
    printf("제곱 차수의 연산 횟수 = %d\n", count);
    for (int i = 0; i < n; i++) {
        nums[i] = n - i; // [n,n-1,...,2,1]
    }
    count = bubbleSort(nums, n);
    printf("제곱 차수(버블 정렬)의 연산 횟수 = %d\n", count);

    count = exponential(n);
    printf("지수 차수(반복문 구현)의 연산 횟수 = %d\n", count);
    count = expRecur(n);
    printf("지수 차수(재귀 구현)의 연산 횟수 = %d\n", count);

    count = logarithmic(n);
    printf("로그 차수(반복문 구현)의 연산 횟수 = %d\n", count);
    count = logRecur(n);
    printf("로그 차수(재귀 구현)의 연산 횟수 = %d\n", count);

    count = linearLogRecur(n);
    printf("선형 로그 차수(재귀 구현)의 연산 횟수 = %d\n", count);

    count = factorialRecur(n);
    printf("팩토리얼 차수(재귀 구현)의 연산 횟수 = %d\n", count);

    // 힙 메모리를 해제한다
    if (nums != NULL) {
        free(nums);
        nums = NULL;
    }
    getchar();

    return 0;
}
