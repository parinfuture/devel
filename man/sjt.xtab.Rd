% Generated by roxygen2 (4.1.1): do not edit by hand
% Please edit documentation in R/sjTabPropTable.R
\name{sjt.xtab}
\alias{sjt.xtab}
\title{Show contingency tables as HTML table}
\usage{
sjt.xtab(var.row, var.col, var.grp = NULL, weightBy = NULL, digits = 1,
  file = NULL, variableLabels = NULL, valueLabels = NULL,
  breakVariableLabelsAt = 40, breakValueLabelsAt = 20,
  stringTotal = "Total", showObserved = TRUE, showCellPerc = FALSE,
  showRowPerc = FALSE, showColPerc = FALSE, showExpected = FALSE,
  showTotalN = FALSE, showHorizontalLine = FALSE, showSummary = TRUE,
  showLegend = TRUE, showNA = FALSE, labelNA = "NA", tdcol.n = "black",
  tdcol.expected = "#339999", tdcol.cell = "#993333",
  tdcol.row = "#333399", tdcol.col = "#339933", highlightTotal = FALSE,
  highlightColor = "#f8f8f8", percSign = "&nbsp;&#37;", hundret = "100.0",
  encoding = NULL, CSS = NULL, useViewer = TRUE, no.output = FALSE,
  remove.spaces = TRUE)
}
\arguments{
\item{var.row}{Variable that should be displayed in the table rows.}

\item{var.col}{Variable that should be displayed in the table columns.}

\item{var.grp}{An optional grouping variable that splits the data into several groups,
depending on the amount of categories. See examples for details.}

\item{weightBy}{A weight factor that will be applied to weight all cases.
Must be a vector of same length as \code{var.row}. Default is \code{NULL}, so no weights are used.}

\item{digits}{The amount of digits used for the percentage values inside table cells.
Default is 1.}

\item{file}{The destination file, which will be in html-format. If no filepath is specified,
the file will be saved as temporary file and openend either in the RStudio View pane or
in the default web browser.}

\item{variableLabels}{A character vector of same length as supplied variables, with
the associated variable names. Following order is needed: name of \code{var.row},
name of \code{var.col}, and - if \code{var.grp} is not \code{NULL} - name of \code{var.grp}.
See examples for more details.
variableLabels are detected automatically, if \code{var.row} or \code{var.col}
have a variable label attribute (see \code{\link[sjmisc]{set_var_labels}}) for details).}

\item{valueLabels}{A list of character vectors that indicate the value labels of the supplied
variables. Following order is needed: value labels of \code{var.row},
value labels  of \code{var.col}, and - if \code{var.grp} is not \code{NULL} -
value labels  of \code{var.grp}. \code{valueLabels} needs to be a \code{\link{list}} object.
See examples for more details.}

\item{breakVariableLabelsAt}{Wordwrap for variable labels. Determines how many chars of the variable labels are displayed in
one line and when a line break is inserted. Default is 40.}

\item{breakValueLabelsAt}{Wordwrap for value labels. Determines how many chars of the value labels are displayed in
one line and when a line break is inserted. Default is 20.}

\item{stringTotal}{String label for the total column / row header.}

\item{showObserved}{If \code{TRUE}, observed values are shown.}

\item{showCellPerc}{If \code{TRUE}, cell percentage values are shown.}

\item{showRowPerc}{If \code{TRUE}, row percentage values are shown.}

\item{showColPerc}{If \code{TRUE}, column percentage values are shown.}

\item{showExpected}{If \code{TRUE}, expected values are also shown.}

\item{showTotalN}{If \code{TRUE}, column and row sums are also shown, even if \code{showObserved} is \code{FALSE}.}

\item{showHorizontalLine}{If \code{TRUE}, data rows are separated with a horizontal line.}

\item{showSummary}{If \code{TRUE} (default), a summary row with Chi-square statistics (see \code{\link{chisq.test}}),
Cramer's V or Phi-value etc. is shown. If a cell contains expected values lower than five (or lower than 10
if df is 1), the Fisher's excact test (see \code{\link{fisher.test}}) is computed instead of Chi-square test.
If the table's matrix is larger than 2x2, Fisher's excact test with Monte Carlo simulation is computed.}

\item{showLegend}{If \code{TRUE} (default), the color legend for coloring observed and expected
values as well as cell, row and column percentages is shown. See \code{tdcol.n},
\code{tdcol.expected}, \code{tdcol.cell}, \code{tdcol.row} and \code{tdcol.col}.}

