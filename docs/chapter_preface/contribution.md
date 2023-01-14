---
comments: true
---

# 一起参与创作

!!! success "开源的魅力"

    纸质书籍的两次印刷的间隔时间往往需要数年，内容更新非常不方便。</br>但在本开源 HTML 书中，内容更迭的时间被缩短至数日甚至几个小时。

由于作者水平有限，书中内容难免疏漏谬误，请您谅解。此外，期待您可以一同参与本书的创作。如果发现笔误、无效链接、内容缺失、文字歧义、解释不清晰、行文结构不合理等问题，烦请您修正内容，以帮助其他读者获取更优质的学习内容。所有 [撰稿人](https://github.com/krahets/hello-algo/graphs/contributors) 将被展示在仓库主页，以感谢您对开源社区的无私奉献。

## 修改文字与代码

每个页面的右上角都有一个「编辑」按钮，你可以按照以下步骤修改文章：

1. 点击编辑按钮，如果遇到提示“需要 Fork 此仓库”，请通过；
2. 修改 Markdown 源文件内容；
3. 在页面底部填写更改说明，然后单击“Propose file change”按钮；
4. 页面跳转后，点击“Create pull request”按钮发起拉取请求即可，我会第一时间查看处理并及时更新内容。

![edit_markdown](contribution.assets/edit_markdown.png)

## 修改图片与动画

书中的配图无法直接修改，需要通过以下途径提出修改意见：

1. 新建一个 Issue ，将需要修改的图片复制或截图，粘贴在面板中；
2. 描述图片问题，应如何修改；
3. 提交 Issue 即可，我会第一时间重新画图并替换图片。

## 创作新内容

如果您想要创作新内容，例如 **重写章节、新增章节、修改代码、翻译代码至其他编程语言** 等，那么需要实施 Pull Request 工作流程：

1. 登录 GitHub ，并 Fork [本仓库](https://github.com/krahets/hello-algo) 至个人账号；
2. 进入 Fork 仓库网页，使用 `git clone` 克隆该仓库至本地；
3. 在本地进行内容创作（建议通过运行测试来验证代码正确性）；
4. 将本地更改 Commit ，并 Push 至远程仓库；
5. 刷新仓库网页，点击“Create pull request”按钮发起拉取请求（Pull Request）即可；

非常欢迎您和我一同来创作本书！

## 本地部署 hello-algo

### Docker

请确保 Docker 已经安装并启动，并根据如下命令离线部署。

稍等片刻，即可使用浏览器打开 `http://localhost:8000` 访问本项目。

```bash
git clone https://github.com/krahets/hello-algo.git
cd hello-algo

docker-compose up -d
```

使用如下命令即可删除部署。

```bash
docker-compose down
```

（TODO：教学视频）
