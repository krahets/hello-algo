/**
 * File: array.c
 * Created Time: 2022-12-20
 * Author: MolDuM (moldum@163.com)
 */

#include "../utils/common.h"

/* 원소에 임의 접근 */
int randomAccess(int *nums, int size) {
    // 구간 [0, size)에서 무작위로 수 하나 선택
    int randomIndex = rand() % size;
    // 무작위 원소를 가져와 반환한다
    int randomNum = nums[randomIndex];
    return randomNum;
}

/* 배열 길이 확장 */
int *extend(int *nums, int size, int enlarge) {
    // 길이를 확장한 배열을 초기화한다
    int *res = (int *)malloc(sizeof(int) * (size + enlarge));
    // 원래 배열의 모든 원소를 새 배열에 복사한다
    for (int i = 0; i < size; i++) {
        res[i] = nums[i];
    }
    // 확장한 공간 초기화
    for (int i = size; i < size + enlarge; i++) {
        res[i] = 0;
    }
    // 확장한 새 배열을 반환한다
    return res;
}

/* 배열의 인덱스 index에 원소 num 삽입 */
void insert(int *nums, int size, int num, int index) {
    // 인덱스 index와 그 뒤에 있는 모든 원소를 한 칸씩 뒤로 이동한다
    for (int i = size - 1; i > index; i--) {
        nums[i] = nums[i - 1];
    }
    // index 위치의 원소에 num을 대입한다
    nums[index] = num;
}

/* 인덱스 index에 있는 원소 삭제 */
// 주의: stdio.h가 remove라는 이름을 사용한다
void removeItem(int *nums, int size, int index) {
    // 인덱스 index 뒤에 있는 모든 원소를 한 칸씩 앞으로 이동한다
    for (int i = index; i < size - 1; i++) {
        nums[i] = nums[i + 1];
    }
}

/* 배열 순회 */
void traverse(int *nums, int size) {
    int count = 0;
    // 인덱스를 통해 배열을 순회한다
    for (int i = 0; i < size; i++) {
        count += nums[i];
    }
}

/* 배열에서 지정한 원소 탐색 */
int find(int *nums, int size, int target) {
    for (int i = 0; i < size; i++) {
        if (nums[i] == target)
            return i;
    }
    return -1;
}

/* 실행 코드 */
int main() {
    /* 난수 시드 초기화(한 번만 실행하면 된다) */
    srand((unsigned)time(NULL));

    /* 배열 초기화 */
    int size = 5;
    int arr[5];
    printf("배열 arr = ");
    printArray(arr, size);

    int nums[] = {1, 3, 2, 5, 4};
    printf("배열 nums = ");
    printArray(nums, size);

    /* 임의 접근 */
    int randomNum = randomAccess(nums, size);
    printf("nums에서 무작위로 가져온 원소: %d", randomNum);

    /* 길이 확장 */
    int enlarge = 3;
    int *res = extend(nums, size, enlarge);
    size += enlarge;
    printf("배열 길이를 8로 확장한 후 nums = ");
    printArray(res, size);

    /* 원소 삽입 */
    insert(res, size, 6, 3);
    printf("인덱스 3에 숫자 6을 삽입한 후 nums = ");
    printArray(res, size);

    /* 원소 삭제 */
    removeItem(res, size, 2);
    printf("인덱스 2의 원소를 삭제한 후 nums = ");
    printArray(res, size);

    /* 배열 순회 */
    traverse(res, size);

    /* 원소 탐색 */
    int index = find(res, size, 3);
    printf("res에서 원소 3을 찾아 얻은 인덱스 = %d\n", index);

    /* 메모리 해제 */
    free(res);
    return 0;
}
