% Generated by roxygen2 (4.1.1): do not edit by hand
% Please edit documentation in R/modelPar.R
\name{modelPar}
\alias{modelPar}
\alias{modelParCPUtime}
\alias{modelParCores}
\alias{modelParNumBatches}
\title{Get a parameter value from \code{solarius} models.}
\usage{
modelPar(mod, par, ...)

modelParCPUtime(mod, format = "sec", ...)

modelParCores(mod)

modelParNumBatches(mod)
}
\arguments{
\item{mod}{An object of \code{solarPolygenic}, \code{solarMultipoint} or \code{solarAssoc} classes.
See \code{\link{solarPolygenicClass}}, \code{\link{solarMultipointClass}} and \code{\link{solarAssocClass}}.}

\item{par}{A character, the parameter name.}

\item{...}{Additional arguments.}

\item{format}{A character, the format of the time value.
   The default value is \code{"sec"}. The second possible value is \code{"POSIX"}.
   This argument is only for \code{modelParCPUtime} function.}
}
\value{
A value of the given parameter.
}
\description{
Get a parameter value from \code{solarius} models.
}

