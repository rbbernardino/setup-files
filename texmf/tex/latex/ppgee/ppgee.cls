\ProvidesClass{ppgee}
\LoadClass{report}
\RequirePackage[pdf]{pstricks}%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%  Arquivo: ppgee.sty, quarta-feira, 12 de fevereiro de 2005
%%  Andr√© Leite Wanderley.... qualquer d˙vida ou sugest√£o:
%%  leite.andre@gmail.com
%%
%% --------------------------------------------------------------------------
%%
%%  Arquivo: ppgee.sty, ter√ßa-feira, 28 de Dezembro de 2010 - Modificado
%%  a partir do arquivo editado por Andr√© Leite e disponibilizado por Erick
%%  A. Bouton.
%%  Jos√© Sampaio de Lemos Neto.... qualquer d√∫vida ou sugest√£o:
%%  netosam@msn.com
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%
%%% Set up page layout parameters.
%%%
\setlength\paperheight{297mm}      %
\setlength\paperwidth{210mm}       % papel a4

\setlength{\parindent}{6mm}

\addtolength{\hoffset}{-1in}
\addtolength{\voffset}{-1in}

\setlength{\oddsidemargin}{3cm}    % Margem esquerda: 30mm
\setlength{\topmargin}{2cm}        %
\setlength{\textwidth}{155mm}      % Margem direita: 25mm
\setlength{\textheight}{230.11mm}  % Margem inferior: 25mm
\setlength{\marginparsep}{0mm}     %



%%%
%%% Set up default values.
%%%


