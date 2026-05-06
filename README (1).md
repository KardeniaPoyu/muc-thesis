# 中央民族大学本科生毕业论文 LaTeX 模板

理学院 2025 年版，依据《中央民族大学本科生毕业论文（设计）撰写规范》制作。

---

## 文件说明

```
cun_thesis/
├── cun_thesis.cls      % 文档类（格式定义，通常不需改动）
├── main.tex            % 主文件（在此基础上撰写论文）
├── figures/            % 图片目录（建议创建此文件夹）
└── README.md           % 本说明文件
```

---

## 使用前提

| 工具 | 说明 |
|------|------|
| **TeX 发行版** | TeX Live 2022+ 或 MiKTeX（含最新包） |
| **编译引擎** | **XeLaTeX**（必须，不可用 pdfLaTeX） |
| **中文字体** | Windows：SimSun/SimHei 已内置；macOS/Linux：需安装思源字体或修改 `.cls` 中的字体名称 |
| **编辑器** | VS Code + LaTeX Workshop、TeXstudio、Overleaf（需上传字体） |

> **Overleaf 用户**：将编译器切换为 `XeLaTeX`，并在 `cun_thesis.cls` 中将中文字体改为：
> ```latex
> \setCJKmainfont{Noto Serif CJK SC}
> \setCJKsansfont{Noto Sans CJK SC}
> ```

---

## 快速开始

1. 打开 `main.tex`，修改论文基本信息（标题、姓名、学号等）。
2. 按照章节结构填写正文内容。
3. 用 **XeLaTeX** 编译两遍（目录和交叉引用需要两遍）：
   ```bash
   xelatex main.tex
   xelatex main.tex
   ```

---

## 格式规范对照表

| 内容 | 规范要求 | LaTeX 实现 |
|------|---------|-----------|
| 纸张 | A4 竖向 | `geometry` 宏包已设置 |
| 页边距 | 上2.5cm，下2.5cm，左2.5cm（含0.5cm装订线），右2cm | `.cls` 中已配置 |
| 正文字体 | 五号宋体（10.5pt） | `\zihao{5}\songti` |
| 英文字体 | Times New Roman | `setmainfont` 已设置 |
| 行距 | 1.5 倍行距（理学院建议） | `\setstretch{1.5}` |
| 一级标题 | 三号黑体，居中 | `\chapter{}` |
| 二级标题 | 四号黑体，缩进两字 | `\section{}` |
| 三级标题 | 小四号宋体，缩进两字 | `\subsection{}` |
| 图题 | 五号黑体，图下居中，格式"图 1-1 标题" | `\caption{}` + `\label{}` |
| 表题 | 五号黑体，表上居中，格式"表 1-1 标题" | `\caption{}` + `\label{}` |
| 公式编号 | 右对齐，格式"(1-1)" | `equation` 环境，已按章编号 |
| 参考文献 | GB/T 7714，数字上标 `[1]` | `\cite{}` |
| 页眉 | "中央民族大学本科生毕业论文（设计）" | `fancyhdr` 已设置 |
| 页脚 | 居中页码 | `fancyhdr` 已设置 |

---

## 常用命令示例

### 插入图片
```latex
\begin{figure}[htbp]
  \centering
  \includegraphics[width=0.7\textwidth]{figures/myimage.png}
  \caption{图片标题}
  \label{fig:myimage}
\end{figure}

% 正文中引用：如图~\ref{fig:myimage} 所示
```

### 插入表格（三线表）
```latex
\begin{table}[htbp]
  \centering
  \caption{表格标题}
  \label{tab:mytable}
  \begin{tabular}{lcc}
    \toprule
    列1 & 列2 & 列3 \\
    \midrule
    数据 & 数据 & 数据 \\
    \bottomrule
  \end{tabular}
\end{table}

% 正文中引用：如表~\ref{tab:mytable} 所示
```

### 公式
```latex
% 带编号的独立公式
\begin{equation}
  E = mc^2
  \label{eq:energy}
\end{equation}

% 引用：式~\eqref{eq:energy}

% 多行公式
\begin{align}
  a &= b + c \\
  d &= e + f
\end{align}

% 无编号公式
\[
  \int_0^\infty e^{-x^2}\,\mathrm{d}x = \frac{\sqrt{\pi}}{2}
\]
```

### 参考文献
```latex
% 在 thebibliography 环境中添加：
\bibitem{zhang2024}
张三，李四．某某研究[J]．某某期刊，2024，10(2)：100-110.

% 正文中引用（上标）：
某某方法\cite{zhang2024}具有……

% 直接说明时（正文排齐）：
由文献 \cite{zhang2024} 可知……
```

### 插入 PDF 页面（诚信承诺书等官方扫描件）
```latex
% 在 main.tex 的导言区添加：
\usepackage{pdfpages}

% 替换对应命令：
\includepdf[pages=1]{integrity_pledge.pdf}
```

---

## 注意事项

1. **信计/统计专业**页眉写"本科毕业论文"，**光电/纳米专业**写"本科毕业设计"，修改 `.cls` 中 `fancyhead` 的内容。
2. 封面日期通常为毕业当年 **4 月 20 日**；任务书签署时间通常为第七学期 **11 月 30 日附近**，早于开题报告时间。
3. 每章末尾需要有"**本章小结**"一节。
4. 参考文献格式遵循 **GB/T 7714** 标准。
5. 打印前检查所有交叉引用（编译两遍），确认无"??"出现。
