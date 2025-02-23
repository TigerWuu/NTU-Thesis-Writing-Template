% --------------------------------------------------
% 國立臺灣大學碩博士論文模板
% National Taiwan University (NTU) Thesis Template
% --------------------------------------------------
% Version       : 1.0
% Author        : Hsins <hsinspeng@gmail.com>
% Repository    : https://github.com/Hsins/NTU-Thesis
% Document      : https://hsins.github.io/NTU-Thesis/
% Last Updated  : 2020.05.01

% --------------------------------------------------
% 01 類別宣告（Class Declaration）
% --------------------------------------------------

% 告知編譯器當前的 LaTeX 版本
% Must indicate what's the release of LaTeX we are using.
\NeedsTeXFormat{LaTeX2e}

% 定義類別名稱與敘述
% Define the name and description of class.
\ProvidesClass{ntuthesis}[2020/05/01 v2.0 NTU Thesis Template]

% --------------------------------------------------
% 02 基礎設定（Basic Settings）
% --------------------------------------------------

% [引入套件]
% Include required packages for basic settings.

\RequirePackage{kvdefinekeys, kvsetkeys, kvoptions}
\RequirePackage{iftex}
\RequirePackage{ifthen}
\RequirePackage[toc,page]{appendix}

% [定義變數]
% Define essential variables.

% 變數: 路徑
% Variables: Path
\newcommand{\ntu@path@font}{./fonts/english/}
\newcommand{\ntu@path@cjkfont}{./fonts/chinese/}

% 變數: 中文翻譯
% Variables: Translation (Chinese)
\newcommand{\ntu@verificationletter@zh}{口試委員審定書}
\newcommand{\ntu@tableofcontents@zh}{目次}
\newcommand{\ntu@listoffigures@zh}{圖次}
\newcommand{\ntu@listoftables@zh}{表次}
\newcommand{\ntu@denotation@zh}{符號列表}
\newcommand{\ntu@bibliography@zh}{參考文獻}
\newcommand{\ntu@acknowledgement@zh}{誌謝}
\newcommand{\ntu@abstract@zh}{摘要}
\newcommand{\ntu@keyword@zh}{關鍵字：}
\newcommand{\ntu@kwsymbol@zh}{、}
\newcommand{\ntu@appendix@zh}{附錄}
\newcommand{\ntu@figurename@zh}{圖}
\newcommand{\ntu@tablename@zh}{表}

\newcommand{\ntu@titlechapter@zh}{第\CJKnumber{\thechapter}章}
\newcommand{\ntu@titlechaptertoc@zh}{第\CJKnumber{\thecontentslabel}章}
\newcommand{\ntu@titleappendix@zh}{\ntu@appendix@zh~{\thechapter}}
\newcommand{\ntu@titleappendixtoc@zh}{\ntu@appendix@zh~{\thecontentslabel}}

% 變數: 英文翻譯
% Variables: Translation (English)
\newcommand{\ntu@verificationletter@en}{Verification Letter from the Oral Examination Committee}
\newcommand{\ntu@tableofcontents@en}{CONTENTS}
\newcommand{\ntu@listoffigures@en}{LIST OF FIGURES}
\newcommand{\ntu@listoftables@en}{LIST OF TABLES}
\newcommand{\ntu@denotation@en}{Denotation}
\newcommand{\ntu@bibliography@en}{References}
\newcommand{\ntu@acknowledgement@en}{Acknowledgements}
\newcommand{\ntu@abstract@en}{ABSTRACT}
\newcommand{\ntu@keyword@en}{Keywords:~}
\newcommand{\ntu@kwsymbol@en}{,~}
\newcommand{\ntu@appendix@en}{Appendix}
\newcommand{\ntu@figurename@en}{Figure}
\newcommand{\ntu@tablename@en}{Table}

\newcommand{\ntu@titlechapter@en}{Chapter~\thechapter}
\newcommand{\ntu@titlechaptertoc@en}{Chapter~\thecontentslabel}
\newcommand{\ntu@titleappendix@en}{\ntu@appendix@en~\thechapter}
\newcommand{\ntu@titleappendixtoc@en}{\ntu@appendix@en~\thecontentslabel}

% 變數: 版面設定
% Variables: Layouts
\newcommand{\ntu@geometry@main}{top=3cm, bottom=2cm, left=3cm, right=3cm}
\newcommand{\ntu@geometry@cover}{top=3cm, bottom=3cm, left=3cm, right=3cm}

\newcommand{\ntu@tocvspace}{1em}
\newcommand{\ntu@tocchaptersize@zh}{4.5em}
\newcommand{\ntu@tocchaptersize@en}{5.5em}

\newcommand{\ntu@tocsecindent@zh}{1.5em}
\newcommand{\ntu@tocsecnumwidth@zh}{3.0em}
\newcommand{\ntu@tocsubsecindent@zh}{3.5em}
\newcommand{\ntu@tocsubsecnumwidth@zh}{3.0em}
\newcommand{\ntu@tocsubsubsecindent@zh}{5em}
\newcommand{\ntu@tocsubsubsecnumwidth@zh}{4.5em}

\newcommand{\ntu@tocsecindent@en}{2.5em}
\newcommand{\ntu@tocsecnumwidth@en}{3.0em}
\newcommand{\ntu@tocsubsecindent@en}{3.5em}
\newcommand{\ntu@tocsubsecnumwidth@en}{3.0em}
\newcommand{\ntu@tocsubsubsecindent@en}{5em}
\newcommand{\ntu@tocsubsubsecnumwidth@en}{4.5em}


