/**
 * File: my_list.js
 * Created Time: 2022-12-12
 * Author: Justin (xiefahit@gmail.com)
 */

/* 列表类 */
class MyList {
    #arr = new Array(); // 数组（存储列表元素）
    #capacity = 10; // 列表容量
    #size = 0; // 列表长度（当前元素数量）
    #extendRatio = 2; // 每次列表扩容的倍数

    /* 构造方法 */
    constructor() {
        this.#arr = new Array(this.#capacity);
    }

    /* 获取列表长度（当前元素数量）*/
    size() {
        return this.#size;
    }

    /* 获取列表容量 */
    capacity() {
        return this.#capacity;
    }

    /* 访问元素 */
    get(index) {
        // 索引如果越界，则抛出异常，下同
        if (index < 0 || index >= this.#size) throw new Error('索引越界');
        return this.#arr[index];
    }

    /* 更新元素 */
    set(index, num) {
        if (index < 0 || index >= this.#size) throw new Error('索引越界');
        this.#arr[index] = num;
    }

    /* 在尾部添加元素 */
    add(num) {
        // 如果长度等于容量，则需要扩容
        if (this.#size === this.#capacity) {
            this.extendCapacity();
        }
        // 将新元素添加到列表尾部
        this.#arr[this.#size] = num;
        this.#size++;
    }

    /* 在中间插入元素 */
    insert(index, num) {
        if (index < 0 || index >= this.#size) throw new Error('索引越界');
        // 元素数量超出容量时，触发扩容机制
        if (this.#size === this.#capacity) {
            this.extendCapacity();
        }
        // 将索引 index 以及之后的元素都向后移动一位
        for (let j = this.#size - 1; j >= index; j--) {
            this.#arr[j + 1] = this.#arr[j];
        }
        // 更新元素数量
        this.#arr[index] = num;
        this.#size++;
    }

    /* 删除元素 */
    remove(index) {
        if (index < 0 || index >= this.#size) throw new Error('索引越界');
        let num = this.#arr[index];
        // 将索引 index 之后的元素都向前移动一位
        for (let j = index; j < this.#size - 1; j++) {
            this.#arr[j] = this.#arr[j + 1];
        }
        // 更新元素数量
        this.#size--;
        // 返回被删除的元素
        return num;
    }

    /* 列表扩容 */
    extendCapacity() {
        // 新建一个长度为原数组 extendRatio 倍的新数组，并将原数组复制到新数组
        this.#arr = this.#arr.concat(
            new Array(this.capacity() * (this.#extendRatio - 1))
        );
        // 更新列表容量
        this.#capacity = this.#arr.length;
    }

    /* 将列表转换为数组 */
    toArray() {
        let size = this.size();
        // 仅转换有效长度范围内的列表元素
        const arr = new Array(size);
        for (let i = 0; i < size; i++) {
            arr[i] = this.get(i);
        }
        return arr;
    }
}

/* Driver Code */
/* 初始化列表 */
const nums = new MyList();
/* 在尾部添加元素 */
nums.add(1);
nums.add(3);
nums.add(2);
nums.add(5);
nums.add(4);
console.log(
    `列表 nums = ${nums.toArray()} ，容量 = ${nums.capacity()} ，长度 = ${nums.size()}`
);

/* 在中间插入元素 */
nums.insert(3, 6);
console.log(`在索引 3 处插入数字 6 ，得到 nums = ${nums.toArray()}`);

/* 删除元素 */
nums.remove(3);
console.log(`删除索引 3 处的元素，得到 nums = ${nums.toArray()}`);

/* 访问元素 */
const num = nums.get(1);
console.log(`访问索引 1 处的元素，得到 num = ${num}`);

/* 更新元素 */
nums.set(1, 0);
console.log(`将索引 1 处的元素更新为 0 ，得到 nums = ${nums.toArray()}`);

/* 测试扩容机制 */
for (let i = 0; i < 10; i++) {
    // 在 i = 5 时，列表长度将超出列表容量，此时触发扩容机制
    nums.add(i);
}
console.log(
    `扩容后的列表 nums = ${nums.toArray()} ，容量 = ${nums.capacity()} ，长度 = ${nums.size()}`
);
