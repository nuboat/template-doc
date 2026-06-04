\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{easreport}[2025/03/06 EA-SSO Report Class]

% Base class
\LoadClass[12pt, a4paper]{article}

% Language and Fonts (Thai support)
\RequirePackage{fontspec}
\RequirePackage{xunicode}
\RequirePackage{geometry}
\RequirePackage{titlesec}
\RequirePackage{titletoc}
\RequirePackage{tabularx}
\RequirePackage{booktabs}
\RequirePackage{longtable}
\RequirePackage{xcolor}
\RequirePackage{graphicx}
\RequirePackage{eso-pic}
\RequirePackage{tikz}
\RequirePackage{hyperref}
\RequirePackage{hyphenat}
\RequirePackage{ragged2e}

% Hyphenation settings for Thai and English
\setlength{\hyphenpenalty}{10}
\setlength{\exhyphenpenalty}{10}
\setlength{\brokenpenalty}{10}
\tolerance=2000
\emergencystretch=3pt
\hbadness=1000
\clubpenalty=10000
\widowpenalty=10000

\RequirePackage{microtype}
\RequirePackage{fancyhdr}

% hyperref settings - remove red border/box
\hypersetup{
  hidelinks
}

% Layout settings
\geometry{top=1in, bottom=1in, left=0.7in, right=0.7in}
\setlength{\parindent}{0pt}
\setlength{\parskip}{0.5em}

% Thai font configuration (Requires XeLaTeX or LuaLaTeX)
\newfontfamily\thaifont[Script=Thai,Scale=1.2]{TH Sarabun New}
\setmainfont[Scale=1.2]{TH Sarabun New}

% Header/Section Styles
\titleformat{\section}{\Large\bfseries\centering}{}{0em}{}
\titleformat{\subsection}{\large\bfseries}{}{0em}{}
\titlecontents{section}[0em]{\bfseries}{}{}{\titlerule*[0.5pc]{.}\contentspage}
\titlecontents{subsection}[2em]{}{}{}{\titlerule*[0.5pc]{.}\contentspage}

% Custom Commands for EA-SSO
\newcommand{\docversion}[1]{\def\@docversion{#1}}
\newcommand{\docdate}[1]{\def\@docdate{#1}}
\newcommand{\authorname}[1]{\def\@authorname{#1}}
\newcommand{\copyrighttext}[1]{\def\@copyrighttext{#1}}
\newcommand{\headerleft}[1]{\def\@headerleft{#1}}
\newcommand{\headerright}[1]{\def\@headerright{#1}}
\def\@copyrighttext{}
\def\@headerleft{}
\def\@headerright{}

% Header and footer
\pagestyle{fancy}
\fancyhf{}
\fancyhead[L]{\small\@headerleft}
\fancyhead[R]{\small\@headerright}
\fancyfoot[C]{\small\@copyrighttext}
\fancyfoot[R]{\small\thepage\hspace{0pt}}
\renewcommand{\headrulewidth}{0.4pt}
\renewcommand{\footrulewidth}{0.4pt}

% Background watermark (bottom-right, aligned to footer right margin, 64% transparent)
\AddToShipoutPictureBG{%
  \put(\LenToUnit{\dimexpr\paperwidth-0.7in},\LenToUnit{0.7in}){%
    \makebox(0,0)[rb]{%
      \tikz\node[opacity=0.36]{\includegraphics[width=0.5\paperwidth]{assets/watermark}};%
    }%
  }%
}

% Title Page Design
\renewcommand{\maketitle}{
  \begin{titlepage}
    \centering
    \vspace*{2cm}
    \pretitlecontent
    \vfill
    {\Large ฉบับ \@docversion\par}
    {\Large \@docdate\par}
  \end{titlepage}
}
