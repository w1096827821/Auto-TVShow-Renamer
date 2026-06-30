# Auto-TVShow-Renamer

A high-density, zero-dependency Windows batch automation tool driven by a PowerShell core engine, specifically designed to clean and standardize chaotic TV show file naming conventions into Plex/Emby/Jellyfin compatible formats.

一个基于 PowerShell 核心驱动的高性能、零依赖 Windows 批处理自动化微型工具，专为规避传统运维脚本缺陷而设计，可一键将混乱的剧集文件名清洗为标准媒体库（Plex/Emby）识别格式。

## 核心技术痛点解决 (Key Engineering Problems Solved)

* **Encoding Resilience (编码鲁棒性)**: 彻底剥离了传统 Batch 脚本在中文路径下因 `GBK/UTF-8` 字节错位导致大括号 `(...)` 语法块熔断崩溃的致命缺陷。底层采用纯英文字符控制流辅以 Unicode 编码注入，实现 100% 乱码免疫。
* **Argument Length Limitation Bypass (绕过传参限制)**: 摒弃了 Windows 资源管理器脆弱的“多文件鼠标拖拽”机制（该机制在长路径、多文件时会因 `lpCmdLine` 字符串超长导致系统级静默截断流失败）。改用本地目录自感知拓扑（Directory-Self-Awareness），双击即燃。
* **Heuristic Token Extraction (启发式特征提取)**: 内部构建了多级正则表达式匹配管道（Regex Pipeline），自动过滤 `[字幕组]`、`【首发】` 等高噪标签，智能提取剧名（向上回溯文件夹解耦）、季集标识（`SxxExx` / `Eoo` / `第oo集`）以及分辨率标尺（`2160p/1080p/720p`）。

## 架构体系与清洗效果 (Transformation Showcase)

### 原始混乱命名 (Raw Chaotic FileNames)
* `30枚银币.30Monedas.S01E02.1080p.WEBRip.AC3.x26...`
* `30枚银币.30Monedas.S01E04.720P.WEBRip.x264.中英..`
* `30Monedas.S01E05.720p.WEBRip.x264,中英...`

### 标准化洗白输出 (Standardized Output)
* `30枚银币 S01E02 1080p.mkv`
* `30枚银币 S01E04 720p.mkv`
* `30枚银币 S01E05 720p.mkv`

## 部署与使用 (Deployment)

1. 下载项目中的 `clean-rename.bat`。
2. 将其丢入任意目标美剧媒体文件夹中（如 `G:\Media\30枚硬币第一季\`）。
3. 双击运行，脚本将在 `< 500ms` 内异步完成全目录文件的原位（In-place）原子重命名。

## 许可证 (License)

Licensed under the [MIT License](LICENSE).
