/**
 * File: my_list.ts
 * Created Time: 2022-12-11
 * Author: Justin (xiefahit@gmail.com)
 */

/* 串列類別 */
class MyList {
    private arr: Array<number>; // 陣列（儲存串列元素）
    private _capacity: number = 10; // 串列容量
    private _size: number = 0; // 串列長度（當前元素數量）
    private extendRatio: number = 2; // 每次串列擴容的倍數

    /* 建構子 */
    constructor() {
        this.arr = new Array(this._capacity);
    }

    /* 獲取串列長度（當前元素數量）*/
    public size(): number {
        return this._size;
    }

    /* 獲取串列容量 */
    public capacity(): number {
        return this._capacity;
    }

    /* 訪問元素 */
    public get(index: number): number {
        // 索引如果越界，則丟擲異常，下同
        if (index < 0 || index >= this._size) throw new Error('索引越界');
        return this.arr[index];
    }

    /* 更新元素 */
    public set(index: number, num: number): void {
        if (index < 0 || index >= this._size) throw new Error('索引越界');
        this.arr[index] = num;
    }

    /* 在尾部新增元素 */
    public add(num: number): void {
        // 如果長度等於容量，則需要擴容
        if (this._size === this._capacity) this.extendCapacity();
        // 將新元素新增到串列尾部
        this.arr[this._size] = num;
        this._size++;
    }

    /* 在中間插入元素 */
    public insert(index: number, num: number): void {
        if (index < 0 || index >= this._size) throw new Error('索引越界');
        // 元素數量超出容量時，觸發擴容機制
        if (this._size === this._capacity) {
            this.extendCapacity();
        }
        // 將索引 index 以及之後的元素都向後移動一位
        for (let j = this._size - 1; j >= index; j--) {
            this.arr[j + 1] = this.arr[j];
        }
        // 更新元素數量
        this.arr[index] = num;
        this._size++;
    }

    /* 刪除元素 */
    public remove(index: number): number {
        if (index < 0 || index >= this._size) throw new Error('索引越界');
        let num = this.arr[index];
        // 將將索引 index 之後的元素都向前移動一位
        for (let j = index; j < this._size - 1; j++) {
            this.arr[j] = this.arr[j + 1];
        }
        // 更新元素數量
        this._size--;
        // 返回被刪除的元素
        return num;
    }

    /* 串列擴容 */
    public extendCapacity(): void {
        // 新建一個長度為 size 的陣列，並將原陣列複製到新陣列
        this.arr = this.arr.concat(
            new Array(this.capacity() * (this.extendRatio - 1))
        );
        // 更新串列容量
        this._capacity = this.arr.length;
    }

    /* 將串列轉換為陣列 */
    public toArray(): number[] {
        let size = this.size();
        // 僅轉換有效長度範圍內的串列元素
        const arr = new Array(size);
        for (let i = 0; i < size; i++) {
            arr[i] = this.get(i);
        }
        return arr;
    }
}

/* Driver Code */
/* 初始化串列 */
const nums = new MyList();
/* 在尾部新增元素 */
nums.add(1);
nums.add(3);
nums.add(2);
nums.add(5);
nums.add(4);
console.log(
    `串列 nums = ${nums.toArray()} ，容量 = ${nums.capacity()} ，長度 = ${nums.size()}`
);

/* 在中間插入元素 */
nums.insert(3, 6);
console.log(`在索引 3 處插入數字 6 ，得到 nums = ${nums.toArray()}`);

/* 刪除元素 */
nums.remove(3);
console.log(`刪除索引 3 處的元素，得到 nums = ${nums.toArray()}`);

/* 訪問元素 */
const num = nums.get(1);
console.log(`訪問索引 1 處的元素，得到 num = ${num}`);

/* 更新元素 */
nums.set(1, 0);
console.log(`將索引 1 處的元素更新為 0 ，得到 nums = ${nums.toArray()}`);

/* 測試擴容機制 */
for (let i = 0; i < 10; i++) {
    // 在 i = 5 時，串列長度將超出串列容量，此時觸發擴容機制
    nums.add(i);
}
console.log(
    `擴容後的串列 nums = ${nums.toArray()} ，容量 = ${nums.capacity()} ，長度 = ${nums.size()}`
);

export {};
