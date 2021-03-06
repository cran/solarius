% Generated by roxygen2 (4.1.1): do not edit by hand
% Please edit documentation in R/solarPolygenic.R
\name{solarPolygenic}
\alias{solarPolygenic}
\title{Run polygenic analysis.}
\usage{
solarPolygenic(formula, data, dir, kinship, traits, covlist = "1",
  covtest = FALSE, screen = FALSE, household = as.logical(NA),
  transforms = character(0), alpha = 0.05, polygenic.settings = "",
  polygenic.options = "", verbose = 0, ...)
}
\arguments{
\item{formula}{an object of class \code{formula} or one that can be coerced to that class.
It is a symbolic description of fixed effects (covariates) to be fitted.
If the model does not have any covariates, then the formula looks like
\code{trait ~ 1}, where \code{1} means the trait mean parameter.}

\item{data}{A data frame containing the variables in the model,
including ID fields needed to construct random effects: genetic and house-hold (both optional).
Other classes such as list, environment or object coercible by \code{as.data.frame} to a data frame
are not supported.}

\item{dir}{an optional character string, the name of directory,
where SOLAR performs the analysis.
In this case, the analysis within related input/output files is
conducted in the given folder instead of a temporary one
(the default work flow).}

\item{kinship}{A matrix of the kinship coefficients (custom kinship matrix).
The IDs are required to be in row and column names.
Currently, it does not work for unrelated individuals (SOLAR issue).}

\item{traits}{a vector of characters to specify trait(s) in the model. It is alternative to the formula interface.}

\item{covlist}{a vector of characters to specify fixed effects (covariates) in the model.
It is alternative to the formula interface.
It could be convenient to indicate covariates in the SOLAR format,
for example, \code{"age^1,2,3#sex"} that means \code{sex age agesex age^2 age^2sex age^3 age^3*sex}.
The default value is \code{"1"}.}

\item{covtest}{a logical value, indicating whether to test the significance of the fixed effects (covariates).
Likelihood ratio test (LRT) is used by SOLAR.
\code{polygenic} SOLAR command is called with a combination of \code{-screen -all} options.
As a result, \code{cf} slot will have p-values in \code{pval} column.
The default value is \code{FALSE}.}

\item{screen}{a logical value, indicating whether to screen the fixed effects (covariates).
\code{polygenic} SOLAR command is called with \code{-screen} option.
As a result, only significant covariates will be maintained in the model.
The default value is \code{FALSE}.}

\item{household}{a logical value, saying to \strong{forcedly} include or exclude the house-hold effect.
The default value is \code{as.logical(NA)}, that means the following behavior in SOLAR.
If \code{data} has \code{hhid} or similar column,
then the house-hold effect is added to the model and tested by SOLAR.
Otherwise, there is no any variable indicating the house-hold effect
neither in \code{data} nor in the model.
If \code{household} is \code{TRUE}, then \code{polygenic} SOLAR command is called
with \code{-keephouse} option.
If \code{household} is \code{FALSE}, then \code{house} SOLAR command
is not called previously to calling \code{polygenic} SOLAR command
(modeling of the house-hold effect is omitted).}

\item{transforms}{a named vector of characters, indicating the transformations to be applied to traits.
A list of available transforms is returned by function \code{\link{availableTransforms}}.
If the model is univariate, the name of transformation is not necessary and can be omitted.
The default value is \code{character(0)}.}

\item{alpha}{a number between 0 an 1, that is the value of
\code{-prob} option of \code{polygenic} SOLAR command.
That is the probability level for keeping covariates as significant.
The default value in SOLAR is 0.1,
but the default value here is \code{0.05}.
This parameter makes the \code{polygenic} SOLAR call to be like \code{polygenic -prob 0.05}.}

\item{polygenic.settings}{A vector of characters, that contains SOLAR commands to be executed just before calling \code{polygenic}.
For example, the liability threshold model applied to a binary trait (the default behavior in SOLAR).
This behavior is disabled by setting the given argument to \code{"option EnableDiscrete 0"}.
The default value is \code{""}.}

\item{polygenic.options}{A character of options to be passed to \code{polygenic} SOLAR command.
For example, the comprehensive analysis of a bivariate model might be parametrized
by setting this parameter to \code{"-testrhoe -testrhog -testrhoc -testrhop -rhopse"}.
See SOLAR help page for \code{polygenic} command for more details
(\url{http://solar.txbiomedgenetics.org/doc/91.appendix_1_text.html#polygenic}).
The default value is \code{""}.}

\item{verbose}{An non-negative integer of the verbose level.
The default value is \code{0}.}

\item{...}{additional parameters to be passed to other functions called inside of \code{solarPolygenic}.
   For example, it might be a parameter \code{log.base} for \code{\link{transformTrait}} function
   in the case \code{transform} is equal to \code{"log"}.}
}
\value{
An object of \code{solarPolygenic} class. See \code{\link{solarPolygenicClass}}.
}
\description{
The polygenic analysis is conducted in the following sequence:
export data to a directory by \code{\link{df2solar}} function,
form a SOLAR call with a list of settings and options,
execute SOLAR by \code{\link{solar}} function,
parse output files and
store results in an object of \code{solarPolygenic} class (see \code{\link{solarPolygenicClass}}).
}
\examples{
### load data and check out ID names
data(dat30)
matchIdNames(names(dat30))

\dontrun{
### basic (univariate) polygenic model
mod <- solarPolygenic(trait1 ~ age + sex, dat30)

### (univariate) polygenic model with parameters
mod <- solarPolygenic(trait1 ~ age + sex, dat30, covtest = TRUE)
mod$cf # look at test statistics for covariates

### basic (bivariate) polygenic model
mod <- solarPolygenic(trait1 + trait2 ~ 1, dat30)
mod$vcf # look at variance components

### (bivariate) polygenic model with trait specific covariates
mod <- solarPolygenic(trait1 + trait2 ~ age + sex(trait1), dat30)

### (bivariate) polygenic model with a test of the genetic correlation
mod <- solarPolygenic(trait1 + trait2 ~ 1, dat30, polygenic.options = "-testrhog")
mod$lf # look at a p-value of the test

### transforms for (univariate) polygenic model
mod <- mod <- solarPolygenic(trait1 ~ 1, dat30, transforms = "log")

### transforms for (bivariate) polygenic model
mod <- solarPolygenic(trait1 + trait2 ~ 1, dat30,
   transforms = c(trait1 = "log", trait2 = "inormal"))

### SOLAR format of introducing covariates
mod <- solarPolygenic(traits = "trait1", covlist = "age^1,2,3#sex", data =  dat30)
mod$cf # 8 covariate terms will be printed

}
}

