/**
 * File: my_list.ts
 * Created Time: 2022-12-11
 * Author: Justin (xiefahit@gmail.com)
 */

/* 리스트 클래스 */
class MyList {
    private arr: Array<number>; // 배열(리스트 원소 저장)
    private _capacity: number = 10; // 리스트 용량
    private _size: number = 0; // 리스트 길이(현재 원소 개수)
    private extendRatio: number = 2; // 리스트의 용량을 확장할 때마다 적용하는 배수

    /* 생성자 */
    constructor() {
        this.arr = new Array(this._capacity);
    }

    /* 리스트 길이(현재 원소 개수) 반환*/
    public size(): number {
        return this._size;
    }

    /* 리스트 용량 반환 */
    public capacity(): number {
        return this._capacity;
    }

    /* 원소 접근 */
    public get(index: number): number {
        // 인덱스가 범위를 벗어나면 예외를 발생시킨다. 아래에서도 동일하다
        if (index < 0 || index >= this._size) throw new Error('인덱스가 범위를 벗어났다');
        return this.arr[index];
    }

    /* 원소 갱신 */
    public set(index: number, num: number): void {
        if (index < 0 || index >= this._size) throw new Error('인덱스가 범위를 벗어났다');
        this.arr[index] = num;
    }

    /* 맨 뒤에 원소 추가 */
    public add(num: number): void {
        // 길이가 용량과 같으면 용량을 확장해야 한다
        if (this._size === this._capacity) this.extendCapacity();
        // 새 원소를 리스트 맨 뒤에 추가한다
        this.arr[this._size] = num;
        this._size++;
    }

    /* 중간에 원소 삽입 */
    public insert(index: number, num: number): void {
        if (index < 0 || index >= this._size) throw new Error('인덱스가 범위를 벗어났다');
        // 원소 개수가 용량을 초과하면 용량 확장을 수행한다
        if (this._size === this._capacity) {
            this.extendCapacity();
        }
        // 인덱스 index와 그 뒤의 원소를 모두 한 칸씩 뒤로 이동한다
        for (let j = this._size - 1; j >= index; j--) {
            this.arr[j + 1] = this.arr[j];
        }
        // 원소 개수를 갱신한다
        this.arr[index] = num;
        this._size++;
    }

    /* 원소 삭제 */
    public remove(index: number): number {
        if (index < 0 || index >= this._size) throw new Error('인덱스가 범위를 벗어났다');
        let num = this.arr[index];
        // 인덱스 index 뒤의 원소를 모두 한 칸씩 앞으로 이동한다
        for (let j = index; j < this._size - 1; j++) {
            this.arr[j] = this.arr[j + 1];
        }
        // 원소 개수를 갱신한다
        this._size--;
        // 삭제한 원소를 반환한다
        return num;
    }

    /* 리스트 용량 확장 */
    public extendCapacity(): void {
        // 길이가 size인 새 배열을 생성하고, 원래 배열을 새 배열에 복사한다
        this.arr = this.arr.concat(
            new Array(this.capacity() * (this.extendRatio - 1))
        );
        // 리스트 용량을 갱신한다
        this._capacity = this.arr.length;
    }

    /* 리스트를 배열로 변환 */
    public toArray(): number[] {
        let size = this.size();
        // 유효한 길이 범위 안의 리스트 원소만 변환한다
        const arr = new Array(size);
        for (let i = 0; i < size; i++) {
            arr[i] = this.get(i);
        }
        return arr;
    }
}

/* 실행 코드 */
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
console.log(`인덱스 1의 원소에 접근하여 얻은 num = ${num}`);

/* 원소 갱신 */
nums.set(1, 0);
console.log(`인덱스 1의 원소를 0으로 갱신한 후 nums = ${nums.toArray()}`);

/* 용량 확장 동작 테스트 */
for (let i = 0; i < 10; i++) {
    // i = 5일 때 리스트 길이가 용량을 초과하므로 용량 확장이 수행된다
    nums.add(i);
}
console.log(
    `용량을 확장한 후 리스트 nums = ${nums.toArray()}, 용량 = ${nums.capacity()}, 길이 = ${nums.size()}`
);

export {};
