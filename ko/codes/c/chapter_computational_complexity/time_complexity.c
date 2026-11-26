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

/* 이차 차수 */
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

/* 이차 차수(버블 정렬) */
int bubbleSort(int *nums, int n) {
    int count = 0; // 카운터
    // 바깥 반복문: 정렬되지 않은 구간은 [0, i]이다
    for (int i = n - 1; i > 0; i--) {
        // 안쪽 반복문: 정렬되지 않은 구간 [0, i]에서 가장 큰 원소를 교환을 통해 맨 오른쪽으로 보낸다
        for (int j = 0; j < i; j++) {
            if (nums[j] > nums[j + 1]) {
                // nums[j]와 nums[j + 1]의 값을 맞바꾼다
                int tmp = nums[j];
                nums[j] = nums[j + 1];
                nums[j + 1] = tmp;
                count += 3; // 두 원소를 교환하는 데는 기본 연산 3회가 필요하다
            }
        }
    }
    return count;
}

/* 지수 차수(반복 구현) */
int exponential(int n) {
    int count = 0;
    int bas = 1;
    // 세포가 매번 둘로 분열하여 그 수가 1, 2, 4, 8, ..., 2^(n-1)이 된다
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

/* 로그 차수(반복 구현) */
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

/* 실행 예제 */
int main(int argc, char *argv[]) {
    // n을 바꿔 실행하며 복잡도에 따라 연산 횟수가 어떻게 변하는지 살펴보자
    int n = 8;
    printf("입력 크기 n = %d\n", n);

    int count = constant(n);
    printf("상수 차수 연산 횟수 = %d\n", count);

    count = linear(n);
    printf("선형 차수 연산 횟수 = %d\n", count);
    // 힙 메모리 할당(int형 원소 n개로 이루어진 가변 길이 1차원 배열 생성)
    int *nums = (int *)malloc(n * sizeof(int));
    count = arrayTraversal(nums, n);
    printf("선형 차수(배열 순회) 연산 횟수 = %d\n", count);

    count = quadratic(n);
    printf("이차 차수 연산 횟수 = %d\n", count);
    for (int i = 0; i < n; i++) {
        nums[i] = n - i; // [n,n-1,...,2,1]
    }
    count = bubbleSort(nums, n);
    printf("이차 차수(버블 정렬) 연산 횟수 = %d\n", count);

    count = exponential(n);
    printf("지수 차수(반복 구현) 연산 횟수 = %d\n", count);
    count = expRecur(n);
    printf("지수 차수(재귀 구현) 연산 횟수 = %d\n", count);

    count = logarithmic(n);
    printf("로그 차수(반복 구현) 연산 횟수 = %d\n", count);
    count = logRecur(n);
    printf("로그 차수(재귀 구현) 연산 횟수 = %d\n", count);

    count = linearLogRecur(n);
    printf("선형 로그 차수(재귀 구현) 연산 횟수 = %d\n", count);

    count = factorialRecur(n);
    printf("팩토리얼 차수(재귀 구현) 연산 횟수 = %d\n", count);

    // 힙 메모리 해제
    if (nums != NULL) {
        free(nums);
        nums = NULL;
    }
    getchar();

    return 0;
}
