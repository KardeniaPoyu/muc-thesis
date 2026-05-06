% ============================================================
%  cun_thesis.cls — 中央民族大学本科生毕业论文文档类
%  理学院 2025 年版
%  依据《中央民族大学本科生毕业论文（设计）撰写规范》
% ============================================================
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{cun_thesis}[2025/11/01 CUN Undergraduate Thesis Template]

% ==================== 基础文档类 ====================
% A4 纸，单面打印，12pt（正文 10.5pt 通过字体命令实现）
\LoadClass[a4paper,12pt,oneside]{ctexbook}

% ==================== 必要宏包 ====================
\RequirePackage{geometry}       % 页面设置
\RequirePackage{fontspec}       % 字体设置（XeLaTeX）
\RequirePackage{xeCJK}          % 中文支持
\RequirePackage{setspace}       % 行距
\RequirePackage{titlesec}       % 标题格式
\RequirePackage{titletoc}       % 目录格式
\RequirePackage{fancyhdr}       % 页眉页脚
\RequirePackage{graphicx}       % 图片
\RequirePackage{booktabs}       % 三线表
\RequirePackage{multirow}       % 表格合并行
\RequirePackage{amsmath}        % 数学公式
\RequirePackage{amssymb}        % 数学符号
\RequirePackage{unicode-math}   % Unicode 数学字体
\RequirePackage{caption}        % 图表题注
\RequirePackage{subcaption}     % 子图
\RequirePackage{enumitem}       % 列表
\RequirePackage{hyperref}       % 超链接
\RequirePackage{url}            % URL
\RequirePackage{xcolor}         % 颜色
\RequirePackage{array}          % 表格增强
\RequirePackage{tabularx}       % 自动宽度表格
\RequirePackage{makecell}       % 单元格内换行
\RequirePackage{pdfpages}       % 插入 PDF 页面（承诺书等）
\RequirePackage{etoolbox}       % 工具宏包

% ==================== 页面设置 ====================
% 规范：A4，上2.5cm，下2.5cm，左2cm，右2cm，装订线0.5cm（左）
\geometry{
  a4paper,
  top      = 2.5cm,
  bottom   = 2.5cm,
  left     = 2.5cm,   % 2cm + 0.5cm 装订线
  right    = 2cm,
  bindingoffset = 0cm,
  headheight = 14pt,
  headsep    = 0.5cm,
  footskip   = 1cm,
}

% ==================== 字体设置 ====================
% 使用系统中文字体；英文使用 Times New Roman
\setmainfont{Times New Roman}
\setsansfont{Arial}
\setCJKmainfont[
  BoldFont   = {SimHei},
  ItalicFont = {KaiTi},
]{SimSun}
\setCJKsansfont{SimHei}
\setCJKmonofont{FangSong}

% 若系统无上述字体，请改用 TeX 内置字体：
% \usepackage{newtxtext,newtxmath}
% \setCJKmainfont{Noto Serif CJK SC}

% 数学字体
\setmathfont{XITS Math}[
  Extension    = .otf,
  BoldFont     = XITSMath-Bold,
]

% ==================== 行距 ====================
% 规范：正文 1.5 倍行距（理学院建议）
\setstretch{1.5}

% ==================== 论文信息命令 ====================
\newcommand{\@subtitle}{}
\newcommand{\@entitle}{}
\newcommand{\@enauthor}{}
\newcommand{\@ensupervisor}{}
\newcommand{\@studentid}{}
\newcommand{\@grade}{}
\newcommand{\@college}{}
\newcommand{\@major}{}
\newcommand{\@supervisor}{}

