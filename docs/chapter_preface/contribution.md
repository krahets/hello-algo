# 一起参与创作

!!! success "开源的魅力"

    纸质书籍的两次印刷的间隔时间往往需要数年，内容更新非常不方便。</br>但在本开源 HTML 书中，内容更迭的时间被缩短至数日甚至几个小时。

由于作者水平有限，书中内容难免疏漏谬误，请您谅解。如果发现笔误、无效链接、内容缺失、文字歧义、解释不清晰、行文结构不合理等问题，请您帮忙修正，以帮助其他读者获取更优质的学习内容。所有[撰稿人](https://github.com/krahets/hello-algo/graphs/contributors)将被展示在仓库与网站主页，以感谢他们对开源社区的无私奉献！

## 内容微调

每个页面的右上角都有一个「编辑」图标，你可以按照以下步骤修改文字或代码：

1. 点击编辑按钮，如果遇到提示“需要 Fork 此仓库”，请通过；
2. 修改 Markdown 源文件内容，并检查内容正确性，尽量保持排版格式统一；
3. 在页面底部填写更改说明，然后单击“Propose file change”按钮；页面跳转后，点击“Create pull request”按钮发起拉取请求即可。

![页面编辑按键](contribution.assets/edit_markdown.png)

图片无法直接修改，需要通过新建 [Issue](https://github.com/krahets/hello-algo/issues) 或评论留言来描述图片问题，我会第一时间重新画图并替换图片。

## 内容创作

如果您想要参与本开源项目，包括翻译代码至其他编程语言、拓展文章内容等，那么需要实施 Pull Request 工作流程：

1. 登录 GitHub ，并 Fork [本仓库](https://github.com/krahets/hello-algo) 至个人账号；
2. 进入 Fork 仓库网页，使用 `git clone` 克隆该仓库至本地；
3. 在本地进行内容创作，并通过运行测试来验证代码正确性；
4. 将本地更改 Commit ，并 Push 至远程仓库；
5. 刷新仓库网页，点击“Create pull request”按钮发起拉取请求即可；

## Docker 部署

你可以使用 Docker 来部署本项目。

```shell
git clone https://github.com/krahets/hello-algo.git
cd hello-algo
docker-compose up -d
```

稍等片刻，即可使用浏览器打开 `http://localhost:8000` 访问本项目。

使用以下命令即可删除部署。

```shell
docker-compose down
```
