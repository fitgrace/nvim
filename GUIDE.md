# 从零折腾 Vim 配置之 NeoVim

本项目是让大家知道 NeoVim 正在飞速进步 ，拥抱 lsp, async, treesitter 等新特性，NeoVim 一定比你想象的酷炫。

## 入门 vim

推荐两个关于 vim 基本知识教程的网站
* [OpenVim](https://openvim.com/): 交互式的学习 vim
* [vim check sheet](https://vim.rtorr.com/lang/zh_cn): vim 常用快捷键清单

建议使用 openvim 打牢基础之后，直接将 vim 用于实战中间，因为这些快捷键都是肌肉记忆，无非多熟悉一下而已。不要指望一次全部背下来，也没有必要全部记住，一次学几个，学最能提高你工作效率的那几个。

## Language Server Protocal

> The Language Server Protocol (LSP) defines the protocol used between an editor or IDE and a language server that provides language features like auto complete, go to definition, find all references etc. The goal of the Language Server Index Format (LSIF, pronounced like “else if”) is to support rich code navigation in development tools or a Web UI without needing a local copy of the source code.
> 语言服务器协议（LSP）定义了编辑器或IDE与语言服务器之间使用的协议，该协议提供了诸如自动完成、转到定义、查找所有参考文献等语言功能。语言服务器索引格式（LSIF，发音类似于 “else if”）的目标是在开发工具或Web UI中支持丰富的代码导航，而不需要源代码的本地拷贝。

简单的来说，LSP 是一个协议，Language Server 可以通过这个协议给 IDE 或者文本编辑器（比如Neovim、VScode等），提供诸如自动补全，定义跳转等功能。总体而言，LSP 定义了一个简单的服务器-客户端模型。

1. 不同的语言需要不同的 Language Server，比如 C/C++ 需要 clangd, Rust 语言采用 rust analyzer, 官方列举了很多 lsp servers。
2. 不同的编辑按照 lsp 的规范和 language server 通信

他们大致的关系如下, 通过统一的接口，大大的减少了重复开发，lsp 定义的查找引用，定义，格式化代码功能只需要安装对应的 language server 支持就是开箱即用，再也无需从各种插件哪里东拼西凑这些功能。

```
   +--------------------------+     +---------------------+
   |      Editor              |     |   Language Server   |
   +--------------------------+     +---------------------+
   |     Emacs                |     |                     |
   |     Neovim               + --> |      clangd         |
   |     Visual Studio Code   |     |                     |
   +--------------------------+     +---------------------+
```

目的：实现类似 IDE 的智能提示、语法检查和解析、悬停文档等交互体验。


## Async

async 的效果当然就是快，当一个插件存在其 async 的版本，那么毫无疑问，就应该使用 async 版本。

文件树插件，我之前一直都是使用 nerdtree 的，直到有一天我用 vim 打开 Linux kernel，我发现光标移动都非常的困难，我开始以为是终端的性能问题，最后将 nerdtree 替换为 nvim-tree 。


## Treesitter

Treesitter 通过语法分析，而不是词法分析，这让很多事情都非常精确，通过 Treesitter 有的插件可以做到超乎想象的事情。

1. 更加智能和高效的高亮。原始的 vim 中只能按照正则匹配来高亮关键字，但是 treesitter 可以区分什么是函数，成员，类，宏等定义。
2. 如果想要跳转到函数头，在 vim 中使用默认提供 [m，但是这是根据词法规则实现的，要么跳转到第一个匹配的 { ，要么跳转到最外层的 { ，因此 对于文件的格式有要求，但是如果使用上 nvim-treesitter-textobjects，这个问题就不存在了，你总是可以跳转到函数的开始位置。
3. 精确的拼写检查。spellsitter 可以让拼写检查仅仅检查注释中内容，而默认的检查会检查所有的单词，包括各种缩写函数名，那些检查大部分都是误报。

## 为什么应该使用 neovim 而不是 vim

其实 vim 还有一个祖先叫做 vi, vim 全称为 vi improve, 但是 vim 在很长一段时间更新的不大，neovim 的作者提交了一个很大的 patch 给 vim，但是被 vim 的作者拒绝了， 因为这个 patch 太大了，改动太多，然后 neovim 的作者就开始自立门户搞了一个 neovim，很多 vim 特性都是被 neovim 逼出来的，[neovim 推出之后，vim 的更新速度大大加快了](https://www.contextualize.ai/mpereira/20-years-of-vim-ef9acae9)，总体来说，neovim 相较于 vim :

1、更新更快, 添加的新功能更多，例如内置 lsp, lua 语言的支持。
2、社区更活跃。这个你对比一下 vim 和 neovim 的开发者数量就可以知道了，vim 很长时间都只有一个人开发的。
3、很多插件依赖 neovim 新特性，或者只能在 vim 上勉强使用。
4、neovim 支持 lua 语言配置。

## 安装
`bash
$ brew install neovim
`
安装完之后，为了方便后面的使用，需要进行以下 bash 配置：
`bash
alias vi='nvim' # 将 "vi" 命令别名指向 "nvim"（NeoVim）
alias vim='nvim' # 将 "vim" 命令别名也指向 "nvim"
`

## Neovim 配置

Nvim 的配置目录在 ~/.config/nvim 下。在 Linux/Mac 系统上，Nvim 会默认读取 ~/.config/nvim/init.lua 文件，理论上来说可以将所有配置都放在这个文件里面，但这样不是一个好的做法，因此划分不同的目录和文件来分管不同的配置是个不错的选择。

`bash
# Neovim 目录结构
.  
├── init.lua        # 主入口文件，负责加载核心配置和插件管理器  
├── lazy-lock.json  # 插件版本锁定文件（由 Lazy.nvim 自动生成维护）  
├── LICENSE         # 许可证文件（若配置开源）  
├── lua/            # Lua 配置模块目录（Neovim 标准配置结构）  
│   ├── core/       # 基础功能配置模块  
│   │   ├── init.lua     # 入口
│   │   ├── keymaps.lua  # 快捷键映射配置  
│   │   ├── lazy.lua     # 插件管理器 Lazy.nvim 的配置  
│   │   └── options.lua  # 基础设置（行号/缩进/颜色等）
│   └── plugins/         # 各插件独立配置文件  
│       ├── colorscheme/ # 配色
│       │   ├── catppuccin.lua
│       │   ├── gruvbox.lua
│       │   └── tokyonight.lua
│       ├── lsp/
│       │   ├── init.lua     # 入口
│       │   └── options.lua  # 基础设置（行号/缩进/颜色等）
│       ├── neo-tree.lua     # 文件树插件 (neo-tree.nvim)  
│       ├── treesitter.lua   # 语法高亮 (nvim-treesitter)  
│       └── which-key.lua    # 快捷键提示插件  
└── README.md
`

## 插件管理器

Neovim 支持多个插件管理器，例如 vim-plug、dein、minpac, packer, lazy 等。在这里，我们将使用 [lazy.nvim](https://github.com/folke/lazy.nvim) 作为插件管理器。

## 代码高亮 nvim-treesitter 的安装与配置

nvim-treesitter 插件提供基于 tree-sitter 的多个基础功能，它可以让你在 nvim 中高效的实现 代码高亮，增量选择 等功能。

## LSP 配置


## 值得一看的配置

* [LazyVim](https://github.com/LazyVim/LazyVim)：folke 大神写的 nvim 配置
* [kickstart.nvim](https://github.com/nvim-lua/kickstart.nvim)：这绝对是开始使用 lua 来配置的 nvim 开始的好地方。强烈推荐。
* [LunarVim](https://github.com/LunarVim/LunarVim)：超过 15000 star 的 IDE 配置
* [NvChad](https://github.com/NvChad/NvChad)：同上
* [jdhao/nvim-config](https://github.com/jdhao/nvim-config)：jdhao 的配置
* [nyoom.nvim](https://github.com/nyoom-engineering/nyoom.nvim)：纯 fennel

<!--
参考：
2024 年 vim 的 C/C++ 配置：https://martins3.github.io/My-Linux-Config/docs/nvim.html
详解nvim内建LSP体系与基于nvim-cmp的代码补全体系：https://www.cnblogs.com/w4ngzhen/p/17546969.html

neovim入门指南(三)：LSP配置(上): https://youngxhui.top/2023/09/neovim-beginners-guide-part-three-lsp-configuration-part-one/

无论是对待自己，还是对待他人，只要情义不灭，尽心就好，该放手时自当放手，节莫求全责备，生了执念。
-->
