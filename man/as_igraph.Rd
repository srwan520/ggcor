% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/as-igraph.R
\name{as.igraph.cor_tbl}
\alias{as.igraph.cor_tbl}
\alias{as.igraph.mantel_tbl}
\alias{as.igraph.rcorr}
\alias{as.igraph.corr.test}
\alias{as.igraph.correlate}
\alias{as.igraph.cor_network}
\title{Corece to a igraph object}
\usage{
\method{as.igraph}{cor_tbl}(x, ...)

\method{as.igraph}{mantel_tbl}(x, ...)

\method{as.igraph}{rcorr}(x, ...)

\method{as.igraph}{corr.test}(x, ...)

\method{as.igraph}{correlate}(x, ...)

\method{as.igraph}{cor_network}(x, ...)
}
\arguments{
\item{x}{\code{R} object.}

\item{...}{extra params.}
}
\value{
igraph object.
}
\description{
Functions to coerce a object to igraph if possible.
}
\author{
Houyun Huang, Lei Zhou, Jian Chen, Taiyun Wei
}
