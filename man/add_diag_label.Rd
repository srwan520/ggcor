% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/add-diag-label.R
\name{add_diag_label}
\alias{add_diag_label}
\title{Add dianoal labels on correlation plot}
\usage{
add_diag_label(drop = FALSE, ...)
}
\arguments{
\item{drop}{logical value (default is TRUE). When type of plot is 'upper'
or 'lower' and 'show.diag' is FALSE, whether need to remove the blank label.}

\item{...}{extra params for \code{\link[ggplot2]{geom_text}}.}
}
\description{
\code{add_grid} is mainly used with \code{ggcor} and
    \code{quickcor} functions.
}
\examples{
quickcor(mtcars, type = "upper") + geom_colour() + add_diag_label()
quickcor(mtcars, type = "lower") + geom_colour() + add_diag_label()
}
\seealso{
\code{\link[ggplot2]{geom_text}}.
}
\author{
Houyun Huang, Lei Zhou, Jian Chen, Taiyun Wei
}
