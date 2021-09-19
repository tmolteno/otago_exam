% This is otago_exam.cls based on nih.cls by Alan Shields, May 2003
% email: tim@physics.otago.ac.nz
%
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{otago_exam}[2005/05/08 TCAM]

% includes needed for preliminary code
\RequirePackage{ifthen}

% Preliminary code
\newcommand{\nih@kk}{~}

% Should the table of physical constants be included in this exam.
\newboolean{exam@constants}
\setboolean{exam@constants}{false}% not strictly necessary, but let's be clear about it

% Should the table of physical constants be included in this exam.
\newboolean{exam@calculator_none}
\newboolean{exam@calculator_simple}
\newboolean{exam@calculator_any}
\setboolean{exam@calculator_none}{false}% not strictly necessary, but let's be clear about it
\setboolean{exam@calculator_simple}{false}% not strictly necessary, but let's be clear about it
\setboolean{exam@calculator_any}{false}% not strictly necessary, but let's be clear about it

% Options
% \DeclareOption{12pt}{\AtEndOfClass{\RequirePackage{times}}}
% \DeclareOption{11pt}{\AtEndOfClass{\RequirePackage{helvet}\renewcommand{\familydefault}{\sfdefault}}}
\DeclareOption{constants}{\setboolean{exam@constants}{true}}
\DeclareOption{nocalculator}{\setboolean{exam@calculator_none}{true}}
\DeclareOption{simplecalculator}{\setboolean{exam@calculator_simple}{true}}
\DeclareOption{anycalculator}{\setboolean{exam@calculator_any}{true}}
\DeclareOption{kk}{\renewcommand{\nih@kk}{\small KK}}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax

% The class we're overwriting
\LoadClass[a4paper,12pt]{article}


% Begin Requirements
\RequirePackage{fullpage}
\RequirePackage{fancyhdr}
\RequirePackage{amsmath}


