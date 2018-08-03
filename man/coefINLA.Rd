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
coefINLA(mod.inla, palette="Purples", exp=FALSE, labeller=NULL, intercept=TRUE, exclude=FALSE)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{mod.inla}{a model object produced from \code{INLA}
%%     ~~Describe \code{x} here~~
} \item{palette}{a named palette from RColorBrewer, e.g. "Purples", "Blues", "Greens". Defaults to "Purples"
} \item{exp}{exponentiate coefficients? Defaults to \code{FALSE}
} \item{labeller}{specify a pre-specified labeller to change the facet labels. Defaults to \code{NULL}, using variable column names as facet labels.
} \item{intercept}{should the model intercept be included in the graphic? \code{TRUE} by default.
} \item{exclude}{a character element or vector indicating column names of covariates to exclude from graphic.
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
library(INLA)
data(iris)

mod1 <- Sepal.Length ~ Sepal.Width + Petal.Length + Petal.Width
fit1 <- inla(mod1,
             data = iris,
             "normal")

coefINLA(fit1) +
  labs(title = "Posterior Distributions",
       subtitle = "with 95\% interval") +
  ggsave(filename = "./example.pdf", dpi = 300,
                        width = 6, height = 8)
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~hplot }% use one of  RShowDoc("KEYWORDS")
