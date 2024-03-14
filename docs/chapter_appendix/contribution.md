# 一起参与创作

由于笔者能力有限，书中难免存在一些遗漏和错误，请您谅解。如果您发现了笔误、链接失效、内容缺失、文字歧义、解释不清晰或行文结构不合理等问题，请协助我们进行修正，以给读者提供更优质的学习资源。

所有[撰稿人](https://github.com/krahets/hello-algo/graphs/contributors)的 GitHub ID 将在本书仓库、网页版和 PDF 版的主页上进行展示，以感谢他们对开源社区的无私奉献。

!!! success "开源的魅力"

    纸质图书的两次印刷的间隔时间往往较久，内容更新非常不方便。
    
    而在本开源书中，内容更迭的时间被缩短至数日甚至几个小时。

### 内容微调

如下图所示，每个页面的右上角都有“编辑图标”。您可以按照以下步骤修改文本或代码。

1. 点击“编辑图标”，如果遇到“需要 Fork 此仓库”的提示，请同意该操作。
2. 修改 Markdown 源文件内容，检查内容的正确性，并尽量保持排版格式的统一。
3. 在页面底部填写修改说明，然后点击“Propose file change”按钮。页面跳转后，点击“Create pull request”按钮即可发起拉取请求。

![页面编辑按键](contribution.assets/edit_markdown.png)

图片无法直接修改，需要通过新建 [Issue](https://github.com/krahets/hello-algo/issues) 或评论留言来描述问题，我们会尽快重新绘制并替换图片。

### 内容创作

如果您有兴趣参与此开源项目，包括将代码翻译成其他编程语言、扩展文章内容等，那么需要实施以下 Pull Request 工作流程。

1. 登录 GitHub ，将本书的[代码仓库](https://github.com/krahets/hello-algo) Fork 到个人账号下。
2. 进入您的 Fork 仓库网页，使用 `git clone` 命令将仓库克隆至本地。
3. 在本地进行内容创作，并进行完整测试，验证代码的正确性。
4. 将本地所做更改 Commit ，然后 Push 至远程仓库。
5. 刷新仓库网页，点击“Create pull request”按钮即可发起拉取请求。

### Docker 部署

在 `hello-algo` 根目录下，执行以下 Docker 脚本，即可在 `http://localhost:8000` 访问本项目：

```shell
docker-compose up -d
```

使用以下命令即可删除部署：

```shell
docker-compose down
```
