/**
 * File: time_complexity.ts
 * Created Time: 2023-01-02
 * Author: RiverTwilight (contact@rene.wang)
 */

// 算法 A 时间复杂度：常数阶
function algorithm_A(n: number): void {
	console.log(0);
}
// 算法 B 时间复杂度：线性阶
function algorithm_B(n: number): void {
	for (var i = 0; i < n; i++) {
		console.log(0);
	}
}
// 算法 C 时间复杂度：常数阶
function algorithm_C(n: number): void {
	for (var i = 0; i < 1000000; i++) {
		console.log(0);
	}
}