%%%% More code
% preamble stuff
\newcommand{\exam@EXAMinstructions}{NOTE: Define the exam instructions with the ``examinstructions'' command.}
\newcommand{\examinstructions}[1]{\renewcommand{\exam@EXAMinstructions}{#1}}

\newcommand{\exam@EXAMotherinst}{}
\newcommand{\otherinstructions}[1]{\renewcommand{\exam@EXAMotherinst}{#1}}

\newcommand{\exam@EXAMduration}{TWO HOURS}
\newcommand{\duration}[1]{\renewcommand{\exam@EXAMduration}{#1}}

\newcommand{\exam@EXAMplatform}{Blackboard}
\newcommand{\platform}[1]{\renewcommand{\exam@EXAMplatform}{#1}}

\newcommand{\exam@EXAMresources}{Any written or printed material}
\newcommand{\resources}[1]{\renewcommand{\exam@EXAMresources}{#1}}

\newcommand{\exam@EXAMsemester}{Semester 1}
\newcommand{\semester}[1]{\renewcommand{\exam@EXAMsemester}{#1}}

\newcommand{\exam@EXAMsubject}{PHYSICS}
\newcommand{\coursesubject}[1]{\renewcommand{\exam@EXAMsubject}{#1}}

\newcommand{\exam@EXAMdescription}{}
\newcommand{\coursedescription}[1]{\renewcommand{\exam@EXAMdescription}{#1}}

\newcommand{\exam@EXAMheaderdesc}{\exam@EXAMdescription}
\newcommand{\headerdescription}[1]{\renewcommand{\exam@EXAMheaderdesc}{#1}}

% constants
\newcommand{\nih@sillysize}{\scriptsize}


%%
%%	Set up to page style
%%
\author{Dummy Author}
\pagestyle{fancy}
\rhead[{\@title} (\exam@EXAMheaderdesc){\number\year}]{{\@title} (\exam@EXAMheaderdesc) {\number\year}}%
\chead[\thepage]{\thepage}
\cfoot[]{}
\rfoot[\textrm{\underline{TURN OVER}}]{\textrm{\underline{TURN OVER}}}
\pagestyle{fancy}
\rhead[{\@title} (\exam@EXAMheaderdesc){\number\year}]{{\@title} (\exam@EXAMheaderdesc) {\number\year}}%
\chead[\thepage]{\thepage}
\cfoot[]{}
\rfoot[\textrm{\underline{TURN OVER}}]{\textrm{\underline{TURN OVER}}}

%%
%%	Set up to page size
%%
\addtolength{\topmargin}{-2cm}%
\addtolength{\headheight}{1cm}%
\addtolength{\textheight}{1.5cm}%
%%\addtolength{\textwidth}{1cm}%
\addtolength{\headsep}{1cm}%
\renewcommand{\headrulewidth}{0pt}
\headwidth=\textwidth


%%
%%	Set up a counter for the number of pages
%%
\def\numpages{\pageref{@lastpage}}

%%
%%	Set the value of this counter at the end of the document.
%%
\AtEndDocument{\rfoot[\textrm{\underline{END OF EXAM}}]{\textrm{\underline{END OF EXAM}}} \clearpage
    \if@filesw 
      {\advance\c@page-1 \immediate\write\@mainaux {\string\newlabel{@lastpage}{{}{\arabic{page}}}}}
    \fi
}
\def\iflastpage#1#2{%
      \@ifundefined{r@@lastpage}{\def\@@lastpage{-1}}%
              {\edef\@@lastpage{\expandafter\@cdr\r@@lastpage\@nil}}%
      \ifnum\value{page}=\@@lastpage
        #1%
      \else
        #2%
      \fi
}


	
\newcommand{\nocalculator}{
	No CALCULATORS may be used in this examination.%
}
\newcommand{\simplecalculator}{
	CALCULATORS may be used. Please note that these must be hand-held without%
	alphabetized key pads. (Calculators are subject to inspection by the examiners.) %
}
\newcommand{\anycalculator}{
	Any model of calculator provided this is battery powered, silent, truly portable and free of communication capabilities %
}
\newcommand{\makeclaculatornote}{
	\ifthenelse{\boolean{exam@calculator_none}}%
		{\nocalculator}
		{\ifthenelse{\boolean{exam@calculator_simple}}%
			{\simplecalculator}
			{\ifthenelse{\boolean{exam@calculator_any}}%
				{\anycalculator}
				{\nocalculator}
			}
		}
}


%% Official Otago Exam Cover Page
\newenvironment{instruction}[1]
		{\underline{#1}:\newline\newline%
		\indent \begin{minipage}[t]{0.9\linewidth}}
		{\end{minipage}\newline\vspace{0.2cm}\newline}
\newcommand{\coverpage}{\par
  \begingroup
\pagestyle{fancy}%
\rhead[]{}%
\chead[]{}%
\cfoot[]{}%
\rfoot[\textrm{\underline{TURN OVER}}]{\textrm{\underline{TURN OVER}}}%
%	\thispagestyle{empty}%
	\begin{center}%
	\begin{Large}%
	\textbf{UNIVERSITY OF OTAGO EXAMINATIONS {\number\year}}\\%
	%
	\vspace{1cm}%
	%
	\framebox{\framebox{\parbox[t][4cm][c]{8cm}%
	{%
	\begin{center}%
	\textbf{\exam@EXAMsubject}\\%
	\textbf{PAPER  \@title}\\%
	\large\textbf{\exam@EXAMdescription}\\%
	\large\textbf{\exam@EXAMsemester}%
	\end{center}%
	}}}\\%
	%
	\vspace{1cm}%
	%
	\large\textbf{TIME ALLOWED : {\exam@EXAMduration}}%
	\end{Large}%
	\end{center}%
	%
 	\underline{This examination paper comprises {\numpages} pages}\newline %
 	\newline %
	\begin{instruction}{Online exam platform}%
	\exam@EXAMplatform%
	\end{instruction}%
	%
	\begin{instruction}{Candidates should answer sections as follows}%
	\exam@EXAMinstructions%
	\end{instruction}%
	%
	\begin{instruction}{The following material is provided}%
	Nil.%
	\end{instruction}%
	%
	\begin{instruction}{Use of calculators}%
	\makeclaculatornote%
	\end{instruction}%
	%
	\begin{instruction}{The following resources are permitted}%
	\exam@EXAMresources%
	\end{instruction}%
	%
	\begin{instruction}{Other Instructions}%
	\exam@EXAMotherinst%
	\end{instruction}%
	\newpage
  \endgroup
  \setcounter{footnote}{0}%
\pagestyle{fancy}
\rhead[{\@title} (\exam@EXAMheaderdesc){\number\year}]{{\@title} (\exam@EXAMheaderdesc) {\number\year}}%
\chead[\thepage]{\thepage}
\cfoot[]{}
\rfoot[\textrm{\underline{TURN OVER}}]{\textrm{\underline{TURN OVER}}}
\pagestyle{fancy}
\rhead[{\@title} (\exam@EXAMheaderdesc){\number\year}]{{\@title} (\exam@EXAMheaderdesc) {\number\year}}%
\chead[\thepage]{\thepage}
\cfoot[]{}
\rfoot[\textrm{\underline{TURN OVER}}]{\textrm{\underline{TURN OVER}}}
}

\newcommand{\makeconstants}{
	\ifthenelse{\boolean{exam@constants}}%
	{\physicalconstants}
	{}
}

\newcommand{\physicalconstants}{{\footnotesize
	%% FORUMLA PAGE
	\begin{center}%
	UNIVERSITY OF OTAGO PHYSICS DEPARTMENT: PHYSICAL CONSTANTS\\%
	(for use in examinations)\\%
	\vspace{0.5cm}%\\
	\begin{tabular}{lllll}
	\textbf{Quantity} 		& \textbf{Symbol} 	& \textbf{Value} 		& & \textbf{Units} \\
	Speed of light			& $c$			& \multicolumn{2}{l}{299 792 458}	& m s$^{-1}$ \\
	Planck constant			& $h$			& 16.626 & $\times 10^{-34}$ 	& J s \\
	Planck constant, reduced	& $\hbar \equiv h/2\pi$	& 1.055 & $\times 10^{-34}$ 	& J s \\
					&			& 6.582 & $\times 10^{-22}$ 	& MeV s \\
	Electron charge			& $e$			& 1.602 & $\times 10^{-19}$ 	& C \\
	Electron mass			& $m_e$			& 9.109 & $\times 10^{-31}$ 	& kg \\
	Proton mass			& $m_p$			& 1.673 & $\times 10^{-27}$ 	& kg \\
	Unified atomic mass unit	& $u$			& 1.661 & $\times 10^{-27}$ 	& kg \\
					&			& =931.5 & 		 	& MeV c$^{-2}$ \\
	Permittivity of free space	& $\epsilon_0 \equiv \frac{1}{\mu_0 c^2}$
								& 8.854 & $\times 10^{-12}$ 	& F m$^{-1}$ \\
	Permeability of free space	& $\mu_0$		& $4\pi$ & $\times 10^{-7}$ 	& N A$^{-2}$ \\
	Coulomb constant		& $\frac{1}{4 \pi \epsilon_0}$
								& 8.998 & $\times 10^{9}$ 	& N m$^{2}$ C$^{-2}$ \\
	Impedance of free space (exact)	& $Z_0 \equiv c \mu_0$	& 377 & 		 	& $\Omega$ \\
	$(\textrm{Fine structure constant})^{-1}$ & $\alpha^{-1}$	& 137.0 & 		 	&  \\
	Classical electron radius	& $r_e$			& 2.818 & $\times 10^{-15}$ 	& m \\
	Electron Compton wavelength	& $\lambdabar_e \equiv \lambda_e / 2 \pi$	& 3.862 & $\times 10^{-13}$ 	& m \\
	Bohr radius ($m_{\textrm{nucleus}} = \infty$)
					& $a_0$			& 5.292 & $\times 10^{-11}$ 	& m \\
	Rydberg energy			& $hcR_{\infty}$	& 13.61 & 		 	& eV \\
	Bohr magneton			& $\mu_B \equiv \frac{e \hbar}{2 m_e}$		& 9.274 & $\times 10^{-24}$ 	& J T$^{-1}$ \\
					&			& =5.788 & $\times 10^{-5}$ 	& eV T$^{-1}$ \\
	Nucler magneton			& $\mu_N \equiv \frac{e \hbar}{2 m_p}$		& 5.051 & $\times 10^{-27}$ 	& J T$^{-1}$ \\
					&			& =3.152 & $\times 10^{-8}$ 	& eV T$^{-1}$ \\
	Electron charge/mass		& $-e/m_e$		& -1.759 & $\times 10^{11}$ 	& C kg$^{-1}$ \\
	Proton charge/mass		& $e/m_p$		& 9.579 & $\times 10^{7}$ 	& C kg$^{-1}$ \\
	Gravitational constant (Newton)	& $G$			& 6.673 & $\times 10^{-11}$ 	& N m$^2$ kg$^{-2}$ \\
	Acceleration due to gravity (sea level)	& $g$		& 9.807 & $\times 10^{-11}$ 	& m s$^{-2}$ \\
	Avogadro number			& $N_A$			& 6.022 & $\times 10^{23}$ 	& mol$^{-1}$ \\
	Bolzmann constant		& $k$			& 1.381 & $\times 10^{-23}$ 	& J K$^{-1}$ \\
					& 			& =8.617 & $\times 10^{-5}$ 	& eV K$^{-1}$ \\
	molar gas constant		& $R \equiv k N_A$	& 8.315 & 		 	& J mol$^{-1}$ K$^{-1}$ \\
	molar volume (at STP)		& $V_m$			& 2.241 & $\times 10^{-2}$ 	& m$^3$ mol$^{-1}$ \\
	Vien displacement law constant	& $b \equiv \lambda_{max}T$	& 2.898 & $\times 10^{-3}$ 	& m K \\
	Stefan-Bolzmann constant	& $\sigma$		& 5.671 & $\times 10^{-8}$ 	& W m$^{-2}$ K$^{-4}$ \\
	\end{tabular}
	\end{center}
	All numerical values have been rounded to four significant figures, for use where necessary in this examination.
	(Note that the actual situation is that except for $G$, $k$, $R$, $N_A$ and $V_m$ all measured values are reliable
	to better than 1 part per million. Also $\mu_0$, $c$, $\epsilon_0$ and $Z_0$ are exact.
	
	\paragraph{Definitions and equations}
	\begin{eqnarray*}
	\alpha 	& \equiv 	& e^2 / (4 \pi \epsilon_0 \hbar c) \\
	a_0 	& \equiv	& \frac{4 \pi \epsilon_0 \hbar^2}{m_e e^2} = \frac{r_e}{\alpha^2} \\
	u	& \equiv	& (\textrm{mass }^{12} \textrm{  atom})/12 = 10^{-3} \textrm{ kg} / N_A \\
	r_e	& \equiv	& \frac{e^2}{4 \pi \epsilon_0 m_e c^2} \\
	\lambdabar_e & \equiv	& \frac{\lambda_e}{2 \pi} = \frac{\hbar}{m_e c} = \frac{r_e}{\alpha} \\
	hcR_\infty	& \equiv & \frac{m_e e^4}{2 (4 \pi \epsilon_0)^2 \hbar^2} = \frac{m_e c^2 \alpha^2}{2}
	\end{eqnarray*}
	}% small
	\newpage
}

 % Environments
%%
\newenvironment{exam}
		{\coverpage
		\makeconstants
		\begin{enumerate}}
		{\end{enumerate} \rfoot[]{} }
\newenvironment{question}
		{\item \begin{minipage}[t]{\linewidth}}
		{\end{minipage}}
%%
