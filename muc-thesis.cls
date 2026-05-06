\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{muc-thesis}[2026/05/06 MUC undergraduate thesis class]

\LoadClass[a4paper,oneside,openany,zihao=-4]{ctexbook}

\RequirePackage{geometry}
\RequirePackage{fontspec}
\RequirePackage{xeCJK}
\RequirePackage{setspace}
\RequirePackage{fancyhdr}
\RequirePackage{graphicx}
\RequirePackage{booktabs}
\RequirePackage{amsmath}
\RequirePackage{amssymb}
\RequirePackage{caption}
\RequirePackage{xparse}
\RequirePackage{etoolbox}
\RequirePackage{tocloft}
\RequirePackage{pdfpages}
\RequirePackage[hidelinks]{hyperref}
\RequirePackage[backend=biber,style=gb7714-2015]{biblatex}

\geometry{
  top=2.5cm,
  bottom=2.5cm,
  left=2cm,
  right=2cm,
  bindingoffset=0.5cm,
  headheight=15pt,
  headsep=0.6cm,
  footskip=1.2cm
}

\setmainfont{Times New Roman}
\setsansfont{Times New Roman}
\setmonofont{Courier New}
\setCJKmainfont{SimSun}[BoldFont=SimHei,ItalicFont=KaiTi]
\setCJKsansfont{SimHei}
\setCJKmonofont{FangSong}

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

\newcommand{\muc@fillline}[1]{\underline{\makebox[8.2cm][c]{#1}}}

\pagestyle{fancy}
\fancyhf{}
\fancyhead[C]{\zihao{5}\songti 中央民族大学本科生毕业论文(设计)}
\fancyfoot[C]{\zihao{5}\thepage}
\renewcommand{\headrulewidth}{0.4pt}
\renewcommand{\footrulewidth}{0pt}

\fancypagestyle{plain}{%
  \fancyhf{}
  \fancyfoot[C]{\zihao{5}\thepage}
  \renewcommand{\headrulewidth}{0pt}
}

\ctexset{
  chapter = {
    format = \centering\heiti\zihao{3},
    name = {},
    number = \arabic{chapter},
    beforeskip = 12pt,
    afterskip = 18pt
  },
  section = {
    format = \heiti\zihao{-4},
    number = \arabic{chapter}.\arabic{section},
    beforeskip = 12pt,
    afterskip = 8pt
  },
  subsection = {
    format = \songti\bfseries\zihao{5},
    number = \arabic{chapter}.\arabic{section}.\arabic{subsection},
    beforeskip = 8pt,
    afterskip = 6pt
  }
}

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
\renewcommand{\cfttoctitlefont}{\hfill\heiti\zihao{3}}
\renewcommand{\cftaftertoctitle}{\hfill}
\renewcommand{\cftchapfont}{\songti\zihao{5}}
\renewcommand{\cftsecfont}{\songti\zihao{5}}
\renewcommand{\cftchappagefont}{\songti\zihao{5}}
\renewcommand{\cftsecpagefont}{\songti\zihao{5}}

\newcommand{\makemuctableofcontents}{%
  \cleardoublepage
  \pagestyle{plain}
  \tableofcontents
  \cleardoublepage
  \pagestyle{fancy}
}

\newcommand{\makecoverpage}{%
  \begin{titlepage}
    \thispagestyle{empty}
    \centering
    \vspace*{-1.6cm}
    \ifstrempty{\muc@coverlogo}{}{%
      \includegraphics[width=11.6cm]{\muc@coverlogo}\par
      \vspace{-0.2cm}
    }
    {\heiti\zihao{0}\muc@covercategory\par}
    \vspace{0.8cm}
    
    {\zihao{1}\heiti 题目：\underline{\makebox[12cm][c]{\@title}}\par}
    \ifstrempty{\muc@subtitle}{}{%
      \vspace{0.1cm}
      {\zihao{1}\heiti \hspace{3em}\underline{\makebox[12cm][c]{\muc@subtitle}}\par}
    }
    
    \vspace{0.6cm}
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
  \end{titlepage}
  \clearpage
}

\NewDocumentEnvironment{cnabstract}{}{
  \cleardoublepage
  \phantomsection
  \addcontentsline{toc}{chapter}{摘要}
  \thispagestyle{plain}
  \begin{center}
    {\heiti\zihao{-3}摘\hspace{1em}要}
  \end{center}
  \vspace{1em}
  \songti\zihao{5}
}{
  \par\vspace{1em}
  \noindent{\heiti\bfseries 关键词：}\muc@keywordsCN
  \par\cleardoublepage
}

\NewDocumentEnvironment{enabstract}{}{
  \phantomsection
  \addcontentsline{toc}{chapter}{Abstract}
  \thispagestyle{plain}
  \begin{center}
    {\rmfamily\bfseries\Large Abstract}
  \end{center}
  \vspace{1em}
  \rmfamily\zihao{5}
}{
  \par\vspace{1em}
  \noindent{\rmfamily\bfseries Keywords: }\muc@keywordsEN
  \par\cleardoublepage
}

\newcommand{\insertfrontpdf}[1]{%
  \cleardoublepage
  \includepdf[pages=-,pagecommand={\thispagestyle{empty}}]{#1}
  \cleardoublepage
}

\makeatother
