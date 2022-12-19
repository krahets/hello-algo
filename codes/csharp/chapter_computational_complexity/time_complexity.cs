// File: time_complexity.cs
// Created Time: 2022-12-19
// Author: SayoKun (373484252@qq.com)

using System;
using System.Linq;

namespace hello_algo.chapter_computational_complexity
{
	public class time_complexity
	{
		/// <summary>
		/// 常数阶
		/// </summary>
		/// <param name="n"></param>
		/// <returns></returns>
		int constant(int n)
		{
			int count = 0;
			int size = 100000;
			for (int i = 0; i < size; i++)
				count++;
			return count;
		}

		/// <summary>
		/// 线性阶
		/// </summary>
		/// <param name="n"></param>
		/// <returns></returns>
		int linear(int n)
		{
			int count = 0;
			for (int i = 0; i < n; i++)
				count++;
			return count;
		}

		/// <summary>
		/// 线性阶（遍历数组）
		/// </summary>
		/// <param name="nums"></param>
		/// <returns></returns>
		int arrayTraversal(int[] nums)
		{
			int count = 0;
			// 循环次数与数组长度成正比
			foreach (int num in nums)
			{
				count++;
			}
			return count;
		}

		/// <summary>
		/// 平方阶
		/// </summary>
		/// <param name="n"></param>
		/// <returns></returns>
		int quadratic(int n)
		{
			int count = 0;
			// 循环次数与数组长度成平方关系
			for (int i = 0; i < n; i++)
			{
				for (int j = 0; j < n; j++)
				{
					count++;
				}
			}
			return count;
		}

		/// <summary>
		/// 平方阶（冒泡排序）
		/// </summary>
		/// <param name="nums"></param>
		/// <returns></returns>
		int bubbleSort(int[] nums)
		{
			int count = 0;  // 计数器
							// 外循环：待排序元素数量为 n-1, n-2, ..., 1
			for (int i = nums.Length - 1; i > 0; i--)
			{
				// 内循环：冒泡操作
				for (int j = 0; j < i; j++)
				{
					if (nums[j] > nums[j + 1])
					{
						// 交换 nums[j] 与 nums[j + 1]
						int tmp = nums[j];
						nums[j] = nums[j + 1];
						nums[j + 1] = tmp;
						count += 3;  // 元素交换包含 3 个单元操作
					}
				}
			}
			return count;
		}

		/// <summary>
		/// 指数阶（循环实现）
		/// </summary>
		/// <param name="n"></param>
		/// <returns></returns>
		int exponential(int n)
		{
			int count = 0, baseNum = 1;
			// cell 每轮一分为二，形成数列 1, 2, 4, 8, ..., 2^(n-1)
			for (int i = 0; i < n; i++)
			{
				for (int j = 0; j < baseNum; j++)
				{
					count++;
				}
				baseNum *= 2;
			}
			// count = 1 + 2 + 4 + 8 + .. + 2^(n-1) = 2^n - 1
			return count;
		}

		/// <summary>
		/// 指数阶（递归实现）
		/// </summary>
		/// <param name="n"></param>
		/// <returns></returns>
		int expRecur(int n)
		{
			if (n == 1) return 1;
			return expRecur(n - 1) + expRecur(n - 1) + 1;
		}

		/// <summary>
		/// 对数阶（循环实现）
		/// </summary>
		/// <param name="n"></param>
		/// <returns></returns>
		int logarithmic(float n)
		{
			int count = 0;
			while (n > 1)
			{
				n = n / 2;
				count++;
			}
			return count;
		}

		/// <summary>
		/// 对数阶（递归实现）
		/// </summary>
		/// <param name="n"></param>
		/// <returns></returns>
		int logRecur(float n)
		{
			if (n <= 1) return 0;
			return logRecur(n / 2) + 1;
		}

		/// <summary>
		/// 线性对数阶
		/// </summary>
		/// <param name="n"></param>
		/// <returns></returns>
		int linearLogRecur(float n)
		{
			if (n <= 1) return 1;
			int count = linearLogRecur(n / 2) +
						linearLogRecur(n / 2);
			for (int i = 0; i < n; i++)
			{
				count++;
			}
			return count;
		}

		/// <summary>
		/// 阶乘阶（递归实现）
		/// </summary>
		/// <param name="n">递归数</param>
		/// <returns></returns>
		int factorialRecur(int n)
		{
			if (n == 0) return 1;
			int count = 0;
			// 从 1 个分裂出 n 个
			for (int i = 0; i < n; i++)
			{
				count += factorialRecur(n - 1);
			}
			return count;
		}

		/// <summary>
		/// 生成一个数组，元素为 { 1, 2, ..., n }，顺序被打乱
		/// </summary>
		/// <param name="n">数组大小</param>
		/// <returns></returns>
		int[] randomNumbers(int n)
		{
			int[] nums = new int[n];
			// 生成数组 nums = { 1, 2, 3, ..., n }
			for (int i = 0; i < n; i++)
			{
				nums[i] = i + 1;
			}
			// 随机打乱数组元素
			nums = nums.OrderBy(num => System.Random.Shared.Next()).ToArray();
			return nums;
		}

		/// <summary>
		/// 查找数组 nums 中数字 1 所在索引
		/// </summary>
		/// <param name="nums">索引数组</param>
		/// <returns></returns>
		int findOne(in Span<int> nums) => nums.IndexOf(1);

		void worstBestTimeComplexity()
		{
			for (int i = 0; i < 10; i++)
			{
				int n = 100;
				int[] nums = randomNumbers(n);
				int index = findOne(nums);
				System.Console.WriteLine($"打乱后的数组为 [{string.Join(",", nums)}]");
				System.Console.WriteLine($"数字 1 的索引为 [{index}]");
			}
		}

		/// <summary>
		/// Driver Code
		/// </summary>
		public void main()
		{
			// 可以修改 n 运行，体会一下各种复杂度的操作数量变化趋势
			int n = 8;
			System.Console.WriteLine("输入数据大小 n = " + n);

			int count = constant(n);
			System.Console.WriteLine("常数阶的计算操作数量 = " + count);

			count = linear(n);
			System.Console.WriteLine("线性阶的计算操作数量 = " + count);

			count = arrayTraversal(new int[n]);
			System.Console.WriteLine("线性阶（遍历数组）的计算操作数量 = " + count);

			count = quadratic(n);
			System.Console.WriteLine("平方阶的计算操作数量 = " + count);

			int[] nums = new int[n];
			for (int i = 0; i < n; i++)
				nums[i] = n - i;  // [n,n-1,...,2,1]
			count = bubbleSort(nums);
			System.Console.WriteLine("平方阶（冒泡排序）的计算操作数量 = " + count);

			count = exponential(n);
			System.Console.WriteLine("指数阶（循环实现）的计算操作数量 = " + count);

			count = expRecur(n);
			System.Console.WriteLine("指数阶（递归实现）的计算操作数量 = " + count);

			count = logarithmic((float)n);
			System.Console.WriteLine("对数阶（循环实现）的计算操作数量 = " + count);

			count = logRecur((float)n);
			System.Console.WriteLine("对数阶（递归实现）的计算操作数量 = " + count);

			count = linearLogRecur((float)n);
			System.Console.WriteLine("线性对数阶（递归实现）的计算操作数量 = " + count);

			count = factorialRecur(n);
			System.Console.WriteLine("阶乘阶（递归实现）的计算操作数量 = " + count);
		}
	}
}
