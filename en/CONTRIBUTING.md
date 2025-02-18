# Contributing guidelines for Chinese-to-English

We are working on translating "Hello Algo" from Chinese to English with the following approach:

1. **AI translation**: Carry out an initial pass of translations using large language models.
2. **Human optimization**: Manually refine the machine-generated outputs to ensure authenticity and accuracy.
3. **Pull request review**: The optimized translation will be double checked by the reviewers through GitHub pull request workflow.
4. Repeat steps `2.` and `3.` for further improvements.

<img width="650" alt="translation_pipeline" src="https://github.com/user-attachments/assets/201930ef-723e-4179-b670-e5a084a8211e">

## Join us

We're seeking contributors who meet the following criteria.

- **Technical background**: Strong foundation in computer science, particularly in data structures and algorithms.
- **Language skills**: Native proficiency in Chinese with professional-level English, or native English.
- **Available time**: Dedicated to contributing to open-source projects with a willingness to engage in long-term translation efforts.

That is, our contributors are computer scientists, engineers, and students from different linguistic backgrounds, and their objectives have different focal points:

- **Native Chinese with professional working English**: Ensuring translation accuracy and consistency between CN and EN versions.
- **Native English**: Enhance the authenticity and fluency of the English content to flow naturally and to be engaging.

> [!note]
> If you are interested in joining us, don't hesitate to contact me via krahetx@gmail.com or WeChat `krahets-jyd`.
> 
> We use this [Notion page](https://hello-algo.notion.site/chinese-to-english) to track progress and assign tasks. Please visit it for more details.

## Translation process

> [!important]
> Before diving in, ensure you're comfortable with the GitHub pull request workflow and have read the "Translation standards" and "Pseudo-code for translation" below.

1. **Task assignment**: Self-assign a task in the Notion workspace.
2. **Translation**: Optimize the translation on your local PC, referring to the “Translation Pseudo-Code” section below for more details.
3. **Peer review**: Carefully review your changes before submitting a Pull Request (PR). The PR will be merged into the main branch after approval from two reviewers.

## Translation standards

> [!tip]
> **The "Accuracy" and "Authenticity" are primarily handled by native Chinese speakers and native English speakers, respectively.**
>
> In some instances, "Accuracy (consistency)" and "Authenticity" represent a trade-off, where optimizing one aspect could significantly affect the other. In such cases, please leave a comment in the pull request for discussion.

**Accuracy**:

- Maintain consistency in terminology across translations by referring to the [Terminology](https://www.hello-algo.com/chapter_appendix/terminology/) section.
- Prioritize technical accuracy and maintain the tone and style of the Chinese version.
- Always take into account the content and context of the Chinese version to ensure modifications are accurate and comprehensive.

**Authenticity**:

- Translations should flow naturally and fluently, adhering to English expression conventions.
- Always consider the context of the content to harmonize the article.
- Be aware of cultural differences between Chinese and English. For instance, Chinese "pinyin" does not exist in English.
- If the optimized sentence could alter the original meaning, please add a comment for discussion.

**Formatting**:

- Figures and tables will be automatically numbered during deployment, so DO NOT manually number them.
- Each PR should cover at least one complete document to ensure manageable review sizes, except for bug fixes.

**Review**:

- During the review, prioritize evaluating the changes, consulting the surrounding context as needed.
- Learning from each other's perspectives can lead to better translations and more cohesive results.

## Translation pseudo-code

The following pseudo-code models the steps in a typical translation process.

```python
def optimize_translation(markdown_texts, lang_skill):
    """Optimize the translation"""
    for sentence in markdown_texts:
        """Accuracy is handled primarily by native Chinese speakers"""
        if lang_skill is "Native Chinese + Professional working English":
            if is_accurate_Chinese_to_English(sentence):
                continue
            # Optimize the accuracy
            result = refine_accuracy(sentence)

        """
        Authenticity is handled primarily by native English speakers
        and secondarily by native Chinese speakers
        """
        if is_authentic_English(sentence):
            continue
        # Optimize the authenticity
        result = refine_authenticity(sentence)
        # Add comments in the PR if it may break consistency
        if break_consistency(result):
            add_comment(description)

    pull_request = submit_pull_request(markdown_texts)
    # The PR will be merged after approved by >= 2 reviewers
    while count_approvals(pull_request) < 2:
          continue
    merge(pull_request)
```

The following pseudo-code is for the reviewers:

```python
def review_pull_requests(pull_request, lang_skill):
    """Review the PR"""
    # Loop through all the changes in the PR
    while is_anything_left_to_review(pull_request):
        change = get_next_change(pull_request)

        """Accuracy is handled primarily by native Chinese speakers"""
        if lang_skill is "Native Chinese + Professional working English":
            # Check the accuracy(consistency) between CN and EN versions
            if is_accurate_Chinese_to_English(change):
                continue
            # Optimize the accuracy(consistency)
            result = refine_accuracy(change)
            # Add comments in the PR
            add_comment(result)

        """
        Authenticity is handled primarily by native English speakers
        and secondarily by native Chinese speakers
        """
        if is_authentic_English(change):
            continue
        # Optimize the authenticity if it is not authentic English
        result = refine_authenticity(change)
        # Add comments in the PR
        add_comment(result)

    approve(pull_request)
```