% 變數: 輸出設定
% Variables: Layouts
\newcommand{\ntu@watermarkfromntulibrary}{true}   % 是否使用臺大圖書館水印

% [定義命令]
% Define essential commands.

% 命令: 錯誤訊息
% Command: Error and Warning Messages
%
\newcommand{\ntu@error}[1]{
  \ClassError{ntuthesis}{#1}{}
}

\newcommand{\ntu@warning}[1]{
  \ClassWarning{ntuthesis}{#1}
}

% 命令: 鍵值設定
% Command: Key Value Options
%
\SetupKeyvalOptions{
  family=ntu,
  prefix=ntu@,
  setkeys=\kvsetkeys
}

\newcommand{\ntusetup}{
  \kvsetkeys{ntu}
}

\newcommand{\ntu@define@key}[1]{
  \kvsetkeys{ntu@key}{#1}
}

\kv@set@family@handler{ntu@key}{%
  \@namedef{ntu@#1@@name}{#1}%
  \def\ntu@@default{}%
  \def\ntu@@choices{}%
  \kv@define@key{ntu@value}{name}{%
    \@namedef{ntu@#1@@name}{##1}%
  }%
  \kv@define@key{ntu@value}{code}{%
    \@namedef{ntu@#1@@code}{##1}%
  }%
  \@namedef{ntu@#1@@check}{}%
  \@namedef{ntu@#1@@code}{}%
  \@namedef{ntu@#1@@hook}{%
    \expandafter\ifx\csname\@currname.\@currext-h@@k\endcsname\relax
      \@nameuse{ntu@#1@@code}%
    \else
      \AtEndOfClass{%
        \@nameuse{ntu@#1@@code}%
      }%
    \fi
  }%
  \kv@define@key{ntu@value}{choices}{%
    \def\ntu@@choices{##1}%
    \@namedef{ntu@#1@@reset}{}%
    \@namedef{ntu@#1@@check}{%
      \@ifundefined{%
        ifntu@\@nameuse{ntu@#1@@name}@\@nameuse{ntu@\@nameuse{ntu@#1@@name}}%
      }{%
        \ntu@error{Invalid value "#1 = \@nameuse{ntu@\@nameuse{ntu@#1@@name}}"}%
      }%
      \@nameuse{ntu@#1@@reset}%
      \@nameuse{ntu@\@nameuse{ntu@#1@@name}@\@nameuse{ntu@\@nameuse{ntu@#1@@name}}true}%
    }%
  }%
  \kv@define@key{ntu@value}{default}{%
    \def\ntu@@default{##1}%
  }%
  \kvsetkeys{ntu@value}{#2}%
  \@namedef{ntu@\@nameuse{ntu@#1@@name}}{}%
  \kv@set@family@handler{ntu@choice}{%
    \ifx\ntu@@default\@empty
      \def\ntu@@default{##1}%
    \fi
    \expandafter\newif\csname ifntu@\@nameuse{ntu@#1@@name}@##1\endcsname
    \expandafter\g@addto@macro\csname ntu@#1@@reset\endcsname{%
      \@nameuse{ntu@\@nameuse{ntu@#1@@name}@##1false}%
    }%
  }%
  \kvsetkeys@expandafter{ntu@choice}{\ntu@@choices}%
  \expandafter\let\csname ntu@\@nameuse{ntu@#1@@name}\endcsname\ntu@@default
  \expandafter\ifx\csname ntu@\@nameuse{ntu@#1@@name}\endcsname\@empty\else
    \@nameuse{ntu@#1@@check}%
    \@nameuse{ntu@#1@@hook}%
  \fi
  \kv@define@key{ntu}{#1}{%
    \@namedef{ntu@\@nameuse{ntu@#1@@name}}{##1}%
    \@nameuse{ntu@#1@@check}%
    \@nameuse{ntu@#1@@hook}%
  }%
}

\newcommand\ntu@option@hook[2]{
  \expandafter\g@addto@macro\csname ntu@#1@@code\endcsname{#2}
}

% 命令: 鍵值陣列使用
% Command: Retrieve the array value with key-value pair.
%
\newcommand\ntu@clist@use[2]{%
  \def\ntu@@tmp{}%
  \kv@set@family@handler{ntu@clist}{%
    \ifx\ntu@@tmp\@empty
      \def\ntu@@tmp{#2}%
    \else
      #2%
    \fi
    ##1%
  }%
  \kvsetkeys@expandafter{ntu@clist}{#1}%
}

% 命令: 日期格式
% Commands: Data Formating
%
\newcommand{\ntu@format@date}[2]{%
  \begin{doctypedepend}
    \edef\ntu@@date{#2}%
    \def\ntu@@process@date##1-##2-##3\@nil{%
      #1{##1}{##2}{##3}%
    }%
    \expandafter\ntu@@process@date\ntu@@date\@nil
  \end{doctypedepend}
}
\newcommand\ntu@date@zh@short[3]{\zhdigits{#1}年\zhnumber{#2}月}
\newcommand\ntu@date@zh@digit[3]{\the\numexpr#1-1911\relax~年~\number#2~月~\number#3~日}
\newcommand\ntu@date@zh@digit@short[3]{\the\numexpr#1-1911\relax~年~\number#2~月}
\newcommand\ntu@date@en@short[3]{\monthname[#2] #1}
\newcommand\ntu@date@en[3]{#3/#2/#1}

\newcommand{\ntu@setgeometry}[1]{\expandafter\newgeometry\expandafter{#1}}

% --------------------------------------------------
% 03 編譯檢查（Compile Checking）
% --------------------------------------------------

\ifXeTeX\else
  \ntu@error{XeLaTeX is required to compile this document.}
\fi

% --------------------------------------------------
% 04 論文設定（Document Configs）
% --------------------------------------------------

% [文檔選項]
% Configs from options
%
\ntu@define@key{
  degree = {
    choices = {
      master,
      doctor,
    },
    default = master,
    name    = degreeset
  },
  language = {
    choices = {
      chinese,
      english,
    },
    default = chinese,
  },
  fontset = {
    choices = {
      default,
      system,
      overleaf,
      template,
    },
    default = default,
  },
  watermark = {
    choices = {
      true,
      false,
    },
    default = true,
  },
  doi = {
    choices = {
      true,
      false,
    },
    default = true,
  },
  doctype = {
    choices = {
      final,  
      draft,
    },
    default = draft
  }, print = {
    choices = {
      true,
      false,
    },
    default = false,
  }
}

% [設定檔案]
% Configs from ntusetup.tex
%
\ntu@define@key{
  university = {
    default = {國立臺灣大學},
  },
  university* = {
    default = {National Taiwan University},
    name    = university@en,
  },
  college = {
    default = {工學院},
  },
  college* = {
    default = {College of Engineering},
    name    = college@en,
  },
  institute = {
    default = {工業工程學研究所},
  },
  institute* = {
    default = {Institute of Industrial Engineering},
    name    = institute@en,
  },
  title = {
    default = {論文標題},
  },
  title* = {
    default = {Title},
    name    = title@en,
  },
  author = {
    default = {論文作者},
  },
  author* = {
    default = {Name of author},
    name    = author@en,
  },
  ID = {
    default = {學號},
  },
  advisor = {
    default = {指導教授},
  },
  advisor* = {
    default = {Name of supervisor},
    name    = advisor@en,
  },
  DOI = {
    default = {DOI Number},
  },
  keywords = {
    default = {關鍵字},
  },
  keywords* = {
    default = {Keywords},
    name    = keywords@en,
  },
  date = {
    default = {\the\year-\two@digits{\month}-\two@digits{\day}},
  },
  oral-date = {
    name    = oraldate,
    default = {\the\year-\two@digits{\month}-\two@digits{\day}},
  },
}

% --------------------------------------------------
% 06 選項設定（Options Settings）
% --------------------------------------------------

% 繼承類別選項（將未定義的傳給基礎文檔）
% Option Declaration (pass tundefined options to father class)
\DeclareDefaultOption{
  \PassOptionsToClass{\CurrentOption}{report}
}

% 處理選項並載入基礎文檔
% Terminates the options processing and loads the basic class.
\ProcessKeyvalOptions*\relax
\LoadClass[a4paper, 12pt]{report}


% 根據設定值賦值變數
% Assign variables according to configs.
\ifthenelse{\equal{\ntu@degreeset}{master}}{
  \newcommand{\ntu@degree}{碩士}
  \newcommand{\ntu@degree@en}{Master's}
  \ifthenelse{\equal{\ntu@doctype}{draft}}{
    \newcommand{\ntu@type}{論文{\color{\ncs@todocolor}(初稿)}}
    \newcommand{\ntu@type@en}{Thesis (Draft)}
  }{
    \newcommand{\ntu@type}{論文}
    \newcommand{\ntu@type@en}{Thesis}
  }
}

\ifthenelse{\equal{\ntu@degreeset}{doctor}}{
  \newcommand{\ntu@degree}{博士}
  \newcommand{\ntu@degree@en}{Doctoral}
  \ifthenelse{\equal{\ntu@doctype}{draft}}{
    \newcommand{\ntu@type}{論文{\color{\ncs@todocolor}(初稿)}}
    \newcommand{\ntu@type@en}{Dissertation (Draft)}
  }{
    \newcommand{\ntu@type}{論文}
    \newcommand{\ntu@type@en}{Dissertation}
  }
}

\ifthenelse{\equal{\ntu@language}{chinese}}{
  % 設定中文
  \newcommand{\ntu@titlechapter}{\ntu@titlechapter@zh}
  \newcommand{\ntu@titlechaptertoc}{\ntu@titlechaptertoc@zh}
  \newcommand{\ntu@titleappendix}{\ntu@titleappendix@zh}
  \newcommand{\ntu@titleappendixtoc}{\ntu@titleappendixtoc@zh}
  \newcommand{\ntu@tocchaptersize}{\ntu@tocchaptersize@zh}
  \newcommand{\ntu@tocsectionindent}{\ntu@tocsectionindent@zh}
  \newcommand{\ntu@tocsubsectionindent}{\ntu@tocsubsectionindent@zh}
  \newcommand{\ntu@acknowledgement}{\ntu@acknowledgement@zh}
  \newcommand{\ntu@tableofcontents}{\ntu@tableofcontents@zh}
  \newcommand{\ntu@listoffigures}{\ntu@listoffigures@zh}
  \newcommand{\ntu@listoftables}{\ntu@listoftables@zh}
  \newcommand{\ntu@denotation}{\ntu@denotation@zh}
  \newcommand{\ntu@verificationletter}{\ntu@verificationletter@zh}
  \newcommand{\ntu@bibliography}{\ntu@bibliography@zh}
  \newcommand{\ntu@appendix}{\ntu@appendix@zh}
  \newcommand{\ntu@figurename}{\ntu@figurename@zh}
  \newcommand{\ntu@tablename}{\ntu@tablename@zh}

  % 設定單位
  \newcommand{\ntu@tocsecindent}{\ntu@tocsecindent@zh}
  \newcommand{\ntu@tocsecnumwidth}{\ntu@tocsecnumwidth@zh}
  \newcommand{\ntu@tocsubsecindent}{\ntu@tocsubsecindent@zh}
  \newcommand{\ntu@tocsubsecnumwidth}{\ntu@tocsubsecnumwidth@zh}
  \newcommand{\ntu@tocsubsubsecindent}{\ntu@tocsubsubsecindent@zh}
  \newcommand{\ntu@tocsubsubsecnumwidth}{\ntu@tocsubsubsecnumwidth@zh}
}

\ifthenelse{\equal{\ntu@language}{english}}{
  % 設定英文
  \newcommand{\ntu@titlechapter}{\ntu@titlechapter@en}
  \newcommand{\ntu@titlechaptertoc}{\ntu@titlechaptertoc@en}
  \newcommand{\ntu@titleappendix}{\ntu@titleappendix@en}
  \newcommand{\ntu@titleappendixtoc}{\ntu@titleappendixtoc@en}
  \newcommand{\ntu@tocchaptersize}{\ntu@tocchaptersize@en}
  \newcommand{\ntu@tocsectionindent}{\ntu@tocsectionindent@en}
  \newcommand{\ntu@tocsubsectionindent}{\ntu@tocsubsectionindent@en}
  \newcommand{\ntu@acknowledgement}{\ntu@acknowledgement@en}
  \newcommand{\ntu@tableofcontents}{\ntu@tableofcontents@en}
  \newcommand{\ntu@listoffigures}{\ntu@listoffigures@en}
  \newcommand{\ntu@listoftables}{\ntu@listoftables@en}
  \newcommand{\ntu@denotation}{\ntu@denotation@en}
  \newcommand{\ntu@verificationletter}{\ntu@verificationletter@en}
  \newcommand{\ntu@bibliography}{\ntu@bibliography@en}
  \newcommand{\ntu@appendix}{\ntu@appendix@en}
  \newcommand{\ntu@figurename}{\ntu@figurename@en}
  \newcommand{\ntu@tablename}{\ntu@tablename@en}

  % 設定單位
  \newcommand{\ntu@tocsecindent}{\ntu@tocsecindent@en}
  \newcommand{\ntu@tocsecnumwidth}{\ntu@tocsecnumwidth@en}
  \newcommand{\ntu@tocsubsecindent}{\ntu@tocsubsecindent@en}
  \newcommand{\ntu@tocsubsecnumwidth}{\ntu@tocsubsecnumwidth@en}
  \newcommand{\ntu@tocsubsubsecindent}{\ntu@tocsubsubsecindent@en}
  \newcommand{\ntu@tocsubsubsecnumwidth}{\ntu@tocsubsubsecnumwidth@en}
}

% --------------------------------------------------
% 07 載入套件 (Include Packages)
% --------------------------------------------------

% [載入套件]
% - ifthen                      條件判斷支持
% - xparse                      定義命令
% - xeCJK                       排版中日韓(CJK)字符
% - indentfirst                 首行縮進
% - fontspec                    設定中英文字體
% - xcolor                      設定顏色
% - geometry                    設定版面大小
% - titlesec                    設定章節格式
% - titletoc, tocloft           設定目錄格式
% - fancyhdr                    設定頁首頁尾
% - ulem, CJKulem               下劃線、雙下劃線與波浪紋效果
% - setspace                    設定行距（標題內文分別設定）
% - graphicx                    插入圖片
% - tikz                        繪圖
% - eso-pic                     插入圖片於文字下方
% - pdfpages                    插入 pdf 檔案
% - tabularx                    插入表格
% - booktabs                    改善表格設置
% - array                       調整表格高度
% - longtable                   支援跨頁長表格
% - diagbox                     插入表格反斜線
% - multirow                    合併儲存格
% - amsmath, amsthm, amssymb    引入 AMS 數學環境
% - datetime                    日期格式轉換
% - CJKnumb                     中文數字轉換
% - fp, calc                    計算功能
% - hyperref                    超連結
% - paralist                    列表環境
% - footmisc                    自訂腳註符號
% - caption, subcaption         插入圖片、表格標題
% - natbib                      參考文獻
%
\RequirePackage{xparse}
\RequirePackage{xeCJK}
\RequirePackage{indentfirst}
\RequirePackage{fontspec}
\RequirePackage{xcolor}
\RequirePackage{titlesec}
\RequirePackage{titletoc, tocloft}
\RequirePackage{fancyhdr}
\RequirePackage{setspace}
\RequirePackage{graphicx}
\RequirePackage{tikz}
\RequirePackage{eso-pic}
\RequirePackage{pdfpages}
\RequirePackage{tabularx}
\RequirePackage{booktabs}
\RequirePackage{multirow}
\RequirePackage{diagbox}
\RequirePackage{array}
\RequirePackage{longtable}
\RequirePackage{datetime}
\RequirePackage{CJKnumb}
\RequirePackage{fp, calc}
\RequirePackage{hyperref}
\RequirePackage{paralist}
\RequirePackage{footmisc}
\RequirePackage{caption}
\RequirePackage[labelformat=simple]{subcaption}

% --------------------------------------------------
% 10 套件設定 (Package Settings)
% --------------------------------------------------

% [圖表目錄]
\graphicspath{{./figures/}}

% [文章排版]
%
\XeTeXlinebreaklocale "zh"
\XeTeXlinebreakskip = 0pt plus 1pt
\setlength{\parskip}{10pt}
\setlength{\parindent}{2em}

% [字體設定]
% - \setmainfont{}          	襯線字體
% - \setsansfont{}          	非襯字體
% - \setmonofont{}          	等寬字體
% - \setCJKmainfont{}			中文襯線字體
% - \setCJKsansfont{}			中文非襯字體
% - \setCJKmonofont{}			中文等寬字體
%

\ifthenelse{\equal{\ntu@fontset}{default}}{
  \setmainfont{Times New Roman}[
    Path = \ntu@path@font ,
    Extension = .ttf ,
    BoldFont = *-Bold ,
    ItalicFont = *-Italic ,
    BoldItalicFont = *-BoldItalic, ]
  \setCJKmainfont{BiauKai}[
    Path = \ntu@path@cjkfont ,
    Extension = .ttf , ]
}

\ifthenelse{\equal{\ntu@fontset}{template}}{
  \setmainfont{Times New Roman}[
    Path = \ntu@path@font ,
    Extension = .ttf ,
    BoldFont = *-Bold ,
    ItalicFont = *-Italic ,
    BoldItalicFont = *-BoldItalic, ]
  \setCJKmainfont{BiauKai}[
    Path = \ntu@path@cjkfont ,
    Extension = .ttf ,
    BoldFont = Kaiti-Black, ]
}

\ifthenelse{\equal{\ntu@fontset}{overleaf}}{
  \setmainfont{Times New Roman}
  \setsansfont{Droid Sans}
  \setmonofont{Courier New}
  \setCJKmainfont{AR PL KaitiM Big5}
  \setCJKsansfont{AR PL KaitiM Big5}
  \setCJKmonofont{AR PL KaitiM Big5}
}

% [顏色設定]
%
% 根據 doc type 決定未確定資料的顏色
\newenvironment{doctypedepend}{%
  \ifthenelse{\equal{\ntu@doctype}{draft}}{\color{\ncs@tempcolor}}{}%
}{}

% [版面大小]
%
\RequirePackage{geometry}
\geometry{
  top=3cm,
  bottom=2cm,
  left=3cm,               % inner=3cm
  right=3cm               % outer=3cm
}

% [連結設定]
%
\ifthenelse{\equal{\ntu@print}{true}}{
  \hypersetup{colorlinks=false}}
  {\ifdefined\useNCSStyle
    \hypersetup{
      colorlinks=true,
      linkcolor=blue,
      filecolor=gray,
      anchorcolor=blue,
      citecolor=red
    }
    \else
    \hypersetup{
      colorlinks=true,
      linkcolor=black,
      filecolor=gray,
      anchorcolor=blue,
      citecolor=black
    }
    \fi
  }

% [目錄格式]
%
\addtocontents{toc}                                         % 修改目錄樣式
% {~\hfill\textbf{Page}\par}
{}
{}
{}

% \titlecontents{標題名稱}[左間距]{標題格式}{標題內容}{無序號標題}{指引線與頁碼}[下間距]
\titlecontents{chapter}[0em]                                % 修改目錄樣式
{\addvspace{0.5em}\normalsize\bfseries\protect}
{\fboxrule=0pt\fboxsep=0pt\framebox[\ntu@tocchaptersize][l]{\ntu@titlechaptertoc}}
{}
{\hfill\contentspage}

\setlength{\cftbeforesecskip}{-3pt}                          % 修改目錄間距
\setlength{\cftbeforesubsecskip}{-3pt}
\setlength{\cftbeforesubsubsecskip}{-3pt}

\setcounter{tocdepth}{3}                                    % 設定目錄深度
\setcounter{secnumdepth}{3}                                 % 設定編號深度

% \cftsetindents{entry}{indent}{numwidth}
\cftsetindents{section}{\ntu@tocsecindent}{\ntu@tocsecnumwidth}
\cftsetindents{subsection}{\ntu@tocsubsecindent}{\ntu@tocsubsecnumwidth}
\cftsetindents{subsubsection}{\ntu@tocsubsubsecindent}{\ntu@tocsubsubsecnumwidth}

% [頁首頁尾]
%

% [標題格式]
% 載入套件包 titlesec 設定各層標題格式
% \titleformat{command}[shape]{format}{label}{sep}{before}[after]
% - command: 代表欲重新定義之標題階層，包含 \part, \chapter, \section, \paragraph
% - shape: 設定段落形狀，可選參數有 hang, block, display
% - format: 定義標題外觀，如：位置、字體大小粗細…
% - label: 定義標籤前綴標號
% - sep: 定義標號與標題內容間隔距離
% - before: 標題內容前增加文字
% - after: 標題內容後增加文字
%
\titleformat{\chapter}[display]                      % 設置 Chapter 格式
{\color{\ncs@titlecolor}\raggedright\Huge\bfseries}  % 定義 format
{%
  \ifnum\pdfstrcmp{\@currenvir}{appendices}=0        % 定義 label
    \ntu@titleappendix%~---~
  \else
    \ntu@titlechapter
  \fi}              		                 
{-0.5em}                                             % 定義 sep
{}                                                   % before

% Adjust the spacing of chapter and section
% \titlespacing*{hcommandi}{hlefti}{hbefore-sepi}{hafter-sepi}[hright-sepi]
\titlespacing*{\chapter}{0pt}{-50pt}{0pt}
\titlespacing*{\section}{0pt}{10pt}{0pt}
\titlespacing*{\subsection}{0pt}{30pt plus 5pt minus 0pt}{-4pt}
\titlespacing*{\subsubsection}{0pt}{30pt plus 5pt minus 0pt}{-4pt}

\titleformat{\section}
{\color{\ncs@titlecolor}\normalfont\Large\bfseries}
{\color{\ncs@titlecolor}\thesection}{1em}{}

% [圖表標題]
%
\setlength{\intextsep}{12bp \@plus4pt \@minus2pt}
\captionsetup{justification=raggedright,singlelinecheck=false}  % To make the caption align left
\captionsetup[table]{position=top,belowskip={12bp-\intextsep},aboveskip=6bp}
\captionsetup[figure]{position=bottom,belowskip={12bp-\intextsep},aboveskip=6bp}
\captionsetup[subfigure]{justification=centering}
\captionsetup[sub]{skip=6bp}

% [引用格式]
%
% \renewcommand\thesubfigure{~(\alph{subfigure})}
% Remove the extra space
\renewcommand\thesubfigure{(\alph{subfigure})}

% --------------------------------------------------
% 08 自訂命令（Custom Commands）
% --------------------------------------------------

% [添加路徑]
\newcommand\appendgraphicspath[1]{
  \g@addto@macro\Ginput@path{#1}
}

% [中文縮進]
% - \Eindent                    縮進
% - \Enoindent                  不縮進
%

% 獲取並定義 CJK 字符寬度
\newcommand{\ntu@CJKChar@size}{\hskip \f@size \p@}
\newdimen{\ntu@CJKChar@size@dimen}
\settowidth{\ntu@CJKChar@size@dimen}{\ntu@CJKChar@size\CJKglue}

% 定義命令
\newcommand{\CJKsetfontspace}{
  \settowidth\ntu@CJKChar@size@dimen{\ntu@CJKChar@size\CJKglue}
  \ifthenelse{\parindent=0pt}{\relax}{\parindent2\ntu@CJKChar@size@dimen}
}

% 縮進
\newcommand{\Eindent}{
  \CJKsetfontspace\parindent2\ntu@CJKChar@size@dimen
}

% 不縮進
\newcommand{\Enoindent}{
  \parident\z@
}

% [插入浮水印]
% - \makewatermark{#1}{#2}      生成浮水印
%   #1 Opacity                  設置透明度
%   #2 Logo Path                校徽路徑
%
\newcommand{\makewatermark}[2]{
  \AddToShipoutPicture{
    \put(0,0){
      \parbox[b][\paperheight]{\paperwidth}{
        \vfill
        \centering
        \begin{tikzpicture}[remember picture, overlay]
          \coordinate (WM) at ([xshift=-4.325cm, yshift=-4.325cm] current page.north east);
          \node [scale=1] at (WM) {\includegraphics[width=3.65cm, height=3.65cm]{#2}};
          \filldraw [fill=white, opacity=1-\the\numexpr#1] (current page.north east) rectangle (current page.south west);
        \end{tikzpicture}
      \vfill
}}}}

% [插入數位識別]
% - \InsertDOI{#1}              生成數位識別碼
%   #1 DOI Code                 數位識別碼
%
\newcommand{\insertdoi}[1]{
  \AddToShipoutPicture{
    \AtPageUpperLeft{
      \fboxrule=0pt\fboxsep=0pt\framebox[\paperwidth][r]{
      \raisebox{-\paperheight}{
      \put(\LenToUnit{-1cm},\LenToUnit{1cm}){
      \fboxrule=0pt\fboxsep=0pt\framebox[0pt][r]{
        \href{http://dx.doi.org/#1}{doi:#1}
}}}}}}}

% [生成封面]
% Generate the cover page
%
\newcommand{\makecover}{
  \ntu@setgeometry{\ntu@geometry@cover}

  \begin{titlepage}
    \begin{singlespace}
      \begin{center}
        % 中文校系名稱 (18, 27)
        \fontsize{18}{27}\selectfont
        \ntu@university\ntu@college\ntu@institute\par
        \ntu@degree\ntu@type\par

        % 英文系所名稱 (14, 21)
        \fontsize{14}{21}\selectfont
        \ntu@institute@en\par
        \ntu@college@en\par

        % 英文學校名稱 (16, 24)
        \fontsize{16}{24}\selectfont
        \ntu@university@en\par
        \ntu@degree@en~\ntu@type@en\par

        % 中英文論文題目 (18, 27)
        % 中英文作者姓名 (18, 27)
        % 中英文指導教授 (18, 27)
        % 論文撰寫日期   (18, 27)
        \vfill
        \fontsize{18}{27}\selectfont
        \ntu@title\par\ntu@title@en\par
        \vfill
        \ntu@author\par\ntu@author@en\par
        \vfill
        指導教授: \ntu@advisor~博士\par
        Advisor: \ntu@advisor@en,~Ph.D.\par
        \vfill
        中華民國~\ntu@format@date{\ntu@date@zh@digit@short}{\ntu@date}\par
        \ntu@format@date{\ntu@date@en@short}{\ntu@date}
      \end{center}
    \end{singlespace}
    
    \ifthenelse{\equal{\ntu@watermark}{true}}{%
      \begin{tikzpicture}[remember picture, overlay]
        \coordinate (WM) at ([xshift=-4.325cm, yshift=-4.325cm] current page.north east);
        \node [scale=1, opacity=0.5*\watermarkOpacity] at (WM) {\includegraphics[width=3.65cm, height=3.65cm]{\watermarkFilePath}};
      \end{tikzpicture}
    }{}
  \end{titlepage}

  % 清除頁碼
  \clearpage
  \restoregeometry
}

% [生成口委審定書]
% Generate the verification letter page
%
\newcommand{\makeverification}{
  \clearpage
  \phantomsection
  \ntu@setgeometry{\ntu@geometry@main}
  \pagenumbering{roman}
  \addcontentsline{toc}{chapter}{\ntu@verificationletter}
  \begin{singlespace}
    %  口委審定書標題 (24, 36) (26, 39)
    %  論文題目 (20, 30)
    \begin{center}
      \fontsize{24}{12}\selectfont
      {\ntu@university}{\ntu@degree}學位{\ntu@type}\par
      \fontsize{26}{13}\selectfont
      口試委員會審定書\par
      \fontsize{14}{0em}\selectfont
      \textbf{\MakeUppercase{{\ntu@degree@en} {\ntu@type@en} ACCEPTANCE CERTIFICATE}}\par
      \textbf{\MakeUppercase{NATIONAL TAIWAN UNIVERSITY}}\par
      \vspace{2em}
      \fontsize{14}{1.25em}\selectfont
      {\ntu@title}\par\par
      {\ntu@title@en}\par
    \end{center}

    % 口委審定書內容 (16, 24)
    \vfill
    \fontsize{16}{24}\selectfont
    \noindent 本論文係{\ntu@author} {(\ntu@ID)}在{\ntu@university}{\ntu@institute}完成之{\ntu@degree}學位{\ntu@type}，於民國{\ntu@format@date{\ntu@date@zh@digit}{\ntu@oraldate}}承下列考試委員審查通過及口試及格，特此證明。\par
    \fontsize{12}{18}\selectfont
    \noindent The undersigned, appointed by the {\ntu@institute@en} on \ntu@format@date{\ntu@date@en}{\ntu@date} have examined a {{\ntu@degree@en} {\ntu@type@en}} entitled above presented by {\ntu@author@en} {\ntu@ID} candidate and hereby certify that it is worthy of acceptance.
  \end{singlespace}

  \begin{doublespace}
    \begin{flushleft}
      % 口委簽名表格 (16, 24)
      \fontsize{16}{16}\selectfont
      \noindent 口試委員 
      \fontsize{12}{24}\selectfont
      \noindent Oral examination committee:\par
      \vspace{1em}
      
      \fontsize{16}{16}\selectfont
      \begin{tabularx}{\textwidth}{lll}
        \rule{4.3cm}{0.5pt}\hspace{0.5cm} & \rule{4.3cm}{0.5pt}\hspace{0.5cm} & \rule{4.3cm}{0.2pt}  \\[-16pt]
        \fontsize{11}{5}\selectfont
        (指導教授 Advisor) & & \\[9pt]
        \fontsize{16}{16}\selectfont
        \rule{4.3cm}{0.5pt}\hspace{0.5cm} & \rule{4.3cm}{0.5pt}\hspace{0.5cm} & \rule{4.3cm}{0.5pt}  \\[16pt]
        \rule{4.3cm}{0.5pt}\hspace{0.5cm} & \rule{4.3cm}{0.5pt}\hspace{0.5cm} & \rule{4.3cm}{0.5pt}  \\
      \end{tabularx}
      \par
      \vspace{1.2em}
      系主任 
      \fontsize{12}{16}\selectfont 
      Director: \rule{6.5cm}{0.5pt}
    \end{flushleft}
  \end{doublespace}
  % \pagestyle{empty}
  % \clearpage
  % 恢復預設板型
  \restoregeometry
}

% [生成目錄]
% Generate table of contents page.
%
\renewcommand{\contentsname}{\color{\ncs@titlecolor}\centerline{\ntu@tableofcontents}}
\newcommand{\maketableofcontents}{
  \cleardoublepage
  \phantomsection
  \setlength{\cftbeforetoctitleskip}{-30pt}
  \setlength{\cftaftertoctitleskip}{10pt}
  \addcontentsline{toc}{chapter}{\ntu@tableofcontents}
  \tableofcontents
}

\let\oldnumberline\numberline
\renewcommand{\listfigurename}{\color{\ncs@titlecolor}\centerline{\ntu@listoffigures}}
\newcommand{\makelistoffigures}{
  \cleardoublepage
  \phantomsection
  \setlength{\cftbeforeloftitleskip}{-30pt}
  \setlength{\cftafterloftitleskip}{10pt}
  \addcontentsline{toc}{chapter}{\ntu@listoffigures}
  \renewcommand{\numberline}{\figurename~\oldnumberline}
  \listoffigures
}

\renewcommand{\listtablename}{\color{\ncs@titlecolor}\centerline{\ntu@listoftables}}
\newcommand{\makelistoftables}{
  \cleardoublepage
  \phantomsection
  \setlength{\cftbeforelottitleskip}{-30pt}
  \setlength{\cftafterlottitleskip}{10pt}
  \addcontentsline{toc}{chapter}{\ntu@listoftables}
  \renewcommand{\numberline}{\tablename~\oldnumberline}
  \listoftables
}

% [正文開始]
% \mainmatter
%
\newcommand{\mainmatter}{
  \cleardoublepage
  \ntu@setgeometry{\ntu@geometry@main}
  \pagenumbering{arabic}
  \fontsize{12}{18}\selectfont
}

% [參考文獻]
% \refmatter
%
\newcommand{\refmatter}{
  \cleardoublepage
  \phantomsection
  \renewcommand{\bibname}{\ntu@bibliography}
  \addcontentsline{toc}{chapter}{\ntu@bibliography}
}

% [附錄]
% \appendix
%
\newenvironment{appendices}{
  \titlecontents{chapter}[0em]                                % 修改目錄樣式
  {\addvspace{0.5em}\normalsize\bfseries\protect}
  {\fboxrule=0pt\fboxsep=0pt\framebox[\ntu@tocchaptersize][l]{\ntu@titleappendixtoc}}
  {}
  {\hfill\contentspage}
}{}

% --------------------------------------------------
% 09 自訂環境（Custom Environments）
% --------------------------------------------------

% [符號列表]
% Denotation Environment
%
\newenvironment{denotation}[1][2.5cm]{
\chapter*{\centering \ntu@denotation}
\addcontentsline{toc}{chapter}{\ntu@denotation}
\noindent
\begin{list}{}{
  \renewcommand\makelabel[1]{##1\hfill}
  \setlength{\labelwidth}{#1}                     % 符號欄寬度
  \setlength{\labelsep}{0.5cm}                    % 標籤與列表文字距離
  \setlength{\itemindent}{0cm}                    % 標籤縮進
  \setlength{\leftmargin}{\labelwidth+\labelsep}  % 標籤左邊界
  \setlength{\rightmargin}{0cm}                   % 標籤右邊界
  \setlength{\parsep}{0cm}                        % 段落間距
  \setlength{\itemsep}{18pt}                      % 標籤間距
  \setlength{\listparindent}{0cm}                 % 段落縮進
  \setlength{\topsep}{0pt}                        % 標籤與上文距離
}}{\end{list}}

% [誌謝環境]
% Acknowledgement Environment
%
\newenvironment{acknowledgement}{
  \begingroup
    \vspace{5em}
    \chapter*{\fontsize{18}{24}\selectfont\centerline{\ntu@acknowledgement@zh}}
    \vspace{-4em}
  \endgroup
  \fontsize{12}{18}\selectfont
  \thispagestyle{empty} % Disable page number
}

% [摘要環境]
% Abstract Environment
%
% 中文摘要
\renewenvironment{abstract}{
  % \clearpage
  \cleardoublepage % in case the chinese abstract not ends on an odd pag
  \begin{singlespace}
    \begin{center}
      % Title
      \vspace*{-1em}
      \fontsize{18}{32}\selectfont
      \ntu@title\par                            % Title
      \vspace{2em}
      % 
      \fontsize{14}{16}\selectfont
      研究生: \ntu@author
      \hfill
      指導教授: \ntu@advisor~博士\par
      \vspace{1.5em}
      \fontsize{16}{24}\selectfont
      {\ntu@university}~~~{\ntu@institute}\par  % Institute
    \end{center}
  \end{singlespace}
  % Disable clearpage to avoid page break after \chapter
  \begingroup
    \let\clearpage\relax
    \let\cleardoublepage\relax
    \vspace{5em}
    \chapter*{\centerline{\ntu@abstract@zh}}
    \vspace{-4em}
  \endgroup
  \addcontentsline{toc}{chapter}{\ntu@abstract@zh}
}{
  \bigbreak
  \noindent \textbf{\ntu@keyword@zh}\par
  \noindent \ncsred{\ntu@clist@use{\ntu@keywords}{\ntu@kwsymbol@zh}}
}

% 英文摘要
\newenvironment{abstract*}{
  % \clearpage
  \cleardoublepage % in case the chinese abstract not ends on an odd pag
  \begin{singlespace}
    \begin{center}
      % Title
      \vspace*{-1em}
      \fontsize{18}{32}\selectfont
      \ntu@title@en\par                            % Title
      \vspace{2em}
      % 
      \fontsize{14}{16}\selectfont
      Student: \ntu@author@en
      \hfill
      Advisor: \ntu@advisor@en,~Ph.D.\par
      \vspace{1.5em}
      \fontsize{16}{24}\selectfont
      {\ntu@institute@en}\par{\ntu@university@en}  % Institute
    \end{center}
  \end{singlespace}
  % Disable clearpage to avoid page break after \chapter
  \begingroup
    \let\clearpage\relax
    \let\cleardoublepage\relax
    \vspace{5em}
    \chapter*{\fontsize{18}{24}\selectfont\centerline{\ntu@abstract@en}}
    \vspace{-4em}
  \endgroup
  \addcontentsline{toc}{chapter}{\ntu@abstract@en}
}{
  \bigbreak
  \noindent \textbf{\ntu@keyword@en}\par
  \noindent \ncsred{\ntu@clist@use{\ntu@keywords@en}{\ntu@kwsymbol@en}}
}

% --------------------------------------------------
% 10 文檔處理（Document Processing）
% --------------------------------------------------

% 根據設定決定是否添加浮水印
% Insert watermark according to the config.
%
% If the watermark is downloaded from https://www.lib.ntu.edu.tw/doc/CL/watermark.pdf,
% adjust the opacity to 0.5.
% If the seal.pdf is used, adjust the opacity to 0.25. 


\ifthenelse{\equal{\ntu@watermark}{true}}{%
  \ifthenelse{\equal{\ntu@watermarkfromntulibrary}{true}}{%
    \newcommand{\watermarkOpacity}{0.5}%
    \newcommand{\watermarkFilePath}{watermark}%
  }{%
    \newcommand{\watermarkOpacity}{0.25}%
    \newcommand{\watermarkFilePath}{seal}%
  }%
  \makewatermark{\watermarkOpacity}{\watermarkFilePath}
}{}

% 根據設定決定是否添加數位標識
% Insert DOI according to the config.
%
\ifthenelse{\equal{\ntu@doi}{true}}{\insertdoi{\ntu@DOI}}{}

% 設定行距
% 1.2：1.5 倍行距
% 1.6：2.0 倍行距
\setstretch{1.6}

% 套用翻譯
\renewcommand{\figurename}{\ntu@figurename}
\renewcommand{\tablename}{\ntu@tablename}
