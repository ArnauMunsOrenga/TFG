% -------------------------------------------------------------------
%  @LaTeX-class-file{
%     filename        = "DissertateUSU.cls",
%     version         = "1.0",
%     date            = "01 July 2017",
%     codetable       = "ISO/ASCII",
%     keywords        = "LaTeX, Dissertate",
%     note            = "Based on 'Dissertate' by Jordan Suchow,
%                        For support, email 'tyson.barrett@usu.edu',
%     docstring       = "Class for a dissertation at Utah State."
% --------------------------------------------------------------------

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{DissertateUSU}[2017/07/01 v1.0 DissertateUSU Class]
\LoadClass[12pt, oneside, letterpaper]{book}

%%%%%%%%%%%%%%%%%
%%   Options   %%
%%%%%%%%%%%%%%%%%  
\RequirePackage{etoolbox}
\usepackage{chngcntr}
\counterwithin*{equation}{section}
\renewcommand{\theequation}{\arabic{section}.\arabic{equation}}


%{{{ Line-spacing control
\RequirePackage{setspace}
\newcommand{\singlespaced}{\singlespacing} %espaciado por defecto entre las lineas
\newcommand{\doublespaced}{\doublespacing}
\newcommand{\triplespaced}{\setstretch {2.6}}
%}}}

% Text layout.
\usepackage{ragged2e}
\RaggedRight
%\justifying
\RequirePackage{graphicx}
\usepackage{fixltx2e}
\usepackage{parskip}
\setlength{\parindent}{1cm}
%\setlength{\parskip}{5ex}
\RequirePackage{lettrine}
\RequirePackage{setspace}
\RequirePackage{verbatim}
\usepackage{indentfirst}

% Fonts.
\RequirePackage{color}
\usepackage{hyperref}
\RequirePackage{url}
\RequirePackage{amssymb}
\RequirePackage{mathspec}
\AtBeginEnvironment{tabular}{\addfontfeature{RawFeature=+tnum}}
\widowpenalty=300
\clubpenalty=300
% \setromanfont[Numbers=OldStyle, Ligatures={Common, TeX}, Scale=1.0]{EB Garamond}
% \newfontfamily{\smallcaps}[RawFeature={+c2sc,+scmp}]{EB Garamond}
% \setsansfont[Scale=MatchLowercase, BoldFont={Lato Bold}]{Lato Regular}
% \setmonofont[Scale=MatchLowercase]{Source Code Pro}
\RequirePackage[labelfont={bf,small,singlespacing},
                textfont={small,singlespacing},
                justification={justified,RaggedRight},
                singlelinecheck=false,
                margin=0pt,
                figurewithin=chapter,
                tablewithin=chapter]{caption}
\RequirePackage{microtype}
\captionsetup{justification=centering} %centrado de los caption



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%        Headings & Headers         %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage{fancyhdr}
\RequirePackage[tiny, md, sc]{titlesec}
\setlength{\headheight}{300pt}
\RequirePackage{titling}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Page number in upper right corner %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\fancypagestyle{plain}{%
\fancyhf{} % clear all header and footer fields
\fancyfoot[C]{\thepage} % numeros de pagina abajo
\renewcommand{\headrulewidth}{0pt}
\renewcommand{\footrulewidth}{0pt}}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% LAYOUT: TABLE of CONTENTS -auto fill %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\setcounter{tocdepth}{3}
\usepackage[titles]{tocloft}
\usepackage[titletoc]{appendix}
\renewcommand{\cftsecleader}{\cftdotfill{\cftdotsep}}
\renewcommand{\cftchapfont}{\normalsize \normalfont}
\renewcommand\contentsname{ÍNDICE}
\renewcommand{\figurename}{Figura}
\renewcommand{\tablename}{Tabla}
\renewcommand\listfigurename{LISTA DE FIGURAS}
\renewcommand\listtablename{LISTA DE TABLAS}
\renewcommand{\cftchapafterpnum}{\vspace{10pt}}
\newcommand{\hsp}{\hspace{20pt}}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% LAYOUT: List of TABLES - auto fill %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%{{{ List of Tables
% LoT should be single-spaced within entries and double-spaced between entries
\renewcommand*{\listoftables}{
    \singlespaced
    % \vskip0pt
    \chapter*{ \begin{center} \textnormal{LISTA DE TABLAS}  \end{center}}
    \addcontentsline{toc}{section}{LISTA DE TABLAS}
    % \addcontentsline{toc}{chapter}{\textnormal{LIST OF TABLES}}
    % \addvspace{10pt}
    % \typeout{!! List of Tables...!!}
    \noindent Tabla \hfill Página\\         % newline allows us to use a vspace...
    % vspace adjusts spacing to get a doublespace between table headings
    % and table contents
    % \vspace{\baselineskip}
    \@starttoc{lot}     
    \newpage
    % \doublespaced
}
% Ensure double-spacing between entries
\renewcommand*\l@table{\par\addvspace{\bigskipamount}\pagebreak[2]
 \@dottedtocline{1}{1.5em}{2.3em}}
%}}}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% LAYOUT: List of FIGURES -auto fill %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%{{{ List of Figures
% LoF should be single-spaced within entries and double-spaced between entries 
\renewcommand*{\listoffigures}{
    \singlespaced
    % \vskip0pt
    \chapter*{\begin{center} \textnormal{LISTA DE FIGURAS} \end{center}}
    \addcontentsline{toc}{section}{LISTA DE FIGURAS}
    % \addcontentsline{toc}{chapter}{\textnormal{LIST OF FIGURES}}
    % \addvspace{10pt} 
    % \typeout{!! List of Figures...!!}
    \noindent Figura \hfill Página\\         % newline allows us to use a vspace...
    % vspace adjusts spacing to get a doublespace between table headings
    % and table contents
    % \vspace{\baselineskip} 
    \@starttoc{lof}     
    \newpage 
    % \doublespaced
}
% Ensure double-spacing between entries
\renewcommand*\l@figure{\par\addvspace{\bigskipamount}\pagebreak[2]
 \@dottedtocline{1}{1.5em}{2.3em}}
%}}}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% LAYOUT: SECTION HEADINGS- auto fill %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\renewcommand{\setthesection}{\roman{chapter}.A\roman{section}}
\usepackage{quotchap}
\parskip 0pt 

\usepackage{titlesec, blindtext, color}

\titleformat{\chapter}[display]
{\vspace{-60pt}\center}   %% spacing of chapter headings
{{CAPÍTULO \thechapter}}
{0pt}
{}

\titleformat{\section}[display]
{\normalfont\normalsize\bfseries}
{}
{0pt}
{{}}

\titleformat{\subsection}[display]
{\normalfont\normalsize\itshape}
{}
{0pt}
{{}}

\titleformat{\subsubsection}[display]
{\normalfont\normalsize}
{}
{0pt}
{{}}

% An environment for paragraph-style section.
\providecommand\newthought[1]{%
   \addvspace{1.0\baselineskip plus 0.5ex minus 0.2ex}%
   \textsc{#1}%
}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Figure numbering - chapter.number %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\renewcommand{\thefigure}{\arabic{section}.\arabic{figure}}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% LAYOUT: Title Page - info filled above    %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\renewcommand{\maketitle}{
	\thispagestyle{empty}
	\vspace*{\fill}
	\begin{center}
	\doublespaced
	\MakeUppercase{\@title}\\
	by\\
	\@author \\ 
	\singlespaced
	A dissertation submitted in partial fulfillment\\
	of the requirements for the degree \\
	\doublespaced
	of\\ 
	\MakeUppercase{\degree} \\
	in\\ 
	\singlespaced
  \field \\
	\end{center} 
	\vspace{12pt}
	\noindent Approved: \\
	\vspace{20pt}
	\begin{tabular}{ll}
	  \centering
    \makebox[2.75in]{\hrulefill} & \makebox[2.7in]{\hrulefill}\\    
    \chairperson                 & \committeeone \\
    Dr. Salvador Torra              & Committee Member \\
    & \\
    & \\
    \end{tabular}
  \vspace{10pt}
    \begin{center}
	  \singlespacing
     UNIVERSITAT DE BARCELONA\\ 
	    Barcelona, España\\
	    \doublespacing
	    \yeardegree
	  \end{center}
	\vspace*{\fill}
	\clearpage
}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% LAYOUT: Copy Right - info filled above    %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand{\copyrightpage}{
	\vspace*{\fill}
  \begin{center}
	\doublespacing
	Copyright \hspace{3pt} 
	  \scshape \small \copyright  \hspace{3pt} 
	  \@author \hspace{3pt} \yeardegree\\
	Todos los derechos reservados
  \end{center}
	\vspace*{\fill}
}