\item{showNA}{If \code{TRUE}, \code{\link{NA}}'s (missing values) are also printed in the table.}

\item{labelNA}{The label for the missing column/row.}

\item{tdcol.n}{Color for highlighting count (observed) values in table cells. Default is black.}

\item{tdcol.expected}{Color for highlighting expected values in table cells. Default is cyan.}

\item{tdcol.cell}{Color for highlighting cell percentage values in table cells. Default is red.}

\item{tdcol.row}{Color for highlighting row percentage values in table cells. Default is blue.}

\item{tdcol.col}{Color for highlighting column percentage values in table cells. Default is green.}

\item{highlightTotal}{If \code{TRUE}, the total column and row will be highlighted with a
different background color. See \code{highlightColor}.}

\item{highlightColor}{If \code{highlightTotal} is \code{TRUE}, this color value will be used
for painting the background of the total column and row. Default is a light grey.}

\item{percSign}{The percentage sign that is printed in the table cells, in HTML-format.
Default is \code{"&nbsp;\%"}, hence the percentage sign has a non-breaking-space after
the percentage value.}

\item{hundret}{Default value that indicates the 100-percent column-sums (since rounding values
may lead to non-exact results). Default is \code{"100.0"}.}

\item{encoding}{The charset encoding used for variable and value labels. Default is \code{NULL}, so encoding
will be auto-detected depending on your platform (\code{"UTF-8"} for Unix and \code{"Windows-1252"} for
Windows OS). Change encoding if specific chars are not properly displayed (e.g.) German umlauts).}

\item{CSS}{A \code{\link{list}} with user-defined style-sheet-definitions, according to the
\href{http://www.w3.org/Style/CSS/}{official CSS syntax}. See 'Detail'.}

\item{useViewer}{If \code{TRUE}, the function tries to show the HTML table in the IDE's viewer pane. If
\code{FALSE} or no viewer available, the HTML table is opened in a web browser.}

\item{no.output}{If \code{TRUE}, the html-output is neither opened in a browser nor shown in
the viewer pane and not even saved to file. This option is useful when the html output
should be used in \code{knitr} documents. The html output can be accessed via the return
value.}

\item{remove.spaces}{logical, if \code{TRUE}, leading spaces are removed from all lines in the final string
that contains the html-data. Use this, if you want to remove parantheses for html-tags. The html-source
may look less pretty, but it may help when exporting html-tables to office tools.}
}
\value{
Invisibly returns
         \itemize{
           \item the web page style sheet (\code{page.style}),
           \item the web page content (\code{page.content}),
           \item the complete html-output (\code{output.complete}) and
           \item the html-table with inline-css for use with knitr (\code{knitr})
           }
           for further use.
}
\description{
Shows contingency tables as HTML file in browser or viewer pane, or saves them as file.
}
\details{
See 'Details' in \code{\link{sjt.frq}}.
}
\note{
See 'Notes' in \code{\link{sjt.frq}}.
}
\examples{
# prepare sample data set
library(sjmisc)
data(efc)
efc.labels <- get_val_labels(efc)

# print simple cross table w/o labels
\dontrun{
sjt.xtab(efc$e16sex, efc$e42dep)

# print cross table with labels and expected values
sjt.xtab(efc$e16sex,
         efc$e42dep,
         variableLabels = c("Elder's gender",
                            "Elder's dependency"),
         valueLabels = list(efc.labels[['e16sex']],
                            efc.labels[['e42dep']]),
         showExpected = TRUE)

# print minimal cross table with labels, total col/row highlighted
sjt.xtab(efc$e16sex, efc$e42dep,
         variableLabels = c("Elder's gender", "Elder's dependency"),
         valueLabels = list(efc.labels[['e16sex']], efc.labels[['e42dep']]),
         showHorizontalLine = FALSE,
         showCellPerc = FALSE,
         highlightTotal = TRUE)

# -------------------------------
# auto-detection of labels
# -------------------------------
efc <- set_var_labels(efc, get_var_labels(efc))
# print cross table with labels and all percentages
sjt.xtab(efc$e16sex, efc$e42dep,
         showRowPerc = TRUE,
         showColPerc = TRUE)

# print cross table with labels and all percentages, including
# grouping variable
sjt.xtab(efc$e16sex, efc$e42dep, efc$c161sex,
         variableLabels=c("Elder's gender",
                          "Elder's dependency",
                          "Carer's gender"),
         valueLabels=list(efc.labels[['e16sex']],
                          efc.labels[['e42dep']],
                          efc.labels[['c161sex']]),
         showRowPerc = TRUE,
         showColPerc = TRUE)

# ----------------------------------------------------------------
# User defined style sheet
# ----------------------------------------------------------------
sjt.xtab(efc$e16sex, efc$e42dep,
         variableLabels = c("Elder's gender", "Elder's dependency"),
         valueLabels = list(efc.labels[['e16sex']],
                            efc.labels[['e42dep']]),
         CSS = list(css.table = "border: 2px solid;",
                    css.tdata = "border: 1px solid;",
                    css.horline = "border-bottom: double blue;"))}
}
\seealso{
\itemize{
           \item \href{http://www.strengejacke.de/sjPlot/sjt.xtab}{sjPlot manual: sjt.xtab}
           \item \code{\link{sjp.xtab}}
         }
}

