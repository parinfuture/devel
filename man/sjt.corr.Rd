% Generated by roxygen2 (4.1.1): do not edit by hand
% Please edit documentation in R/sjTabCorr.R
\name{sjt.corr}
\alias{sjt.corr}
\title{Show correlations as HTML table}
\usage{
sjt.corr(data, missingDeletion = "pairwise", corMethod = "spearman",
  title = NULL, showPValues = TRUE, pvaluesAsNumbers = FALSE,
  fadeNS = TRUE, file = NULL, varlabels = NULL, breakLabelsAt = 40,
  digits = 3, triangle = "both", val.rm = NULL, stringDiagonal = NULL,
  encoding = NULL, CSS = NULL, useViewer = TRUE, no.output = FALSE,
  remove.spaces = TRUE)
}
\arguments{
\item{data}{a matrix with correlation coefficients as returned by the
\code{\link{cor}}-function, or a \code{\link{data.frame}} of variables that
should be correlated.}

\item{missingDeletion}{Indicates how missing values are treated. May be either
\code{"listwise"} or \code{"pairwise"} (default).}

\item{corMethod}{Indicates the correlation computation method. May be one of
\code{"spearman"} (default), \code{"pearson"} or \code{"kendall"}.}

\item{title}{A table caption as character. By default, \code{title} is \code{NULL}, hence no title will be used.}

\item{showPValues}{Whether significance levels (p-values) of correlations should
be printed or not. See 'Note'.}

\item{pvaluesAsNumbers}{If \code{TRUE}, the significance levels (p-values) are printed as numbers.
if \code{FALSE} (default), asterisks are used. See 'Note'.}

\item{fadeNS}{If \code{TRUE} (default), non-significant correlation-values appear faded (by using
a lighter grey text color). See 'Note'.}

\item{file}{The destination file, which will be in html-format. If no filepath is specified,
the file will be saved as temporary file and openend either in the RStudio View pane or
in the default web browser.}

\item{varlabels}{The item labels that are printed along the first column/row. If no item labels are
provided (default), the data frame's column names are used. Item labels must
be a string vector, e.g.: \code{varlabels=c("Var 1", "Var 2", "Var 3")}.
varlabels are detected automatically if \code{data} is a \code{\link{data.frame}} where each variable has
a variable label attribute (see \code{\link[sjmisc]{set_var_labels}}) for details).}

\item{breakLabelsAt}{Wordwrap for diagram labels. Determines how many chars of the variable labels are displayed in
one line and when a line break is inserted. Default is 40.}

\item{digits}{The amount of digits used the values inside table cells.
Default is 2.}

\item{triangle}{Indicates whether only the upper right (use \code{"upper"}), lower left (use \code{"lower"})
or both (use \code{"both"}) triangles of the correlation table is filled with values. Default
is \code{"both"}. You can specifiy the inital letter only.}

\item{val.rm}{Specify a number between 0 and 1 to suppress the output of correlation values
that are smaller than \code{val.rm}. The absolute correlation values are used, so
a correlation value of -.5 would be greater than \code{"val.rm=.4"} and thus not be
omitted. By default, this parameter is \code{NULL}, hence all values are shown in the table.
If a correlation value is below the specified value of \code{val.rm}, it is still printed to
the HTML table, but made "invisible" with white foreground color. You can use the \code{CSS}
parameter (\code{"css.valueremove"}) to change color and appearance of those correlation value that are smaller than
the limit specified by \code{val.rm}.}

\item{stringDiagonal}{a vector with string values of the same length as \code{ncol(data)} (number of
correlated items) that can be used to display content in the diagonal cells
where row and column item are identical (i.e. the "self-correlation"). By defauilt,
this parameter is \code{NULL} and the diagnal cells are empty.}

\item{encoding}{The charset encoding used for variable and value labels. Default is \code{NULL}, so encoding
will be auto-detected depending on your platform (\code{"UTF-8"} for Unix and \code{"Windows-1252"} for
Windows OS). Change encoding if specific chars are not properly displayed (e.g.) German umlauts).}

\item{CSS}{A \code{\link{list}} with user-defined style-sheet-definitions, according to the
\href{http://www.w3.org/Style/CSS/}{official CSS syntax}. See 'Details'.}

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
Shows the results of a computed correlation as HTML table. Requires either
               a \code{\link{data.frame}} or a matrix with correlation coefficients
               as returned by the \code{\link{cor}}-function.
}
\details{
See 'Details' in \code{\link{sjt.frq}}.
}
\note{
If \code{data} is a matrix with correlation coefficients as returned by
      the \code{\link{cor}}-function, p-values can't be computed.
      Thus, \code{showPValues}, \code{pvaluesAsNumbers} and \code{fadeNS}
      only have an effect if \code{data} is a \code{\link{data.frame}}.
      \cr \cr
      Additionally, see 'Note' in \code{\link{sjt.frq}}.
}
\examples{
\dontrun{
# create data frame with 5 random variables
mydf <- data.frame(cbind(runif(10),
                         runif(10),
                         runif(10),
                         runif(10),
                         runif(10)))

# plot correlation matrix using circles
sjt.corr(mydf)

# -------------------------------
# Data from the EUROFAMCARE sample dataset
# -------------------------------
library(sjmisc)
data(efc)

# retrieve variable and value labels
varlabs <- get_var_labels(efc)

# recveive first item of COPE-index scale
start <- which(colnames(efc) == "c83cop2")
# recveive last item of COPE-index scale
end <- which(colnames(efc) == "c88cop7")

# create data frame with COPE-index scale
mydf <- data.frame(efc[, c(start:end)])
colnames(mydf) <- varlabs[c(start:end)]

# we have high correlations here, because all items
# belong to one factor. See example from "sjp.pca".
sjt.corr(mydf, pvaluesAsNumbers = TRUE)

# -------------------------------
# auto-detection of labels, only lower triangle
# -------------------------------
sjt.corr(efc[, c(start:end)], triangle = "lower")

# -------------------------------
# auto-detection of labels, only lower triangle,
# all correlation values smaller than 0.3 are not
# shown in the table
# -------------------------------
sjt.corr(efc[, c(start:end)],
         triangle = "lower",
         val.rm = 0.3)

# -------------------------------
# auto-detection of labels, only lower triangle,
# all correlation values smaller than 0.3 are printed
# in blue
# -------------------------------
sjt.corr(efc[, c(start:end)],
         triangle = "lower",
         val.rm = 0.3,
         CSS = list(css.valueremove = 'color:blue;'))}
}
\seealso{
\itemize{
          \item \href{http://www.strengejacke.de/sjPlot/sjt.corr}{sjPlot manual: sjt.corr}
          \item \code{\link{sjp.corr}}
         }
}

