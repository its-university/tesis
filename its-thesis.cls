%% its-thesis.cls
%% LaTeX Class for ITS Thesis
%% Based on Panduan Penyusunan Tesis Program Magister ITS 2021
%%
%% Font: Times Roman 12pt
%% Line spacing: 1.5
%% Margins (odd pages): top 3.5cm, bottom 3cm, left 4cm, right 3cm
%% Margins (even pages): top 3.5cm, bottom 3cm, left 3cm, right 4cm

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{its-thesis}[2025/01/01 ITS Thesis Class]

%% Base class
\LoadClass[12pt,a4paper,twoside,openright]{report}

%% ============================================================================
%% REQUIRED PACKAGES
%% ============================================================================

\RequirePackage[T1]{fontenc}
\RequirePackage[utf8]{inputenc}
\RequirePackage{mathptmx}           % Times Roman font
\RequirePackage[scaled=0.92]{helvet} % Helvetica (for cover/title page)
\RequirePackage{graphicx}
\RequirePackage{setspace}           % Line spacing
\RequirePackage{geometry}
\RequirePackage{fancyhdr}           % Headers and footers
\RequirePackage{titlesec}           % Chapter/section formatting
\RequirePackage{tocloft}            % TOC formatting
\RequirePackage{caption}            % Figure/table captions
\RequirePackage{subcaption}
\RequirePackage{float}
\RequirePackage{array}
\RequirePackage{tabularx}
\RequirePackage{booktabs}
\RequirePackage{multirow}
\RequirePackage{amsmath,amssymb}
\RequirePackage{algorithm}
\RequirePackage{algpseudocode}
\RequirePackage{listings}           % Code listings
\RequirePackage[dvipsnames,svgnames,x11names]{xcolor}
\RequirePackage{tikz}
\RequirePackage{hyperref}

