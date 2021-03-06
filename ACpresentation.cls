\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{ACpresentation}[2020/08/10 v1.0 ACpresentation]

% ==============================================================================
% Document Class
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{beamer}}
\ProcessOptions\relax
\LoadClass[
  12pt, % Do not put to much stuff on a slide. Decrease this if you must.
  compress, % Show all frames of a section in a single row if a navbar exists
]{beamer}

% ==============================================================================
% Packages

\newcommand*\RequireOptionsPackage[2][]{
  \PassOptionsToPackage{#1}{#2}
  \RequirePackage{#2}
}

\RequirePackage{ifluatex}
\ifluatex
    % Lua(La)TeX
    % Language typesetting.
    \RequirePackage{polyglossia}

    % Font selection.
    \RequirePackage{fontspec}
    \setsansfont{TeX Gyre Heros} % Sans-serif

    % Unicode support for math. Load after other math/font packages.
    \RequirePackage{unicode-math}

    % Patches a few math packages to work correctly with LuaLaTeX.
    \RequirePackage{lualatex-math}
\fi

% Micro-typographic extensions.
\RequirePackage{microtype}

% Various useful tools for mathematical typesetting.
\RequirePackage{mathtools}

% Quotations.
\RequirePackage{csquotes}

% Tables
%\usepackage{booktabs}
\RequirePackage{tabu}

% Pseudocode
\RequireOptionsPackage[
  noend % Omits end statements in algorithms
]{algpseudocode}

% Source Code Listings
\RequirePackage{listings}

% tikz
\RequirePackage{tikz}
\usetikzlibrary{fadings}

% Bibliography.
\RequireOptionsPackage[
  backend = biber, % use biber as backend
  style = authoryear-comp,
  maxbibnames = 10, % max number of names in bibliography
  maxcitenames = 2, % max number of names in text cite
  uniquelist = minyear, % only add more authors if year is not unique
  labeldateparts = true,
  uniquename = init,
  giveninits = true, % abbreviate first name of authors
  doi = false, % do not show doi
  isbn = false, % do not show isbn
  eprint = false, % do not show eprint
  urldate = long, % format of urldate field
]{biblatex}

\RequirePackage{silence, lmodern}
% Filter warnings issued by biblatex starting with "Patching footnotes failed"
% see https://tex.stackexchange.com/a/202994/75225
\WarningFilter{biblatex}{Patching footnotes failed}

% ==============================================================================
% Theme

% Disable navigation symbols in the bottom left.
\beamertemplatenavigationsymbolsempty

% No double space after end of sentences.
\frenchspacing

% Show navigational bar on the top with little circles for each slide.
% (We redefine the relevant themes later, but we need this theme for spacing.)
\useoutertheme[
  subsection = false, % Do not leave a separate line to name subsections.
  footline = authorinstitute, % Show author and institute in a footline.
]{miniframes}

% Number items in the outline.
\setbeamertemplate{section in toc}[sections numbered]
\setbeamertemplate{subsection in toc}[subsections numbered]

% Use circles as itemize list items.
\setbeamertemplate{itemize items}[circle]

% Fonts ------------------------------------------------------------------------

\usefonttheme{professionalfonts} % Do not do some math font replacements.

\setbeamerfont{title}{series = \bfseries} % Make title of titlepage bold.
\setbeamerfont{subtitle}{series = {}} % Make subtitle of titlepage normal.
\setbeamerfont{frametitle}{series = \bfseries} % Make titles of slides bold.
\setbeamerfont{footline}{size = \tiny} % Font size of footline.
\setbeamerfont{author in head/foot}{parent = footline}
\setbeamerfont{date in head/foot}{parent = footline}
\setbeamerfont{framenumber in head/foot}{parent = footline, series = \bfseries} % Make framenumber bold.

% Colors -----------------------------------------------------------------------

\definecolor{ACblue}{HTML}{0C3875}
\definecolor{ACorange}{HTML}{FFAE00}
\definecolor{ACred}{HTML}{DD4814}
\definecolor{ACgray}{HTML}{D9D9D9}
\definecolor{ACcyan}{HTML}{21BFFC}

\usecolortheme[named = ACblue]{structure} % General theme color.
\setbeamercolor{mini frame}{fg=ACblue} % Color of bullets in navigation bar
\setbeamercolor{lower separation line head}{bg = ACcyan}
\setbeamercolor{lower separation line head 2}{bg = ACgray}
\setbeamercolor{footline}{fg = black, bg = ACgray} % Colors of footline.
\setbeamercolor{author in head/foot}{parent = footline}
\setbeamercolor{date in head/foot}{parent = footline}
\setbeamercolor{framenumber in head/foot}{parent = footline, fg = white, bg = ACcyan} % Accentuate framenumber by color.
\setbeamercolor{alerted text}{fg = ACred} % Color of alerted text.
\setbeamercolor{section in toc}{fg = ACblue} % Color of outline numbers.
\setbeamercolor{subsection in toc}{fg = ACblue} % Color of outline numbers.
\setbeamercolor{block title}{fg = ACblue} % Color of block titles.
% \setbeamercolor{block title example}{fg = ACblue} % Color of block titles of examples.
\hypersetup{
  colorlinks, % Colorize links.
  urlcolor = ACblue, % Color for extern url links.
  linkcolor = ACblue, % Color for intern links like "Section 2".
  citecolor = ACblue, % Color for links in citations.
}

% Normal Frame -----------------------------------------------------------------

% Headline.
\let\ACheadline\relax
\defbeamertemplate{headline}{ACnormal}{%
  \hbox{%
    \begin{beamercolorbox}[wd = .83\paperwidth, ht = .4cm]{section in head/foot}
      \ifundef{\ACheadline}{%
        \insertnavigation{.83\paperwidth}\vskip2pt%
      }{%
        \vspace{.18cm}%
        \hspace{1em}\ACheadline%
      }%
    \end{beamercolorbox}%
    \begin{beamercolorbox}[wd = .20\paperwidth, ht = .5cm, center]{section in head/foot}%
      \vspace{.05cm}%
      \includegraphics[height = .5cm]{logo_ac}%
    \end{beamercolorbox}%
  }%
  \begin{beamercolorbox}[colsep=.7pt]{lower separation line head}%
  \end{beamercolorbox}%
  \begin{beamercolorbox}[colsep=.7pt]{lower separation line head 2}%
  \end{beamercolorbox}%
}

% Footline.
\newcommand*\ACfootlineLeft{\insertshortauthor}
\newcommand*\ACfootlineCenter{\insertshortdate}
\defbeamertemplate{footline}{ACnormal}{%
  \leavevmode%
  \hbox{%
    \begin{beamercolorbox}[wd = .40\paperwidth, ht = 2.25ex, dp = 1ex, left]{author in head/foot}%
      \hspace{1em}\usebeamerfont{author in head/font}\ACfootlineLeft
    \end{beamercolorbox}%
    \begin{beamercolorbox}[wd = .20\paperwidth, ht = 2.25ex, dp = 1ex, center]{date in head/foot}%
      \usebeamerfont{date in head/font}\ACfootlineCenter
    \end{beamercolorbox}%
    \begin{beamercolorbox}[wd = .23\paperwidth, ht = 2.25ex, dp = 1ex, right]{author in head/foot}%
    \end{beamercolorbox}%
    \begin{beamercolorbox}[wd = .17\paperwidth, ht = 2.25ex, dp = 1ex, center]{framenumber in head/foot}%
      \usebeamerfont{framenumber in head/foot}\insertframenumber
    \end{beamercolorbox}%
  }%
  \vskip0pt%
}

% Define normal frame style.
\BeforeBeginEnvironment{frame}{%
  \setbeamertemplate{headline}[ACnormal]%
  \setbeamertemplate{footline}[ACnormal]
  \setbeamertemplate{frametitle}[default]
}

% Fancy Frame ------------------------------------------------------------------
% This frame style is used for title and section pages.

% Headline.
\defbeamertemplate{headline}{ACfancy}{%
\begin{tikzpicture}
\path (0,0) rectangle (\paperwidth,\paperheight);
\node[scope fading=south,inner sep=0pt,outer sep=0pt,anchor=north east] at(\paperwidth,\paperheight) {\includegraphics[width = \paperwidth]{bg}};
\end{tikzpicture}
}

% Footline.
\defbeamertemplate{footline}{ACfancy}{%
  \vspace{-1.7cm}
  {
    \begin{center}
      \includegraphics[height = 0.08\paperwidth]{logo_ac}
      \hspace{1cm}
      \includegraphics[height = 0.08\paperwidth]{logo_uni}
    \end{center}
  }%
  \vspace{-.2cm}
  \leavevmode%
  \hbox{%
    \begin{beamercolorbox}[wd = \paperwidth, ht = 2.25ex, dp = 1ex, right]{white}%
    \end{beamercolorbox}%
  }%
  \vskip0pt%
}

% Frame Title.
\defbeamertemplate{frametitle}{ACfancy}{%
  \vspace{2.3cm} % Move title down to account for fancy headline.
  \setbeamertemplate{frametitle}[default][center] % Center title.
  \usebeamertemplate***{frametitle}
}

% Define fancy frame style.
\define@key{beamerframe}{ACfancy}[true]{%
  \setbeamertemplate{headline}[ACfancy]%
  \setbeamertemplate{footline}[ACfancy]%
  \setbeamertemplate{frametitle}[ACfancy]
}

% Title Page -------------------------------------------------------------------

\setbeamertemplate{title page}{%
  \vspace{-.3cm}
  \vbox{}
  \vfill
  \begingroup
    \centering
    \begin{beamercolorbox}[sep=8pt,center]{title}
      \usebeamerfont{title}\inserttitle\par%
      \ifx\insertsubtitle\@empty%
      \else%
        \vskip0.25em%
        {\usebeamerfont{subtitle}\usebeamercolor[fg]{subtitle}\insertsubtitle\par}%
      \fi%
    \end{beamercolorbox}%
    \vskip.8em\par
    \begin{beamercolorbox}[sep=3pt,center]{author}
      \usebeamerfont{author}\insertauthor
    \end{beamercolorbox}
    \begin{beamercolorbox}[sep=3pt,center]{institute}
      \usebeamerfont{institute}\insertinstitute
    \end{beamercolorbox}
    \begin{beamercolorbox}[sep=6pt,center]{date}
      \usebeamerfont{date}\insertdate
    \end{beamercolorbox}\vskip0.3em
    {\usebeamercolor[fg]{titlegraphic}\inserttitlegraphic\par}
  \endgroup
  \vfill
}

% Subsection page --------------------------------------------------------------

\setbeamertemplate{subsection page}{%
  \begingroup
    \centering
    {\usebeamerfont{subsection name}\usebeamercolor[fg]{subsection name}\subsectionname~\insertsectionnumber.\insertsubsectionnumber}
    \vskip1em\par
    \begin{beamercolorbox}[sep=8pt,center]{part title}
      \usebeamerfont{subsection title}\insertsubsection\par
    \end{beamercolorbox}
  \endgroup
}

% Bibliography -----------------------------------------------------------------

% Last names before first names: http://tex.stackexchange.com/q/113573
\DeclareNameAlias{sortname}{family-given}
\DeclareNameAlias{default}{family-given}

% Author lastnames in small caps, but only in bibliography not in the citation.
% Note: last-first renamed to family-given to reflect updated BibLaTeX
% terminology.
\AtBeginBibliography{
  \renewcommand\mkbibnamelast[1]{\textsc{#1}}
}

% Decrease bibliography font size.
\def\bibfont{\small}

% Vertical space between bibliography entries.
\setlength\bibitemsep{0.8em}
% Indent after first line on bibliography entries
\setlength\bibhang{1em}

% Have URLs for specific entries.
% see http://tex.stackexchange.com/a/152971/75225
\DeclareBibliographyCategory{needsurl}
\newcommand{\entryneedsurl}[1]{\addtocategory{needsurl}{#1}}
\renewbibmacro*{url+urldate}{%
  \ifcategory{needsurl}{
    \printfield{url}%
    \iffieldundef{urlyear}
      {}
      {\setunit*{\addspace}%
       \printurldate}}
    {}}

% Navigation Bar ---------------------------------------------------------------

% Fixes the navigation bar so that it also works without subsections.
% see http://tex.stackexchange.com/a/215948
\pretocmd\sectionentry{%
  \let\ifhadanonsubsecn\@secondoftwo
}{}{\@error{unable to patch \string\sectionentry}{}}

%\patchcmd\slideentry{%
%  \ifnum#2>0%
%}{%
%  \ifnum2>0%
%}{}{\@error{unable to patch \string\slideentry}{}}

\patchcmd\slideentry{%
  \beamer@xpos=#3\relax%
  \beamer@ypos=#2\relax%
}{%
  \ifnum#2=0\relax
  \let\ifhadanonsubsecn\@firstoftwo
  \fi
  \beamer@xpos=#3\relax
  \beamer@ypos=#2\relax
  \ifhadanonsubsecn{%
    \advance \beamer@ypos by1\relax
  }{}%
}{}{\@error{unable to patch \string#1}}%

\patchcmd\fakeslideentry{%
  \beamer@xpos=#3\relax%
  \beamer@ypos=#2\relax%
}{%
  \ifnum#2=0\relax
  \let\ifhadanonsubsecn\@firstoftwo
  \fi
  \beamer@xpos=#3\relax
  \beamer@ypos=#2\relax
  \ifhadanonsubsecn{%
    \advance \beamer@ypos by1\relax
  }{}%
}{}{\PackageError{patchbeamernav}{unable to patch \string#1}}%

\@addtoreset{subsectionslide}{section}

% Adds commands to exclude certain slides from the navigation bar.
% see http://tex.stackexchange.com/a/45038/75225
\makeatletter
\let\beamer@writeslidentry@miniframeson=\beamer@writeslidentry
\def\beamer@writeslidentry@miniframesoff{%
  \expandafter\beamer@ifempty\expandafter{\beamer@framestartpage}{}% does not happen normally
  {%else
    % removed \addtocontents commands
    \clearpage\beamer@notesactions%
  }
}
\newcommand*{\miniframeson}{\let\beamer@writeslidentry=\beamer@writeslidentry@miniframeson}
\newcommand*{\miniframesoff}{\let\beamer@writeslidentry=\beamer@writeslidentry@miniframesoff}
\makeatother

% Algorithms -------------------------------------------------------------------

% Make line numbers gray and remove ugly colon (:) behind them
\algrenewcommand{\alglinenumber}[1]{%
  \color{ACgray}\tiny#1%
}

% Make comments gray
\algrenewcomment[1]{%
  \hfill\textcolor{ACblue}{\(\triangleright\) #1}%
}

% Add single line comment
% http://tex.stackexchange.com/a/74885/75225
\algnewcommand{\LineComment}[1]{%
  \State \textcolor{ACblue}{\(\triangleright\) #1}%
}

% Style for keywords
% http://tex.stackexchange.com/a/274708/75225
\newcommand*\AlgKeyword[1]{\textbf{#1}}
\algrenewcommand\algorithmicend{\AlgKeyword{end}}
\algrenewcommand\algorithmicdo{\AlgKeyword{do}}
\algrenewcommand\algorithmicwhile{\AlgKeyword{while}}
\algrenewcommand\algorithmicfor{\AlgKeyword{for}}
\algrenewcommand\algorithmicforall{\AlgKeyword{for all}}
\algrenewcommand\algorithmicloop{\AlgKeyword{loop}}
\algrenewcommand\algorithmicrepeat{\AlgKeyword{repeat}}
\algrenewcommand\algorithmicuntil{\AlgKeyword{until}}
\algrenewcommand\algorithmicprocedure{\AlgKeyword{procedure}}
\algrenewcommand\algorithmicfunction{\AlgKeyword{function}}
\algrenewcommand\algorithmicif{\AlgKeyword{if}}
\algrenewcommand\algorithmicthen{\AlgKeyword{then}}
\algrenewcommand\algorithmicelse{\AlgKeyword{else}}
\algrenewcommand\algorithmicrequire{\AlgKeyword{Input:}} % change "Require" to "Input"
\algrenewcommand\algorithmicensure{\AlgKeyword{Output:}} % change "Ensure" to "Output"
\algrenewcommand\algorithmicreturn{\AlgKeyword{return}}

% Style for identifiers
\newcommand*\AlgIdentifier[1]{#1}

% Listings ---------------------------------------------------------------------

\lstset{
  numbers = left,
  breaklines = false,
  mathescape,
  showspaces = false,
  showstringspaces = false,
  basicstyle = \footnotesize\ttfamily,
  numberstyle = \tiny\color{ACgray},
  commentstyle = \color{ACblue},
  keywordstyle = \color{ACred},
  stringstyle = \color{ACcyan},
  numbersep = 1em,
}
