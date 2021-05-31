%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Stylish Article
% Class File
% Version 2.2 (2020-10-22)
%
% This template has been downloaded from:
% http://www.LaTeXTemplates.com
%
% Original author:
% Mathias Legrand (legrand.mathias@gmail.com)
% With extensive modifications by:
% Vel (vel@latextemplates.com)
%
% License:
% CC BY-NC-SA 3.0 (http://creativecommons.org/licenses/by-nc-sa/3.0/)
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%----------------------------------------------------------------------------------------
%	CLASS CONFIGURATION
%----------------------------------------------------------------------------------------

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{SelfArx}[22/10/2020, v2.2]

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}} % Pass through any options to the base class
\ProcessOptions\relax % Process given options

\LoadClass{article} % Load the base class

%----------------------------------------------------------------------------------------
%	REQUIRED PACKAGES AND DOCUMENT CONFIGURATIONS
%----------------------------------------------------------------------------------------

\RequirePackage{ifthen}
\RequirePackage{calc}
\RequirePackage{amsmath, amsfonts, amssymb}
\RequirePackage{graphicx}
\graphicspath{{./.Figures/}{./}} % Specifies where to look for included images (trailing slash required)
\RequirePackage[svgnames]{xcolor}
\RequirePackage{booktabs}
\RequirePackage{lastpage} % Number of pages in the document

\AtEndOfClass{\RequirePackage{microtype}}

\flushbottom % Makes all text pages the same height

%----------------------------------------------------------------------------------------
%	FONTS
%----------------------------------------------------------------------------------------

\RequirePackage[utf8]{inputenc}
\RequirePackage{times} % Loads the Times Roman Fonts
\RequirePackage{mathptmx} % Loads the Times Roman Math Fonts

%----------------------------------------------------------------------------------------
%	MARGINS
%----------------------------------------------------------------------------------------

\RequirePackage[
	left=2cm,
	right=2cm,
	top=2.25cm,
	bottom=2.25cm,
	headheight=11pt,
	letterpaper,
]{geometry}

%----------------------------------------------------------------------------------------
%	FIGURE AND TABLE CAPTIONS
%----------------------------------------------------------------------------------------

\RequirePackage[
	labelfont={bf,sf,small},
	labelsep=period,
	justification=raggedright,
]{caption}

\setlength{\abovecaptionskip}{3pt}
\setlength{\belowcaptionskip}{0pt}

%----------------------------------------------------------------------------------------
%	PAGE HEADER
%----------------------------------------------------------------------------------------

\RequirePackage{fancyhdr} % Needed to define custom headers/footers
\pagestyle{fancy} % Enables the custom headers/footers

\renewcommand{\headrulewidth}{0.4pt} % No header rule
\renewcommand{\footrulewidth}{0.3pt} % No footer rule

