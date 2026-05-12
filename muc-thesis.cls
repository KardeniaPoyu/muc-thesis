\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{muc-thesis}[2026/05/06 MUC undergraduate thesis class]

\LoadClass[a4paper,oneside,openany,zihao=-4]{ctexbook}

\RequirePackage{geometry}
\RequirePackage{fontspec}
\RequirePackage{xeCJK}
\RequirePackage{setspace}
\RequirePackage{fancyhdr}
\RequirePackage{graphicx}
\graphicspath{{figures/}}
\RequirePackage{booktabs}
\RequirePackage{amsmath}
\RequirePackage{amssymb}
\RequirePackage{caption}
\RequirePackage{xparse}
\RequirePackage{etoolbox}
\RequirePackage{tocloft}
\RequirePackage{pdfpages}
\RequirePackage[hidelinks]{hyperref}
\RequirePackage[backend=biber,style=gb7714-2015,doi=false,isbn=false,url=false]{biblatex}
\RequirePackage{tabularx}
\RequirePackage{indentfirst}
\RequirePackage{makecell}
\RequirePackage{xcolor}

\geometry{
  a4paper,
  top=2.5cm,
  bottom=2.5cm,
  left=2.0cm,
  right=2.0cm,
  bindingoffset=0.5cm,
  headheight=15pt,
  headsep=0.5cm,
  footskip=0.75cm
}

\setmainfont{Times New Roman}
\setsansfont{Times New Roman}
\setmonofont{Courier New}

% 字体处理：仅在 Windows 环境下强制指定宋体系列，其他环境（如 Linux/CI）交由 ctex 自动处理
\IfFontExistsTF{SimSun}{
  \setCJKmainfont{SimSun}[BoldFont=SimHei,ItalicFont=KaiTi]
  \setCJKsansfont{SimHei}
  \setCJKmonofont{FangSong}
}{}

% 定义小标宋：项目内字体 -> 系统字体 -> 黑体回退
\IfFileExists{FZXBSJW.ttf}{%
  \newCJKfontfamily\xiaobiaosong{FZXBSJW.ttf}[Path = ./]%
}{%
  \IfFontExistsTF{方正小标宋简体}{%
    \newCJKfontfamily\xiaobiaosong{方正小标宋简体}
  }{%
    \IfFontExistsTF{方正小标宋简}{%
      \newCJKfontfamily\xiaobiaosong{方正小标宋简}
    }{%
      \let\xiaobiaosong\heiti
    }%
  }%
}

\AtBeginDocument{%
  \zihao{5}%
  \songti
  \setstretch{1.5}%
  \setlength{\parindent}{2\ccwd}%
}

\makeatletter

\newcommand{\muc@entitle}{}
\newcommand{\muc@enauthor}{}
\newcommand{\muc@ensupervisor}{}
\newcommand{\muc@studentid}{}
\newcommand{\muc@grade}{}
\newcommand{\muc@college}{}
\newcommand{\muc@major}{}
\newcommand{\muc@supervisor}{}
\newcommand{\muc@coverlogo}{}
\newcommand{\muc@covercategory}{本科毕业论文（设计）}
\newcommand{\muc@subtitle}{}
\newcommand{\muc@paperortype}{论文}
\newcommand{\muc@keywordsCN}{}
\newcommand{\muc@keywordsEN}{}

