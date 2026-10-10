/**
 * File: array_deque.ts
 * Created Time: 2023-02-28
 * Author: Zhuo Qinyue (1403450829@qq.com)
 */

/* 循環配列ベースの両端キュー */
class ArrayDeque {
    private nums: number[]; // 両端キューの要素を格納する配列
    private front: number; // 先頭ポインタ。先頭要素を指す
    private queSize: number; // 両端キューの長さ

    /* コンストラクタ */
    constructor(capacity: number) {
        this.nums = new Array(capacity);
        this.front = 0;
        this.queSize = 0;
    }

    /* 両端キューの容量を取得 */
    capacity(): number {
        return this.nums.length;
    }

    /* 両端キューの長さを取得 */
    size(): number {
        return this.queSize;
    }

    /* 両端キューが空かどうかを判定 */
    isEmpty(): boolean {
        return this.queSize === 0;
    }

    /* 循環配列のインデックスを計算 */
    index(i: number): number {
        // 剰余演算により配列の先頭と末尾をつなげる
        // i が配列の末尾を越えたら先頭に戻る
        // i が配列の先頭を越えて前に出たら末尾に戻る
        return (i + this.capacity()) % this.capacity();
    }

    /* キュー先頭にエンキュー */
    pushFirst(num: number): void {
        if (this.queSize === this.capacity()) {
            console.log('両端キューは満杯です');
            return;
        }
        // 先頭ポインタを左に 1 つ移動する
        // 剰余演算により、front が配列先頭を越えた後に末尾へ戻るようにする
        this.front = this.index(this.front - 1);
        // num をキュー先頭に追加
        this.nums[this.front] = num;
        this.queSize++;
    }

    /* キュー末尾にエンキュー */
    pushLast(num: number): void {
        if (this.queSize === this.capacity()) {
            console.log('両端キューは満杯です');
            return;
        }
        // キュー末尾ポインタを計算し、末尾インデックス + 1 を指す
        const rear: number = this.index(this.front + this.queSize);
        // num をキュー末尾に追加
        this.nums[rear] = num;
        this.queSize++;
    }

    /* キュー先頭からデキュー */
    popFirst(): number {
        const num: number = this.peekFirst();
        // 先頭ポインタを 1 つ後ろへ進める
        this.front = this.index(this.front + 1);
        this.queSize--;
        return num;
    }

    /* キュー末尾からデキュー */
    popLast(): number {
        const num: number = this.peekLast();
        this.queSize--;
        return num;
    }

    /* キュー先頭の要素にアクセス */
    peekFirst(): number {
        if (this.isEmpty()) throw new Error('The Deque Is Empty.');
        return this.nums[this.front];
    }

    /* キュー末尾の要素にアクセス */
    peekLast(): number {
        if (this.isEmpty()) throw new Error('The Deque Is Empty.');
        // 末尾要素のインデックスを計算
        const last = this.index(this.front + this.queSize - 1);
        return this.nums[last];
    }

    /* 出力用の配列を返す */
    toArray(): number[] {
        // 有効長の範囲内のリスト要素のみを変換
        const res: number[] = [];
        for (let i = 0, j = this.front; i < this.queSize; i++, j++) {
            res[i] = this.nums[this.index(j)];
        }
        return res;
    }
}

/* Driver Code */
/* 両端キューを初期化 */
const capacity = 5;
const deque: ArrayDeque = new ArrayDeque(capacity);
deque.pushLast(3);
deque.pushLast(2);
deque.pushLast(5);
console.log('両端キュー deque = [' + deque.toArray() + ']');

/* 要素にアクセス */
const peekFirst = deque.peekFirst();
console.log('先頭要素 peekFirst = ' + peekFirst);
const peekLast = deque.peekLast();
console.log('末尾要素 peekLast = ' + peekLast);

/* 要素をエンキュー */
deque.pushLast(4);
console.log('要素 4 を末尾に追加後 deque = [' + deque.toArray() + ']');
deque.pushFirst(1);
console.log('要素 1 を先頭に追加後 deque = [' + deque.toArray() + ']');

/* 要素をデキュー */
const popLast = deque.popLast();
console.log(
    '末尾から取り出した要素 = ' +
        popLast +
        '、末尾から取り出し後 deque = [' +
        deque.toArray() +
        ']'
);
const popFirst = deque.popFirst();
console.log(
    '先頭から取り出した要素 = ' +
        popFirst +
        '、先頭から取り出し後 deque = [' +
        deque.toArray() +
        ']'
);

/* 両端キューの長さを取得 */
const size = deque.size();
console.log('両端キューの長さ size = ' + size);

/* 両端キューが空かどうかを判定 */
const isEmpty = deque.isEmpty();
console.log('両端キューが空かどうか = ' + isEmpty);

export {};
