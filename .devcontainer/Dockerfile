FROM registry.gitlab.com/islandoftex/images/texlive:TL2025-2025-03-30-basic

RUN apt-get update -q && \
    # ssh client
    apt-get install -qy --no-install-recommends openssh-client && \
    # inkscape
    apt-get install -qy --no-install-recommends inkscape && \
    # latexindent deps
    apt-get install -qy libyaml-tiny-perl libfile-homedir-perl libunicode-linebreak-perl liblog-log4perl-perl libtest-log-dispatch-perl && \
    # clean files
    rm -rf /var/lib/apt/lists/* && apt-get clean

ENV PATH ${PATH}:/usr/local/texlive/2025/bin/x86_64-linux

RUN tlmgr update --self

# Tooling
RUN tlmgr install \
    latexmk chktex latexindent texcount \
    && texhash

# Must have
RUN tlmgr install \
    biblatex biblatex-ieee biber \
    microtype \
    setspace \
    lm \
    && texhash

# Should have
RUN tlmgr install \
    svg xcolor transparent pgf catchfile \
    csquotes \
    amsmath amsfonts \
    && texhash

# Nice to have
RUN tlmgr install \
    tcolorbox \
    pgfgantt \
    pgfplots \
    caption \
    && texhash

RUN tlmgr install \
#     datetime2 datetime2-english \
      # glossaries
      glossaries glossaries-english glossaries-extra \
#     # formatting
#     listings \
#     # tcolorbox
#     pdfcol tikzfill \
#     # standalone
    standalone filehook svn-prov \
#     # minted
#     minted fancyvrb upquote \
#     # BNF syntax
#     mdwtools \
#     # other
    booktabs \
    tikzviolinplots stringstrings \
    && texhash


RUN tlmgr update --all
