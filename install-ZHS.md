## 本地安装说明

如果你想在本地运行训练营，请根据你所使用的环境执行下面的相应说明。
请注意，我们为 Jupyter 提供了一个自定义 JavaScript 文件；因此即使你已经安装了 Jupyter，仍然需要安装这个 custom.js 文件。

注意：请确保使用的是 **Java 8**（不是 Java 9），并且已经安装 JDK8。截至 2018 年 1 月，Coursier/jupyter-scala 似乎尚未兼容 Java 9。

如果你安装了多个 Java 版本，请确保在运行 `jupyter notebook` 之前选择 Java 8（1.8）：

* Windows：https://gist.github.com/rwunsch/d157d5fe09e9f7cdc858cec58c8462d6
* macOS：https://stackoverflow.com/questions/21964709/how-to-set-or-change-the-default-java-jdk-version-on-os-x

### 使用 Docker 在本地安装 - Linux/Mac/Windows

请确保你的系统已经[安装](https://docs.docker.com/get-docker/) Docker。

运行以下命令：

```
docker run -it --rm -p 8888:8888 ucbbar/chisel-bootcamp
```

这会下载训练营的 Docker 镜像并运行它。输出最后会出现以下消息：

```
    To access the notebook, open this file in a browser:
        file:///home/bootcamp/.local/share/jupyter/runtime/nbserver-6-open.html
    Or copy and paste one of these URLs:
        http://79b8df8411f2:8888/?token=LONG_RANDOM_TOKEN
     or http://127.0.0.1:8888/?token=LONG_RANDOM_TOKEN
```

将最后一条链接（即以 `https://127.0.0.1:8888` 开头的那条）复制到浏览器中，然后按照训练营的说明进行操作。

### 本地安装 - Mac/Linux

本训练营使用 Jupyter notebook。
Jupyter notebook 允许你在浏览器中以交互方式运行代码。
它支持多种编程语言。
对于本训练营，我们会先安装 Jupyter，然后安装 Scala 专用的 Jupyter 后端（现在称为 almond）。


#### Jupyter
首先安装 Jupyter。

依赖项：openssh-client、openjdk-8-jre、openjdk-8-jdk（两者都可以使用 `-headless` 版本）、ca-certificates-java

首先，使用 pip3 安装 Jupyter（如果使用 Python 2，则使用 pip）：http://jupyter.org/install.html
```
pip3 install --upgrade pip
pip3 install jupyter --ignore-installed
```

如果 pip3 无法直接使用（可能是因为你的 Python3 版本过旧），可以尝试用 `python3 -m pip` 代替 `pip3`。

（如果以后出于某种原因需要重新安装 Jupyter，可以使用 `--no-deps` 来避免重新安装所有依赖项。）

你也可以尝试 Jupyter Lab，这是 Project Jupyter 开发的新界面。
如果你想在浏览器中运行终端模拟器，它会特别有用。
可以通过 `pip3` 安装：
```
pip3 install jupyterlab
```

#### Scala 的 Jupyter 后端

如果你在本节遇到错误或问题，请先尝试运行 `rm -rf ~/.local/share/jupyter/kernels/scala/`。

接下来，下载 coursier，并用它安装 almond（这些说明的来源见[这里](https://almond.sh/docs/quick-start-install)）：
```
curl -L -o coursier https://git.io/coursier-cli && chmod +x coursier
SCALA_VERSION=2.12.10 ALMOND_VERSION=0.9.1
./coursier bootstrap -r jitpack \
    -i user -I user:sh.almond:scala-kernel-api_$SCALA_VERSION:$ALMOND_VERSION \
    sh.almond:scala-kernel_$SCALA_VERSION:$ALMOND_VERSION \
    --sources --default=true \
    -o almond
./almond --install
```

如果愿意，你可以删除 `coursier` 和 `almond` 文件。

#### 可视化

要显示 Chisel 模块的可视化结果（例如演示页面中的内容），需要安装 [Graphviz](https://graphviz.org/download/)。不过，可视化是可选的，即使不安装它，其他 Chisel 和 Scala 功能也可以正常使用。

#### 安装训练营
现在克隆训练营仓库，并安装自定义脚本。
如果你已经有一个自定义脚本，请将这段脚本追加到其中。

```
git clone https://github.com/freechipsproject/chisel-bootcamp.git
cd chisel-bootcamp
mkdir -p ~/.jupyter/custom
cp source/custom.js ~/.jupyter/custom/custom.js
```

如果要在本地机器上启动训练营：
```
jupyter notebook
```

如果你安装的是 Jupyter Lab，请改为运行 `jupyter-lab`。


### 本地安装 - Windows

以下说明大致描述了在 Windows 10 下安装 Generator Bootcamp 的方法。
可能会遇到各种不同的 Windows 配置，因此可能需要做出一些调整。
如果有内容已经过时，或者还应当在这里补充说明，请告诉我们。

>有很多地方你可能需要启动命令行（shell）窗口。
>我发现以管理员模式启动命令行窗口会很有帮助。
>要从左下角的启动器执行此操作，请在菜单中找到或搜索“CMD”，右键单击它，然后选择“以管理员模式启动”。
>更多细节见[这里](http://www.thewindowsclub.com/how-to-run-command-prompt-as-an-administrator)以及其他相关页面。
>此外，最好在安装过程中的每个步骤之间重新启动所有命令行窗口（例如安装 Java 之后），这样新安装的软件才会被识别。

#### 确保已安装 Java（最好是 Java 8）。
如果你在命令提示符中输入 `java`，但系统提示找不到该命令，则需要安装
[Java](https://adoptopenjdk.net/installation.html)。

#### 安装 Jupyter
Jupyter 建议使用 Anaconda 发行版，这里是其
[Windows 下载链接](https://www.anaconda.com/download/#windows)。

在 Jupyter 安装过程接近结束时，会询问是否将 Jupyter 添加到 PATH。
Windows 不建议这样做，但我建议这样做。这样使用命令提示符运行 Jupyter 会更方便。

如果你没有选择将 Jupyter 添加到 PATH，请从开始菜单中使用
“Anaconda Prompt (Anaconda3)”快捷方式启动命令提示符。

#### 安装 Scala 组件。

最简单的方法似乎是从[这里](https://github.com/coursier/coursier/releases/download/v2.0.0-RC6-24/coursier)下载 Coursier。

进入包含 `coursier`（文件）的下载文件夹，运行：

```
java -noverify -jar coursier launch --fork almond:0.10.6 --scala 2.12.8 -- --install
```

#### 可视化

要显示 Chisel 模块的可视化结果（例如演示页面中的内容），需要安装 [Graphviz](https://graphviz.org/download/)。不过，可视化是可选的，即使不安装它，其他 Chisel 和 Scala 功能也可以正常使用。

#### 安装 chisel-bootcamp 仓库。
将 [chisel-bootcamp](https://github.com/freechipsproject/chisel-bootcamp) 下载为 zip 文件（或使用 Windows Git 客户端），
然后将其解压到一个你有权限访问的目录中。
最好将它放在不包含空格的路径下。

安装自定义脚本：将 `chisel-bootcamp/source/custom.js` 移动到
`%HOMEDRIVE%%HOMEPATH%\.jupyter\custom\custom.js`。
如果你已经有一个 custom.js 文件，请将这段脚本追加到其中。

#### 启动 Jupyter 和训练营
在包含已解压 chisel-bootcamp 仓库的目录中，打开一个新的命令窗口并输入：
```bash
jupyter notebook
```
这应该会启动训练营服务器，并在你的默认浏览器中打开训练营的首页菜单。如果没有打开，
请在命令窗口中查找类似下面的内容，并将你看到的链接复制粘贴到浏览器窗口中。
```bash
    Copy/paste this URL into your browser when you connect for the first time,
    to login with a token:
        http://localhost:8888/?token=9c503729c379fcb3c7a17087f05462c733c1733eb8b31d07
```

##### 使用代理
如果你需要使用代理，请尝试取消注释并修改 `source/load-ivy.sc` 开头的相关行。

祝你好运！

### Cadence AWS 设置

如果你不知道 Cadence AWS 是什么，或者没有 Cadence AWS 的访问权限，请跳过本节。

进入你的工作目录，这很可能是你的主目录。

```
cd ~
```

然后运行以下命令。
默认 shell 是 c-shell；但如果你切换到 bash，请改为 source `jupyter_sh`。
```
source /craft/tools/jupyter/jupyter_csh
```

默认浏览器 Konqueror 无法配合 Jupyter 使用。
请在后台启动 Firefox，并在它询问时将 Firefox 设置为默认浏览器。
```
/craft/cdns_sw_inst/firefox/45.3.0esr/firefox &
```

克隆仓库并启动 Jupyter。
如果它要求输入令牌，请复制并粘贴终端中看到的 *to login with a token* URL。
之后一段时间内再次启动时就不会再询问。
```
git clone /craft/tools/chisel/generator-bootcamp.git
cd generator-bootcamp
jupyter notebook
```

### Cadence Chamber 设置

如果你不知道 Cadence Chamber 是什么，请跳过本节。
进入你的工作目录，很可能是 `/projects/craft_flow/work/<username>/`。
然后运行以下命令。
请注意，`/proj/` 是 `/projects/` 的别名。
如果你使用的是 bash，请改为 source `jupyter_sh`，而不是 `jupyter_csh`。

```
source /proj/craft_flow/tools/jupyter/jupyter_csh
git clone /proj/craft_flow/source/chisel/generator-bootcamp
cd generator-bootcamp
jupyter notebook
```
