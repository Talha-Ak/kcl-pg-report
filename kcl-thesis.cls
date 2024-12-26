\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{kcl-thesis}[2024/12/26 KCL MSc Thesis Class by Talha Abdulkuddus]

% Release option
\newif\if@release
\@releasefalse
\DeclareOption{release}{\@releasetrue}
\ProcessOptions\relax

\LoadClass[11pt,a4paper]{report}

% Required packages
\usepackage[british]{babel} % For British English hyphenation
\usepackage{csquotes}       % For quoting

\usepackage{amssymb}       % For checkbox symbols

\RequirePackage{graphicx}   % For image handling
\RequirePackage{svg}        % For SVG image handling
\graphicspath{{figures/}}   % Set the path to the images directory

\RequirePackage{tcolorbox}   % For release notice

\RequirePackage[
    margin=1.5cm,           % Set 1.5cm margins on all sides
    includehead,            % Include header in margin calculations
    includefoot             % Include footer in margin calculations
]{geometry}

\RequirePackage{setspace}   % For line spacing control
\singlespacing              % Set line spacing to single

\newcommand*{\studentnumber}[1]{\def\@studentnumber{#1}}
\newcommand*{\degree}[1]{\def\@degree{#1}}
\newcommand*{\supervisor}[1]{\def\@supervisor{#1}}
\newcommand*{\wordcount}[1]{\def\@wordcount{#1}}

% Initialize empty values
\def\@studentnumber{\texttt{\textbackslash studentnumber}}
\def\@degree{\texttt{\textbackslash degree}}
\def\@supervisor{\texttt{\textbackslash supervisor}}
\def\@wordcount{\texttt{\textbackslash wordcount}}

\def\@leftheader{
    {\textbf{Faculty of Natural, Mathematical and Engineering Sciences}}\\
    {\small{Department of Informatics}}
}

\def\@centerheader{
    King's College London\\
    Strand Campus, London\\
    United Kingdom
}

\def\@reportheader{
    \begin{center}
        \textbf{7CCSMPRJ} \\
        Individual Project Submission 2024/25
    \end{center}
}

\def\@reportdetails{
    \begin{doublespace}
        \textbf{Name:} \@author\\
        \textbf{Student Number:} \@studentnumber\\
        \textbf{Degree Programme:} \@degree\\
        \textbf{Project Title:} \@title\\
        \textbf{Supervisor:} \@supervisor\\
        \textbf{Word Count:} \@wordcount
    \end{doublespace}
}

\def\@projectnotice{
    \begin{tcolorbox}[boxsep=3mm,title=RELEASE OF PROJECT]
        Following the submission of your project, the Department would like
        to make it publicly available via the library electronic resources.
        You will retain copyright of the project.
    \end{tcolorbox}
}

\renewcommand{\maketitle}{
    \begin{titlepage}
        \noindent
        \begin{minipage}[t]{0.3\textwidth}
            \vspace{0pt}
            \raggedright
            \@leftheader
        \end{minipage}%
        \begin{minipage}[t]{0.4\textwidth}
            \vspace{0pt}
            \raggedright
            \@centerheader
        \end{minipage}%
        \begin{minipage}[t]{0.3\textwidth}
            \vspace{0pt}
            \raggedleft
            \includesvg[height=2.25cm]{kcl-logo}
        \end{minipage}
        \vspace*{2cm}
        \@reportheader
        \vspace*{1cm}
        \@reportdetails
        \vspace*{0.5cm}
        \@projectnotice
        \vspace*{0.5cm}
        \begin{doublespace}
            \if@release
                \noindent
                $\boxtimes$ I \textbf{agree} to the release of my project\\
                $\square$ I \textbf{do not} agree to the release of my project
            \else
                \noindent
                $\square$ I \textbf{agree} to the release of my project\\
                $\boxtimes$ I \textbf{do not} agree to the release of my project
            \fi
        \end{doublespace}
        \vfill
        \begin{doublespace}
            \textbf{Signature:} \input{tex/signature.tex}\\
            \textbf{Date:} \@date
        \end{doublespace}
    \end{titlepage}

    \begin{titlepage}
        \noindent
        \begin{minipage}[t]{0.3\textwidth}
            \vspace{0pt}
            \raggedright
            \@leftheader
        \end{minipage}%
        \begin{minipage}[t]{0.4\textwidth}
            \vspace{0pt}
            \raggedright
            \@centerheader
        \end{minipage}%
        \begin{minipage}[t]{0.3\textwidth}
            \vspace{0pt}
            \raggedleft
            \includesvg[height=2.25cm]{kcl-logo}
        \end{minipage}
        \vspace*{2cm}
        \begin{center}
            {\Large \textbf{7CCSMPRJ} MSc Report}
            % \vspace*{0.5cm}
            \begin{spacing}{2.5}
                {\Huge \textbf{\@title}}
            \end{spacing}
        \end{center}
        \begin{flushleft}
            \begin{doublespace}
                \Large
                \textbf{Name:} \@author\\
                \textbf{Student Number:} \@studentnumber\\
                \textbf{Degree Programme:} \@degree\\
            \end{doublespace}
            \vspace{1cm}
            {\Large\textbf{Supervisor:} \@supervisor}\\
            \vfill
            This dissertation is submitted for the degree of \@degree.
        \end{flushleft}
    \end{titlepage}
}
