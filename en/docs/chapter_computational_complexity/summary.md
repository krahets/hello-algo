# Summary

### Key takeaways

**Evaluating algorithm efficiency**

- Time and space efficiency are the two main measures of algorithm quality.
- Practical testing measures efficiency, but cannot easily remove environmental effects and consumes substantial computing resources.
- Complexity analysis avoids those limitations, applies across platforms, and reveals efficiency at different input sizes.

**Time complexity**

- Time complexity describes how runtime grows with input size. It is useful for evaluating efficiency, but may not distinguish algorithms accurately for small inputs or equal complexity classes.
- Worst-case time complexity is expressed with big-$O$ notation, an asymptotic upper bound describing the growth of the operation count $T(n)$ as $n$ tends to positive infinity.
- Deriving time complexity takes two steps: count operations, then determine the asymptotic upper bound.
- Common complexities, from slower to faster growth, include $O(1)$, $O(\log n)$, $O(n)$, $O(n \log n)$, $O(n^2)$, $O(2^n)$, and $O(n!)$.
- Some algorithms' complexity depends on the input's arrangement. We distinguish worst-case, best-case, and average-case complexity. Best-case complexity is rarely used because reaching it generally requires strict input conditions.
- Average-case complexity describes performance on random inputs and is closest to typical practical behavior. Calculating it requires an input distribution and its mathematical expectation.

**Space complexity**

- Like time complexity, space complexity describes a growth trend: how memory usage increases with input size.
- Memory used during execution includes input, temporary, and output space. Input space is usually excluded from space complexity. Temporary space includes temporary data, stack frames, and instructions; stack frames usually affect complexity only in recursive functions.
- We usually consider worst-case space complexity, measuring memory under the worst input and at the moment of maximum usage.
- Common space complexities, from slower to faster growth, include $O(1)$, $O(\log n)$, $O(n)$, $O(n^2)$, and $O(2^n)$.

### Q & A

**Q**: Does tail recursion have $O(1)$ space complexity?

In theory, tail recursion can be optimized to $O(1)$ space. However, most languages, including Java, Python, C++, Go, and C#, do not automatically optimize tail recursion, so its space complexity is usually treated as $O(n)$.

**Q**: What is the difference between a function and a method?

A <u>function</u> can run independently, with all arguments passed explicitly. A <u>method</u> is associated with an object, receives that object implicitly when called, and can operate on the instance's data.

Here are examples from several common languages.

- C is procedural and has no built-in object-oriented model, so it has functions only. We can simulate object-oriented programming with structures (`struct`); functions associated with a structure then act like methods in other languages.
- Java and C# are object-oriented, and executable blocks (methods) are usually part of a class. Static methods behave like functions: they belong to the class and cannot access a particular instance's variables directly.
- C++ and Python support both procedural programming with functions and object-oriented programming with methods.

**Q**: Does the common space complexity chart show absolute memory usage?

No. It illustrates growth trends rather than absolute amounts of memory.

For $n = 8$, the plotted values may not match the corresponding functions exactly. Each curve includes a constant term that adjusts it to a visually convenient range.

In practice, these constant terms are usually unknown, so complexity alone cannot generally identify the best solution for $n = 8$. For $n = 8^5$, the choice is easier because growth rates dominate.

**Q**: Do algorithms sometimes trade time for space, or space for time, depending on the application?

Most practical applications trade space for time. Database indexes, for example, often use B+ trees or hash indexes, consuming substantial memory to achieve $O(\log n)$ or even $O(1)$ query time.

When memory is scarce, the reverse tradeoff may be useful. In embedded development, an engineer might replace a hash table with sequential array search to save memory, accepting slower lookups.
