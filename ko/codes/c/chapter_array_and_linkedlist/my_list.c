/**
 * File: my_list.c
 * Created Time: 2023-01-12
 * Author: Zero (glj0@outlook.com)
 */

#include "../utils/common.h"

/* 리스트 클래스 */
typedef struct {
    int *arr;        // 배열(리스트 원소 저장)
    int capacity;    // 리스트 용량
    int size;        // 리스트 크기
    int extendRatio; // 리스트 용량을 확장할 때마다 적용하는 배수
} MyList;

void extendCapacity(MyList *nums);

/* 생성자 */
MyList *newMyList() {
    MyList *nums = malloc(sizeof(MyList));
    nums->capacity = 10;
    nums->arr = malloc(sizeof(int) * nums->capacity);
    nums->size = 0;
    nums->extendRatio = 2;
    return nums;
}

/* 소멸자 */
void delMyList(MyList *nums) {
    free(nums->arr);
    free(nums);
}

/* 리스트 길이 구하기 */
int size(MyList *nums) {
    return nums->size;
}

/* 리스트 용량 반환 */
int capacity(MyList *nums) {
    return nums->capacity;
}

/* 원소 접근 */
int get(MyList *nums, int index) {
    assert(index >= 0 && index < nums->size);
    return nums->arr[index];
}

/* 원소 갱신 */
void set(MyList *nums, int index, int num) {
    assert(index >= 0 && index < nums->size);
    nums->arr[index] = num;
}

/* 맨 뒤에 원소 추가 */
void add(MyList *nums, int num) {
    if (size(nums) == capacity(nums)) {
        extendCapacity(nums); // 용량 확장
    }
    nums->arr[size(nums)] = num;
    nums->size++;
}

/* 중간에 원소 삽입 */
void insert(MyList *nums, int index, int num) {
    assert(index >= 0 && index < size(nums));
    // 원소 개수가 용량을 초과하면 용량 확장을 수행한다
    if (size(nums) == capacity(nums)) {
        extendCapacity(nums); // 용량 확장
    }
    for (int i = size(nums); i > index; --i) {
        nums->arr[i] = nums->arr[i - 1];
    }
    nums->arr[index] = num;
    nums->size++;
}

/* 원소 삭제 */
// 주의: stdio.h가 remove라는 이름을 사용한다
int removeItem(MyList *nums, int index) {
    assert(index >= 0 && index < size(nums));
    int num = nums->arr[index];
    for (int i = index; i < size(nums) - 1; i++) {
        nums->arr[i] = nums->arr[i + 1];
    }
    nums->size--;
    return num;
}

/* 리스트 용량 확장 */
void extendCapacity(MyList *nums) {
    // 먼저 공간 할당
    int newCapacity = capacity(nums) * nums->extendRatio;
    int *extend = (int *)malloc(sizeof(int) * newCapacity);
    int *temp = nums->arr;

    // 기존 데이터를 새 공간에 복사
    for (int i = 0; i < size(nums); i++)
        extend[i] = nums->arr[i];

    // 기존 데이터 공간 해제
    free(temp);

    // 새 데이터로 갱신
    nums->arr = extend;
    nums->capacity = newCapacity;
}

/* 출력을 위해 리스트를 Array로 변환 */
int *toArray(MyList *nums) {
    return nums->arr;
}

/* 실행 코드 */
int main() {
    /* 리스트 초기화 */
    MyList *nums = newMyList();
    /* 맨 뒤에 원소 추가 */
    add(nums, 1);
    add(nums, 3);
    add(nums, 2);
    add(nums, 5);
    add(nums, 4);
    printf("리스트 nums = ");
    printArray(toArray(nums), size(nums));
    printf("용량 = %d, 길이 = %d\n", capacity(nums), size(nums));

    /* 중간에 원소 삽입 */
    insert(nums, 3, 6);
    printf("인덱스 3에 숫자 6을 삽입한 후 nums = ");
    printArray(toArray(nums), size(nums));

    /* 원소 삭제 */
    removeItem(nums, 3);
    printf("인덱스 3의 원소를 삭제한 후 nums = ");
    printArray(toArray(nums), size(nums));

    /* 원소 접근 */
    int num = get(nums, 1);
    printf("인덱스 1의 원소에 접근하여 얻은 num = %d\n", num);

    /* 원소 갱신 */
    set(nums, 1, 0);
    printf("인덱스 1의 원소를 0으로 갱신한 후 nums = ");
    printArray(toArray(nums), size(nums));

    /* 용량 확장 동작 테스트 */
    for (int i = 0; i < 10; i++) {
        // i = 5일 때 리스트 길이가 용량을 초과하므로 용량 확장이 수행된다
        add(nums, i);
    }

    printf("용량을 확장한 후 리스트 nums = ");
    printArray(toArray(nums), size(nums));
    printf("용량 = %d, 길이 = %d\n", capacity(nums), size(nums));

    /* 할당한 메모리 해제 */
    delMyList(nums);

    return 0;
}
