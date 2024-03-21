/**
 * File: hash_map_open_addressing.ts
 * Created Time: 2023-08-06
 * Author: yuan0221 (yl1452491917@gmail.com), krahets (krahets@163.com)
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

/* 开放寻址哈希表 */
class HashMapOpenAddressing {
    private size: number; // 键值对数量
    private capacity: number; // 哈希表容量
    private loadThres: number; // 触发扩容的负载因子阈值
    private extendRatio: number; // 扩容倍数
    private buckets: Array<Pair | null>; // 桶数组
    private TOMBSTONE: Pair; // 删除标记

    /* 构造方法 */
    constructor() {
        this.size = 0; // 键值对数量
        this.capacity = 4; // 哈希表容量
        this.loadThres = 2.0 / 3.0; // 触发扩容的负载因子阈值
        this.extendRatio = 2; // 扩容倍数
        this.buckets = Array(this.capacity).fill(null); // 桶数组
        this.TOMBSTONE = new Pair(-1, '-1'); // 删除标记
    }

    /* 哈希函数 */
    private hashFunc(key: number): number {
        return key % this.capacity;
    }

    /* 负载因子 */
    private loadFactor(): number {
        return this.size / this.capacity;
    }

    /* 搜索 key 对应的桶索引 */
    private findBucket(key: number): number {
        let index = this.hashFunc(key);
        let firstTombstone = -1;
        // 线性探测，当遇到空桶时跳出
        while (this.buckets[index] !== null) {
            // 若遇到 key ，返回对应的桶索引
            if (this.buckets[index]!.key === key) {
                // 若之前遇到了删除标记，则将键值对移动至该索引处
                if (firstTombstone !== -1) {
                    this.buckets[firstTombstone] = this.buckets[index];
                    this.buckets[index] = this.TOMBSTONE;
                    return firstTombstone; // 返回移动后的桶索引
                }
                return index; // 返回桶索引
            }
            // 记录遇到的首个删除标记
            if (
                firstTombstone === -1 &&
                this.buckets[index] === this.TOMBSTONE
            ) {
                firstTombstone = index;
            }
            // 计算桶索引，越过尾部则返回头部
            index = (index + 1) % this.capacity;
        }
        // 若 key 不存在，则返回添加点的索引
        return firstTombstone === -1 ? index : firstTombstone;
    }

    /* 查询操作 */
    get(key: number): string | null {
        // 搜索 key 对应的桶索引
        const index = this.findBucket(key);
        // 若找到键值对，则返回对应 val
        if (
            this.buckets[index] !== null &&
            this.buckets[index] !== this.TOMBSTONE
        ) {
            return this.buckets[index]!.val;
        }
        // 若键值对不存在，则返回 null
        return null;
    }

    /* 添加操作 */
    put(key: number, val: string): void {
        // 当负载因子超过阈值时，执行扩容
        if (this.loadFactor() > this.loadThres) {
            this.extend();
        }
        // 搜索 key 对应的桶索引
        const index = this.findBucket(key);
        // 若找到键值对，则覆盖 val 并返回
        if (
            this.buckets[index] !== null &&
            this.buckets[index] !== this.TOMBSTONE
        ) {
            this.buckets[index]!.val = val;
            return;
        }
        // 若键值对不存在，则添加该键值对
        this.buckets[index] = new Pair(key, val);
        this.size++;
    }

    /* 删除操作 */
    remove(key: number): void {
        // 搜索 key 对应的桶索引
        const index = this.findBucket(key);
        // 若找到键值对，则用删除标记覆盖它
        if (
            this.buckets[index] !== null &&
            this.buckets[index] !== this.TOMBSTONE
        ) {
            this.buckets[index] = this.TOMBSTONE;
            this.size--;
        }
    }

    /* 扩容哈希表 */
    private extend(): void {
        // 暂存原哈希表
        const bucketsTmp = this.buckets;
        // 初始化扩容后的新哈希表
        this.capacity *= this.extendRatio;
        this.buckets = Array(this.capacity).fill(null);
        this.size = 0;
        // 将键值对从原哈希表搬运至新哈希表
        for (const pair of bucketsTmp) {
            if (pair !== null && pair !== this.TOMBSTONE) {
                this.put(pair.key, pair.val);
            }
        }
    }

    /* 打印哈希表 */
    print(): void {
        for (const pair of this.buckets) {
            if (pair === null) {
                console.log('null');
            } else if (pair === this.TOMBSTONE) {
                console.log('TOMBSTONE');
            } else {
                console.log(pair.key + ' -> ' + pair.val);
            }
        }
    }
}

/* Driver Code */
// 初始化哈希表
const hashmap = new HashMapOpenAddressing();

// 添加操作
// 在哈希表中添加键值对 (key, val)
hashmap.put(12836, '小哈');
hashmap.put(15937, '小啰');
hashmap.put(16750, '小算');
hashmap.put(13276, '小法');
hashmap.put(10583, '小鸭');
console.log('\n添加完成后，哈希表为\nKey -> Value');
hashmap.print();

// 查询操作
// 向哈希表中输入键 key ，得到值 val
const name = hashmap.get(13276);
console.log('\n输入学号 13276 ，查询到姓名 ' + name);

// 删除操作
// 在哈希表中删除键值对 (key, val)
hashmap.remove(16750);
console.log('\n删除 16750 后，哈希表为\nKey -> Value');
hashmap.print();

export {};
