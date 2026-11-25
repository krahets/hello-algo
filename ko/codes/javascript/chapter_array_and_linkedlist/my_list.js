/**
 * File: my_list.js
 * Created Time: 2022-12-12
 * Author: Justin (xiefahit@gmail.com)
 */

/* 리스트 클래스 */
class MyList {
    #arr = new Array(); // 배열(리스트 원소 저장)
    #capacity = 10; // 리스트 용량
    #size = 0; // 리스트 길이(현재 원소 수)
    #extendRatio = 2; // 리스트 용량을 늘릴 때마다 적용하는 배수

    /* 생성자 */
    constructor() {
        this.#arr = new Array(this.#capacity);
    }

    /* 리스트 길이(현재 원소 수) 구하기*/
    size() {
        return this.#size;
    }

    /* 리스트 용량 구하기 */
    capacity() {
        return this.#capacity;
    }

    /* 원소 접근 */
    get(index) {
        // 인덱스가 범위를 벗어나면 예외를 던진다. 이하에서도 같다.
        if (index < 0 || index >= this.#size) throw new Error('인덱스 범위 초과');
        return this.#arr[index];
    }

    /* 원소 갱신 */
    set(index, num) {
        if (index < 0 || index >= this.#size) throw new Error('인덱스 범위 초과');
        this.#arr[index] = num;
    }

    /* 맨 뒤에 원소 추가 */
    add(num) {
        // 길이가 용량과 같으면 용량을 늘려야 한다.
        if (this.#size === this.#capacity) {
            this.extendCapacity();
        }
        // 리스트 끝에 새 원소 추가
        this.#arr[this.#size] = num;
        this.#size++;
    }

    /* 중간에 원소 삽입 */
    insert(index, num) {
        if (index < 0 || index >= this.#size) throw new Error('인덱스 범위 초과');
        // 원소 수가 용량을 초과하면 용량을 늘린다.
        if (this.#size === this.#capacity) {
            this.extendCapacity();
        }
        // 인덱스 index부터 끝까지 원소를 뒤로 한 칸씩 이동
        for (let j = this.#size - 1; j >= index; j--) {
            this.#arr[j + 1] = this.#arr[j];
        }
        // 원소 수 갱신
        this.#arr[index] = num;
        this.#size++;
    }

    /* 원소 삭제 */
    remove(index) {
        if (index < 0 || index >= this.#size) throw new Error('인덱스 범위 초과');
        let num = this.#arr[index];
        // 인덱스 index 다음의 원소를 모두 앞으로 한 칸씩 이동
        for (let j = index; j < this.#size - 1; j++) {
            this.#arr[j] = this.#arr[j + 1];
        }
        // 원소 수 갱신
        this.#size--;
        // 삭제한 원소 반환
        return num;
    }

    /* 리스트 용량 늘리기 */
    extendCapacity() {
        // 원래 배열 길이의 extendRatio배인 새 배열을 만들고 원래 배열을 복사
        this.#arr = this.#arr.concat(
            new Array(this.capacity() * (this.#extendRatio - 1))
        );
        // 리스트 용량 갱신
        this.#capacity = this.#arr.length;
    }

    /* 리스트를 배열로 변환 */
    toArray() {
        let size = this.size();
        // 유효한 길이 범위 안의 리스트 원소만 변환
        const arr = new Array(size);
        for (let i = 0; i < size; i++) {
            arr[i] = this.get(i);
        }
        return arr;
    }
}

/* 실행 예제 */
/* 리스트 초기화 */
const nums = new MyList();
/* 맨 뒤에 원소 추가 */
nums.add(1);
nums.add(3);
nums.add(2);
nums.add(5);
nums.add(4);
console.log(
    `리스트 nums = ${nums.toArray()}, 용량 = ${nums.capacity()}, 길이 = ${nums.size()}`
);

/* 중간에 원소 삽입 */
nums.insert(3, 6);
console.log(`인덱스 3에 숫자 6을 삽입한 후 nums = ${nums.toArray()}`);

/* 원소 삭제 */
nums.remove(3);
console.log(`인덱스 3의 원소를 삭제한 후 nums = ${nums.toArray()}`);

/* 원소 접근 */
const num = nums.get(1);
console.log(`인덱스 1의 원소를 읽은 결과 num = ${num}`);

/* 원소 갱신 */
nums.set(1, 0);
console.log(`인덱스 1의 원소를 0으로 바꾼 후 nums = ${nums.toArray()}`);

/* 용량 확장 동작 테스트 */
for (let i = 0; i < 10; i++) {
    // i = 5일 때 리스트 길이가 용량을 초과하게 되어 용량 확장이 일어난다.
    nums.add(i);
}
console.log(
    `용량 확장 후 리스트 nums = ${nums.toArray()}, 용량 = ${nums.capacity()}, 길이 = ${nums.size()}`
);