% ITS Official Blue Color
\definecolor{ITSBlue}{HTML}{0067AC}
\RequirePackage{pdfpages}           % Include PDF pages
\RequirePackage{indentfirst}        % Indent first paragraph
\RequirePackage{enumitem}           % List spacing control
% \RequirePackage[normalem]{ulem}   % Strikethrough text - uncomment if available
\providecommand{\sout}[1]{#1}       % Fallback if ulem not available
\RequirePackage[provide=*,english]{babel}  % Use provide mode for missing languages
\RequirePackage{csquotes}
\RequirePackage{natbib}             % Use natbib for bibliography
\bibliographystyle{apalike}         % APA-like style (similar to Harvard)

% Provide addbibresource command for compatibility
\newcommand{\addbibresource}[1]{}
\newcommand{\printbibliography}[1][]{\bibliography{references}}

%% ============================================================================
%% PAGE GEOMETRY - Different margins for odd/even pages
%% ============================================================================

\geometry{
    a4paper,
    top=3.5cm,
    bottom=3cm,
    inner=4cm,      % Left margin for odd pages (binding side)
    outer=3cm,      % Right margin for odd pages
    headheight=15pt,
    headsep=1cm,
    footskip=1.5cm
}

%% ============================================================================
%% LINE SPACING - 1.5 spasi
%% ============================================================================

\onehalfspacing

%% ============================================================================
%% PARAGRAPH SETTINGS
%% ============================================================================

\setlength{\parindent}{1cm}     % First line indent aligned with section title
\setlength{\parskip}{0pt}       % No space between paragraphs

%% ============================================================================
%% CHAPTER AND SECTION FORMATTING
%% ============================================================================

% Chapter format: BAB 1, BAB 2, etc. with 14pt font
\titleformat{\chapter}[display]
    {\normalfont\fontsize{14}{16}\bfseries\centering}
    {\MakeUppercase{\chaptertitlename}\ \thechapter}
    {0pt}
    {\fontsize{14}{16}\bfseries\MakeUppercase}

\titlespacing*{\chapter}{0pt}{-30pt}{0.5\baselineskip}

% Section format: title case, 12pt bold
\titleformat{\section}
    {\normalfont\fontsize{12}{14}\bfseries}
    {\thesection}
    {1em}
    {}

\titlespacing*{\section}{0pt}{1\baselineskip}{0.5\baselineskip}

% Subsection format
\titleformat{\subsection}
    {\normalfont\fontsize{12}{14}\bfseries}
    {\thesubsection}
    {1em}
    {}

\titlespacing*{\subsection}{0pt}{0.75\baselineskip}{0.25\baselineskip}

% Subsubsection format
\titleformat{\subsubsection}
    {\normalfont\fontsize{12}{14}\bfseries}
    {\thesubsubsection}
    {1em}
    {}

\titlespacing*{\subsubsection}{0pt}{0.5\baselineskip}{0.25\baselineskip}

%% ============================================================================
%% TABLE OF CONTENTS FORMATTING
%% ============================================================================

% Set Indonesian names (override babel)
\addto\captionsindonesian{%
    \renewcommand{\contentsname}{DAFTAR ISI}%
    \renewcommand{\listfigurename}{DAFTAR GAMBAR}%
    \renewcommand{\listtablename}{DAFTAR TABEL}%
    \renewcommand{\bibname}{DAFTAR PUSTAKA}%
    \renewcommand{\chaptername}{BAB}%
    \renewcommand{\figurename}{Gambar}%
    \renewcommand{\tablename}{Tabel}%
}
\addto\captionsenglish{%
    \renewcommand{\contentsname}{DAFTAR ISI}%
    \renewcommand{\listfigurename}{DAFTAR GAMBAR}%
    \renewcommand{\listtablename}{DAFTAR TABEL}%
    \renewcommand{\bibname}{DAFTAR PUSTAKA}%
    \renewcommand{\chaptername}{BAB}%
    \renewcommand{\figurename}{Gambar}%
    \renewcommand{\tablename}{Tabel}%
}

% Fallback definitions
\renewcommand{\contentsname}{DAFTAR ISI}
\renewcommand{\listfigurename}{DAFTAR GAMBAR}
\renewcommand{\listtablename}{DAFTAR TABEL}
\renewcommand{\bibname}{DAFTAR PUSTAKA}
\renewcommand{\chaptername}{BAB}
\renewcommand{\figurename}{Gambar}
\renewcommand{\tablename}{Tabel}
\renewcommand{\ALG@name}{Algoritma}

% Force names at document begin
\AtBeginDocument{%
    \renewcommand{\contentsname}{DAFTAR ISI}%
    \renewcommand{\listfigurename}{DAFTAR GAMBAR}%
    \renewcommand{\listtablename}{DAFTAR TABEL}%
    \renewcommand{\bibname}{DAFTAR PUSTAKA}%
    \renewcommand{\chaptername}{BAB}%
    \renewcommand{\figurename}{Gambar}%
    \renewcommand{\tablename}{Tabel}%
    \pagestyle{plain}%
}

% TOC formatting - no bold, with dot leaders
\renewcommand{\cftchapfont}{\normalfont}
\renewcommand{\cftchappagefont}{\normalfont}
\renewcommand{\cftsecfont}{\normalfont}
\renewcommand{\cftsecpagefont}{\normalfont}
\renewcommand{\cftsubsecfont}{\normalfont}
\renewcommand{\cftsubsecpagefont}{\normalfont}
\setlength{\cftbeforechapskip}{6pt}

% Add dot leaders for chapters
\renewcommand{\cftchapleader}{\cftdotfill{\cftdotsep}}

% Center TOC/LOF/LOT titles
\renewcommand{\cfttoctitlefont}{\hfill\fontsize{14}{16}\selectfont\bfseries}
\renewcommand{\cftaftertoctitle}{\hfill}
\renewcommand{\cftloftitlefont}{\hfill\fontsize{14}{16}\selectfont\bfseries}
\renewcommand{\cftafterloftitle}{\hfill}
\renewcommand{\cftlottitlefont}{\hfill\fontsize{14}{16}\selectfont\bfseries}
\renewcommand{\cftafterlottitle}{\hfill}

% Reduce space before and after TOC/LOF/LOT titles
\setlength{\cftbeforetoctitleskip}{-20pt}
\setlength{\cftaftertoctitleskip}{0.5\baselineskip}
\setlength{\cftbeforeloftitleskip}{-20pt}
\setlength{\cftafterloftitleskip}{0.5\baselineskip}
\setlength{\cftbeforelottitleskip}{-20pt}
\setlength{\cftafterlottitleskip}{0.5\baselineskip}

%% ============================================================================
%% PAGE NUMBERING AND HEADERS
%% ============================================================================

% Define page styles IMMEDIATELY after loading fancyhdr
\fancyhf{}  % Clear all headers and footers

% Redefine 'plain' style (used by chapters and frontmatter)
\fancypagestyle{plain}{%
    \fancyhf{}%
    \fancyfoot[C]{\thepage}%
    \renewcommand{\headrulewidth}{0pt}%
    \renewcommand{\footrulewidth}{0pt}%
}

% Redefine 'fancy' style (same as plain for this template)
\fancypagestyle{fancy}{%
    \fancyhf{}%
    \fancyfoot[C]{\thepage}%
    \renewcommand{\headrulewidth}{0pt}%
    \renewcommand{\footrulewidth}{0pt}%
}

% Set default page style
\pagestyle{plain}

% Also set at begin document as backup
\AtBeginDocument{%
    \pagestyle{plain}%
}

%% ============================================================================
%% CAPTION FORMATTING
%% ============================================================================

\captionsetup{
    format=plain,
    labelfont=bf,
    textfont=normal,
    justification=justified,
    singlelinecheck=false,
    labelsep=space
}

\captionsetup[figure]{
    position=bottom,
    skip=6pt
}

\captionsetup[table]{
    position=top,
    skip=6pt
}

%% ============================================================================
%% THESIS INFORMATION COMMANDS
%% ============================================================================

% Title
\newcommand{\@titleID}{}
\newcommand{\titleID}[1]{\renewcommand{\@titleID}{#1}}
\newcommand{\@titleEN}{}
\newcommand{\titleEN}[1]{\renewcommand{\@titleEN}{#1}}

% Author
\newcommand{\@authorname}{}
\newcommand{\authorname}[1]{\renewcommand{\@authorname}{#1}}
\newcommand{\@studentid}{}
\newcommand{\studentid}[1]{\renewcommand{\@studentid}{#1}}

% Supervisors
\newcommand{\@supervisorOne}{}
\newcommand{\supervisorOne}[1]{\renewcommand{\@supervisorOne}{#1}}
\newcommand{\@supervisorOneNIP}{}
\newcommand{\supervisorOneNIP}[1]{\renewcommand{\@supervisorOneNIP}{#1}}
\newcommand{\@supervisorTwo}{}
\newcommand{\supervisorTwo}[1]{\renewcommand{\@supervisorTwo}{#1}}
\newcommand{\@supervisorTwoNIP}{}
\newcommand{\supervisorTwoNIP}[1]{\renewcommand{\@supervisorTwoNIP}{#1}}

% Examiners
\newcommand{\@examinerOne}{}
\newcommand{\examinerOne}[1]{\renewcommand{\@examinerOne}{#1}}
\newcommand{\@examinerOneNIP}{}
\newcommand{\examinerOneNIP}[1]{\renewcommand{\@examinerOneNIP}{#1}}
\newcommand{\@examinerTwo}{}
\newcommand{\examinerTwo}[1]{\renewcommand{\@examinerTwo}{#1}}
\newcommand{\@examinerTwoNIP}{}
\newcommand{\examinerTwoNIP}[1]{\renewcommand{\@examinerTwoNIP}{#1}}
\newcommand{\@examinerThree}{}
\newcommand{\examinerThree}[1]{\renewcommand{\@examinerThree}{#1}}
\newcommand{\@examinerThreeNIP}{}
\newcommand{\examinerThreeNIP}[1]{\renewcommand{\@examinerThreeNIP}{#1}}

% Exam and graduation info
\newcommand{\@examDate}{}
\newcommand{\examDate}[1]{\renewcommand{\@examDate}{#1}}
\newcommand{\@graduationPeriod}{}
\newcommand{\graduationPeriod}[1]{\renewcommand{\@graduationPeriod}{#1}}

% Program info
\newcommand{\@studyProgram}{}
\newcommand{\studyProgram}[1]{\renewcommand{\@studyProgram}{#1}}
\newcommand{\@expertise}{}
\newcommand{\expertise}[1]{\renewcommand{\@expertise}{#1}}
\newcommand{\@department}{}
\newcommand{\department}[1]{\renewcommand{\@department}{#1}}
\newcommand{\@faculty}{}
\newcommand{\faculty}[1]{\renewcommand{\@faculty}{#1}}

% Year
\newcommand{\@thesisYear}{}
\newcommand{\thesisYear}[1]{\renewcommand{\@thesisYear}{#1}}

% Department head
\newcommand{\@deptHead}{}
\newcommand{\deptHead}[1]{\renewcommand{\@deptHead}{#1}}
\newcommand{\@deptHeadNIP}{}
\newcommand{\deptHeadNIP}[1]{\renewcommand{\@deptHeadNIP}{#1}}

% Keywords
\newcommand{\@keywordsID}{}
\newcommand{\keywordsID}[1]{\renewcommand{\@keywordsID}{#1}}
\newcommand{\@keywordsEN}{}
\newcommand{\keywordsEN}[1]{\renewcommand{\@keywordsEN}{#1}}

% Thesis code
\newcommand{\@thesisCode}{EF235401}
\newcommand{\thesisCode}[1]{\renewcommand{\@thesisCode}{#1}}

% Degree
\newcommand{\@degree}{Magister Teknik (M.T.)}
\newcommand{\degree}[1]{\renewcommand{\@degree}{#1}}

%% ============================================================================
%% FRONT MATTER SETUP
%% ============================================================================

\newcommand{\frontmattersetup}{%
    \cleardoublepage
    \pagenumbering{roman}%
    \setcounter{page}{1}%
    \pagestyle{fancy}%
}

%% ============================================================================
%% MAIN MATTER SETUP
%% ============================================================================

\newcommand{\mainmattersetup}{%
    \cleardoublepage
    \pagenumbering{arabic}%
    \setcounter{page}{1}%
    \pagestyle{fancy}%
}

%% ============================================================================
%% BACK MATTER SETUP
%% ============================================================================

\newcommand{\backmattersetup}{%
    \pagestyle{fancy}%
}

%% ============================================================================
%% BLANK PAGE COMMAND
%% ============================================================================

\newcommand{\blankpage}{
    \newpage
    \thispagestyle{fancy}
    \mbox{}
    \newpage
}

%% ============================================================================
%% ABSTRACT ENVIRONMENT (INDONESIAN)
%% ============================================================================

\newenvironment{abstractID}[1]{
    \newpage
    \thispagestyle{fancy}
    \begin{center}
        \begin{singlespace}
        {\fontsize{14}{16}\selectfont\bfseries\MakeUppercase{#1}}
        
        \vspace{0.5cm}
        
        {\fontsize{12}{14}\selectfont
        Nama Mahasiswa : \@authorname\\
        NRP : \@studentid\\
        Pembimbing : \@supervisorOne}
        
        \vspace{1cm}
        
        {\fontsize{14}{16}\selectfont\bfseries ABSTRAK}
        \end{singlespace}
    \end{center}
    
    \vspace{0.5cm}
    
    \begin{singlespace}
    \noindent
}{
    \vspace{1cm}
    
    \noindent
    \textbf{Kata kunci:} \@keywordsID
    \end{singlespace}
}

%% ============================================================================
%% ABSTRACT ENVIRONMENT (ENGLISH)
%% ============================================================================

\newenvironment{abstractEN}[1]{
    \newpage
    \thispagestyle{fancy}
    \begin{center}
        \begin{singlespace}
        {\fontsize{14}{16}\selectfont\bfseries\MakeUppercase{#1}}
        
        \vspace{0.5cm}
        
        {\fontsize{12}{14}\selectfont
        Student Name : \@authorname\\
        Student ID : \@studentid\\
        Supervisor : \@supervisorOne}
        
        \vspace{1cm}
        
        {\fontsize{14}{16}\selectfont\bfseries ABSTRACT}
        \end{singlespace}
    \end{center}
    
    \vspace{0.5cm}
    
    \begin{singlespace}
    \noindent
}{
    \vspace{1cm}
    
    \noindent
    \textbf{Keywords:} \@keywordsEN
    \end{singlespace}
}

%% ============================================================================
%% PREFACE ENVIRONMENT
%% ============================================================================

\newenvironment{preface}{
    \begin{center}
        {\fontsize{14}{16}\selectfont\bfseries KATA PENGANTAR}
    \end{center}
    
    \vspace{0.5\baselineskip}
    
    \begin{onehalfspace}
}{
    \end{onehalfspace}
}

%% ============================================================================
%% BIOGRAPHY ENVIRONMENT
%% ============================================================================

\newenvironment{biography}{
    \begin{center}
        {\fontsize{14}{16}\selectfont\bfseries BIOGRAFI PENULIS}
    \end{center}
    \addcontentsline{toc}{chapter}{BIOGRAFI PENULIS}
    
    \vspace{0.5\baselineskip}
    
    \begin{onehalfspace}
}{
    \end{onehalfspace}
}

%% ============================================================================
%% HYPERREF SETUP
%% ============================================================================

\hypersetup{
    colorlinks=true,
    linkcolor=black,
    citecolor=black,
    urlcolor=blue,
    pdfauthor={},
    pdftitle={},
    pdfsubject={Tesis},
    pdfkeywords={}
}

\endinput