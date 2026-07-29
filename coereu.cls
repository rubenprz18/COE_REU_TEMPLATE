\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{coereu}[2026/07/28 Coe College Summer REU report class]

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Coe College summer REU write-up template.
%
% Based on "A soft template for homework solutions" by Lucas R. Ximenes
% (Jimeens), modified with attribution as its license requests. That
% license also forbids selling the template or any modified version.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Any book-class option passes straight through, e.g.
%   \documentclass[oneside]{coereu}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{book}}
\ProcessOptions\relax

\LoadClass[letterpaper, twoside, 11pt]{book}

% LANGUAGE AND ENCODING
\RequirePackage[english]{babel} % Document language
\RequirePackage[utf8]{inputenc} % Defines the input encoding
\RequirePackage[T1]{fontenc} % Defines the font encoding

% TEXT FORMATTING AND MANIPULATION
\RequirePackage{indentfirst} % Indent the first paragraph of a section
\RequirePackage{csquotes} % Context sensitive quotation facilities
\RequirePackage{mathrsfs} % Provides additional math scripts fonts
\RequirePackage{titlesec} % Allows customization of section titles
\RequirePackage{upgreek} % Provides upright greek letters
\RequirePackage{dsfont} % Provides various math symbols such as the indicator function
\RequirePackage{pifont} % Provides various symbols such as check marks and crosses
\RequirePackage{lipsum} % Generates Lorem Ipsum text for testing purposes

% MATHEMATICS AND PHYSICS
\RequirePackage{amsmath} % for mathematical symbols
\RequirePackage{amssymb} % for mathematical symbols
\RequirePackage{mathtools} % for mathematical typesetting
\RequirePackage{physics} % for mathematical physics
\RequirePackage{stmaryrd} % for mathematical symbols
\RequirePackage{tensor} % for tensors
\RequirePackage{calc} % for mathematical calculations

% FIGURES, TIKZ AND BOXES
\RequirePackage{graphicx} % for including images
\RequirePackage{float} % provides H option for figures and tables
\RequirePackage{xcolor} % for color support
\RequirePackage{tikz} % for creating graphics and diagrams
\RequirePackage{pgfplots} % for creating plots and diagrams
\RequirePackage[most]{tcolorbox} % for creating colored boxes and frames
\RequirePackage{environ} % \NewEnviron, used by the keyresult box. tcolorbox
                         % pulls this in anyway, but relying on that is fragile.

% PAGE AND TEXT STYLES
\RequirePackage[colorlinks = true,
                urlcolor = LinkColor,
                anchorcolor = LinkColor,
                citecolor = LinkColor,
                filecolor = LinkColor,
                linkcolor = LinkColor,
                menucolor = LinkColor,
                linktocpage = true,
                bookmarks = true,
                pdfusetitle]{hyperref} % Hyperlinks
\RequirePackage[top = 2.5cm,
                bottom = 3.8cm,
                left = 2cm,
                right = 2cm,
                ]{geometry} % Page margins
\RequirePackage[shortlabels]{enumitem} % Customized lists
\RequirePackage{microtype} % Improves typography
\RequirePackage{fancyhdr} % Custom headers and footers
\RequirePackage{titletoc} % Custom table of contents
\RequirePackage{lastpage} % Reference to the last page
\RequirePackage{etoolbox} % Toolbox of programming tools
\RequirePackage{multicol} % Multiple columns
\RequirePackage{caption} % Customizing captions
\RequirePackage{lmodern} % Latin Modern fonts (math)
% COE TYPEFACES -- matches coe.edu, which loads exactly these two from
% Google Fonts. Both ship with TeX Live and Overleaf.
%   Roboto     -> body text
%   Montserrat -> headings
% To go back to a serif body, delete the [sfdefault] option below.
\RequirePackage[sfdefault]{roboto}
\RequirePackage{montserrat}
% Guard: if this montserrat build doesn't expose \montserratfamily,
% fall back to the default sans rather than failing to compile.
\providecommand{\montserratfamily}{\sffamily}
\newcommand{\coeHeadFont}{\montserratfamily}
\RequirePackage{nameref} % Cross-referencing by name

