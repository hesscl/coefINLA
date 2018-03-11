\name{coefINLA}
\alias{coefINLA}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{Create ggplot for INLA fixed effects coefficients
%%  ~~function to do ... ~~
}
\description{This function takes model objects from \code{INLA} and produces a ggplot for the posterior fixed effects coefficients.
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
coefINLA(mod.inla, palette="Purples", exp=FALSE, labeller=NULL)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{mod.inla}{a model object produced from \code{INLA}
%%     ~~Describe \code{x} here~~
} \item{palette}{a named palette from RColorBrewer, e.g. "Purples", "Blues", "Greens". Defaults to "Purples"
} \item{exp}{exponentiate coefficients? Defaults to FALSE
} \item{labeller}{specify a pre-specified labeller to change the facet labels. Defaults to NULL, using variable column names as facet labels.
}
 }
\details{
%%  ~~ If necessary, more details than the description above ~~
}
\value{
%%  ~Describe the value returned
%%  If it is a LIST, use
%%  \item{comp1 }{Description of 'comp1'}
%%  \item{comp2 }{Description of 'comp2'}
%% ...
}
\references{
%% ~put references to the literature/web site here ~
}
\author{Chris Hess, University of Washington
%%  ~~who you are~~
}
\note{
%%  ~~further notes~~
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{\url{https://www.github.com/hesscl/coefINLA}
%% ~~objects to See Also as \code{\link{help}}, ~~~
}
\examples{
Forthcoming
{
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~hplot }% use one of  RShowDoc("KEYWORDS")
