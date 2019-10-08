\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{skript}[2019/04/11 Vorlesungsskripte]

\RequirePackage{scrbase}

%The language to pass to babel
\newif\ifenglish\englishtrue
\DefineFamily{Skript}
\DefineFamilyMember{Skript}
\DeclareOption{german}{\englishfalse}
\DeclareOption{english}{\englishtrue}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{scrartcl}}
\FamilyProcessOptions{Skript}
\LoadClass{scrreprt}

\RequirePackage[automark]{scrlayer-scrpage}
\KOMAoption{fontsize}{12pt}
\KOMAoption{parskip}{half-}
\KOMAoption{DIV}{12}
\KOMAoption{headings}{normal}
%\KOMAoption{twoside}{semi}

\RequirePackage{microtype}
\RequirePackage[\ifenglish english\else german\fi]{mymath}
\KOMAoption{headsepline}{:}

%%% SPECIFICATION
\newcommand{\lecturer}[1]{\def\@lecturer{#1}}
\def\@shorttitle{\@title}
\newcommand{\shorttitle}[1]{\def\@shorttitle{#1}}

\AtBeginDocument{\maketitle}

\renewcommand*{\maketitle}{
	\begin{titlepage}
	\thispagestyle{empty}
	\  \par\vspace{3em}
{\centering\usekomafont{prefix}\ifenglish Lecture Notes\else Vorlesungsmitschrift\fi\par}
{\centering\usekomafont{normaltitle}\ifenglish to\else zu\fi\par}
	\vfill
	{\centering\usekomafont{title}\@title\par}
	\vfill
	\addvspace{8cm}
	{\centering\noindent\begin{tabularx}{\textwidth}{Xp{0.5\textwidth}}
		{\hfill\usekomafont{lecturer}\ifenglish Lecture by\else Vorlesung von\fi}&{\usekomafont{normaltitle} \@lecturer}\\
{\hfill\usekomafont{lecturer}\ifenglish Notes by\else Notizen von\fi}&{\usekomafont{normaltitle} \@author}
\end{tabularx}\par}
	\vspace{3em}
	{\centering\usekomafont{date}\@date\par}
\end{titlepage}
}

\setkomafont{disposition}{\bfseries}
\setkomafont{title}{\Huge\bfseries}
\newkomafont{normaltitle}{\Large}
\newkomafont{normalhead}{}
\newkomafont{lecturer}{\Large\scshape}
\newkomafont{prefix}{\LARGE}
\newkomafont{headtitle}{\itshape}
\setkomafont{pageheadfoot}{\footnotesize}
\setkomafont{descriptionlabel}{\bfseries}
\setkomafont{pagenumber}{\normalsize}

\pagestyle{scrheadings}
\ihead[]{\usekomafont{normalhead}\@shorttitle}
\chead[]{\usekomafont{headtitle}\rightmark}
\ohead[]{\usekomafont{normalhead}\@date}
%\ifoot[]{}
%\ofoot[]{}

