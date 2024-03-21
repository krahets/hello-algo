import { Heap } from 'https://esm.sh/heap-js@2.5.0';

function testPush(heap, val) {
    heap.push(val); // 元素入堆
    console.log(`元素 ${val} 入堆后`);
    console.log(heap.toArray());
}

function testPop(heap) {
    let val = heap.pop(); // 堆顶元素出堆
    console.log(`堆顶元素 ${val} 出堆后`);
    console.log(heap.toArray());
}

// 通过将代码放在浏览器上的 <script type="module"> 中来执行代码
// 或者
// $ deno run heap.js
(function main() {
    /* 初始化堆 */
    // 初始化小顶堆
    const minHeap = new Heap();
    // 初始化大顶堆
    const maxHeap = new Heap(Heap.maxComparator);

    console.log('以下测试样例为大顶堆');

    /* 元素入堆 */
    testPush(maxHeap, 1);
    testPush(maxHeap, 3);
    testPush(maxHeap, 2);
    testPush(maxHeap, 5);
    testPush(maxHeap, 4);

    /* 获取堆顶元素 */
    let peek = maxHeap.peek(); // 5
    console.log(`堆顶元素为 ${peek}`);

    /* 堆顶元素出堆 */
    // 出堆元素会形成一个从大到小的序列
    testPop(maxHeap);
    testPop(maxHeap);
    testPop(maxHeap);
    testPop(maxHeap);
    testPop(maxHeap);

    /* 获取堆大小 */
    const size = maxHeap.size();
    console.log(`堆元素数量为 ${size}`);

    /* 判断堆是否为空 */
    const isEmpty = maxHeap.isEmpty();
    console.log(`堆是否为空 ${isEmpty}`);

    /* 输入列表并建堆 */
    minHeap.init([1, 3, 2, 5, 4]);
    console.log('输入列表并建立小顶堆后');
    console.log(minHeap.toArray());
})();
