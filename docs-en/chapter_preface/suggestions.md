# How To Read

!!! tip

    For the best reading experience, it is recommended that you read through this section.

## Conventions Of Style

- Those labeled `*` after the title are optional chapters with relatively difficult content. If you have limited time, it is advisable to skip them.
- Proper nouns and words and phrases with specific meanings are marked with `"double quotes"` to avoid ambiguity.
- Important proper nouns and their English translations are marked with `" "` in parentheses, e.g. `"array array"` . It is recommended to memorize them for reading the literature.
- **Bolded text** Indicates key content or summary statements, which deserve special attention.
- When it comes to terms that are inconsistent between programming languages, this book follows Python, for example using $\text{None}$ to mean "empty".
- This book partially abandons the specification of annotations in programming languages in exchange for a more compact layout of the content. There are three main types of annotations: title annotations, content annotations, and multi-line annotations.

=== "Python"

    ```python title=""
    """Header comments for labeling functions, classes, test samples, etc.""""
   
    # Content comments for detailed code solutions
   
    """
    multi-line
    marginal notes
    """
    ```

=== "C++"

    ```cpp title=""
    /* Header comments for labeling functions, classes, test samples, etc. */
   
    // Content comments for detailed code solutions.
   
    /**
     * multi-line
     * marginal notes
     */
    ```

=== "Java"

    ```java title=""
    /* Header comments for labeling functions, classes, test samples, etc. */
   
    // Content comments for detailed code solutions.
   
    /**
     * multi-line
     * marginal notes
     */
    ```

=== "C#"

    ```csharp title=""
    /* Header comments for labeling functions, classes, test samples, etc. */
   
    // Content comments for detailed code solutions.
   
    /**
     * multi-line
     * marginal notes
     */
    ```

=== "Go"

    ```go title=""
    /* Header comments for labeling functions, classes, test samples, etc. */
   
    // Content comments for detailed code solutions.
   
    /**
     * multi-line
     * marginal notes
     */
    ```

=== "Swift"

    ```swift title=""
    /* Header comments for labeling functions, classes, test samples, etc. */
   
    // Content comments for detailed code solutions.
   
    /**
     * multi-line
     * marginal notes
     */
    ```

=== "JS"

    ```javascript title=""
    /* Header comments for labeling functions, classes, test samples, etc. */
   
    // Content comments for detailed code solutions.
   
    /**
     * multi-line
     * marginal notes
     */
    ```

=== "TS"

    ```typescript title=""
    /* Header comments for labeling functions, classes, test samples, etc. */
   
    // Content comments for detailed code solutions.
   
    /**
     * multi-line
     * marginal notes
     */
    ```

=== "Dart"

    ```dart title=""
    /* Header comments for labeling functions, classes, test samples, etc. */
   
    // Content comments for detailed code solutions.
   
    /**
     * multi-line
     * marginal notes
     */
    ```

=== "Rust"

    ```rust title=""
    /* Header comments for labeling functions, classes, test samples, etc. */

    // Content comments for detailed code solutions.
   
    /**
     * multi-line
     * marginal notes
     */
    ```

=== "C"

    ```c title=""
    /* Header comments for labeling functions, classes, test samples, etc. */
   
    // Content comments for detailed code solutions.
   
    /**
     * multi-line
     * marginal notes
     */
    ```

=== "Zig"

    ```zig title=""
    // Header comments for labeling functions, classes, test samples, etc.
   
    // Content comments for detailed code solutions.
   
    // Multi-line
    // Annotation
    ```

## Learn Efficiently In Animated Graphic Solutions

Compared with text, videos and pictures have a higher degree of information density and structure and are easier to understand. In this book, **key and difficult knowledge will be presented mainly in the form of animations and graphs**, while the text serves as an explanation and supplement to the animations and graphs.

If, while reading the book, you find that a particular paragraph provides an animation or a graphic solution as shown below, **please use the figure as the primary source and the text as a supplement and synthesize the two to understand the content**.

![Example animation](../index.assets/animation.gif)

## Deeper Understanding In Code Practice

The companion code for this book is hosted in the [GitHub repository](https://github.com/krahets/hello-algo). As shown in the figure below, **the source code is accompanied by test samples that can be run with a single click**.

If time permits, **it is recommended that you refer to the code and knock it through on your own**. If you have limited time to study, please read through and run all the code at least once.

The process of writing code is often more rewarding than reading it. **Learning by doing is really learning**.

![Running code example](../index.assets/running_code.gif)

The preliminaries for running the code are divided into three main steps.

**Step 1: Install the local programming environment**. Please refer to [Appendix Tutorial](https://www.hello-algo.com/chapter_appendix/installation/) for installation, or skip this step if already installed.

**Step 2: Clone or download the code repository**. If [Git](https://git-scm.com/downloads) is already installed, you can clone this repository with the following command.

```shell
git clone https://github.com/krahets/hello-algo.git
```

Of course, you can also in the location shown in the figure below, click "Download ZIP" directly download the code zip, and then in the local solution.

![Clone repository with download code](suggestions.assets/download_code.png)

**Step 3: Run the source code**. As shown in the figure below, for the code block labeled with the file name at the top, we can find the corresponding source code file in the `codes` folder of the repository. The source code files can be run with a single click, which will help you save unnecessary debugging time and allow you to focus on what you are learning.

![Code block with corresponding source file](suggestions.assets/code_md_to_repo.png)

## Growing Together In Questioning And Discussion

While reading this book, please don't skip over the points that you didn't learn. **Feel free to ask your questions in the comment section**. We will be happy to answer them and can usually respond within two days.

As you can see in the figure below, each post comes with a comment section at the bottom. I hope you'll pay more attention to the comments section. On the one hand, you can learn about the problems that people encounter, so as to check the gaps and stimulate deeper thinking. On the other hand, we expect you to generously answer other partners' questions, share your insights, and help others improve.

![Example of comment section](../index.assets/comment.gif)

## Algorithm Learning Route

From a general point of view, we can divide the process of learning data structures and algorithms into three stages.

1. **Introduction to Algorithms**. We need to familiarize ourselves with the characteristics and usage of various data structures and learn about the principles, processes, uses and efficiency of different algorithms.
2. **Brush up on algorithm questions**. It is recommended to start brushing from popular topics, such as [Sword to Offer](https://leetcode.cn/studyplan/coding-interviews/) and [LeetCode Hot 100](https://leetcode.cn/studyplan/top-100- liked/), first accumulate at least 100 questions to familiarize yourself with mainstream algorithmic problems. Forgetfulness can be a challenge when first brushing up, but rest assured that this is normal. We can follow the "Ebbinghaus Forgetting Curve" to review the questions, and usually after 3-5 rounds of repetitions, we will be able to memorize them.
3. **Build the knowledge system**. In terms of learning, we can read algorithm column articles, solution frameworks and algorithm textbooks to continuously enrich the knowledge system. In terms of brushing, we can try to adopt advanced brushing strategies, such as categorizing by topic, multiple solutions, multiple solutions, etc. Related brushing tips can be found in various communities.

As shown in the figure below, this book mainly covers "Phase 1" and is designed to help you start Phase 2 and 3 more efficiently.

![algorithm learning route](suggestions.assets/learning_route.png)
