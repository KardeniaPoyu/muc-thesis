# MUC Thesis LaTeX Template

本目录提供一个面向“中央民族大学本科毕业论文（设计）”的 XeLaTeX 模板，核心文件为 `muc-thesis.cls`。

## 推荐项目结构

```text
muc-thesis/
|-- main.tex
|-- muc-thesis.cls
|-- references.bib
|-- README.md
|-- figures/
|-- frontmatter/
|   |-- task-book-signed.pdf
|   `-- integrity-pledge-signed.pdf
`-- vertopal_e0d7cf72ee6745ca98d1712b40ad6067/
    `-- media/
```

## 编译方式

```bash
xelatex main.tex
biber main
xelatex main.tex
xelatex main.tex
```

## 模板要点

- 基于 `ctexbook`，要求使用 XeLaTeX。
- 页边距为上 2.5cm、下 2.5cm、左 2cm、右 2cm、装订线 0.5cm。
- 正文默认五号宋体，英文字体为 Times New Roman，行距 1.5 倍。
- 页眉居中显示“中央民族大学本科生毕业论文(设计)”，页脚居中显示页码。
- 一级标题为居中黑体三号，二级标题为左对齐黑体小四。
- 图、表、公式按章编号，例如“图 1-1”“表 2-2”“(3-1)”。
- 参考文献通过 `biblatex + gb7714-2015` 实现。
- 已签字 PDF 可通过 `\insertfrontpdf{...}` 插入。
