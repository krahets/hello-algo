/**
 * File: hashMapOpenAddressing.js
 * Created Time: 2023-06-13
 * Author: yuan0221 (yl1452491917@gmail.com), krahets (krahets@163.com)
 */

/* 鍵值對 Number -> String */
class Pair {
    constructor(key, val) {
        this.key = key;
        this.val = val;
    }
}

/* 採用開放定址法的雜湊表 */
class HashMapOpenAddressing {
    #size; // 鍵值對數量
    #capacity; // 雜湊表容量
    #loadThres; // 觸發容量擴充的負載因子門檻
    #extendRatio; // 容量擴充倍數
    #buckets; // 桶陣列
    #TOMBSTONE; // 刪除標記

    /* 建構方法 */
    constructor() {
        this.#size = 0; // 鍵值對數量
        this.#capacity = 4; // 雜湊表容量
        this.#loadThres = 2.0 / 3.0; // 觸發容量擴充的負載因子門檻
        this.#extendRatio = 2; // 容量擴充倍數
        this.#buckets = Array(this.#capacity).fill(null); // 桶陣列
        this.#TOMBSTONE = new Pair(-1, '-1'); // 刪除標記
    }

    /* 雜湊函式 */
    #hashFunc(key) {
        return key % this.#capacity;
    }

    /* 負載因子 */
    #loadFactor() {
        return this.#size / this.#capacity;
    }

    /* 尋找 key 對應的桶索引 */
    #findBucket(key) {
        let index = this.#hashFunc(key);
        let firstTombstone = -1;
        // 進行線性探測，遇到空桶就跳出迴圈
        while (this.#buckets[index] !== null) {
            // 若遇到 key，回傳對應的桶索引
            if (this.#buckets[index].key === key) {
                // 若先前遇過刪除標記，將鍵值對移到該標記所在的索引位置
                if (firstTombstone !== -1) {
                    this.#buckets[firstTombstone] = this.#buckets[index];
                    this.#buckets[index] = this.#TOMBSTONE;
                    return firstTombstone; // 回傳移動後的桶索引
                }
                return index; // 回傳桶索引
            }
            // 記錄遇到的第一個刪除標記
            if (
                firstTombstone === -1 &&
                this.#buckets[index] === this.#TOMBSTONE
            ) {
                firstTombstone = index;
            }
            // 計算桶索引，超過陣列尾端就回到開頭
            index = (index + 1) % this.#capacity;
        }
        // 若 key 不存在，回傳可插入位置的索引
        return firstTombstone === -1 ? index : firstTombstone;
    }

    /* 查詢操作 */
    get(key) {
        // 尋找 key 對應的桶索引
        const index = this.#findBucket(key);
        // 若找到鍵值對，回傳對應的 val
        if (
            this.#buckets[index] !== null &&
            this.#buckets[index] !== this.#TOMBSTONE
        ) {
            return this.#buckets[index].val;
        }
        // 若鍵值對不存在，回傳 null
        return null;
    }

    /* 新增操作 */
    put(key, val) {
        // 當負載因子超過門檻時，擴充容量
        if (this.#loadFactor() > this.#loadThres) {
            this.#extend();
        }
        // 尋找 key 對應的桶索引
        const index = this.#findBucket(key);
        // 若找到鍵值對，覆寫 val 並結束操作
        if (
            this.#buckets[index] !== null &&
            this.#buckets[index] !== this.#TOMBSTONE
        ) {
            this.#buckets[index].val = val;
            return;
        }
        // 若鍵值對不存在，新增該鍵值對
        this.#buckets[index] = new Pair(key, val);
        this.#size++;
    }

    /* 刪除操作 */
    remove(key) {
        // 尋找 key 對應的桶索引
        const index = this.#findBucket(key);
        // 若找到鍵值對，以刪除標記取代它
        if (
            this.#buckets[index] !== null &&
            this.#buckets[index] !== this.#TOMBSTONE
        ) {
            this.#buckets[index] = this.#TOMBSTONE;
            this.#size--;
        }
    }

    /* 擴充雜湊表容量 */
    #extend() {
        // 暫存原本的雜湊表
        const bucketsTmp = this.#buckets;
        // 初始化擴充後的新雜湊表
        this.#capacity *= this.#extendRatio;
        this.#buckets = Array(this.#capacity).fill(null);
        this.#size = 0;
        // 將鍵值對從原本的雜湊表移到新表
        for (const pair of bucketsTmp) {
            if (pair !== null && pair !== this.#TOMBSTONE) {
                this.put(pair.key, pair.val);
            }
        }
    }

    /* 印出雜湊表 */
    print() {
        for (const pair of this.#buckets) {
            if (pair === null) {
                console.log('null');
            } else if (pair === this.#TOMBSTONE) {
                console.log('TOMBSTONE');
            } else {
                console.log(pair.key + ' -> ' + pair.val);
            }
        }
    }
}

/* 主程式 */
// 初始化雜湊表
const hashmap = new HashMapOpenAddressing();

// 新增操作
// 在雜湊表中新增鍵值對 (key, val)
hashmap.put(12836, '小哈');
hashmap.put(15937, '小囉');
hashmap.put(16750, '小算');
hashmap.put(13276, '小法');
hashmap.put(10583, '小鴨');
console.log('\n新增後的雜湊表\nKey -> Value');
hashmap.print();

// 查詢操作
// 輸入鍵 key，從雜湊表取得對應的值 val
const name = hashmap.get(13276);
console.log('\n輸入學號 13276，查得姓名 ' + name);

// 刪除操作
// 從雜湊表刪除鍵值對 (key, val)
hashmap.remove(16750);
console.log('\n刪除 16750 後的雜湊表\nKey -> Value');
hashmap.print();