\newcommand{\subtitle}[1]{\renewcommand{\@subtitle}{#1}}
\newcommand{\entitle}[1]{\renewcommand{\@entitle}{#1}}
\newcommand{\enauthor}[1]{\renewcommand{\@enauthor}{#1}}
\newcommand{\ensupervisor}[1]{\renewcommand{\@ensupervisor}{#1}}
\newcommand{\studentid}[1]{\renewcommand{\@studentid}{#1}}
\newcommand{\grade}[1]{\renewcommand{\@grade}{#1}}
\newcommand{\college}[1]{\renewcommand{\@college}{#1}}
\newcommand{\major}[1]{\renewcommand{\@major}{#1}}
\newcommand{\supervisor}[1]{\renewcommand{\@supervisor}{#1}}

% ==================== 封面 ====================
\newcommand{\makecoverpage}{%
  \begin{titlepage}
    \centering
    \vspace*{1cm}
    {\zihao{2}\bfseries\heiti 中央民族大学本科生毕业论文（设计）}\par
    \vspace{3cm}
    {\zihao{-1}\bfseries\heiti 本科毕业论文（设计）}\par
    \vspace{2cm}
    \begin{center}
      \zihao{3}\songti
      \begin{tabular}{ll}
        \rule{1.5cm}{0pt}题\hspace{2em}目：&
          \underline{\hspace{6cm}\@title\hspace{1cm}}\\[0.8em]
        \rule{3.5cm}{0pt}——&
          \underline{\hspace{6cm}\@subtitle\hspace{1cm}}\\[1.5em]
        \rule{1.5cm}{0pt}姓\hspace{2em}名：&
          \underline{\makebox[6cm]{\@author}}\\[0.8em]
        \rule{1.5cm}{0pt}学\hspace{2em}号：&
          \underline{\makebox[6cm]{\@studentid}}\\[0.8em]
        \rule{1.5cm}{0pt}年\hspace{2em}级：&
          \underline{\makebox[6cm]{\@grade}}\\[0.8em]
        \rule{1.5cm}{0pt}学\hspace{2em}院：&
          \underline{\makebox[6cm]{\@college}}\\[0.8em]
        \rule{1.5cm}{0pt}专\hspace{2em}业：&
          \underline{\makebox[6cm]{\@major}}\\[0.8em]
        \rule{1.5cm}{0pt}指导教师：&
          \underline{\makebox[6cm]{\@supervisor}}\\[0.8em]
      \end{tabular}
    \end{center}
    \vfill
    {\zihao{3}\songti\@date}\par
    \vspace{1cm}
  \end{titlepage}
  \cleardoublepage
}

% ==================== 任务书 ====================
% 任务书通常为扫描件或单独 PDF，建议用 \includepdf 插入
% 此处提供可填写的 LaTeX 版本
\newcommand{\maketaskbook}{%
  \thispagestyle{empty}
  \begin{center}
    {\zihao{-2}\bfseries\heiti 本科毕业论文（设计）任务书}
  \end{center}
  \vspace{0.5em}
  \zihao{5}\songti
  \begin{tabular}{|p{1.8cm}|p{2.8cm}|p{1.8cm}|p{2.8cm}|}
    \hline
    学\hspace{1em}院 & \@college & 专\hspace{1em}业 & \@major \\
    \hline
    年\hspace{1em}级 & \@grade   & 学\hspace{1em}号 & \@studentid \\
    \hline
    姓\hspace{1em}名 & \@author  & 起止时间 & 20xx.10.15--20xx.4.20 \\
    \hline
    指导教师姓名 & \@supervisor & 职\hspace{1em}称 & \\
    \hline
    \multicolumn{2}{|l|}{题\hspace{1em}目} & \multicolumn{2}{l|}{\@title} \\
    \hline
    \multicolumn{4}{|l|}{目的} \\
    \multicolumn{4}{|p{10.5cm}|}{\vspace{2cm}} \\
    \hline
    \multicolumn{4}{|l|}{内容与要求（包括原始数据、技术要求、工作要求及成果要求等）} \\
    \multicolumn{4}{|p{10.5cm}|}{\vspace{3cm}} \\
    \hline
    \multicolumn{4}{|l|}{进度安排} \\
    \multicolumn{4}{|p{10.5cm}|}{\vspace{2cm}} \\
    \hline
    \multicolumn{4}{|l|}{文献查阅指引} \\
    \multicolumn{4}{|p{10.5cm}|}{\vspace{2cm}} \\
    \hline
    \multicolumn{2}{|l|}{指导教师（签名）\hspace{2cm}} & 日期 & 202X.11.30 \\
    \hline
  \end{tabular}
  \cleardoublepage
}

% ==================== 诚信承诺书 ====================
% 原件为图片/PDF 格式；此处提供文字版，建议替换为官方扫描件
\newcommand{\makeintegritypage}{%
  \thispagestyle{empty}
  \begin{center}
    {\zihao{-2}\bfseries\heiti 本科毕业论文（设计）学术诚信承诺书}
  \end{center}
  \vspace{1em}
  \zihao{5}\songti\setlength{\parindent}{2em}

  本人郑重承诺：所呈交的毕业论文（设计）是本人在导师指导下独立进行研究工作所取得
  的研究成果。论文中引用他人已经发表或撰写过的研究成果，均已做了明确标注；对本研
  究做出重要贡献的个人和集体，均已在文中以明确方式标明；论文中的研究数据、实验结
  果均是真实可靠的。

  本人完全了解违反学术诚信的行为将受到学校的严肃处理，愿意承担本声明所带来的相应
  责任和后果。

  \vspace{2cm}
  \hspace{4cm}承诺人签名：\underline{\hspace{4cm}}\par
  \vspace{0.8cm}
  \hspace{4cm}日\hspace{3em}期：202X年4月20日\par
  \cleardoublepage
}

% ==================== 使用授权书 ====================
\newcommand{\makeauthorizationpage}{%
  \thispagestyle{empty}
  \begin{center}
    {\zihao{-2}\bfseries\heiti 本科毕业论文（设计）使用授权书}
  \end{center}
  \vspace{1em}
  \zihao{5}\songti\setlength{\parindent}{2em}

  本人完全了解中央民族大学有关收集、保存、使用学位论文的规定，即：学校有权保留并
  向有关部门或机构送交论文的复印件和电子版，允许论文被查阅和借阅，可以采用影印、
  缩印或扫描等复制手段保存、汇编学位论文。

  \vspace{2cm}
  \hspace{1cm}本人签名：\underline{\hspace{3cm}}
  \hspace{2cm}日期：202X年4月20日\par
  \vspace{0.8cm}
  \hspace{1cm}指导老师签名：\underline{\hspace{3cm}}
  \hspace{2cm}日期：202X年4月20日\par
  \cleardoublepage
}

% ==================== 中文摘要 ====================
\newenvironment{cnabstract}[1]{%  #1 = 关键词
  \cleardoublepage
  \thispagestyle{plain}
  \phantomsection
  \addcontentsline{toc}{chapter}{摘要}
  \begin{center}
    {\zihao{3}\bfseries\heiti\@title}\\[0.5em]
    \ifx\@subtitle\empty\else
      {\zihao{3}\bfseries\heiti——\@subtitle}\\[0.5em]
    \fi
    \vspace{0.5em}
    {\zihao{4}\bfseries\heiti 摘\hspace{2em}要}
  \end{center}
  \vspace{0.5em}
  \zihao{5}\songti\setlength{\parindent}{2em}
}{%
  \par\vspace{0.5em}\noindent
  {\zihao{-4}\bfseries\heiti 关键词：}%
  {\zihao{5}\songti #1}
  \cleardoublepage
}

% ==================== 英文摘要 ====================
\newenvironment{enabstract}[1]{%  #1 = Keywords
  \thispagestyle{plain}
  \phantomsection
  \addcontentsline{toc}{chapter}{Abstract}
  \begin{center}
    {\zihao{3}\bfseries\MakeUppercase{\@entitle}}\\[0.5em]
    \vspace{0.5em}
    {\zihao{4}\bfseries ABSTRACT}
  \end{center}
  \vspace{0.5em}
  \zihao{5}\rmfamily\setlength{\parindent}{2em}
}{%
  \par\vspace{0.5em}\noindent
  {\zihao{-4}\bfseries Keywords: }%
  {\zihao{5}\rmfamily #1}
  \cleardoublepage
}

% ==================== 目录格式 ====================
\renewcommand{\contentsname}{目\hspace{2em}录}
\titlecontents{chapter}[0em]
  {\addvspace{0pt}\zihao{5}\songti}
  {\contentslabel{1.5em}}{}
  {\titlerule*[0.5pc]{.}\contentspage}

\titlecontents{section}[1.5em]
  {\zihao{5}\songti}
  {\contentslabel{2em}}{}
  {\titlerule*[0.5pc]{.}\contentspage}

\titlecontents{subsection}[3.5em]
  {\zihao{5}\songti}
  {\contentslabel{2.5em}}{}
  {\titlerule*[0.5pc]{.}\contentspage}

% ==================== 标题格式 ====================
% 一级标题：三号黑体，居中
\titleformat{\chapter}[block]
  {\centering\zihao{3}\bfseries\heiti}
  {\thechapter}{1em}{}
\titlespacing{\chapter}{0pt}{0.5\baselineskip}{0.5\baselineskip}

% 二级标题：四号黑体，左对齐，缩进两字
\titleformat{\section}[block]
  {\zihao{4}\bfseries\heiti}
  {\thesection}{1em}{}
\titlespacing{\section}{2\ccwd}{0.4\baselineskip}{0.4\baselineskip}

% 三级标题：小四号宋体，缩进两字
\titleformat{\subsection}[block]
  {\zihao{-4}\bfseries\songti}
  {\thesubsection}{1em}{}
\titlespacing{\subsection}{2\ccwd}{0.3\baselineskip}{0.3\baselineskip}

% ==================== 正文切换 ====================
\newcommand{\mainmatter}{%
  \cleardoublepage
  \pagestyle{fancy}
  \setcounter{page}{1}
  \pagenumbering{arabic}
}

% ==================== 页眉页脚 ====================
\pagestyle{fancy}
\fancyhf{}
\fancyhead[C]{\zihao{5}\songti 中央民族大学本科生毕业论文（设计）}
\fancyfoot[C]{\zihao{5}\thepage}
\renewcommand{\headrulewidth}{0.4pt}
\renewcommand{\footrulewidth}{0pt}

% 摘要、目录页使用 plain 样式（仅页码）
\fancypagestyle{plain}{%
  \fancyhf{}
  \fancyfoot[C]{\zihao{5}\thepage}
  \renewcommand{\headrulewidth}{0pt}
}

% ==================== 图表题注 ====================
% 图：图序-章编号，如"图 1-1"
\renewcommand{\thefigure}{\thechapter-\arabic{figure}}
\captionsetup[figure]{
  font       = {small, bf, sf},  % 五号黑体（近似）
  labelsep   = space,
  position   = below,
  justification = centering,
  format     = plain,
}

% 表：表序-章编号，如"表 1-1"
\renewcommand{\thetable}{\thechapter-\arabic{table}}
\captionsetup[table]{
  font       = {small, bf, sf},
  labelsep   = space,
  position   = above,
  justification = centering,
  format     = plain,
}

% ==================== 公式编号 ====================
% 公式按章编号，如"(2-1)"
\numberwithin{equation}{chapter}
\renewcommand{\theequation}{\thechapter-\arabic{equation}}

% ==================== 列表格式 ====================
\setlist[enumerate,1]{
  label  = \arabic*.,
  leftmargin = 2\ccwd,
  itemsep = 0pt,
}
\setlist[itemize,1]{
  label  = \textbullet,
  leftmargin = 2\ccwd,
  itemsep = 0pt,
}

% ==================== 参考文献 ====================
% 使用上标数字格式 [1]
\renewenvironment{thebibliography}[1]{%
  \chapter*{\bibname}
  \zihao{5}\songti
  \setlength{\parindent}{0pt}
  \setlength{\parskip}{4pt}
  \list{[\arabic{enumiv}]}{%
    \settowidth\labelwidth{[#1]}%
    \leftmargin\labelwidth
    \advance\leftmargin\labelsep
    \usecounter{enumiv}%
    \let\p@enumiv\@empty
    \renewcommand\theenumiv{\arabic{enumiv}}%
  }%
  \sloppy\clubpenalty4000\widowpenalty4000%
  \sfcode`\.\@m
}{%
  \def\@noitemerr{\@latex@warning{Empty `thebibliography' environment}}%
  \endlist
}

% ==================== 致谢 ====================
\newenvironment{acknowledgements}{%
  \cleardoublepage
  \phantomsection
  \addcontentsline{toc}{chapter}{致谢}
  \chapter*{致\hspace{2em}谢}
  \zihao{5}\songti\setlength{\parindent}{2em}
}{}

% ==================== 超链接设置 ====================
\hypersetup{
  colorlinks = true,
  linkcolor  = black,
  citecolor  = black,
  urlcolor   = blue,
  bookmarksnumbered = true,
  pdfencoding = auto,
}

% ==================== 正文字号 ====================
% 规范：正文五号字体（10.5pt）
\AtBeginDocument{%
  \zihao{5}%
  \setlength{\parindent}{2\ccwd}%
}
