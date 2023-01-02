/**
 * File: time_complexity.js
 * Created Time: 2023-01-02
 * Author: RiverTwilight (contact@rene.wang)
 */

class time_complexity {
	/* 常数阶 */
	constant(n) {
		var count = 0;
		const size = 100000;
		for (var i = 0; i < size; i++) count++;
		return count;
	}

	/* 线性阶 */
	linear(n) {
		var count = 0;
		for (var i = 0; i < n; i++) count++;
		return count;
	}

	/* 线性阶（遍历数组） */
	arrayTraversal(nums) {
		var count = 0;
		// 循环次数与数组长度成正比
		for (var i = 0; i < nums.length; i++) {
			count++;
		}
		return count;
	}

	/* 平方阶 */
	quadratic(n) {
		var count = 0;
		// 循环次数与数组长度成平方关系
		for (var i = 0; i < n; i++) {
			for (let j = 0; j < n; j++) {
				count++;
			}
		}
		return count;
	}

	/* 平方阶（冒泡排序） */
	bubbleSort(nums) {
		var count = 0; // 计数器
		// 外循环：待排序元素数量为 n-1, n-2, ..., 1
		for (var i = nums.length - 1; i > 0; i--) {
			// 内循环：冒泡操作
			for (let j = 0; j < i; j++) {
				if (nums[j] > nums[j + 1]) {
					// 交换 nums[j] 与 nums[j + 1]
					let tmp = nums[j];
					nums[j] = nums[j + 1];
					nums[j + 1] = tmp;
					count += 3; // 元素交换包含 3 个单元操作
				}
			}
		}
		return count;
	}

	/* 指数阶（循环实现） */
	exponential(n) {
		var count = 0,
			base = 1;
		// cell 每轮一分为二，形成数列 1, 2, 4, 8, ..., 2^(n-1)
		for (var i = 0; i < n; i++) {
			for (let j = 0; j < base; j++) {
				count++;
			}
			base *= 2;
		}
		// count = 1 + 2 + 4 + 8 + .. + 2^(n-1) = 2^n - 1
		return count;
	}

	/* 指数阶（递归实现） */
	expRecur(n) {
		if (n == 1) return 1;
		return this.expRecur(n - 1) + this.expRecur(n - 1) + 1;
	}

	/* 对数阶（循环实现） */
	logarithmic(n) {
		var count = 0;
		while (n > 1) {
			n = n / 2;
			count++;
		}
		return count;
	}

	/* 对数阶（递归实现） */
	logRecur(n) {
		if (n <= 1) return 0;
		return this.logRecur(n / 2) + 1;
	}

	/* 线性对数阶 */
	linearLogRecur(n) {
		if (n <= 1) return 1;
		var count = this.linearLogRecur(n / 2) + this.linearLogRecur(n / 2);
		for (var i = 0; i < n; i++) {
			count++;
		}
		return count;
	}

	/* 阶乘阶（递归实现） */
	factorialRecur(n) {
		if (n == 0) return 1;
		var count = 0;
		// 从 1 个分裂出 n 个
		for (var i = 0; i < n; i++) {
			count += this.factorialRecur(n - 1);
		}
		return count;
	}
}

(function main() {
	var test = new time_complexity();

	var n = 8;
	console.log("输入数据大小 n = " + n);

	var count = test.constant(n);
	console.log("常数阶的计算操作数量 = " + count);

	count = test.linear(n);
	console.log("线性阶的计算操作数量 = " + count);
	count = test.arrayTraversal(new Array(n));
	console.log("线性阶（遍历数组）的计算操作数量 = " + count);

	count = test.quadratic(n);
	console.log("平方阶的计算操作数量 = " + count);
	var nums = new Array(n);
	for (var i = 0; i < n; i++) nums[i] = n - i; // [n,n-1,...,2,1]
	count = test.bubbleSort(nums);
	console.log("平方阶（冒泡排序）的计算操作数量 = " + count);

	count = test.exponential(n);
	console.log("指数阶（循环实现）的计算操作数量 = " + count);
	count = test.expRecur(n);
	console.log("指数阶（递归实现）的计算操作数量 = " + count);

	count = test.logarithmic(n);
	console.log("对数阶（循环实现）的计算操作数量 = " + count);
	count = test.logRecur(n);
	console.log("对数阶（递归实现）的计算操作数量 = " + count);

	count = test.linearLogRecur(n);
	console.log("线性对数阶（递归实现）的计算操作数量 = " + count);

	count = test.factorialRecur(n);
	console.log("阶乘阶（递归实现）的计算操作数量 = " + count);
})();
