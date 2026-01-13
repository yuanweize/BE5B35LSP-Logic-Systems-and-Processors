% ==============================================================================
% LSP EXAM V3.0 - 学渣逆袭·无脑做题版
% 考前10小时 | 不问为什么，只管怎么做
% ==============================================================================
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{lsp-exam}[2026/01/13 LSP Exam V3.0 Brainless Hack Edition]

% 基于article双栏布局
\LoadClass[10pt, a4paper, twocolumn]{article}

% ==============================================================================
% 核心宏包
% ==============================================================================
\RequirePackage[UTF8, heading=true]{ctex}
\RequirePackage{geometry}
\RequirePackage{amsmath, amssymb, amsthm}
\RequirePackage{graphicx}
\RequirePackage{xcolor}
\RequirePackage{tikz}
\RequirePackage{circuitikz}
\RequirePackage{karnaugh-map}
\RequirePackage{booktabs}
\RequirePackage{multirow}
\RequirePackage{array}
\RequirePackage{listings}
\RequirePackage{hyperref}
\RequirePackage{cite}
\RequirePackage[most]{tcolorbox}
\RequirePackage{enumitem}
\RequirePackage{fancyhdr}
\RequirePackage{titlesec}
\RequirePackage{caption}
\RequirePackage{subcaption}
\RequirePackage{float}
\RequirePackage{ulem}  % 删除线

% ==============================================================================
% 高密度页面设置 - 极限压缩边距
% ==============================================================================
\geometry{
    a4paper,
    left=1.0cm,
    right=1.0cm,
    top=1.2cm,
    bottom=1.2cm,
    columnsep=0.6cm,
    headsep=0.3cm,
    footskip=0.4cm
}

% ==============================================================================
% 颜色定义
% ==============================================================================
\definecolor{algoblue}{RGB}{41, 98, 168}
\definecolor{examplegreen}{RGB}{34, 139, 34}
\definecolor{pitfallred}{RGB}{178, 34, 34}
\definecolor{formulagray}{RGB}{64, 64, 64}
\definecolor{keyboxorange}{RGB}{255, 140, 0}
\definecolor{hackmagenta}{RGB}{200, 0, 150}
\definecolor{lightbluebg}{RGB}{240, 248, 255}
\definecolor{lightgreenbg}{RGB}{240, 255, 240}
\definecolor{lightredbg}{RGB}{255, 245, 245}
\definecolor{lightgraybg}{RGB}{248, 248, 248}
\definecolor{lightorangebg}{RGB}{255, 250, 240}
\definecolor{lightmagentabg}{RGB}{255, 230, 250}

% ==============================================================================
% tcolorbox 模块化环境定义
% ==============================================================================

% 算法/步骤环境 (蓝色)
\newtcolorbox{algorithm}[1][]{
    enhanced,
    colback=lightbluebg,
    colframe=algoblue,
    fonttitle=\bfseries\sffamily,
    title={#1},
    boxrule=0.8pt,
    arc=2pt,
    left=3pt, right=3pt, top=2pt, bottom=2pt,
    before skip=4pt, after skip=4pt,
    breakable
}

% 例题环境 (绿色)
\newtcolorbox{example}[1][]{
    enhanced,
    colback=lightgreenbg,
    colframe=examplegreen,
    fonttitle=\bfseries\sffamily,
    title={#1},
    boxrule=0.8pt,
    arc=2pt,
    left=3pt, right=3pt, top=2pt, bottom=2pt,
    before skip=4pt, after skip=4pt,
    breakable
}

% 易错点/陷阱环境 (红色)
\newtcolorbox{pitfall}[1][]{
    enhanced,
    colback=lightredbg,
    colframe=pitfallred,
    fonttitle=\bfseries\sffamily,
    title={[!] #1},
    boxrule=0.8pt,
    arc=2pt,
    left=3pt, right=3pt, top=2pt, bottom=2pt,
    before skip=4pt, after skip=4pt,
    breakable
}

% 公式环境 (灰色)
\newtcolorbox{formula}[1][]{
    enhanced,
    colback=lightgraybg,
    colframe=formulagray,
    fonttitle=\bfseries\sffamily,
    title={#1},
    boxrule=0.8pt,
    arc=2pt,
    left=3pt, right=3pt, top=2pt, bottom=2pt,
    before skip=4pt, after skip=4pt,
    breakable
}

% 重点/关键环境 (橙色)
\newtcolorbox{keybox}[1][]{
    enhanced,
    colback=lightorangebg,
    colframe=keyboxorange,
    fonttitle=\bfseries\sffamily,
    title={#1},
    boxrule=0.8pt,
    arc=2pt,
    left=3pt, right=3pt, top=2pt, bottom=2pt,
    before skip=4pt, after skip=4pt,
    breakable
}

% ==============================================================================
% V3.0 新增：无脑大招环境 (洋红色/紫色) - 最醒目！
% ==============================================================================
\newtcolorbox{hack}[1][]{
    enhanced,
    colback=lightmagentabg,
    colframe=hackmagenta,
    fonttitle=\bfseries\sffamily\large,
    title={[HACK] #1},
    boxrule=1.5pt,
    arc=3pt,
    left=4pt, right=4pt, top=3pt, bottom=3pt,
    before skip=6pt, after skip=6pt,
    breakable,
    shadow={1mm}{-1mm}{0mm}{hackmagenta!30}
}

% ==============================================================================
% 紧凑列表设置
% ==============================================================================
\setlist{nosep, leftmargin=*, labelindent=0pt}
\setlist[itemize]{label={\tiny$\bullet$}}
\setlist[enumerate]{label=\arabic*.}

% ==============================================================================
% 紧凑标题设置
% ==============================================================================
\titleformat{\section}
    {\Large\bfseries\sffamily\color{algoblue}}
    {\thesection.}{0.3em}{}
\titlespacing*{\section}{0pt}{6pt}{3pt}

\titleformat{\subsection}
    {\large\bfseries\sffamily}
    {\thesubsection}{0.3em}{}
\titlespacing*{\subsection}{0pt}{4pt}{2pt}

\titleformat{\subsubsection}
    {\normalsize\bfseries\sffamily}
    {\thesubsubsection}{0.3em}{}
\titlespacing*{\subsubsection}{0pt}{3pt}{1pt}

% ==============================================================================
% 页眉页脚
% ==============================================================================
\pagestyle{fancy}
\fancyhf{}
\fancyhead[L]{\small\sffamily\color{hackmagenta} LSP V3.0 学渣逆袭版}
\fancyhead[R]{\small\sffamily 2026-01-13 | 10:00}
\fancyfoot[C]{\small\thepage}
\renewcommand{\headrulewidth}{0.4pt}

% ==============================================================================
% 超链接设置
% ==============================================================================
\hypersetup{
    colorlinks=true,
    linkcolor=algoblue,
    urlcolor=algoblue,
    citecolor=algoblue
}

% ==============================================================================
% 数学命令
% ==============================================================================
\newcommand{\obar}[1]{\overline{#1}}
\newcommand{\xor}{\oplus}
\newcommand{\binary}[1]{\texttt{#1}_2}
\newcommand{\hex}[1]{\texttt{0x#1}}
\newcommand{\bitwidth}[1]{[#1]}

% ==============================================================================
% 代码样式
% ==============================================================================
\lstset{
    basicstyle=\small\ttfamily,
    breaklines=true,
    frame=single,
    xleftmargin=0pt,
    xrightmargin=0pt,
    framesep=2pt,
    tabsize=2
}

% ==============================================================================
% 图表标题紧凑
% ==============================================================================
\captionsetup{font=small, labelfont=bf, skip=3pt}

\endinput
