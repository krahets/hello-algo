# Contributing to the English edition

Help make *Hello Algo* accurate, clear, and enjoyable for readers learning data structures and algorithms. Corrections to explanations, terminology, code comments, examples, and links are welcome.

For the general contribution workflow, see [Contributing](https://www.hello-algo.com/en/chapter_appendix/contribution/). You can use the edit button on a book page for a small correction, or fork the repository, make and test your changes locally, and submit a pull request.

## Translating and reviewing a chapter

Use the current Simplified Chinese source as the authority for meaning. Read the complete passage and its examples before changing a sentence. The English should convey the full explanation in natural English, including qualifications and assumptions.

1. Translate the complete document, including headings, tables, figure captions, callouts, questions, and code comments. Preserve the algorithms, example data, formulas, links, and code references.
2. Compare the English with the Chinese, checking technical meaning, completeness, terminology, and the steps in each example.
3. Read the English on its own. Make it clear and natural for a beginner, then check any revisions against the Chinese again.
4. Ask another reviewer to check the whole document in context. Resolve differences in interpretation before treating the translation as ready.

Use clear American English and sentence case for headings. Prefer direct explanations to word-for-word renderings of Chinese sentence structure. Use the same term consistently, and distinguish concepts such as full, perfect, and complete binary trees by their definitions. See the [terminology table](https://www.hello-algo.com/en/chapter_appendix/terminology/) for reference.

If the Chinese source appears incorrect or ambiguous, describe the issue in the pull request. A translation should not silently change the algorithm or introduce a new technical claim. Likewise, keep example strings unchanged when they are program data, even if those strings contain Chinese characters.

## Checking the result

Review the rendered page as well as the Markdown. Check that formulas, emphasis, tables, images, links, code tabs, and PythonTutor examples still work. Translate the comments and explanatory output inside PythonTutor examples without deleting explanations to shorten the links.

Figure and table numbers are generated during the build; keep their placeholders intact. Chapter exercise pages are also generated: changes to exercise wording belong in the source exercise data and translation inputs in the companion [workspace repository](https://github.com/krahets/hello-algo-workspace), rather than directly in the generated pages.

Keep a pull request focused on a complete document when possible; a small correction can be smaller. Explain what changed and how you checked it. Automated checks help find missing content and structural or code changes, but do not replace a careful language review.

If you find a problem in an image, open an [issue](https://github.com/krahets/hello-algo/issues) or leave a comment describing it so the image can be updated.
