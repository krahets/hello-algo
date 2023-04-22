/**
 * File: my_list.ts
 * Created Time: 2022-12-11
 * Author: Justin (xiefahit@gmail.com)
 */

/* 列表类简易实现 */
class MyList {
    private nums: Array<number>; // 数组（存储列表元素）
    private _capacity: number = 10; // 列表容量
    private _size: number = 0; // 列表长度（即当前元素数量）
    private extendRatio: number = 2; // 每次列表扩容的倍数

    /* 构造方法 */
    constructor() {
        this.nums = new Array(this._capacity);
    }

    /* 获取列表长度（即当前元素数量）*/
    public size(): number {
        return this._size;
    }

    /* 获取列表容量 */
    public capacity(): number {
        return this._capacity;
    }

    /* 访问元素 */
    public get(index: number): number {
        // 索引如果越界则抛出异常，下同
        if (index < 0 || index >= this._size) throw new Error('索引越界');
        return this.nums[index];
    }

    /* 更新元素 */
    public set(index: number, num: number): void {
        if (index < 0 || index >= this._size) throw new Error('索引越界');
        this.nums[index] = num;
    }

    /* 尾部添加元素 */
    public add(num: number): void {
        // 如果长度等于容量，则需要扩容
        if (this._size === this._capacity) this.extendCapacity();
        // 将新元素添加到列表尾部
        this.nums[this._size] = num;
        this._size++;
    }

    /* 中间插入元素 */
    public insert(index: number, num: number): void {
        if (index < 0 || index >= this._size) throw new Error('索引越界');
        // 元素数量超出容量时，触发扩容机制
        if (this._size === this._capacity) {
            this.extendCapacity();
        }
        // 将索引 index 以及之后的元素都向后移动一位
        for (let j = this._size - 1; j >= index; j--) {
            this.nums[j + 1] = this.nums[j];
        }
        // 更新元素数量
        this.nums[index] = num;
        this._size++;
    }

    /* 删除元素 */
    public remove(index: number): number {
        if (index < 0 || index >= this._size) throw new Error('索引越界');
        let num = this.nums[index];
        // 将索引 index 之后的元素都向前移动一位
        for (let j = index; j < this._size - 1; j++) {
            this.nums[j] = this.nums[j + 1];
        }
        // 更新元素数量
        this._size--;
        // 返回被删除元素
        return num;
    }

    /* 列表扩容 */
    public extendCapacity(): void {
        // 新建一个长度为 size 的数组，并将原数组拷贝到新数组
        this.nums = this.nums.concat(
            new Array(this.capacity() * (this.extendRatio - 1))
        );
        // 更新列表容量
        this._capacity = this.nums.length;
    }

    /* 将列表转换为数组 */
    public toArray(): number[] {
        let size = this.size();
        // 仅转换有效长度范围内的列表元素
        const nums = new Array(size);
        for (let i = 0; i < size; i++) {
            nums[i] = this.get(i);
        }
        return nums;
    }
}

/* Driver Code */
/* 初始化列表 */
const list = new MyList();
/* 尾部添加元素 */
list.add(1);
list.add(3);
list.add(2);
list.add(5);
list.add(4);
console.log(
    `列表 list = ${list.toArray()} ，容量 = ${list.capacity()} ，长度 = ${list.size()}`
);

/* 中间插入元素 */
list.insert(3, 6);
console.log(`在索引 3 处插入数字 6 ，得到 list = ${list.toArray()}`);

/* 删除元素 */
list.remove(3);
console.log(`删除索引 3 处的元素，得到 list = ${list.toArray()}`);

/* 访问元素 */
const num = list.get(1);
console.log(`访问索引 1 处的元素，得到 num = ${num}`);

/* 更新元素 */
list.set(1, 0);
console.log(`将索引 1 处的元素更新为 0 ，得到 list = ${list.toArray()}`);

/* 测试扩容机制 */
for (let i = 0; i < 10; i++) {
    // 在 i = 5 时，列表长度将超出列表容量，此时触发扩容机制
    list.add(i);
}
console.log(
    `扩容后的列表 list = ${list.toArray()} ，容量 = ${list.capacity()} ，长度 = ${list.size()}`
);

export {};
