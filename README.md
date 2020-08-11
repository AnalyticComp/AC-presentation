This is a LaTeX class for creating scientific presentations in the corporate design of the
[Analytic Computing](https://www.ipvs.uni-stuttgart.de/departments/ac/) group.
Its style is adapted from the 
[WeSTpresentation](https://github.com/Institute-Web-Science-and-Technologies/WeSTpresentation) template,
and the [university presentation template](https://www.beschaeftigte.uni-stuttgart.de/uni-services/oeffentlichkeitsarbeit/corporate-design/download-vorlagen).
It is implemented as a theme for LaTeX poster class
[beamer](https://www.ctan.org/pkg/beamer), so you should probably
have a look at its manual.

## Packages

    sudo apt install texlive-latex-recommended texlive-bibtex-extra biber

Or simply install vanilla TeXLive (recommended).

## Usage

Have a look at the [slides.tex](slides.tex) or [slides_wide.tex](slides_wide.tex) file for how to use this class.

The code can be build using `pdfLaTeX` or `luaLaTeX`, for instance

    pdflatex -shell-escape -file-line-error -halt-on-error slides.tex
    biber slides
    pdflatex -shell-escape -file-line-error -halt-on-error slides.tex
    pdflatex -shell-escape -file-line-error -halt-on-error slides.tex

or

    pdflatex -shell-escape -file-line-error -halt-on-error slides_wide.tex
    biber slides
    pdflatex -shell-escape -file-line-error -halt-on-error slides_wide.tex
    pdflatex -shell-escape -file-line-error -halt-on-error slides_wide.tex
    
Alternatively one can use [stu](https://github.com/kunegis/stu) to compile it.

    stu
    
## Changelog

- 2018-12-12

Now also supports pdfLaTeX (default).

- 2020-03-19

Now it passes options to the base class `beamer`. For instance use `aspectratio=169` to set the ratio to 16:9.

- 2020-08-11

Adapt for AC.

## TODOs

Bugs:

- Have better example content.
- Fonts are not exactly the same when compiled with different engines (LuaLaTeX, pdfLaTeX).

Additional Features:

- Support Beamer's Handout feature.
