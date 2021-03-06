% Generated by roxygen2 (4.1.1): do not edit by hand
% Please edit documentation in R/classSolarMultipoint.R
\name{solarMultipointClass}
\alias{plot.solarMultipoint}
\alias{print.solarMultipoint}
\alias{solarMultipointClass}
\alias{summary.solarMultipoint}
\alias{tabplot.solarMultipoint}
\title{S3 class solarMultipoint.}
\usage{
\method{print}{solarMultipoint}(x, ...)

\method{plot}{solarMultipoint}(x, pass = 1, main, xlab, faceting = TRUE,
  ...)

\method{summary}{solarMultipoint}(object, ...)

\method{tabplot}{solarMultipoint}(object, LOD.thr = 1.5, plot.null = TRUE,
  ...)
}
\arguments{
\item{x}{An object of class \code{solarMultipoint}.}

\item{...}{Additional arguments.}

\item{pass}{Integer argument for \code{plot} method,
indicating whether which pass in multi-passs linkage scan to be plotted.
The default value is 1.}

\item{main}{An argument for \code{plot} method.}

\item{xlab}{An argument for \code{plot} method.}

\item{faceting}{An argument for \code{plot} method.
The default value is \code{TRUE}.}

\item{object}{An object of class \code{solarMultipoint}.}

\item{LOD.thr}{An argument for \code{tabplot} method.
The default value is \code{1.5}.}

\item{plot.null}{An argument for \code{tabplot} method.
The default value is \code{TRUE}.}
}
\description{
S3 class solarMultipoint.
}

