\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{ms}
[2023/07/20 v0.0.1 Manuscript Class]
% article inheritance
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions
\LoadClass{article}
% spacing
\RequirePackage[margin=35mm]{geometry} % TODO make class options
\setlength{\parskip}{1ex}
\setlength{\parindent}{0ex}
\setlength{\abovecaptionskip}{\medskipamount}
\setlength{\belowcaptionskip}{\medskipamount}
\newlength{\metalabel}\setlength{\metalabel}{.15\linewidth}
\RequirePackage[onehalfspacing]{setspace} % TODO: make class options
% meta-data
\RequirePackage{authblk}
\def\meta@block{}
\newcommand{\meta@part}[2]{%
  \hspace{\metalabel}\llap{\textbf{#1:}}\hspace{1em}%
  \parbox[t]{\dimexpr\linewidth-\metalabel-1em}{#2}\par\medskip}
\newcommand{\metafield}[3][]{%
  \g@addto@macro{\meta@block}{%
    \meta@part{\ifempty{#1}{\MakeUppercase#2}{#1}}{#3}}
  \expandafter\gdef\csname @#2\endcsname{#3}}
\renewcommand{\title}[2][]{%
  \metafield{title}{#2}%
  \ifempty{#1}{}{\metafield[Short Title]{shorttitle}{#1}}
  \g@addto@macro{\meta@block}{\meta@part{Authors}{\@author}\medskip}}
\renewcommand{\date}[1]{\metafield{date}{#1}}
\renewcommand{\abstract}[1]{\metafield{abstract}{#1}}
\newcommand{\metabreak}{\g@addto@macro{\meta@block}{\clearpage}}
% maketitle
\renewcommand{\maketitle}{%
  \thispagestyle{empty}%
  \meta@block
  \clearpage}
% TODO: appendix
% TODO: biblatex
% helpers
\renewcommand{\paragraph}[1]{\par\textbf{#1}\hskip.5em}
\newcommand{\ifempty}[3]{\if\relax\detokenize{#1}\relax#2\else#3\fi}