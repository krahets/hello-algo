# Contributing Together

Due to limited capacity, there may be inevitable omissions and errors in this book. We appreciate your understanding and are grateful for your help in correcting them. If you discover typos, broken links, missing content, ambiguous wording, unclear explanations, or structural issues, please help us make corrections to provide readers with higher-quality learning resources.

The GitHub IDs of all [contributors](https://github.com/krahets/hello-algo/graphs/contributors) will be displayed on the homepage of the book repository, the web version, and the PDF version to acknowledge their selfless contributions to the open source community.

!!! success "The Charm of Open Source"

    The interval between two printings of a physical book is often quite long, making content updates very inconvenient.

    In this open source book, the time for content updates has been shortened to just days or even hours.

### Minor Content Adjustments

As shown in the figure below, there is an "edit icon" in the top-right corner of each page. You can modify text or code by following these steps.

1. Click the "edit icon". If you encounter a prompt asking you to "Fork this repository", please approve the operation.
2. Modify the content of the Markdown source file, verify the correctness of the content, and maintain consistent formatting as much as possible.
3. Fill in a description of your changes at the bottom of the page, then click the "Propose file change" button. After the page transitions, click the "Create pull request" button to submit your pull request.

![Page edit button](contribution.assets/edit_markdown.png)

Images cannot be directly modified. Please describe the issue by creating a new [Issue](https://github.com/krahets/hello-algo/issues) or leaving a comment. We will promptly redraw and replace the images.

### Content Creation

If you are interested in contributing to this open source project, including translating code into other programming languages or expanding article content, you will need to follow the Pull Request workflow below.

1. Log in to GitHub and Fork the book's [code repository](https://github.com/krahets/hello-algo) to your personal account.
2. Enter your forked repository webpage and use the `git clone` command to clone the repository to your local machine.
3. Create content locally and conduct comprehensive tests to verify code correctness.
4. Commit your local changes and push them to the remote repository.
5. Refresh the repository webpage and click the "Create pull request" button to submit your pull request.

### Docker Deployment

From the root directory of `hello-algo`, run the following Docker script to access the project at `http://localhost:8000`:

```shell
docker-compose up -d
```

Use the following command to remove the deployment:

```shell
docker-compose down
```
