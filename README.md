This is a LaTeX class for creating scientific presentations in the corporate
design of the
[Institute for Web Science and Technologies (WeST)](http://west.uni-koblenz.de/).
It's style was adapted by Lukas from the
`WeST - Presentation Template - 2015-07-17.potx` powerpoint template.
It is implemented as a theme for LaTeX poster class
[beamer](https://www.ctan.org/pkg/beamer), so you should probably
have a look at its manual.

## Packages

    sudo apt install texlive-latex-recommended texlive-bibtex-extra biber

Or simply install vanilla TeXLive (recommended).

## Usage

Have a look at the [slides.tex](slides.tex) file for how to use this class.

The code can be build using pdfLaTeX or luaLaTeX.
For compilation [stu](https://github.com/kunegis/stu) is recommended, if
you have it installed you just have to perform:

    stu

Of course you can also compile this class by calling `pdflatex` or `lualatex` manually.

## Changelog

- 2018-12-12

Now also supports pdfLaTeX (default).

- 2020-03-19

Now it passes options to the base class `beamer`. For instance use `aspectratio=169` to set the ratio to 16:9.

## ToDo

There is a lot left to be done before this thing can be considered stable,
pull requests are always welcome.

Bugs:

- Have better example content.
- Fonts are not exactly the same when compiled with different engines.

Additional Features:

- Support Beamer's Handout feature.
