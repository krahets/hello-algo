/**
 * File: hash_map_chaining.ts
 * Created Time: 2023-08-06
 * Author: yuan0221 (yl1452491917@gmail.com)
 */

/* 键值对 Number -> String */
class Pair {
    key: number;
    val: string;
    constructor(key: number, val: string) {
        this.key = key;
        this.val = val;
    }
}

/* 链式地址哈希表 */
class HashMapChaining {
    #size: number; // 键值对数量
    #capacity: number; // 哈希表容量
    #loadThres: number; // 触发扩容的负载因子阈值
    #extendRatio: number; // 扩容倍数
    #buckets: Pair[][]; // 桶数组

    /* 构造方法 */
    constructor() {
        this.#size = 0;
        this.#capacity = 4;
        this.#loadThres = 2.0 / 3.0;
        this.#extendRatio = 2;
        this.#buckets = new Array(this.#capacity).fill(null).map((x) => []);
    }

    /* 哈希函数 */
    #hashFunc(key: number): number {
        return key % this.#capacity;
    }

    /* 负载因子 */
    #loadFactor(): number {
        return this.#size / this.#capacity;
    }

    /* 查询操作 */
    get(key: number): string | null {
        const index = this.#hashFunc(key);
        const bucket = this.#buckets[index];
        // 遍历桶，若找到 key ，则返回对应 val
        for (const pair of bucket) {
            if (pair.key === key) {
                return pair.val;
            }
        }
        // 若未找到 key ，则返回 null
        return null;
    }

    /* 添加操作 */
    put(key: number, val: string): void {
        // 当负载因子超过阈值时，执行扩容
        if (this.#loadFactor() > this.#loadThres) {
            this.#extend();
        }
        const index = this.#hashFunc(key);
        const bucket = this.#buckets[index];
        // 遍历桶，若遇到指定 key ，则更新对应 val 并返回
        for (const pair of bucket) {
            if (pair.key === key) {
                pair.val = val;
                return;
            }
        }
        // 若无该 key ，则将键值对添加至尾部
        const pair = new Pair(key, val);
        bucket.push(pair);
        this.#size++;
    }

    /* 删除操作 */
    remove(key: number): void {
        const index = this.#hashFunc(key);
        let bucket = this.#buckets[index];
        // 遍历桶，从中删除键值对
        for (let i = 0; i < bucket.length; i++) {
            if (bucket[i].key === key) {
                bucket.splice(i, 1);
                this.#size--;
                break;
            }
        }
    }

    /* 扩容哈希表 */
    #extend(): void {
        // 暂存原哈希表
        const bucketsTmp = this.#buckets;
        // 初始化扩容后的新哈希表
        this.#capacity *= this.#extendRatio;
        this.#buckets = new Array(this.#capacity).fill(null).map((x) => []);
        this.#size = 0;
        // 将键值对从原哈希表搬运至新哈希表
        for (const bucket of bucketsTmp) {
            for (const pair of bucket) {
                this.put(pair.key, pair.val);
            }
        }
    }

    /* 打印哈希表 */
    print(): void {
        for (const bucket of this.#buckets) {
            let res = [];
            for (const pair of bucket) {
                res.push(pair.key + ' -> ' + pair.val);
            }
            console.log(res);
        }
    }
}

/* Driver Code */
/* 初始化哈希表 */
const map = new HashMapChaining();

/* 添加操作 */
// 在哈希表中添加键值对 (key, value)
map.put(12836, '小哈');
map.put(15937, '小啰');
map.put(16750, '小算');
map.put(13276, '小法');
map.put(10583, '小鸭');
console.log('\n添加完成后，哈希表为\nKey -> Value');
map.print();

/* 查询操作 */
// 向哈希表中输入键 key ，得到值 value
const name = map.get(13276);
console.log('\n输入学号 13276 ，查询到姓名 ' + name);

/* 删除操作 */
// 在哈希表中删除键值对 (key, value)
map.remove(12836);
console.log('\n删除 12836 后，哈希表为\nKey -> Value');
map.print();

export {};