%% Footnote parameters
\renewcommand{\footnoterule}{\vspace*{-3pt}\noindent\rule{3cm}{.4pt}\vspace*{2.6pt}}
\renewcommand{\@makefntext}[1]{\hspace{-12pt}\makebox[1.8em][r]{\@makefnmark}#1}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


\newcommand{\@universityname}{Universidade Federal de Pernambuco}
\newcommand{\@publicationno}{PublicaÁ„o no.\space\line(1,0){40} \\[10mm]}
\newcommand{\thesisauthor}{Um Estudante da UFPE}
\newcommand{\thesisday}{1}
\newcommand{\thesismonth}{maio}
\newcommand{\thesismontheng}{may}
\newcommand{\thesisyear}{1994}
\newcommand{\thesistitle}{TÌtulo}
\newcommand{\thesistitleenglish}{Title}
\newcommand{\thesistitletypesize}{\Large}
\newcommand{\thesisauthorpreviousdegrees}{Degree}
\newcommand{\palavraschaves}{Tipografia, Normas}
\newcommand{\keywords}{Typography, Norms}
\newcommand{\thesissupervisor}{Orientador}
\newcommand{\thesiscosupervisor}{Co-orientador}
\newcommand{\thesisauthoraddress}{Brasil}
\newcommand{\thesisapprovedby}{}
\newcommand{\thesisapprovedbytypesize}{\large}
\newcommand{\thesiscopyrightholder}{\thesisauthor}
\newcommand{\thesistypist}{pelo autor}
\newcommand{\thesistype}{Projeto de Tese}
\newcommand{\thesistypeeng}{Thesis Project}
\newcommand{\thesisarea}{¡rea}
\newcommand{\thesisareaeng}{¡rea}
\newcommand{\thesistypetypesize}{\large}
\newcommand{\thesistypesize}{\large}
\newcommand{\thesisdegree}{Doutor em Engenharia ElÈtrica}
\newcommand{\thesisdegreeeng}{Doctor in Electrical Engineering}
\newcommand{\thesisdegreetypesize}{\large}
\newcommand{\thesisdegreeabbreviation}{D.E.E.}
\newcommand{\thesiscommitteesize}{3}
\newcommand{\thesiscommittee}{Banca Examinadora:}
\newcommand{\coordenador}{Nome do Coordenador}
\newcommand{\commiteepresident}{A}
\newcommand{\commiteemembera}{B}
\newcommand{\commiteememberb}{C}
\newcommand{\commiteememberc}{D}
\newcommand{\InstO}{\@universityname}
\newcommand{\InstA}{D}
\newcommand{\InstB}{D}
\newcommand{\InstC}{D}
\newcommand{\thesiscommitteetypesize}{\large}
\newcommand{\thesisvitahead}{Sobre o Autor}
\newcommand{\thesisvitaheadtypesize}{\Large}
\newcommand{\thesisacknowledgmenthead}{Agradecimentos}
\newcommand{\thesisacknowledgmentheadtypesize}{\Large}
\newcommand{\thesisacknowledgmentsigname}{\thesisauthor}
\newcommand{\thesisacknowledgmentsignametypesize}{\large}
\newcommand{\espel}{1.5}
\newcommand{\thesisacknowledgmentsigplace}%
    {{\slshape
       \renewcommand{\arraystretch}{1.0}
       \begin{tabular}{l}
         \@universityname \\
         \thesisday\space de \thesismonth\space de \thesisyear
       \end{tabular}}}
\newcommand{\thesisstudent}{\thesisauthor, \thesisauthorpreviousdegrees}
\newcommand{\thesisstudenttypesize}{\large}
\newcommand{\thesisdedication}{A Deus, que È Pai, Filho e EspÌrito Santo.}

%%%
%%% Command for masters theses.  \phdthesis is provided for symmetry.
%%%
\newcommand{\mastersthesis}{
    \renewcommand{\thesistype}{DissertaÁ„o}
    \renewcommand{\thesistypeeng}{Dissertation}
    \renewcommand{\@publicationno}{}
    \renewcommand{\thesisdegree}{Mestre em Engenharia ElÈtrica}
    \renewcommand{\thesisdegreeeng}{Master in Electrical Engineering}
    \renewcommand{\thesisdegreeabbreviation}{M.E.E.}
    \renewcommand{\thesiscommitteesize}{2}
    \renewcommand{\thesiscommittee}{Banca Examinadora:}}

\newcommand{\presthesis}{
    \renewcommand{\thesistype}{Projeto de Tese}
    \renewcommand{\thesistypeeng}{Project of Thesis}
}

\newcommand{\phdthesis}{}

%%%
%%% Set up other commands.
%%%
\newcommand{\@defaultbaselinestretch}{1.3}
\newcommand{\@base}[1]{\renewcommand{\baselinestretch}{#1}}
\newcommand{\singlespace}{\renewcommand{\@defaultbaselinestretch}{1.1}}
\newcommand{\oneandhalfspace}{\renewcommand{\@defaultbaselinestretch}{1.5}}
\newcommand{\doublespace}{\renewcommand{\@defaultbaselinestretch}{1.7}}
\newcommand{\@thesistitle}{\textbf{\thesistitletypesize \thesistitle}}
\newcommand{\@thesistitleenglish}{\textbf{\thesistitletypesize \thesistitleenglish}}
\newcommand{\@thesisapprovedby}%
    {\textbf{\thesisapprovedbytypesize \thesisapprovedby}}
\newcommand{\@thesistype}{\textbf{\thesistypetypesize \thesistype}}
\newcommand{\@thesisdegree}{\textbf{\thesisdegreetypesize \thesisdegree}}
\newcommand{\@thesisdegreeabbreviation}{\thesisdegreeabbreviation}
\newcommand{\@thesiscommittee}%
    {\textbf{\thesiscommitteetypesize \thesiscommittee}}
\newcommand{\@thesisvitahead}{\thesisvitahead}
\newcommand{\@thesisacknowledgmenthead}%
    {\thesisacknowledgmenthead}
\newcommand{\@thesisacknowledgmentsigname}%
    {\textsc{\thesisacknowledgmentsignametypesize \thesisacknowledgmentsigname}}
\newcommand{\@thesisacknowledgmentsigplace}{\thesisacknowledgmentsigplace}
\newcommand{\@thesisstudent}{\textbf{\thesisstudenttypesize \thesisstudent}}

%%%
%%% Indent the first paragraph after a sectioning command.
%%%
% Tava Comentado... faz a mesma coisa do Identfirst....
\let\@afterindentfalse\@afterindenttrue
\@afterindenttrue

%%%
%%% Set up default page numbering and line spacing.
%%%
\newcommand{\@textpagenumbering}{arabic}
\newcommand{\@preamblepagenumbering}{arabic} % Recomenda√ß√£o da ABNT
\newcommand{\@textpagestyle}{plain}
\newcommand{\@preamblepagestyle}{empty} % Recomenda√ß√£o da ABNT
\pagenumbering{\@preamblepagenumbering}
\@base{\@defaultbaselinestretch}
\newcommand{\@chaptertype}{\chaptername}
\newcommand{\@appendix}{0}

%%%
%%% Command to generate copyright page.
%%%
\newcommand{\thesiscopyrightpage}{
    \thispagestyle{empty}
    \strut \vfill
    \begin{center}
     \begin{spacing}{\espel}
      Copyright \\ by \\ \thesiscopyrightholder \\ \thesisyear
      \end{spacing}
    \end{center}
    \vfill \strut
    \newpage}

%%%
%%% Comando para fazer a capa
%%%
\newcommand{\thesiscoverpage}{
    \thispagestyle{fancy}
    \fancyhead{}
    \fancyfoot{}
    \fancyhead[C]{\setlength{\unitlength}{1in}
        \begin{picture}(0,0)
            \put(-2.5,-8.5){\usebox{\ufpelogo}}
        \end{picture}}
    \begin{spacing}{1.5}
    \begin{center}
%%      \textbf{\Large \textsc{\@universityname}} \\
%%      \textbf{\large \textsc{Centro de Tecnologia e Geoci√™ncias}} \\
%%      \textbf{\large \textsc{Programa de P√≥s-gradua√ß√£o em Engenharia El√©trica}} \\
      {\Large \textsc{\@universityname}} \\
      {\large \textsc{Centro de Tecnologia e GeociÍncias}} \\
      {\large \textsc{Programa de PÛs-graduaÁ„o em Engenharia ElÈtrica}} \\
      %\vfill
      \vspace{5cm}
%%% Para trocar o ordem do autar e t√≠tulo brinque de comentar e descomentar...
      %{\huge\textsc{\textbf{\thesistitle}}}\\
      %{\Large\textsc{\textbf{\thesisauthor}}}  \\[8mm]
      {\Large\textsc{\textbf{\thesisauthor}}}  \\[8mm]
      %\vfill
      \vspace{3cm}
      %{\Large\textsc{\textbf{\thesisauthor}}}  \\[8mm]
      {\huge\textsc{{\thesistitle}}}\\
      \vfill
      \begin{spacing}{0.8}
      Recife\\
      \thesisyear
      \end{spacing}
    \end{center}
    \end{spacing}

    \newpage}

%%%
%%% Comando para fazer a pagina do titulo
%%%
\newcommand{\thesistitlepage}{
    \setcounter{page}{1}   %% Recomendacao ABNT
    \thispagestyle{empty}
    \begin{spacing}{\espel}
    \begin{center}
%          \textbf{\LARGE \textsc{\@universityname}} \\
%      \textbf{\Large \textsc{Centro de Tecnologia e GeociÍncias}} \\
%      \textbf{\Large \textsc{Programa de PÛs-graduaÁ„o em Engenharia ElÈtrica}} \\
      \strut\vfill
%%% Para trocar o ordem do autar e t√≠tulo brinque de comentar e descomentar...
%      {\huge \textbf{\textsc{\thesistitle}}} \\
       {\Large \textbf{\textsc{\thesisauthor}}} \\[8mm]
      \vfill
%      {\Large \textbf{\textsc{\thesisauthor}}} \\[8mm]
       {\huge {\textsc{\thesistitle}}} \\
      \vfill
      \hspace{.5\textwidth}\begin{minipage}{.5\textwidth}
      \begin{spacing}{1}
      \textbf{\thesistypetypesize \thesistype}
       submetida ao Programa de PÛs-GraduaÁ„o em Engenharia ElÈtrica da \@universityname\/
     % submetido ao Programa de PÛs-GraduaÁ„o em Engenharia ElÈtrica da \@universityname\/
       como parte dos re\-qui\-si\-tos para obtenÁ„o do grau de
      \textbf{\thesisdegreetypesize \thesisdegree}.\\
      {{{Orientador: \thesissupervisor}}}\\
      % {{{Coorientador: \thesiscosupervisor}}}\\
      {{{¡rea de ConcentraÁ„o: \thesisarea}}} \\
      \end{spacing}
      \end{minipage}
      \vfill
      \vfill
      \begin{spacing}{0.8}
      Recife\\
      \thesisyear
      \end{spacing}
      %\vfill
      %{\small \copyright \thesisauthor, \thesisyear}
    \end{center}
    \end{spacing}
    \newpage}

%%%
%%% Comando para a pagina de assinaturas
%%%

\newcommand{\signature}[2]{
\begin{center}
%\par\noindent\dotfill\null \\*
\par\noindent\makebox[76mm]{}\\* % Linha √© coisa para anafalbeto. \dotfill} \\*
#2 \\[.20\baselineskip]
{\begin{spacing}{1}\small #1\end{spacing}}
\vspace{5mm}
\end{center}
}


%%%
%%% Ficha Catalogr·fica
%%%
\newcommand{\thesiscataloguepage}{
 \thispagestyle{empty}
 \begin{center}
 \end{center}
\vspace{10cm}

\begin{center}
  \usebox{\ficha}
\end{center}
\newpage}


%%%
%%% Pagina de assinaturas
%%%
\newcommand{\thesissignaturepage}{
    \setcounter{page}{3}   %% Recomendacao ABNT
    \thispagestyle{empty}
\begin{center}
    \usebox{\assinatura}
\end{center}
\newpage}
%
%
%\newcommand{\thesissignaturepage}{
%    \thispagestyle{empty}
%    \begin{spacing}{\espel}
%    \strut\vspace{-2.5cm} %\vfill
%    \begin{center}
%      \textbf{\Large \textsc{\@universityname}} \\
%      \textbf{\large \textsc{Centro de Tecnologia e GeociÍncias}} \\
%      \textbf{\large \textsc{Programa de PÛs-graduaÁ„o em Engenharia ElÈtrica}} \\
%      \vspace{.5cm}
%      {\Large \thesisauthor}\\[5mm]
%      \@thesistitle\vspace{1cm}
%    \end{center}
%    \hspace{.5\textwidth}\begin{minipage}{.5\textwidth}
%\begin{spacing}{1}
%`Esta \thesistype\space foi julgada adequada para obtenÁ„o do TÌtulo de
%\thesisdegree, ¡rea de ConcentraÁ„o em \thesisarea,
%e aprovada em sua forma final pelo Programa de PÛs-graduaÁ„o
%em Engenharia ElÈtrica da Universidade Federal de Pernambuco'.
%\end{spacing}
%    \end{minipage}
%%
%    \vspace{0mm}
%    \mbox{} \hfill
%%                   \begin{minipage}{8cm}
%                     \begin{spacing}{1}
%                     %\signature{Orientador}{\thesissupervisor}
%                     \signature{Coordenador do Programa de \\PÛs-graduaÁ„o em Engenharia ElÈtrica}{\coordenador}
%%                     \hfill\mbox{} \\
%                     \@thesiscommittee \\
%                     \ifthenelse{\equal{\thesissupervisor}{nao}}{}{\signature{Orientador\\ \InstO}{\thesissupervisor}}
%                     \ifthenelse{\equal{\thesiscosupervisor}{nao}}{}{\signature{Co-orientador}{\thesiscosupervisor}}
%                     \ifthenelse{\equal{\commiteemembera}{nao}}{}{\signature{\InstA}{\commiteemembera}}
%                     \ifthenelse{\equal{\commiteememberb}{nao}}{}{\signature{\InstB}{\commiteememberb}}
%                     \ifthenelse{\equal{\commiteememberc}{nao}}{}{\signature{\InstC}{\commiteememberc}}
%                     \end{spacing}
%%                   \end{minipage}
%    \vfill \strut
%\begin{center}\thesisday\space de \thesismonth\space de \thesisyear\end{center}
%    \end{spacing}
%    \newpage
%    }

%%%
%%% Ambiente apara o Resumo
%%%
\newenvironment{thesisabstract}
     {
%     \chapter*{\centering {{Resumo}}\@mkboth{\uppercase{Resumo}}{\uppercase{Resumo}}}
%          \chapter*{}
\begin{center}\end{center}
     \vspace{15mm}

\begin{center}
{\Huge\textsc{\textbf{Resumo}}}
\end{center}
     \thispagestyle{empty}
     \vspace{22mm}
     \begin{spacing}{1.1} \noindent %Mudei Para que o resumo tenha espaÁamento 1 entre linhas (Sampaio 28/12/2010)
	 }
     {
     \vspace{16mm}
     \end{spacing}
     \begin{spacing}{1}
       \noindent
       \textbf{Palavras-chaves:} \palavraschaves
     \end{spacing}
     \newpage
     }

%\newenvironment{thesisabstract}
%     { \thispagestyle{empty}
%     %\addcontentsline{toc}{chapter}{Resumo}
%     \begin{center}
%\begin{spacing}{1}
%     {Resumo da \thesistype\space apresentada \`{a} \textsc{ufpe} como parte dos requisitos
%     necess·rios para a obtenÁ„o do grau de \thesisdegreetypesize \thesisdegree}
%\end{spacing}
%
%\vspace{8mm}
%
%       {\Large \textbf{\textsc{\thesistitle}}} \\[5mm]
%       \setlength{\unitlength}{1mm}
%       \begin{spacing}{\espel}
%       {\large \textbf{\thesisauthor}} \\[5mm]
%       \end{spacing}
%       \begin{spacing}{\@defaultbaselinestretch}
%
%       \thesismonth/\thesisyear \\[5mm]
%       \end{spacing}
%     \end{center}
%      \begin{spacing}{1}
%       \noindent
%       \textbf{Orientador:} \thesissupervisor \\
%       \textbf{Co-orientador:} \thesiscosupervisor \\
%       \textbf{¡rea de ConcentraÁ„o:} \thesisarea \\
%       \textbf{Palavras-chave:} \palavraschaves \\
%       \textbf{N˙mero de p·ginas:} \pageref{LastPage} %%%Qualquer coisa...  \pageref{`lastromanpage'}+
%      \end{spacing}
%     \vspace{5mm}
%     %\begin{spacing}{\@defaultbaselinestretch} \noindent}
%     \begin{spacing}{1.1} \noindent} % Mudei Para que o resumo tenha espa√ßamento 1 entre linhas (Sampaio 28/12/2010)
%    {\end{spacing} \newpage}


%%%
%%% Ambiente para gerar o abstract em ingles
%%%
\newenvironment{thesisabstractenglish}
     {
     \selectlanguage{english}
\begin{center}\end{center}
     \vspace{15mm}

\begin{center}
{\Huge\textsc{\textbf{Abstract}}}
\end{center}
     \thispagestyle{empty}
     \vspace{22mm}
     \begin{spacing}{1.1} \noindent %Mudei Para que o resumo tenha espaÁamento 1 entre linhas (Sampaio 28/12/2010)
     }
     {
     \vspace{16mm}
     \end{spacing}
     \begin{spacing}{1}
       \noindent
       \textbf{Keywords:} \keywords
     \end{spacing}
     \selectlanguage{portuges}
     \newpage
     }


%\newenvironment{thesisabstractenglish}
%    { \thispagestyle{empty}
%    %\addcontentsline{toc}{chapter}{Abstract}
%     \begin{center}
%     \selectlanguage{english}
% \begin{spacing}{1}
%     {Abstract of \thesistypeeng\space presented to \textsc{ufpe} as a partial fulfillment
%     of the requirements for the degree of \thesisdegreetypesize \thesisdegreeeng}
%\end{spacing}
%
% \vspace{8mm}
%
%       {\Large \textbf{\textsc{\thesistitleenglish}} } \\[5mm]
%       \setlength{\unitlength}{1mm}
%       \begin{spacing}{\espel}
%       {\large \textbf{\thesisauthor}} \\[5mm]
%       \end{spacing}
%       \begin{spacing}{\@defaultbaselinestretch}
%
%       \thesismontheng/\thesisyear \\[5mm]
%       \end{spacing}
%     \end{center}
%      \begin{spacing}{1}
%       \noindent
%       \textbf{Supervisor:} \thesissupervisor \\
%       \textbf{Co-supervisor:} \thesiscosupervisor \\
%       \textbf{Area of Concentration:} \thesisareaeng \\
%       \textbf{Keywords:} \keywords \\
%       \textbf{Number of pages:} \pageref{LastPage} %%%% Precisando... \pageref{`lastromanpage'}+
%      \end{spacing}
%     \vspace{5mm}
%     %\begin{spacing}{\@defaultbaselinestretch} \noindent}
%     \begin{spacing}{1.1} \noindent} % Mudei Para que o resumo tenha espacamento 1 entre linhas (Sampaio 28/12/2010)
%    {\end{spacing} \selectlanguage{portuges} \newpage}

%%%
%%% Command to generate dedication page.
%%%
\newcommand{\thesisdedicationpage}{
    \thispagestyle{empty}
    \strut \vfill
    \begin{spacing}{\@defaultbaselinestretch}
    \begin{flushright}
      \thesisdedication
    \end{flushright}
    \end{spacing}
    \vspace{3cm} \strut
    \newpage}

%%%
%%% Environment to generate acknowledgments page.
%%%
\newenvironment{thesisacknowledgments}
     {\thispagestyle{empty}
     \begin{center}
     \end{center}
         \vspace{15mm}

     \begin{center}

      {\Huge \textbf{\textsc{Agradecimentos}}} \\[5mm]
     \end{center}

     \vspace{21mm}
     \begin{spacing}{1.1} \noindent} % Mudei Para que o resumo tenha espa√ßamento 1 entre linhas (Sampaio 28/12/2010)
    {\end{spacing} \newpage}


%\newenvironment{thesisacknowledgments}
%    {
%    %\doublespace\small\normalsize
%     \chapter*{\centering \textsc{{\@thesisacknowledgmenthead}}
%         \@mkboth{\uppercase{\@thesisacknowledgmenthead}}
%                 {\uppercase{\@thesisacknowledgmenthead}}}
%     %\addcontentsline{toc}{chapter}{\@thesisacknowledgmenthead}
%     %\begin{spacing}{\@defaultbaselinestretch}}
%     \begin{spacing}{1}
%     \thispagestyle{empty}}
%    {\end{spacing} \par \vspace{20mm}
%     \raggedleft \@thesisacknowledgmentsigname \\[10mm]
%     \raggedright \@thesisacknowledgmentsigplace \newpage}

%%%
%%% Environment to generate vita page.
%%%
\newenvironment{thesisauthorvita}
    {\chapter*{\centering\textsc{\textbf{\@thesisvitahead}}}
%    \addcontentsline{toc}{chapter}{\@thesisvitahead}
    \begin{spacing}{\@defaultbaselinestretch}}
    {\end{spacing} \par \vspace{15mm}
     \noindent EndereÁo:
       \begin{minipage}[t]{90mm}
         \thesisauthoraddress
       \end{minipage}
     \par \vspace{10mm}
     \noindent\emph{e-mail}: \authoremail
     \par \vspace{10mm}
     \noindent Esta \lowercase\expandafter{\thesistype} foi
       diagramada usando \LaTeXe\footnote{\LaTeXe{} È uma extens„o do \LaTeX.
       \LaTeX{} È uma coleÁ„o de macros criadas por Leslie Lamport para o
       sistema \TeX, que foi desenvolvido por Donald E. Knuth.
       \TeX{} È uma marca registrada da Sociedade Americana
       de Matem·tica (\AmS). O estilo usado na formataÁ„o desta
       \lowercase\expandafter{\thesistype} foi escrito
       por Dinesh Das, Universidade do Texas. Modificado por Renato JosÈ de Sobral Cintra
       (2001) e por Andrei Leite Wanderley (2005), ambos da Universidade Federal de Pernambuco.
       Sua ˙lltima modificaÁ„o ocorreu em 2010 realizada por JosÈ Sampaio de Lemos Neto, tambÈm da
       Universidade Federal de Pernambuco.
    } \thesistypist.}



\newcommand{\@chapteralignment}{}
\renewcommand{\chapter}{\clearpage
   \ifnum\@appendix=1
     \renewcommand{\@chaptertype}{\appendixname}
   \else
     \renewcommand{\@chaptertype}{\chaptername}
   \fi
   \thispagestyle{plain}%
   \global\@topnum\z@
   \@afterindentfalse
   \secdef\@chapter\@schapter
   }
\renewcommand\appendix{\par
  \setcounter{chapter}{0}%
  \setcounter{section}{0}%
%  \renewcommand{\@chapapp}{\appendixname\ }%
  \renewcommand{\thechapter}{\Alph{chapter}}
  \renewcommand{\@appendix}{1}}

%%%
%%% Define chapter heading placement commands.
%%%
\newcommand{\leftchapter}{
    \renewcommand{\@chapteralignment}{\raggedright}}
\newcommand{\centerchapter}{
    \renewcommand{\@chapteralignment}{\centering}}
\newcommand{\rightchapter}{
    \renewcommand{\@chapteralignment}{\raggedleft}}

%%%
%%% Command from report.cls, (c) LaTeX3 Project.
%%%
\renewcommand\@chapapp{ }
\def\@chapter[#1]#2{\ifnum \c@secnumdepth >\m@ne
                      \refstepcounter{chapter}%
                      \typeout{\@chapapp\space\thechapter.}%
                            \ifnum\@appendix=0
                        \addcontentsline{toc}{chapter}%
%                            {\protect\numberline{\thechapter}\textsc{\textbf{#1}}}%
                            {\protect\numberline{\thechapter}\scshape{\bfseries{#1}}}%
                        \else
                        \addcontentsline{toc}{chapter}%
                            {\@chaptertype{} \protect\numberline{\thechapter}\textsc{\textbf{#1}}}%
                        \fi
                    \else
%%%                  \addcontentsline{toc}{chapter}{\@chaptertype{} #1}
                     \addcontentsline{toc}{chapter}{#1}
                    \fi
                    \ifnum\value{chapter}=1
                      \ifnum\@appendix=0
                        \pagestyle{\@textpagestyle}
                        %\pagenumbering{\@textpagenumbering} %%%% Andr√©, para a ABNT
                      \fi
                    \fi
                    \chaptermark{#1}%
                    \addtocontents{lof}{\protect\addvspace{10\p@}}%
                    \addtocontents{lot}{\protect\addvspace{10\p@}}%
                    \if@twocolumn
                      \@topnewpage[\@makechapterhead{#2}]%
                    \else
                      \@makechapterhead{#2}%
                      \@afterheading
                    \fi
                    }

%%%
%%% Command from report.cls, (c) LaTeX3 Project.
%%% Foi aqui que mudei... e ainda vou mudar....
\def\@makechapterhead#1{%
   %\thispagestyle{empty} % tira o n˙mero da primeira p√°gina de cada cap√≠tulo!.
  \vspace*{50\p@}%
  {\parindent \z@ \@chapteralignment \reset@font

 \ifnum\@appendix=0
         \ifnum \c@secnumdepth >\m@ne
          \@chapapp{}{
% Minhas mudan√ßas... para melhor.. eu acho. Outros n√£o acham... hehehe
%             \strut\hfill \pscharpath[linewidth=.5pt,fillcolor=gray,fillstyle=solid]{\huge {\textsc{capÌtulo}}} {\fontsize{60}{0}\usefont{T1}{psbj}{m}{n}\selectfont {{\thechapter}}}}
             \strut\hfill{\huge {\textsc{\textbf{CapÌtulo}}} }\fontsize{60}{0}\usefont{T1}{psbj}{m}{n}\selectfont \thechapter}            %psbj
        \fi
 \else
         \ifnum \c@secnumdepth >\m@ne
          \@chapapp{}{
% Minhas mudan√ßas... para melhor.. eu acho. Outros n√£o acham... hehehe
%             \strut\hfill{\huge {\textsc{ap√™ndice}} }\fontsize{60}{0}\usefont{T1}{psbj}{m}{n}\selectfont {\textbf{\thechapter}}}
             \strut\hfill{\huge {\textsc{\textbf{Ap\^{e}ndice}}} }\fontsize{60}{0}\usefont{T1}{psbj}{m}{n}\selectfont \thechapter}
        \fi
\fi

\addvspace{1cm}
\begin{flushright}
\begin{minipage}{.75\textwidth}\raggedleft
     \begin{spacing}{2}
        {\Huge\scshape\bfseries #1}
        \end{spacing}
    \nobreak
    \vskip 40\p@
\end{minipage}
\end{flushright}
\addvspace{3cm}

  }}


\def\@makeschapterhead#1{%
  \vspace*{50\p@}%
  {\parindent \z@ \@chapteralignment
    \reset@font
\begin{centering}
\begin{minipage}{\textwidth}\centering
     \begin{spacing}{2}
        {\Huge\scshape\bfseries #1}
        \end{spacing}
    \nobreak
    \vskip 40\p@
\end{minipage}
\end{centering}
    \nobreak
    \vskip 40\p@
  }}

\renewcommand\section{\@startsection{section}{1}{\z@}%
                                   {-3.5ex \@plus -1ex \@minus -.2ex}%
                                   {2.3ex \@plus.2ex}%
                                   {\Large\rmfamily\bfseries}}%\sffamily
\renewcommand\subsection{\@startsection{subsection}{2}{\z@}%
                                     {-3.25ex\@plus -1ex \@minus -.2ex}%
                                     {1.5ex \@plus .2ex}%
                                     {\large\rmfamily}}

\renewcommand*\l@section{\bfseries\@dottedtocline{1}{0em}{3.0em}}      %Valores alterados ‡ pedido da biblioteca do CTG em 17/05/2015
\renewcommand*\l@subsection{\normalfont\@dottedtocline{2}{0em}{3.0em}} %Valores alterados ‡ pedido da biblioteca do CTG em 17/05/2015
%%%
%%% Command from report.cls, (c) LaTeX3 Project.
%%%
\renewcommand\listoftables{%
    \if@twocolumn
      \@restonecoltrue\onecolumn
    \else
      \@restonecolfalse
    \fi
    
    \chapter*{\centering\textsc{\textbf{\listtablename}}
      \@mkboth{\uppercase{\listtablename}}{\uppercase{\listtablename}}}%
%ABNT    \addcontentsline{toc}{chapter}{\textbf{\textsc{\listtablename}}}
    \thispagestyle{empty}
    \@starttoc{lot}%
    \thispagestyle{empty}
    \if@restonecol\twocolumn\fi
    }
\renewcommand\listoffigures{%
    \if@twocolumn
      \@restonecoltrue\onecolumn
    \else
      \@restonecolfalse
    \fi
    \chapter*{\centering\textsc{\textbf{\listfigurename}}
      \@mkboth{\uppercase{\listfigurename}}%
              {\uppercase{\listfigurename}}}%
%ABNT    \addcontentsline{toc}{chapter}{\textbf{\textsc{\listfigurename}}}
    \thispagestyle{empty}
    \pagestyle{empty}
    \@starttoc{lof}%
    \thispagestyle{empty}
    \if@restonecol\twocolumn\fi

    }



\renewcommand\tableofcontents{%
    \renewcommand{\contentsname}{Sum·rio}
    \if@twocolumn
      \@restonecoltrue\onecolumn
    \else
      \@restonecolfalse
    \fi
    \chapter*{\centering\textsc{\textbf{\contentsname}}
        \@mkboth{\uppercase{\contentsname}}
                {\uppercase{\contentsname}}}%
    \thispagestyle{empty}
    \@starttoc{toc}
    \thispagestyle{empty}
    \if@restonecol\twocolumn\fi
    }
\renewcommand*\l@chapter[2]{%
  \ifnum \c@tocdepth >\m@ne
    \addpenalty{-\@highpenalty}%
    \vskip 1.0em \@plus\p@
    \setlength\@tempdima{3.0em}%
    \begingroup
      \parindent \z@ \rightskip \@pnumwidth
      \parfillskip -\@pnumwidth
      \leavevmode \bfseries
      \advance\leftskip\@tempdima
      \hskip -\leftskip
      #1\nobreak\hfil \nobreak\hb@xt@\@pnumwidth{\hss #2}\par
      \penalty\@highpenalty
    \endgroup
  \fi}

%%%
%%% Command to print draft version of the thesis.
%%%
\newcommand{\thesisdraft}{
    \setlength{\topmargin}{0in}
    \setlength{\headheight}{0.2in}
    \setlength{\headsep}{0.25in}
    \renewcommand{\@textpagestyle}{myheadings}
    \def\ps@myheadings{%
     \let\@oddfoot\@empty\let\@evenfoot\@empty
     \def\@oddhead{\textsl{Rascunho de \timestamp}\hfil\thepage}%
     \let\@mkboth\@gobbletwo
     \let\chaptermark\@gobble
     \let\sectionmark\@gobble}
    }

%%%
%%% Comando para colocar cabecalhos
%%%
\newcommand{\cabecalho}{
    \setlength{\headheight}{5mm}
    \renewcommand{\@textpagestyle}{myheadings}
    \def\ps@myheadings{%
     \let\@oddfoot\@empty\let\@evenfoot\@empty
     \def\@oddhead{\textsl{\chaptername\space \thechapter.\space \chaptermark}\hfil\thepage}%
     \let\@mkboth\@gobbletwo
     \let\chaptermark\@gobble
     \let\sectionmark\@gobble}
    }

%%%
%%% Comando para colocar numeracao no canto superior direito
%%%
\newcommand{\numberup}{
%    \setlength{\topmargin}{0in}
    \setlength{\headheight}{12pt}
%    \setlength{\headsep}{0.25in}
    \renewcommand{\@textpagestyle}{myheadings}
    \def\ps@myheadings{%
     \let\@oddfoot\@empty\let\@evenfoot\@empty
     \def\@oddhead{\strut\hfil\thepage}%
     \def\@evenhead{\strut\hfil\thepage}%
%     \let\@mkboth\@gobbletwo
%     \let\chaptermark\@gobble
%     \let\sectionmark\@gobble
     }
    }

%%%
%%% Code to compute current timestamp.  Some parts by Martin Minow.
%%%
\newcount\hour \newcount\minute
\hour=\time  \divide \hour by 60
\minute=\time
\loop \ifnum \minute > 59 \advance \minute by -60 \repeat
\def\thesistime{\ifnum \hour<13 \number\hour:%
                      \ifnum \minute<10 0\fi
                      \number\minute
                      \ifnum \hour<12 \ am\else \ pm\fi
         \else \advance \hour by -12 \number\hour:%
                      \ifnum \minute<10 0\fi
                      \number\minute \ pm\fi}

\def\thesisdate{\number\day\space de\space
\ifcase\month\or
janeiro\or fevereiro\or marÁo\or abril\or maio\or junho\or
julho\or agosto\or setembro\or outubro\or novembro\or dezembro\fi
\space de\space \number\year}

\newcount\dow
\newcount\leap
\newcount\x
\newcount\y

%leap = year + (month - 14)/12
\leap=\month \advance\leap by -14 \divide\leap by 12
  \advance\leap by \year

%dow = (13 * (month + 10 - (month + 10)/13*12) - 1)/5
\dow=\month \advance\dow by 10
  \y=\dow \divide\y by 13 \multiply\y by 12
  \advance\dow by -\y \multiply\dow by 13 \advance\dow by -1 \divide\dow by 5

%dow += day + 77 + 5 * (leap % 100)/4
\advance\dow by \day \advance\dow by 77
  \x=\leap \y=\x \divide\y by 100 \multiply\y by 100 \advance\x by -\y
  \multiply\x by 5 \divide\x by 4 \advance\dow by \x

%dow += leap / 400
\x=\leap \divide\x by 400 \advance\dow by \x

%dow -= leap / 100 * 2;
%dow = (dow % 7)
\x=\leap \divide\x by 100 \multiply\x by 2 \advance\dow by -\x
  \x=\dow \divide\x by 7 \multiply\x by 7 \advance\dow by -\x

\def\thesisdayofweek{\ifcase\dow
Domingo\or Segunda-feira\or TerÁa-feira\or
Quarta-feira\or Quinta-feira\or Sexta-feira\or S·bado\fi}

\def\timestamp{\thesistime, \thesisdayofweek, \thesisdate}

%%%
%%% Commands for spacing.  Some parts from spacing.sty by Stephen Page.
%%%
\ifx\undefined\selectfont
\def\@setsize#1#2#3#4{\@nomath#1
   \let\@currsize#1\baselineskip
   #2\baselineskip\baselinestretch\baselineskip
   \parskip\baselinestretch\parskip
   \setbox\strutbox\hbox{\vrule height.7\baselineskip
      depth.3\baselineskip width\z@}
   \normalbaselineskip\baselineskip#3#4}
\else
\def\@newbaseline{%
    \ifx\undefined\setnew@baselineskip
      \baselineskip\f@baselineskip\relax
    \else
      \setnew@baselineskip
    \fi
    \baselineskip\baselinestretch\baselineskip
    \setbox\strutbox\hbox{\vrule\@height.7\baselineskip
    \@depth.3\baselineskip \@width\z@}%
    \normalbaselineskip\baselineskip}
\fi
%%%
%%% Reset baselinestretch within footnotes and floats. Originally stolen
%%% from Stanford thesis style and Andr√© Leite's mind...
%%%
\long\def\@makecaption#1#2{%
  \vskip\abovecaptionskip
  \sbox\@tempboxa{#1: #2}%
  \ifdim \wd\@tempboxa >\hsize
    \textbf{#1:} \textit{#2}\par
  \else
    \global \@minipagefalse
    \hb@xt@\hsize{\hfil\box\@tempboxa\hfil}%
  \fi
  \vskip\belowcaptionskip}
%%%%%
\long\def\@footnotetext#1{\insert\footins{\def\baselinestretch{1}\footnotesize
    \interlinepenalty\interfootnotelinepenalty
    \splittopskip\footnotesep
    \splitmaxdepth \dp\strutbox \floatingpenalty \@MM
    \hsize\columnwidth \@parboxrestore
   \edef\@currentlabel{\csname p@footnote\endcsname\@thefnmark}\@makefntext
    {\rule{\z@}{\footnotesep}\ignorespaces
      #1\strut}}}
%%%
%%%
%%%
\def\spacing#1{\par%
 \begingroup
 \def\baselinestretch{#1}
 \ifx\undefined\selectfont
 \ifx\@currsize\normalsize\@normalsize\else\@currsize\fi
 \else
 \@newbaseline
 \fi}
\def\endspacing{\par
 \vskip \parskip
 \vskip \baselineskip
 \endgroup
 \vskip -\parskip
 \vskip -\baselineskip}

\newcommand{\cip}[1]{%
   \clearpage
   \if@twocolumn
     \@restonecoltrue\onecolumn
   \fi
   \gdef\@catalog{#1}%
   {\centering\large\sffamily\bfseries
    CIP --- CATALOGA\c{C}\~{A}O NA PUBLICA\c{C}\~{A}O \par}
   \vspace{10mm}
   %%
   %% Quadro
   %%
   {\centering\framebox[120mm]{%
     \begin{minipage}{110mm}
       \vspace*{2mm}
       \setlength{\parindent}{1.5em}%
%       \noindent\@authorl{}, \@authorf{} \\

       \thesistitle\ / por \thesisauthor. --- Recife: \textsc{ppgee} da \textsc{ufpe}, \thesisyear.\\
       \indent\pageref{LastPage} p.: il. \\

       \thesistype
       --- Universidade Federal de Pernambuco.
       Programa de P\'{o}s-Gradua\c{c}\~{a}o em Engenharia ElÈtrica,
       Recife, BR--PE, \number\thesisyear.
%       \ifx\@advisorfl\@empty Orientador:
%       \else Orientadora:
%       \fi
%       \@advisorl, \@advisorf
%       \ifx\@coadvisorf\@empty . \else
%         ; \ifx\@coadvisorfl\@empty Co-rientador:
%           \else Co-orientadora:
%           \fi
%         \@coadvisorl, \@coadvisorf.
%       \fi \\

%       \@catalog\ I. \@advisorl, \@advisorf.
%       \ifx\@coadvisorf\@empty II. T\'{\i}tulo.
%       \else II. \@coadvisorl, \@coadvisorf. III. T\'{\i}tulo.
%       \fi
       \vspace{4mm}
      \end{minipage}%
    } \par}
  }


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Nominata
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newenvironment{nominata}{%
   \if@twocolumn
     \@restonecoltrue\onecolumn
   \fi
   \null\vfill{}
   \footnotesize
   {\noindent \parsep \z@ \rule{\textwidth}{2pt}
    \sffamily\bfseries Universidade Federal de Pernambuco}%
   \list{}{\itemsep \z@
           \parsep \z@
           \labelwidth\z@ \itemindent-\leftmargin
           \let\makelabel\descriptionlabel}}
  {\endlist \if@restonecol\twocolumn\fi}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Ambiente para colocar a cita√ß√µes no come√ßo de cada cap√≠tulo....
%% Andr√© Leite
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand{\quem}[1]{\par\bf\medskip --- #1 \hfill}
\newenvironment{milkcitation}
    {%
    \addvspace{-3cm}
    \begin{flushleft}
    \begin{minipage}[t]{5.75cm} \small\em } %\raggedright .4\textwidth
    {%
    \end{minipage}
    %\vrule depth 3cm height 1ex width 0pt
    \vspace{2cm}
    \end{flushleft}}

\newenvironment{milkquotation}
    {\medskip %
    \begin{center}
    \begin{minipage}{10cm}
    \hspace{.25cm}\small\itshape}%
    {\medskip\end{minipage}
    \end{center}
    }%

%% Caso a tese tenha fragmentos de codigo no corpo da dissertacao,
%% descomente as linhas abaixo e use o ambiente
%% \begin{programa} ... \end{programa}
%%%%%% Inicio da definicao de ambiente para programas
%\floatstyle{ruled}
%\newfloat{Program}{thp}{lop}[chapter]
%\floatname{Program}{Programa}
%\newenvironment{programa}[1]
%{
%\begin{Program}
%\caption{#1} } {\end{Program}}



%%%
%%% Environment Para colocar um cita√ß√£o!
%%%
\newenvironment{epigrafe}
    {\thispagestyle{empty}
    \strut \vspace{16cm}
     \begin{spacing}{1}\itshape}
    {\end{spacing}
    \newpage}

\newcommand{\hlinem}[3]{\noalign{\vspace{#3}\hrule height #1 depth #2}}


