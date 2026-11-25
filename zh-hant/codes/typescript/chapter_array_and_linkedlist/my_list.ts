/**
 * File: my_list.ts
 * Created Time: 2022-12-11
 * Author: Justin (xiefahit@gmail.com)
 */

/* 列表類別 */
class MyList {
    private arr: Array<number>; // 陣列（用來儲存列表元素）
    private _capacity: number = 10; // 列表容量
    private _size: number = 0; // 列表長度（目前的元素數量）
    private extendRatio: number = 2; // 每次擴充列表容量的倍數

    /* 建構方法 */
    constructor() {
        this.arr = new Array(this._capacity);
    }

    /* 取得列表長度（目前的元素數量）*/
    public size(): number {
        return this._size;
    }

    /* 取得列表容量 */
    public capacity(): number {
        return this._capacity;
    }

    /* 存取元素 */
    public get(index: number): number {
        // 若索引超出範圍，就拋出例外，以下同理
        if (index < 0 || index >= this._size) throw new Error('索引超出範圍');
        return this.arr[index];
    }

    /* 更新元素 */
    public set(index: number, num: number): void {
        if (index < 0 || index >= this._size) throw new Error('索引超出範圍');
        this.arr[index] = num;
    }

    /* 在尾端加入元素 */
    public add(num: number): void {
        // 若長度等於容量，就需要擴充容量
        if (this._size === this._capacity) this.extendCapacity();
        // 將新元素加入列表尾端
        this.arr[this._size] = num;
        this._size++;
    }

    /* 在中間插入元素 */
    public insert(index: number, num: number): void {
        if (index < 0 || index >= this._size) throw new Error('索引超出範圍');
        // 若加入元素後數量將超過容量，就觸發擴充機制
        if (this._size === this._capacity) {
            this.extendCapacity();
        }
        // 將索引 index 起的所有元素往後移一格
        for (let j = this._size - 1; j >= index; j--) {
            this.arr[j + 1] = this.arr[j];
        }
        // 更新元素數量
        this.arr[index] = num;
        this._size++;
    }

    /* 刪除元素 */
    public remove(index: number): number {
        if (index < 0 || index >= this._size) throw new Error('索引超出範圍');
        let num = this.arr[index];
        // 將索引 index 之後的所有元素往前移一格
        for (let j = index; j < this._size - 1; j++) {
            this.arr[j] = this.arr[j + 1];
        }
        // 更新元素數量
        this._size--;
        // 回傳刪除的元素
        return num;
    }

    /* 擴充列表容量 */
    public extendCapacity(): void {
        // 建立長度為 size 的陣列，並將原陣列的內容複製過去
        this.arr = this.arr.concat(
            new Array(this.capacity() * (this.extendRatio - 1))
        );
        // 更新列表容量
        this._capacity = this.arr.length;
    }

    /* 將列表轉為陣列 */
    public toArray(): number[] {
        let size = this.size();
        // 僅轉換列表有效長度範圍內的元素
        const arr = new Array(size);
        for (let i = 0; i < size; i++) {
            arr[i] = this.get(i);
        }
        return arr;
    }
}

/* 範例主程式 */
/* 初始化列表 */
const nums = new MyList();
/* 在尾端加入元素 */
nums.add(1);
nums.add(3);
nums.add(2);
nums.add(5);
nums.add(4);
console.log(
    `列表 nums = ${nums.toArray()}，容量 = ${nums.capacity()}，長度 = ${nums.size()}`
);

/* 在中間插入元素 */
nums.insert(3, 6);
console.log(`在索引 3 處插入數字 6，得到 nums = ${nums.toArray()}`);

/* 刪除元素 */
nums.remove(3);
console.log(`刪除索引 3 處的元素，得到 nums = ${nums.toArray()}`);

/* 存取元素 */
const num = nums.get(1);
console.log(`存取索引 1 處的元素，得到 num = ${num}`);

/* 更新元素 */
nums.set(1, 0);
console.log(`將索引 1 處的元素更新為 0，得到 nums = ${nums.toArray()}`);

/* 測試容量擴充機制 */
for (let i = 0; i < 10; i++) {
    // 當 i = 5，列表長度將超過容量，此時會觸發擴充機制
    nums.add(i);
}
console.log(
    `擴充後的列表 nums = ${nums.toArray()}，容量 = ${nums.capacity()}，長度 = ${nums.size()}`
);

export {};