% Headers
\renewcommand{\sectionmark}[1]{\lhead{\small\sffamily\bfseries Reporte de Laboratorio \ --- {\sc #1}}}
\chead{}
\rhead{\@Course \ -- UNAH \ \  \thepage}


% Footers
\lfoot{}
\cfoot{}
\rfoot{}

%----------------------------------------------------------------------------------------
%	SECTION SETUP
%----------------------------------------------------------------------------------------

\RequirePackage[explicit]{titlesec}

\titleformat{\section}
	{\color{color1}\LARGE\sffamily\sc}
	{}
	{0em}
	{\colorbox{color2!10}{\parbox{\dimexpr\linewidth-2\fboxsep\relax}{\centering\space#1}}}
	[]

\titleformat{name=\section,numberless}
	{\color{color1}\LARGE\sffamily\sc}
	{}
	{0em}
	{\colorbox{color2!10}{\parbox{\dimexpr\linewidth-2\fboxsep\relax}{\centering #1}}}
	[]

\titleformat{\subsection}
	{\color{color1}\sffamily\Large\sc}
	{}
	{0.5em}
	{#1}
	[]

\titleformat{\subsubsection}
	{\sffamily\sc\large}
	{}
	{0.5em}
	{#1}
	[]

\titleformat{\paragraph}[runin]
	{\sffamily\small}
	{}
	{0em}
	{#1} 

\titlespacing*{\section}{0pc}{3ex \@plus4pt \@minus3pt}{5pt}
\titlespacing*{\subsection}{0pc}{2.5ex \@plus3pt \@minus2pt}{0pt}
\titlespacing*{\subsubsection}{0pc}{2ex \@plus2.5pt \@minus1.5pt}{0pt}
\titlespacing*{\paragraph}{0pc}{1.5ex \@plus2pt \@minus1pt}{10pt}

%----------------------------------------------------------------------------------------
%	TABLE OF CONTENTS SETUP
%----------------------------------------------------------------------------------------

\newlength{\tocsep} 
\setlength\tocsep{1.5pc} % Sets the indentation of the sections in the table of contents
\setcounter{tocdepth}{2} % Three levels in the table of contents section: sections, subsections and subsubsections

\usepackage{titletoc}
\contentsmargin{0.6cm}

\titlecontents{section}[\tocsep]
	{\addvspace{5pt}\large\bfseries\sffamily}
	{\contentslabel[]{\tocsep}}
	{}
	{\ \titlerule*[.6pc]{-}\ \thecontentspage}
	[]

\titlecontents{subsection}[\tocsep]
	{\addvspace{2pt}\sffamily}
	{\ \ \ \contentslabel[]{\tocsep}}
	{}
	{\ \titlerule*[.5pc]{.}\ \thecontentspage}
	[]

\titlecontents*{subsubsection}[\tocsep]
	{\footnotesize\sffamily}
	{}
	{}
	{}
	[\ \textbullet\ ]

%----------------------------------------------------------------------------------------
%	MULTIPLE AUTHOR SET
%----------------------------------------------------------------------------------------

\newcount\@authcnt
\newcount\@tmpcnt\@tmpcnt\z@

\def\@affiliation{%
	\ifnum\@tmpcnt<\@authcnt
		 \global\advance\@tmpcnt1
		 \raggedright \csname @auth\romannumeral\the\@tmpcnt\endcsname\hfill\\%
		 \let\next\@affiliation \vskip1pt
	\else
		\let\next\relax
	\fi
	\next%
}

\newcommand{\affiliation}[1]{%
	\global\advance\@authcnt1
	\expandafter\gdef\csname @auth\romannumeral\the\@authcnt\endcsname
	{#1}
}

%----------------------------------------------------------------------------------------
%	LISTS
%----------------------------------------------------------------------------------------

\RequirePackage{enumitem}
%\setlist{nolistsep} % Uncomment to remove spacing before lists (enumerate, itemize)
\providecommand{\tightlist}{%
  \setlength{\itemsep}{0pt}\setlength{\parskip}{0pt}}


%----------------------------------------------------------------------------------------
%	ABSTRACT AND AUTHOR FRAME
%----------------------------------------------------------------------------------------

\newcommand{\PaperTitle}[1]{\def\@PaperTitle{#1}}
\newcommand{\Instructor}[1]{\def\@Instructor{#1}}
\newcommand{\Course}[1]{\def\@Course{#1}}
\newcommand{\SectionID}[1]{\def\@SectionID{#1}}
\newcommand{\Deadline}[1]{\def\@Deadline{#1}}
\newcommand{\Abstract}[1]{\def\@Abstract{#1}}
\newcommand{\Keywords}[1]{\def\@Keywords{#1}}
\newcommand{\keywordname}{Palabras claves} % Defines the keywords heading name

% ---------------------------------------------------------------------

\renewcommand{\@maketitle}{%
	%\twocolumn[
	{%
		\centering
		\rule{\linewidth}{0.8mm}\\
		\rule[5mm]{\linewidth}{0.1mm}\\
		
		\begin{minipage}[!h]{0.14\linewidth} \includegraphics[width=0.7\textwidth]{logo_unah.png} \end{minipage}
		\begin{minipage}[!h]{0.7\linewidth}
			\begin{center} 
				\Large{\textbf{Universidad Nacional Autónoma de Honduras}}\\
				\large Facultad de Ciencias\\
				Departamento de Materia Condensada\\
				\vspace{4mm}
				{\sffamily\bfseries\fontsize{20}{25}\selectfont\centering \@PaperTitle \par}
				\vspace{2mm}
				{\sffamily\large\selectfont\centering Reporte de Laboratorio\par}
				\vspace{1mm}
			\end{center} 
		\end{minipage}
		\begin{minipage}[!h]{0.14\linewidth} \includegraphics[width=1\textwidth]{logo_ciencias.png} \end{minipage}\\	
		
		\rule{\linewidth}{0.5mm}\\	
		
		\vspace{3mm}
		\begin{minipage}[!c]{0.4\linewidth}
			{\sffamily\bfseries\selectfont Instructor:}
			{\sffamily\selectfont \@Instructor \par}
			{\sffamily\bfseries\selectfont Asignatura:}
			{\sffamily\selectfont \@Course \par}
			{\sffamily\bfseries\selectfont Sección:}
			{\sffamily\selectfont \@SectionID \par}
			{\sffamily\bfseries\selectfont Fecha:}
			{\sffamily\selectfont \@Deadline}
			%{\sffamily\bfseries\fontsize{12}{16}\selectfont \@Deadline}
		\end{minipage}	
		\begin{minipage}[!c]{0.5\linewidth}
			\printauthors
		\end{minipage}	
		
		\vspace{3mm}		
				
		\rule{\linewidth}{0.1mm}\\
		\rule[4mm]{\linewidth}{0.8mm}\\	

        \ifx\@Keywords\@empty%

        \else%
            \vspace{3mm}		
		    \fcolorbox{color1}{white}{%
			    \parbox{\textwidth-2\fboxsep-2\fboxrule}{\centering%
				    \colorbox{color2!10}{%
					    \parbox{\textwidth-4\fboxsep-2\fboxrule}{%
						    \ifx\@Keywords\@empty%
							    \vspace{1mm}
                                %\sffamily\textbf{\abstractname}\\\@Abstract%
	    					\else%
		    					%\sffamily\textbf{\abstractname}\\\@Abstract\\[4pt]%
			    				\textbf{\keywordname}\\\@Keywords%
				    		\fi%
					    }%
    				}%
	    		}%
		    }%
        \fi
		%\vskip25pt%
	}%]%
}

%----------------------------------------------------------------------------------------
%	REFERENCES
%----------------------------------------------------------------------------------------
  
\renewcommand{\@biblabel}[1]{\bfseries\color{color1}\textsuperscript{[#1]}} % Styling of the reference numbers in the bibliography
%\setlength{\bibitemsep}{0cm}

\let\oldbibliography\thebibliography

\renewcommand{\thebibliography}[1]{%
	\addcontentsline{toc}{section}{\refname}%
	\oldbibliography{#1}%
	\setlength\itemsep{0pt}%
}

%----------------------------------------------------------------------------------------
%	GRAPHIC SETUP	
%----------------------------------------------------------------------------------------
  
\usepackage{graphicx}
\makeatletter
\def\maxwidth{\ifdim\Gin@nat@width>\linewidth\linewidth\else\Gin@nat@width\fi}
\def\maxheight{\ifdim\Gin@nat@height>\textheight\textheight\else\Gin@nat@height\fi}
\makeatother
% Scale images if necessary, so that they will not overflow the page
% margins by default, and it is still possible to overwrite the defaults
% using explicit options in \includegraphics[width, height, ...]{}
\setkeys{Gin}{width=\maxwidth,height=0.65\maxheight,keepaspectratio}
% Set default figure placement to htbp
\makeatletter
\def\fps@figure{htbp}
\makeatother