% BIBLIOGRAFY
\RequirePackage[backend    = biber, 
                style      = ext-authoryear-comp,
                sorting    = nyvt, 
                backref    = false,
                articlein  = false,
                uniquename = true,
                doi        = true, 
                dashed     = false]{biblatex} % Custom bibliography
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% BIBLIOGRAFYU SETTINGS
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Load bib.bib if it exists. Guarding this means a project that hasn't
% written a bibliography yet still compiles instead of dying on a missing
% resource. Add more with \addbibresource{other.bib} in your document.
\newif\ifcoeprintbib
\IfFileExists{bib.bib}{\addbibresource{bib.bib}\coeprintbibtrue}{\coeprintbibfalse}
\DeclareFieldFormat[article,periodical]{volume}{\mkbibbold{#1}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% The below commands was created to make a onte kind of reference citing
\newcommand{\therefs}{%
    {%\bfseries%
    \newline%
    \textcolor{coeCrimson}{References:}%
    }
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Print the references at the end of the document. Set \coeprintbibfalse in
% your document to suppress this -- otherwise a report with no citations
% still gets an empty References section.
\AtEndDocument{%
    \ifcoeprintbib
        \clearpage
        \pagestyle{coereu} % defined near the end of this class
        \markboth{\textsc{References}}{\textsc{References}} % keeps headers right in the reference chapter
        \printbibliography[heading=bibintoc, title=References]
    \fi
}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


% TIKZ SETTINGS
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\usetikzlibrary{%
    decorations.pathreplacing, % Create decorative path elements that replace parts of the original path.
    decorations.pathmorphing, % Create decorative path elements that morph the original path.
    decorations.markings, % Place decorations along a path.
    shapes.multipart, % Create nodes with multiple parts.
    shapes.geometric, % Provide additional geometric shapes.
    arrows.meta, % Define arrowheads for paths.
    tikzmark, % Place markers on a path or in a TikZ picture.
    fadings, % Create gradient and transparency effects.
    arrows, % Provide additional arrowheads.
    angles, % Measure and display angles between lines.
    quotes, % Place quotes on a path.
    calc, % Provide additional mathematical functions.
    3d, % Create three-dimensional TikZ diagrams.
}
\pgfplotsset{compat=1.18} % Sets the compatibility level for the pgfplots package to version 1.18, ensuring consistent compilation of plots and diagrams in the document.

\tikzset{>=stealth} % Arrow style for all tikZ environment.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% COLOR SETTINGS -- COE COLLEGE PALETTE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Crimson and gold are taken from Coe's own production stylesheet
% (coe.edu/application/themes/coecollege/css/custom.css), since Coe does
% not publish its brand guide publicly. These are WEB values -- no
% Pantone or CMYK build is published. Before sending anything to a
% printer, confirm with o-marketing@coe.edu.

\definecolor{coeCrimson}{HTML}{880011}   % Coe primary crimson
\definecolor{coeGold}{HTML}{D3902F}      % Coe primary gold
\definecolor{coeLightGold}{HTML}{DAA252} % Accent gold
\definecolor{coePaper}{HTML}{F9F9F9}     % Near-white, for type on dark
\definecolor{coeInk}{HTML}{2B0509}       % Crimson-black

% The class's two structural colors. myDColor is the dark ground (cover
% background, chapter blocks, rules); myLColor is the accent (section
% marker, box frames, cover geometry).
\definecolor{myDColor}{HTML}{2B0509}     % Darker Color  = crimson-black
\definecolor{myLColor}{HTML}{D3902F}     % Lighter Color = Coe gold

% Links are crimson, not gold: gold on white is far too low-contrast for
% body-size text. Same reasoning applies to equation tags and \therefs.
\definecolor{LinkColor}{HTML}{880011}    % Link Color

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% REPORT METADATA
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Override any of these in your main .tex file with \renewcommand.
% Unlike the original class, these all have defaults, so a missing
% definition no longer breaks the build.
\newcommand{\reportNumber}{1}                            % big chapter numeral
\newcommand{\reportKicker}{Coe College REU}              % rotated spine label
\newcommand{\coeProgram}{Research at Coe College}    % cover program line
\newcommand{\coeLogoFile}{Coe_Logo_Inverse.png}          % white knockout mark
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% CHAPTER AND SECTION SETTINGS
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% This command is designed to customize the styling of the \chaper{} command to create a box with the chapter number along with a mini summary containing the page where each exercise and its solution are located.
\newcommand{\chapterNumberAndMinitoc}{%
\begin{tikzpicture}
    \node[%
        minimum height  = 3.2cm,
        text width      = 2.5cm,
        outer sep       = 0pt,
        inner sep       = 0pt,
        align           = center, 
        fill            = myDColor,
        font            = \color{coePaper}\coeHeadFont\bfseries\fontsize{70}{90}\selectfont,
    ] (num) {\reportNumber};
    
    \node[%
         minimum height     = 20pt,
        outer sep           = 0pt,
        inner sep           = 0pt,
        rotate              = 90,
        anchor              = south,
        font                = \color{coeCrimson}\small\coeHeadFont
    ] (listN) at (num.west) {\textls[180]{\textsc{\reportKicker}}};
    
    \node[%
        minimum height  = 3.2cm,% Height of the box    
        minimum width   = 6.2cm,
        inner sep       = 2.5mm, % The border thickness
        outer sep       = 0pt,
        align           = left, % Text aligning
        fill            = myDColor, % Color background
        anchor          = east,
    ] at (listN.north) {%
        \footnotesize
        \color{white}
        \begin{minipage}{\fpeval{\textwidth-2.5cm-20pt-5mm}pt} % Control the width of the box
            \begin{multicols}{2}
                \printcontents[sections]{}{1}{}{}
            \end{multicols}
        \end{minipage}%
    };
\end{tikzpicture}%
}

\titleformat{\chapter}[display]
{\normalfont\bfseries\color{myDColor}}
{\filleft%
    \chapterNumberAndMinitoc}{1em}
{\titlerule[2.5pt]\vspace{3pt}\titlerule\vspace{4pt}\LARGE\textsc}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% This command removes the blank page that is automatically created when you compile the text cover and then a chapter.
\makeatletter
\patchcmd{\chapter}{%
\if@openright
    \cleardoublepage
    \else
    \clearpage
\fi
}{%
}{}{}
\makeatother
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Section marker: a filled gold disc with concentric rings running off the
% left edge of the page. Circles rather than the original hexagons, so the
% section markers read as part of the same wavefront family as the cover.
\newcommand{\polygonSection}{%
\begin{tikzpicture}[remember picture, overlay,baseline=1.5ex]
\node[%
    circle,
    minimum size            = 1.58cm,
    inner sep               = 0pt,
    fill                    = myLColor!90,
    anchor                  = south
] at (current page.north west |- 0,0) (coemarker) {};
\foreach \i in {2.5,...,4.5}{%
    \pgfmathsetmacro{\ringrad}{\i/2}%
    \draw[myDColor, ultra thick] (coemarker) circle (\ringrad cm);
}
\end{tikzpicture}}

\RequirePackage{titlesec}
\titleformat{\section}[display]
    {\vspace{2em}\normalfont\coeHeadFont\bfseries\color{myDColor}\huge}{}{}
    {\polygonSection\hspace{0.666em}}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% This command is a reformulation of the \section{} command, so that from now on, every time this command is called it will not compile the section number, only the title, but will still add this title in the table of contents
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Sections are always unnumbered, for a cleaner mini-summary, but still get
% a table-of-contents entry. The original redefinition took a mandatory
% argument, which swallowed the star and made \section*{} silently
% impossible; \@ifstar handles both forms properly.
\let\oldsection\section
\makeatletter
\newcommand{\coe@section}[1]{%
    \oldsection*{#1}%
    \phantomsection
    % \phantomsection leaves \@currentlabelname empty, which silently breaks
    % \nameref for every section -- it expands to nothing at all. Since
    % sections are unnumbered, \nameref is the ONLY way to cross-reference
    % one, so setting this explicitly is what makes section references work.
    \def\@currentlabelname{#1}%
    \addcontentsline{toc}{section}{#1}%
}
\newcommand{\coe@sectionstar}[1]{\oldsection*{#1}}
\renewcommand{\section}{\@ifstar\coe@sectionstar\coe@section}
\makeatother
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\titlecontents{section}
[0em]
{}
{}
{}
{\titlerule*[0.4pc]{.}\contentspage}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% This command change the color of the label number in \label{} commands
\makeatletter
\def\tagform@#1{\maketag@@@{\normalfont(\color{coeCrimson}\ignorespaces#1\unskip\@@italiccorr\color{black})}}
\makeatother
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% DOCUMENT COVER
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Here the commands for building the document cover were made.
% Cover art: concentric wavefronts and an emission-line band, in place of
% the original hexagon bursts. The motif is spectroscopy -- the subject of
% Coe's REU site -- and it also sidesteps the fact that hexagons appear
% nowhere in Coe's own visual system.
%
% Every offset below is absolute, in cm, measured from a page corner on
% US letter (21.59 x 27.94 cm). Changing paper size means re-tuning them.
\newcommand{\pretitle}[3]{%
% Fill in the PDF's document properties. hyperref is loaded with
% pdfusetitle, but nothing ever set \title/\author, so without this the
% compiled PDF has blank metadata.
\hypersetup{pdftitle={#1},pdfauthor={#3},pdfsubject={#2},pdfcreator={coereu class}}%
\begin{titlepage}
\pagestyle{empty}
\begin{tikzpicture}[remember picture,overlay]
    % ---- GROUND ------------------------------------------------------
    \fill[myDColor] (current page.south west) rectangle (current page.north east);

    % ---- WAVEFRONTS --------------------------------------------------
    % Clipped to the page so the outer rings don't bleed into the margins
    % of the PDF bounding box.
    \begin{scope}
        \clip (current page.south west) rectangle (current page.north east);

        % Gold wavefronts expanding from the lower left, under the year badge
        \foreach \i in {1,...,22}{%
            \pgfmathsetmacro{\ringop}{1-\i/26}%
            \pgfmathsetmacro{\ringrad}{\i*0.62}%
            \draw[coeGold, line width=0.9pt, opacity=\ringop]
                ($(current page.west)+(2.4,-5)$) circle (\ringrad cm);
        }
        % Crimson counter-wavefronts from the upper right
        \foreach \i in {1,...,20}{%
            \pgfmathsetmacro{\ringop}{1-\i/24}%
            \pgfmathsetmacro{\ringrad}{\i*0.78}%
            \draw[coeCrimson, line width=1.7pt, opacity=\ringop]
                ($(current page.north east)+(-1.2,-2.4)$) circle (\ringrad cm);
        }
        % Faint interference rings, bottom right
        \foreach \i in {1,...,16}{%
            \pgfmathsetmacro{\ringop}{0.45-\i/44}%
            \pgfmathsetmacro{\ringrad}{\i*0.9}%
            \draw[coeLightGold, line width=0.6pt, opacity=\ringop]
                ($(current page.south east)+(-0.4,0.3)$) circle (\ringrad cm);
        }

        % ---- EMISSION-LINE BAND --------------------------------------
        % A full-width spectrum strip along the bottom edge. The strip is
        % filled with the ground colour first, which masks the wavefront
        % rings behind it -- without that mask the lines and the rings
        % overlap into visual noise and the band reads as a bar chart.
        \fill[myDColor]
            (current page.south west) rectangle
            ($(current page.south east)+(0,2.9)$);
        \draw[coeGold, opacity=0.5, line width=0.6pt]
            ($(current page.south west)+(0,2.9)$) --
            ($(current page.south east)+(0,2.9)$);
        % Irregular spacing and varying width/opacity, the way a real
        % emission spectrum looks. Format is x-offset/width-pt/opacity.
        \foreach \x/\w/\o in {%
            0.7/2.2/0.90,  1.15/0.9/0.45, 1.9/3.2/1.00, 2.45/1.1/0.40,
            2.8/0.8/0.30,  3.6/2.6/0.85,  4.05/1.4/0.55, 4.9/0.7/0.28,
            5.4/3.0/0.95,  6.1/1.0/0.38,  6.55/1.8/0.65, 7.4/0.8/0.28,
            8.0/2.4/0.85,  8.6/1.2/0.45,  9.4/0.9/0.32, 10.1/2.0/0.72,
            10.8/1.1/0.40, 11.5/2.8/0.90, 12.2/0.8/0.28, 12.9/1.6/0.60,
            13.7/1.0/0.35, 14.3/2.2/0.80, 15.1/0.9/0.30, 15.8/1.4/0.52,
            16.6/2.6/0.88, 17.3/0.8/0.28, 18.0/1.2/0.42, 18.9/2.0/0.70,
            19.6/0.9/0.32, 20.4/1.5/0.55}{%
            \draw[coeGold, line width=\w pt, opacity=\o]
                ($(current page.south west)+(\x,0.55)$) --
                ($(current page.south west)+(\x,2.55)$);
        }
    \end{scope}

    % ---- COE WORDMARK (white knockout) -------------------------------
    \node[anchor = east] (coelogo)
        at ($(current page.north east)+(-1.4,-7.2)$)
        {\includegraphics[width=5.6cm]{\coeLogoFile}};

    % ---- TITLE -------------------------------------------------------
    \node[%
        text        = coePaper,
        anchor      = east,
        align       = right,
        text width  = 0.62\paperwidth,
        font        = \coeHeadFont\bfseries\fontsize{30}{34}\selectfont,
    ] (title) at ($(current page.north east)+(-1.4,-9.8)$) {#1};

    % ---- SUBTITLE ----------------------------------------------------
    \node[%
        text        = coeGold,
        anchor      = north east,
        align       = right,
        text width  = 0.62\paperwidth,
        font        = \coeHeadFont\huge,
    ] (subtitle) at ($(title.south east)+(0,-0.35)$) {#2};

    % ---- RULE --------------------------------------------------------
    \draw[coeGold, line width=1.2pt]
        ($(subtitle.south east)+(0,-0.5)$) -- ++(-6,0);

    % ---- AUTHOR ------------------------------------------------------
    \node[%
        text        = coePaper,
        anchor      = north east,
        align       = right,
        text width  = 0.62\paperwidth,
        font        = \Large,
    ] (author) at ($(subtitle.south east)+(0,-0.9)$) {\textsc{#3}};

    % ---- PROGRAM LINE ------------------------------------------------
    % Letterspaced uppercase micro-label, echoing Coe's own web styling.
    \node[%
        text        = coePaper,
        opacity     = 0.75,
        anchor      = north east,
        align       = right,
        text width  = 0.62\paperwidth,
        font        = \coeHeadFont\footnotesize,
    ] at ($(author.south east)+(0,-0.25)$)
        {\textls[120]{\MakeUppercase{\coeProgram}}};

    % ---- YEAR BADGE --------------------------------------------------
    % Sits at the origin of the gold wavefronts, so the rings read as
    % radiating out of the year itself.
    \node[%
        circle,
        minimum size = 2.5cm,
        inner sep    = 0pt,
        fill         = coeGold,
        text         = myDColor,
        font         = \coeHeadFont\bfseries\LARGE,
    ] at ($(current page.west)+(2.4,-5)$) {\the\year};

\end{tikzpicture}
\end{titlepage}
}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%






% NEW ENVIRONMENTS AND NEW COMMANDS
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% This environment was made to produce a box which maintain the width and height of the text inside it.
\newtcolorbox{results}[1][]{%
    enhanced,
    skin first=enhanced,
    skin middle=enhanced,
    skin last=enhanced,
    before upper={\parindent15pt},
    breakable,
    boxrule = 0pt,
    frame hidden,
    borderline west = {4pt}{0pt}{myDColor},
    colback = myLColor!10,
    coltitle = coePaper,
    sharp corners,
    rounded corners = southeast,
    arc is angular,
    arc = 3mm,
    attach boxed title to top left,
    boxed title style = {%
        enhanced,
        colback = myDColor,
        colframe = myDColor,
        top = 0pt,
        bottom = 0pt,
        sharp corners,
        rounded corners = northeast,
        arc is angular,
        arc = 2mm,
        rightrule = 0pt,
        bottomrule = 0pt,
        toprule = 0pt,
    },
    title = {\coeHeadFont\bfseries\large Results:},
    overlay unbroken={%
        \node[anchor=west, color=coeCrimson] at (title.east) {\;#1};
        \path[fill = tcbcolback!80!black] 
            ([yshift = 3mm]interior.south east) -- ++(-0.4,-0.1) -- ++(0.1,-0.2);
    },
    overlay first = {%
        \node[anchor=west, color=coeCrimson] at (title.east) {\;#1};
        \path[fill = tcbcolback!80!black] 
            ([yshift = 3mm]interior.south east) -- ++(-0.4,-0.1) -- ++(0.1,-0.2);
    },
    overlay middle={%
        \path[fill = tcbcolback!80!black] 
            ([yshift = -3mm]interior.north east) -- ++(-0.4,0.1) -- ++(0.1,0.2);
        \path[fill = tcbcolback!80!black] 
            ([yshift = 3mm]interior.south east) -- ++(-0.4,-0.1) -- ++(0.1,-0.2);
    },
    overlay last={%
        \path[fill = tcbcolback!80!black] 
            ([yshift = -3mm]interior.north east) -- ++(-0.4,0.1) -- ++(0.1,0.2);
        \path[fill = tcbcolback!80!black] 
            ([yshift = 3mm]interior.south east) -- ++(-0.4,-0.1) -- ++(0.1,-0.2);
    },
    extras middle and last = { rounded corners = northeast }
}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% The below commands was made to personalize the align and align* environments to have a orange line between to equalities.
\newcommand*\eqlineset{\pgfqkeys{/eqlines}}
\eqlineset{
  picture/.style={baseline, remember picture},
  line/.style={thick, draw=coeCrimson, line cap=round},
  node/.style={
    minimum size=+0pt, inner sep=+0pt, outer ysep=+.3333em, anchor=base,
    name=tma\thetikzmarkalign},
}
\newcounter{tikzmarkalign}
\makeatletter
\AtBeginEnvironment{align}{%
  \setcounter{tikzmarkalign}{0}%
  \newcommand*\noeq{\hphantom{={}}}%
  \newcommand*\eq{
    \ifnum\value{tikzmarkalign}=0
      \mathrel{\tikz[/eqlines/picture]\node[/eqlines/node]{$=$};}
    \else
      \mathrel{
        \begin{tikzpicture}[/eqlines/picture]
          \node[/eqlines/node] (tma\thetikzmarkalign) {$=$};
          \unless\ifmeasuring@
            \path[/eqlines/line, overlay] (tma\thetikzmarkalign)
                        -- (tma\pgfinteval{\thetikzmarkalign-1});
          \fi
        \end{tikzpicture}
      }
    \fi
    \stepcounter{tikzmarkalign}
  }%
}
\makeatother
\makeatletter
\AtBeginEnvironment{align*}{%
  \setcounter{tikzmarkalign}{0}%
  \newcommand*\noeq{\hphantom{={}}}%
  \newcommand*\eq{
    \ifnum\value{tikzmarkalign}=0
      \mathrel{\tikz[/eqlines/picture]\node[/eqlines/node]{$=$};}
    \else
      \mathrel{
        \begin{tikzpicture}[/eqlines/picture]
          \node[/eqlines/node] (tma\thetikzmarkalign) {$=$};
          \unless\ifmeasuring@
            \path[/eqlines/line, overlay] (tma\thetikzmarkalign)
                        -- (tma\pgfinteval{\thetikzmarkalign-1});
          \fi
        \end{tikzpicture}
      }
    \fi
    \stepcounter{tikzmarkalign}
  }%
}
\makeatother
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% This command make a simple line to divide texts. The width is adaptable to the text width.
\newcommand{\divider}{\setlength{\parindent}{0pt}\textcolor{myDColor!30}{\rule{\linewidth}{0.6pt}}\smallskip\setlength{\parindent}{1.5em}}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% This command was made to create a box (which can be labeled) to write equations which are answers for a random problem
\NewEnviron{keyresult}{
\begin{equation}
\tcbhighmath[
         boxrule = 1pt,
         colframe = coeGold,
         colback = myDColor,
         sharp corners,
         rounded corners = southeast,
         rounded corners = northeast,
         rounded corners = southwest,
         rounded corners = northwest,
         arc is angular,
         arc = 3mm,
         coltext = coePaper,
     ]{\BODY}\end{equation}}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% This renewcommand was created to change the arrow notation from vectors to the bold notation of them.
\renewcommand\vec{\boldsymbol}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% This command was created to make comments inside the text using the a more beautifull " ".
\newcommand{\Acomment}[1]{\textquotedblleft \textit{#1}\textquotedblright }
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% The below commands is to maintain the font to the symbol mathbb{1} different and more beauty
\DeclareMathAlphabet{\mathbbold}{U}{bbold}{m}{n}
\newcommand*{\boldone}{\mathbbold{1}}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% PAGE STYLE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% The original class defined no header or footer at all -- it loaded
% fancyhdr, called \pagestyle{fancy}, and left the document to patch
% things per-page with deprecated fancyhdr v3 commands (\rfoot, and the
% 'fancyplain' style). This is a proper v4 style instead.
\fancypagestyle{coereu}{%
    \fancyhf{}
    \renewcommand{\headrulewidth}{0.8pt}
    \renewcommand{\footrulewidth}{0pt}
    % Outer header: current chapter. Inner header: program kicker.
    \fancyhead[LE,RO]{\coeHeadFont\footnotesize\textcolor{coeCrimson}{\nouppercase{\leftmark}}}
    \fancyhead[RE,LO]{\coeHeadFont\footnotesize\textcolor{myDColor!60}{\reportKicker}}
    % Outer footer: page x of y. lastpage is already loaded for this.
    \fancyfoot[LE,RO]{\coeHeadFont\footnotesize\textcolor{myDColor}{\thepage\,/\,\pageref{LastPage}}}
    \fancyfoot[RE,LO]{\coeHeadFont\scriptsize\textcolor{myDColor!55}{\coeProgram}}
}
% Gold head rule rather than the default black.
\renewcommand{\headrule}{{\color{coeGold}\hrule height \headrulewidth}}
\pagestyle{coereu}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% DEFINE YOUR NEW COMMANDS FROM HERE:
