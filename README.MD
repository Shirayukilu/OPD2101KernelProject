# 🛠️ OPD2101KernelProject
> 为 OPPO Pad (OPD2101 / SM8250) 打造的定制内核项目，基于官方开源源码深度优化，云端一键编译，打造流畅、稳定、可定制的专属内核体验。

[![GitHub Workflow Status](https://img.shields.io/github/actions/workflow/status/你的用户名/你的仓库名/build.yml?branch=构建内核&label=编译状态&style=flat-square)](https://github.com/你的用户名/你的仓库名/actions)
[![License](https://img.shields.io/badge/license-GPL--3.0-blue.svg?style=flat-square)](LICENSE)
[![Platform](https://img.shields.io/badge/platform-SM8250-lightgrey.svg?style=flat-square)](https://www.qualcomm.com/smartphones/products/8-series/snapdragon-870-5g-mobile-platform)
[![Device](https://img.shields.io/badge/device-OPPO%20Pad%20(OPD2101)-green.svg?style=flat-square)](https://www.oppo.com/cn/accessories/oppo-pad/)

---

## 📖 项目介绍
`OPD2101KernelProject` 是一个为 **OPPO Pad (OPD2101，骁龙SM8250)** 打造的开源内核项目，基于 OPPO-Source 官方内核源码二次开发。
项目的核心目标是：
- 提供比官方内核更稳定、更流畅的使用体验
- 保留官方兼容性的同时，加入实用的自定义功能
- 借助 GitHub Actions 实现**零门槛云端一键编译**，无需本地搭建复杂环境
- 支持 KernelSU / SusFS 等 Root 与隐藏功能，满足进阶用户需求

本项目严格遵循 **GPL-3.0 开源协议**，所有修改均基于公开的官方源码，欢迎大家一起贡献和改进。

---

## ✨ 核心功能与特性
### 🔧 基础优化
- 基于官方 SM8250 内核源码，深度适配 OPPO Pad (OPD2101) 设备树与驱动
- 优化调度器与内存管理，提升平板日常使用的流畅度与后台留存
- 修复部分官方内核存在的稳定性问题与兼容性Bug

### 📦 云端编译支持
- 完整的 GitHub Actions 自动化编译流程，全程无需本地环境
- 可自定义编译参数：仓库地址、分支、配置文件、版本号等
- 支持一键打包 AnyKernel3 刷机包，直接通过 Recovery 刷入

### 🛡️ 进阶功能（可选）
- **KernelSU 集成**：可一键开启 KernelSU 内核级 Root 支持，无需刷入第三方 Recovery
- **SusFS 集成**：在 KernelSU 基础上可选集成 SusFS，增强 Root 隐藏能力，适配银行、游戏等检测严格的应用
- **自定义版本号**：支持自定义内核版本后缀，并可自动添加编译日期，方便区分不同版本

---

## 📋 目录
- [快速开始](#-快速开始)
- [参数说明](#-参数说明)
- [获取产物](#-获取产物)
- [编译原理](#-编译原理)
- [常见问题](#-常见问题)
- [开源协议](#-开源协议)

---

## 🚀 快速开始
### 1. 前置条件
确保你的 GitHub 仓库中包含以下核心文件：
- `.github/workflows/build.yml`（GitHub Actions 自动化编译脚本）
- `README.md`（本文件）
- `LICENSE`（GPL-3.0 开源许可证）

### 2. 触发编译
无需本地配置任何环境，全程云端一键构建：
1.  进入项目主页，点击顶部的「Actions」标签页
2.  选择「构建内核」工作流，点击右侧「运行工作流」
3.  按需填写参数（参考下方「参数说明」）
4.  点击「运行工作流」，等待编译完成即可

---

## ⚙️ 参数说明
运行工作流时，你可以根据需求配置以下参数：

| 参数 | 说明 | 示例 |
| :--- | :--- | :--- |
| `闭源驱动仓库地址` | OPPO Pad (OPD2101) 对应的设备树与驱动仓库地址 | `https://github.com/Shirayukilu/Devicetree_oppo_sm8250_opd2101` |
| `闭源驱动仓库分支` | 驱动仓库对应的分支，需与内核分支匹配 | `oppo/sm8250_t_13.0.0_oppopad` |
| `内核源码仓库地址` | SM8250 内核源码仓库地址 | `https://github.com/Shirayukilu/android_kernel_oppo_sm8250` |
| `开源仓库分支` | 内核源码对应的分支，需与驱动分支匹配 | `lineage-23.0` |
| `配置文件名称` | 内核编译使用的 defconfig 文件 | `gki_defconfig` |
| `是否集成 KernelSU` | 选择是否开启 KernelSU 内核级 Root 支持 | `true` / `false` |
| `是否集成 SusFS` | 选择是否在 KSU 基础上集成 SusFS 隐藏模块（需先开启KSU） | `true` / `false` |
| `自定义内核版本号` | 自定义内核版本后缀，如 `opd-v1.0` | `opd-v1.0-KSU` |
| `是否加入编译日期` | 选择是否在版本号后自动添加编译日期 | `true` / `false` |

---

## 📦 获取产物
1.  在对应的 Action 运行记录页面，找到 `Artifacts` 区域
2.  下载以下两种产物：
    - `kernel-image-xxx`：内核镜像文件（`Image`/`Image.gz`），可用于手动替换或集成到刷机包
    - `kernel-anykernel3-xxx`：AnyKernel3 格式刷机包，可直接通过 Recovery 刷入
3.  刷机前请务必备份数据，并确认你的设备型号与内核版本兼容！

---

## ⚙️ 编译原理
本脚本复刻了传统本地编译的核心逻辑，并将其完整迁移到云端：
1.  **拉取资源**：分别克隆 OPPO Pad (OPD2101) 闭源驱动/设备树仓库和 SM8250 内核源码仓库
2.  **构建目录**：在 `/kernel/common` 下构建标准 Android 内核编译树，符合官方编译规范
3.  **注入驱动**：合并闭源仓库的 `vendor` 驱动文件，确保设备硬件兼容性
4.  **可选集成**：根据配置自动集成 KernelSU / SusFS 补丁
5.  **配置与编译**：写入自定义版本号，执行 `make` 命令编译内核
6.  **打包输出**：生成内核镜像与 AnyKernel3 刷机包，自动上传为 Artifacts

---

## 🛠️ 常见问题（故障排除）
### Q1：编译报错 `Permission denied`？
> 这是常见的文件权限问题，脚本已内置 `sudo chown -R $USER:$USER /kernel` 命令处理权限。若仍报错，请检查工作流中是否有额外的权限限制步骤。

### Q2：驱动/内核仓库拉取失败？
> 请检查你填写的仓库地址与分支是否正确，确保仓库是公开的，或已正确配置访问权限。部分私有仓库可能需要配置 Token 才能拉取。

### Q3：集成 KernelSU 失败？
> 请确保你的内核源码分支支持 KSU 补丁，非 GKI 内核或部分老旧分支可能存在兼容性问题。建议优先使用官方 GKI 分支进行编译。

### Q4：刷入内核后无法开机？
> 请确认你下载的内核版本与你的设备型号、系统版本完全兼容，刷入前务必备份数据。若出现问题，可通过 Recovery 刷回官方内核恢复。

---

## 📜 开源协议
本项目基于 **GPL-3.0 开源协议** 发布，你可以自由使用、修改和分发代码，但必须保留开源声明与协议文本，且修改后的衍生作品也需以相同协议开源。

---

💡 感谢使用 `KonaryKernelProject`！如果你觉得项目好用，欢迎给个 Star ⭐ 支持一下！
