/**
 * File: hash_map_open_addressing.ts
 * Created Time: 2023-08-06
 * Author: yuan0221 (yl1452491917@gmail.com), krahets (krahets@163.com)
 */

/* 鍵值對 Number -> String */
class Pair {
    key: number;
    val: string;

    constructor(key: number, val: string) {
        this.key = key;
        this.val = val;
    }
}

/* 開放定址雜湊表 */
class HashMapOpenAddressing {
    private size: number; // 鍵值對數量
    private capacity: number; // 雜湊表容量
    private loadThres: number; // 觸發擴容的負載因子閾值
    private extendRatio: number; // 擴容倍數
    private buckets: Array<Pair | null>; // 桶陣列
    private TOMBSTONE: Pair; // 刪除標記

    /* 建構子 */
    constructor() {
        this.size = 0; // 鍵值對數量
        this.capacity = 4; // 雜湊表容量
        this.loadThres = 2.0 / 3.0; // 觸發擴容的負載因子閾值
        this.extendRatio = 2; // 擴容倍數
        this.buckets = Array(this.capacity).fill(null); // 桶陣列
        this.TOMBSTONE = new Pair(-1, '-1'); // 刪除標記
    }

    /* 雜湊函式 */
    private hashFunc(key: number): number {
        return key % this.capacity;
    }

    /* 負載因子 */
    private loadFactor(): number {
        return this.size / this.capacity;
    }

    /* 搜尋 key 對應的桶索引 */
    private findBucket(key: number): number {
        let index = this.hashFunc(key);
        let firstTombstone = -1;
        // 線性探查，當遇到空桶時跳出
        while (this.buckets[index] !== null) {
            // 若遇到 key ，返回對應的桶索引
            if (this.buckets[index]!.key === key) {
                // 若之前遇到了刪除標記，則將鍵值對移動至該索引處
                if (firstTombstone !== -1) {
                    this.buckets[firstTombstone] = this.buckets[index];
                    this.buckets[index] = this.TOMBSTONE;
                    return firstTombstone; // 返回移動後的桶索引
                }
                return index; // 返回桶索引
            }
            // 記錄遇到的首個刪除標記
            if (
                firstTombstone === -1 &&
                this.buckets[index] === this.TOMBSTONE
            ) {
                firstTombstone = index;
            }
            // 計算桶索引，越過尾部則返回頭部
            index = (index + 1) % this.capacity;
        }
        // 若 key 不存在，則返回新增點的索引
        return firstTombstone === -1 ? index : firstTombstone;
    }

    /* 查詢操作 */
    get(key: number): string | null {
        // 搜尋 key 對應的桶索引
        const index = this.findBucket(key);
        // 若找到鍵值對，則返回對應 val
        if (
            this.buckets[index] !== null &&
            this.buckets[index] !== this.TOMBSTONE
        ) {
            return this.buckets[index]!.val;
        }
        // 若鍵值對不存在，則返回 null
        return null;
    }

    /* 新增操作 */
    put(key: number, val: string): void {
        // 當負載因子超過閾值時，執行擴容
        if (this.loadFactor() > this.loadThres) {
            this.extend();
        }
        // 搜尋 key 對應的桶索引
        const index = this.findBucket(key);
        // 若找到鍵值對，則覆蓋 val 並返回
        if (
            this.buckets[index] !== null &&
            this.buckets[index] !== this.TOMBSTONE
        ) {
            this.buckets[index]!.val = val;
            return;
        }
        // 若鍵值對不存在，則新增該鍵值對
        this.buckets[index] = new Pair(key, val);
        this.size++;
    }

    /* 刪除操作 */
    remove(key: number): void {
        // 搜尋 key 對應的桶索引
        const index = this.findBucket(key);
        // 若找到鍵值對，則用刪除標記覆蓋它
        if (
            this.buckets[index] !== null &&
            this.buckets[index] !== this.TOMBSTONE
        ) {
            this.buckets[index] = this.TOMBSTONE;
            this.size--;
        }
    }

    /* 擴容雜湊表 */
    private extend(): void {
        // 暫存原雜湊表
        const bucketsTmp = this.buckets;
        // 初始化擴容後的新雜湊表
        this.capacity *= this.extendRatio;
        this.buckets = Array(this.capacity).fill(null);
        this.size = 0;
        // 將鍵值對從原雜湊表搬運至新雜湊表
        for (const pair of bucketsTmp) {
            if (pair !== null && pair !== this.TOMBSTONE) {
                this.put(pair.key, pair.val);
            }
        }
    }

    /* 列印雜湊表 */
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
// 初始化雜湊表
const hashmap = new HashMapOpenAddressing();

// 新增操作
// 在雜湊表中新增鍵值對 (key, val)
hashmap.put(12836, '小哈');
hashmap.put(15937, '小囉');
hashmap.put(16750, '小算');
hashmap.put(13276, '小法');
hashmap.put(10583, '小鴨');
console.log('\n新增完成後，雜湊表為\nKey -> Value');
hashmap.print();

// 查詢操作
// 向雜湊表中輸入鍵 key ，得到值 val
const name = hashmap.get(13276);
console.log('\n輸入學號 13276 ，查詢到姓名 ' + name);

// 刪除操作
// 在雜湊表中刪除鍵值對 (key, val)
hashmap.remove(16750);
console.log('\n刪除 16750 後，雜湊表為\nKey -> Value');
hashmap.print();

export {};