\newcommand{\entitle}[1]{\gdef\muc@entitle{#1}}
\newcommand{\enauthor}[1]{\gdef\muc@enauthor{#1}}
\newcommand{\ensupervisor}[1]{\gdef\muc@ensupervisor{#1}}
\newcommand{\studentid}[1]{\gdef\muc@studentid{#1}}
\newcommand{\grade}[1]{\gdef\muc@grade{#1}}
\newcommand{\college}[1]{\gdef\muc@college{#1}}
\newcommand{\major}[1]{\gdef\muc@major{#1}}
\newcommand{\supervisor}[1]{\gdef\muc@supervisor{#1}}
\newcommand{\coverlogo}[1]{\gdef\muc@coverlogo{#1}}
\newcommand{\covercategory}[1]{\gdef\muc@covercategory{#1}}
\newcommand{\keywordsCN}[1]{\gdef\muc@keywordsCN{#1}}
\newcommand{\keywordsEN}[1]{\gdef\muc@keywordsEN{#1}}
\newcommand{\subtitle}[1]{\gdef\muc@subtitle{#1}}
\newcommand{\paperortype}[1]{\gdef\muc@paperortype{#1}}

% 红色、蓝色、高亮色提醒开关
\newif\ifshowremarks
\showremarkstrue
\newcommand{\showremarks}{\showremarkstrue}
\newcommand{\hideremarks}{\showremarksfalse}
\newcommand{\remark}[1]{%
  \ifshowremarks
    {\color{red}\zihao{5}\songti #1}%
  \fi
}

\newcommand{\blueremark}[1]{%
  \ifshowremarks
    {\color{blue}\zihao{5}\songti #1}%
  \fi
}

\newcommand{\highlightremark}[1]{%
  \ifshowremarks
    \medskip
    \noindent\colorbox{yellow}{%
      \parbox{\dimexpr\textwidth-2\fboxsep}{%
        \hspace{2\ccwd}\color{red}\zihao{5}\songti #1%
      }%
    }\par\medskip
  \fi
}

% 电子签名处理逻辑
\newcommand{\muc@sigstudentimage}{}
\newcommand{\muc@sigstudentwidth}{2.5cm}
\newcommand{\muc@sigsupervisorimage}{}
\newcommand{\muc@sigsupervisorwidth}{2.5cm}

\newcommand{\sigstudent}[2][2.5cm]{%
  \gdef\muc@sigstudentwidth{#1}%
  \gdef\muc@sigstudentimage{#2}%
}
\newcommand{\sigsupervisor}[2][2.5cm]{%
  \gdef\muc@sigsupervisorwidth{#1}%
  \gdef\muc@sigsupervisorimage{#2}%
}

\newcommand{\muc@printsigstudent}{%
  \ifdefempty{\muc@sigstudentimage}{%
    \hspace{4cm}%
  }{%
    \smash{\raisebox{-0.2\height}{\includegraphics[width=\muc@sigstudentwidth]{\muc@sigstudentimage}}}%
  }%
}

\newcommand{\muc@printsigsupervisor}{%
  \ifdefempty{\muc@sigsupervisorimage}{%
    \hspace{4cm}%
  }{%
    \smash{\raisebox{-0.2\height}{\includegraphics[width=\muc@sigsupervisorwidth]{\muc@sigsupervisorimage}}}%
  }%
}

\newcommand{\muc@fillline}[1]{\underline{\makebox[8.2cm][c]{#1}}}

% 统一页眉页脚配置
\fancyhf{}
\fancyhead[R]{\zihao{-5}\songti 中央民族大学本科毕业\muc@paperortype}
\fancyfoot[C]{\zihao{-5}\thepage}
\renewcommand{\headrulewidth}{0.4pt}

% 摘要页样式：无页眉，页脚显示罗马数字页码
\fancypagestyle{abstract}{%
  \fancyhf{}%
  \fancyfoot[C]{\zihao{-5}\thepage}%
  \renewcommand{\headrulewidth}{0pt}%
}

% 确保 plain 样式（章节首页）也有一致的页眉
\fancypagestyle{plain}{
  \fancyhf{}
  \fancyhead[R]{\zihao{-5}\songti 中央民族大学本科毕业\muc@paperortype}
  \fancyfoot[C]{\zihao{-5}\thepage}
  \renewcommand{\headrulewidth}{0.4pt}
}

\pagestyle{fancy}

% Fonts and Styles
\ctexset{
  chapter = {
    format = \heiti\zihao{3}\centering,
    name = {,},
    number = \arabic{chapter},
    aftername = \hspace{0.5em},
    beforeskip = 12pt,
    afterskip = 18pt,
    fixskip = true
  },
  section = {
    format = \heiti\zihao{4},
    beforeskip = 18pt,
    afterskip = 12pt,
    fixskip = true
  },
  subsection = {
    format = \heiti\zihao{-4},
    beforeskip = 12pt,
    afterskip = 12pt
  }
}

% Body settings
\setstretch{1.5}
\renewcommand{\normalsize}{\zihao{5}}
\zihao{5}

\@addtoreset{figure}{chapter}
\@addtoreset{table}{chapter}
\numberwithin{equation}{chapter}
\renewcommand{\thefigure}{\arabic{chapter}-\arabic{figure}}
\renewcommand{\thetable}{\arabic{chapter}-\arabic{table}}
\renewcommand{\theequation}{\arabic{chapter}-\arabic{equation}}

\DeclareCaptionFont{mucaptionfont}{\songti\bfseries\zihao{5}}
\captionsetup{
  font=mucaptionfont,
  labelsep=space
}
\captionsetup[figure]{
  position=bottom,
  justification=centering,
  singlelinecheck=false
}
\captionsetup[table]{
  position=top,
  justification=centering,
  singlelinecheck=false
}

\renewcommand{\contentsname}{目\hspace{2em}录}
% Table of Contents styling
\renewcommand{\cfttoctitlefont}{\hspace*{\fill}\heiti\zihao{3}}
\renewcommand{\cftaftertoctitle}{\hspace*{\fill}}
\renewcommand{\cftbeforetoctitleskip}{0pt}
\renewcommand{\cftaftertoctitleskip}{2em}

% Set all entries to Songti Wu-hao
\renewcommand{\cftchapfont}{\songti\zihao{5}}
\renewcommand{\cftsecfont}{\songti\zihao{5}}
\renewcommand{\cftsubsecfont}{\songti\zihao{5}}
\renewcommand{\cftchappagefont}{\songti\zihao{5}}
\renewcommand{\cftsecpagefont}{\songti\zihao{5}}
\renewcommand{\cftsubsecpagefont}{\songti\zihao{5}}

% Remove bold for chapters in TOC
% 强制设定所有层级的引导点密度（数值越小越密）
\renewcommand{\cftdotsep}{0.1}
\renewcommand{\cftchapleader}{\cftdotfill{\cftdotsep}}
\renewcommand{\cftsecleader}{\cftdotfill{\cftdotsep}}
\renewcommand{\cftsubsecleader}{\cftdotfill{\cftdotsep}}

\newcommand{\makemuctableofcontents}{%
  \cleardoublepage
  \fancypagestyle{plain}{%
    \fancyhf{}%
    \renewcommand{\headrulewidth}{0pt}%
  }%
  \pagestyle{empty}%
  \tableofcontents
  \addtocontents{toc}{\protect\thispagestyle{empty}}%
  % 恢复 plain 样式供正文使用
  \fancypagestyle{plain}{%
    \fancyhf{}%
    \fancyhead[R]{\zihao{-5}\songti 中央民族大学本科毕业\muc@paperortype}%
    \fancyfoot[C]{\zihao{-5}\thepage}%
    \renewcommand{\headrulewidth}{0.4pt}%
  }%
}

\newcommand{\makecoverpage}{%
  \begin{titlepage}
    \thispagestyle{empty}
    \centering
    \vspace*{-2.0cm}
    \ifstrempty{\muc@coverlogo}{}{%
      \includegraphics[width=11.6cm]{\muc@coverlogo}\par
      \vspace{-1.5cm}
    }
    {\heiti\zihao{0}\muc@covercategory\par}
    \vspace{2.5cm}
    
    {\zihao{1}\heiti 题目：\underline{\makebox[12cm][c]{\@title}}\par}
    \ifstrempty{\muc@subtitle}{}{%
      \vspace{0.1cm}
      {\zihao{1}\heiti \hspace{3em}\underline{\makebox[12cm][c]{\muc@subtitle}}\par}
    }
    
    \vspace{1.5cm}
    \renewcommand{\arraystretch}{1.5}
    \zihao{-3}\fangsong
    \begin{tabular}{@{}l@{\hspace{1em}}c@{}}
      \makebox[4\ccwd][s]{姓名}： & \muc@fillline{\@author} \\
      \makebox[4\ccwd][s]{学号}： & \muc@fillline{\muc@studentid} \\
      \makebox[4\ccwd][s]{年级}： & \muc@fillline{\muc@grade} \\
      \makebox[4\ccwd][s]{学院}： & \muc@fillline{\muc@college} \\
      \makebox[4\ccwd][s]{专业}： & \muc@fillline{\muc@major} \\
      \makebox[4\ccwd][s]{指导教师}： & \muc@fillline{\muc@supervisor} \\
    \end{tabular}
    \vfill
    {\zihao{-3}\fangsong \@date\par}
    \vspace{1.2cm}
  \end{titlepage}
  \clearpage
}

\newcommand{\maketaskbook}{%
  \cleardoublepage
  \pagestyle{empty}
  \begin{center}
    {\zihao{2}\xiaobiaosong 本科毕业论文（设计）任务书}
  \end{center}
  \noindent
  \zihao{5}\songti
  \renewcommand{\arraystretch}{1.2}
  \begin{tabularx}{\textwidth}{|>{\centering\arraybackslash\fangsong\zihao{4}}m{3.6cm}|>{\centering\arraybackslash\fangsong\zihao{4}}X|>{\centering\arraybackslash\fangsong\zihao{4}}m{2.5cm}|>{\centering\arraybackslash\fangsong\zihao{4}}X|}
    \hline
    学\hspace{1em}院 & \muc@college & 专\hspace{1em}业 & \muc@major \\ \hline
    年\hspace{1em}级 & \muc@grade   & 学\hspace{1em}号 & \muc@studentid \\ \hline
    姓\hspace{1em}名 & \@author     & 起止时间 & \rmfamily\zihao{4} \mbox{2026.10.15--2027.4.20} \\ \hline
    指导教师姓名 & \muc@supervisor & 职\hspace{1em}称 & \\ \hline
    题\hspace{1em}目 & \multicolumn{3}{l|}{\fangsong\zihao{4} \@title} \\ \hline
    \multicolumn{4}{|>{\fangsong\zihao{4}}l|}{目的} \\ \hline
    \multicolumn{4}{|p{\dimexpr\textwidth-2\tabcolsep-2\arrayrulewidth}|}{\rule{0pt}{1.5cm}} \\ \hline
    \multicolumn{4}{|>{\fangsong\zihao{4}}l|}{内容与要求（包括原始数据、技术要求、工作要求及成果要求等）} \\ \hline
    \multicolumn{4}{|p{\dimexpr\textwidth-2\tabcolsep-2\arrayrulewidth}|}{\rule{0pt}{3.5cm}} \\ \hline
    \multicolumn{4}{|>{\fangsong\zihao{4}}l|}{进度安排} \\ \hline
    \multicolumn{4}{|p{\dimexpr\textwidth-2\tabcolsep-2\arrayrulewidth}|}{\rule{0pt}{2cm}} \\ \hline
    \multicolumn{4}{|>{\fangsong\zihao{4}}l|}{文献查阅指引} \\ \hline
    \multicolumn{4}{|p{\dimexpr\textwidth-2\tabcolsep-2\arrayrulewidth}|}{\rule{0pt}{2cm}} \\ \hline
    指导教师（签名） & \muc@printsigsupervisor & 日\hspace{1em}期 & 202X.11.30 \\ \hline
  \end{tabularx}
  \cleardoublepage
}

\newcommand{\makeintegritypage}{%
  \cleardoublepage
  \thispagestyle{empty}
  \begin{center}
    {\zihao{2}\xiaobiaosong 本科毕业论文（设计）学术诚信承诺书}
  \end{center}
  \vspace{1.5cm}
  \begin{center}
    \includegraphics[width=0.9\textwidth]{image2.png}
  \end{center}
  \vspace{3cm}
  \begin{flushright}
    \zihao{-4}
    承诺人签名：\muc@printsigstudent \par
    \vspace{0.5cm}
    日\hspace{2.5em}期：\underline{\makebox[4cm][c]{2026.4.20}} \par
  \end{flushright}
  \cleardoublepage
}

\newcommand{\makelicensepage}{%
  \cleardoublepage
  \thispagestyle{empty}
  \begin{center}
    {\zihao{2}\xiaobiaosong 本科毕业论文（设计）使用授权书}
  \end{center}
  \vspace{1.5cm}
  \begin{center}
    \includegraphics[width=0.95\textwidth]{image3.png}
  \end{center}
  \vspace{2cm}
  \begin{flushright}
    \zihao{-4}
    本人签名：\muc@printsigstudent \hspace{1cm} 日期：\underline{\makebox[3cm][c]{2026.4.20}} \par
    \vspace{1cm}
    指导老师签名：\muc@printsigsupervisor \hspace{1cm} 日期：\underline{\makebox[3cm][c]{2026.4.20}} \par
  \end{flushright}
  
  \remark{
\zihao{-4}\fangsong
\noindent 关于封面、任务书、承诺书、授权书等前置材料的说明：由于涉及到签字，自动排版通常会比较困难。在这一版本中，我们推荐暂时使用word模板填写好相关内容，并将这四页转化为PDF格式，最终与摘要、正文等内容合并成一个完整的PDF文件提交。后续我们会考虑开发一个自动生成签字页的功能，敬请期待。

\

\noindent !!\textbf{重要}!! 如果要使用该Latex模板，请同时注意PDF中的内容以及\textbf{.tex后缀文件}中的命令和注释，尤其是\texttt{main.tex}中的相关命令和注释说明。确保正确填写并生成包含签字的PDF文件，否则可能会导致提交的PDF不符合要求或编译报错等bug。
}
  \cleardoublepage
}

\newenvironment{cnabstract}{
  \cleardoublepage
  \pagenumbering{Roman}%
  \pagestyle{abstract}%
  \begin{center}
    {\heiti\zihao{3} \@title}
  \end{center}
  \vspace{-1.5em}          % <--- 这里设为负值，将“摘要”字样向上拉
  \begin{center}
    {\heiti\zihao{4} 摘\hspace{2em}要}
  \end{center}
  \vspace{-0.5em}          % <--- 进一步缩小摘要字样与正文的间距
  \zihao{5}\songti
  \setlength{\parindent}{2\ccwd}
  \hspace*{2\ccwd}\ignorespaces
}{
  \par\vspace{2em}
  \noindent{\heiti\zihao{-4} 关键词：}\muc@keywordsCN
  \cleardoublepage
}

\newenvironment{enabstract}{
  \cleardoublepage
  \pagestyle{abstract}%
  \begin{center}
    {\bfseries\rmfamily\zihao{3} \muc@entitle}
  \end{center}
  \vspace{-1.5em}          % <--- 这里设为负值，将 Abstract 向上拉
  \begin{center}
    {\bfseries\rmfamily\zihao{3} Abstract}
  \end{center}
  \vspace{-0.5em}          % <--- 缩小 Abstract 与正文的间距
  \zihao{5}\rmfamily
  \setlength{\parindent}{2em}
  \hspace*{2em}\ignorespaces
}{
  \par\vspace{2em}
  \noindent{\bfseries\rmfamily\zihao{-4} Keywords: }\muc@keywordsEN
  \cleardoublepage
}

\newcommand{\insertfrontpdf}[1]{%
  \cleardoublepage
  \includepdf[pages=-,pagecommand={\thispagestyle{empty}}]{#1}
  \cleardoublepage
}

\newenvironment{acknowledgements}{
  \cleardoublepage
  \chapter*{致\hspace{2em}谢}
  \addcontentsline{toc}{chapter}{致谢}
  \zihao{5}\songti
}{
  \cleardoublepage
}

\newcommand{\makeaipage}{%
  \cleardoublepage
  \thispagestyle{empty}
  \begin{center}
    \xiaobiaosong\zihao{2} 关于使用 AI 工具情况的说明
  \end{center}
  \noindent
  \renewcommand{\arraystretch}{1.2}
  \begin{tabularx}{\textwidth}{!{\vrule width 1.5pt}>{\centering\arraybackslash\fangsong\zihao{4}}m{3.6cm}!{\vrule width 0.4pt}>{\centering\arraybackslash\fangsong\zihao{4}}X!{\vrule width 0.4pt}>{\centering\arraybackslash\fangsong\zihao{4}}m{2.5cm}!{\vrule width 0.4pt}>{\centering\arraybackslash\fangsong\zihao{4}}X!{\vrule width 1.5pt}}
    \Xhline{1.5pt}
    学\hspace{1em}院 & \muc@college & 专\hspace{1em}业 & \muc@major \\ \Xhline{0.4pt}
    学生姓名 & \@author & 学\hspace{1em}号 & \muc@studentid \\ \Xhline{0.4pt}
    指导教师 & \muc@supervisor & & \\ \Xhline{0.4pt}
    题\hspace{1em}目 & \multicolumn{3}{>{\fangsong\zihao{4}}l!{\vrule width 1.5pt}}{\@title} \\ \Xhline{0.4pt}
    \begin{minipage}[c][9.0cm][c]{3.2cm}
        \centering \fangsong\zihao{4} \begin{tabular}{c} 使用 AI 工具 \\ 情况的说明 \\ （可加页） \end{tabular}
    \end{minipage} & \multicolumn{3}{>{\fangsong\zihao{-4}}m{\dimexpr\textwidth-3.6cm-6\tabcolsep-4\arrayrulewidth}!{\vrule width 1.5pt}}{
        \begin{minipage}[t][9.0cm][t]{\dimexpr\textwidth-3.6cm-6\tabcolsep-4\arrayrulewidth}
            说明：\par
            1. 需列出所使用的 AI 工具相关信息，包括工具名称、开发者、版本、使用日期、使用方式等。\par
            2. 须保留 AI 工具处理之前的相关重要材料，以备指导教师或评审专家对学生使用 AI 工具的检查或质询。\par
        \end{minipage}
    } \\ \Xhline{0.4pt}
    \begin{minipage}[c][5.0cm][c]{3.2cm}
        \centering \fangsong\zihao{4} \begin{tabular}{c} 学生 \\ 诚信声明 \end{tabular}
    \end{minipage} & \multicolumn{3}{>{\kaishu\zihao{4}\bfseries}m{\dimexpr\textwidth-3.6cm-6\tabcolsep-4\arrayrulewidth}!{\vrule width 1.5pt}}{
        \begin{minipage}[t][6.0cm][t]{\dimexpr\textwidth-3.6cm-6\tabcolsep-4\arrayrulewidth}
            \hspace{2\ccwd}本人郑重声明，上述关于 AI 工具使用情况的陈述真实无误。本人深知学术诚信的重要性，如有任何隐瞒或虚假之处，愿承担学术不端行为带来的相关惩处。\par
            \vspace{1.0cm}
            \fangsong\zihao{4}\bfseries
            \hfill 学生（签字）：\muc@printsigstudent \hspace{1.5cm} \null \par
            \vfill
            \hfill 202\hspace{1em}年\hspace{1.5em}月\hspace{1.5em}日 \hspace{1.5cm} \null \par
            \vspace{0.1cm}
        \end{minipage}
    } \\ \Xhline{1.5pt}
  \end{tabularx}
  \cleardoublepage
}

\makeatother
