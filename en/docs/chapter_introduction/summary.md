---
comments: true
---

# 1.3 &nbsp; Summary

### 1. &nbsp; Key points

- Algorithms are part of everyday life and well within reach. Without realizing it, we have already learned many of them to solve problems large and small.
- Looking up a character in a dictionary uses the same reasoning as binary search. Binary search illustrates the important idea of divide and conquer.
- Sorting a hand of cards closely resembles insertion sort, which is well suited to small data sets.
- The steps for making change form a greedy algorithm: at each step, make the choice that looks best at that moment.
- An algorithm is a set of instructions or steps for solving a specific problem in finite time. A data structure is a way of organizing and storing data in a computer.
- Data structures and algorithms are closely connected. Data structures give algorithms a foundation, and algorithms put data structures to work.
- Think of assembling a model from building blocks. The blocks are the data. Their shapes and the ways they connect represent the data structure. The assembly steps are the algorithm.

### 2. &nbsp; Q & A

**Q**: As a programmer, I never solve problems with algorithms in my day-to-day work. My programming language already provides the common ones, and I just use them. Does that mean the problems I face at work aren't difficult enough to need algorithms?

If particular job skills are the moves you practice in a martial art, the fundamentals are the training that gives those moves their power.

To me, the point of studying algorithms and other fundamentals goes beyond implementing them from scratch at work. What you learn helps you recognize what a problem calls for and make informed decisions, improving the quality of your work. Consider a simple example: programming languages come with a built-in sorting function.

- Without a background in data structures and algorithms, we might pass any data straight to that function. It runs smoothly and performs well. Everything seems fine.
- With that background, we recognize the built-in sort's $O(n \log n)$ time complexity. If our data consists of integers with a fixed number of digits, such as student IDs, we can use a more efficient radix sort, bringing the time complexity down to $O(nk)$, where $k$ is the number of digits. At large scales, the time saved can translate into lower costs or a better user experience.

In engineering, optimal solutions are often hard to reach. Many problems get solutions that are simply good enough. How difficult a problem seems depends both on the problem itself and on the knowledge of the person looking at it. Greater knowledge and experience let us analyze problems more deeply and find more elegant solutions.

**Q**: Now that AI agents write nearly all our code, do we still need to learn algorithms?

As Mu Li puts it, “An agent amplifies ability: it multiplies your ability by 10. It doesn't add 10.”

If AI amplifies ability, the ability you start with matters. Two skills seem especially worth developing. The first is communication, particularly when working with AI: explain the goal, supply the missing context, and correct the course promptly. Explaining a problem to AI also helps you think it through yourself. The second is a grasp of the fundamentals. AI can fill in details, but you need to understand the concepts to ask the right questions, judge the answers, and turn its output into something useful.

One unusual thing about AI is that its capabilities have less clearly defined boundaries than those of earlier tools. It's a little like water, taking a different shape in different hands. The stronger a person's abilities and the more refined their judgment, the more pronounced the amplifying effect.
