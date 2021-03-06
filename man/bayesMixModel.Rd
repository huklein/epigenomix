\name{bayesMixModel}
\alias{bayesMixModel}
\alias{bayesMixModel,numeric-method}

\title{
  Fits a Bayesian mixture model using Markov Chain Monte Carlo (MCMC) methods
}

\description{
  This method estimates the posterior distribution of a Bayesian mixture
  model using Markov Chain Monte Carlo (MCMC) methods and calculates measures of this distribution.
  The mixture model may consist of normal components (with a fixed expectation of 0),
  exponential components and gamma components, which may be mirrored in order to model
  negative values.  
}

\usage{
bayesMixModel(z, normNull=c(), expNeg=c(), expPos=c(), gamNeg=c(), gamPos=c(), sdNormNullInit=c(), rateExpNegInit=c(), rateExpPosInit=c(), shapeGamNegInit=c(), scaleGamNegInit=c(), shapeGamPosInit=c(), scaleGamPosInit=c(), piInit, classificationsInit, dirichletParInit=1, shapeDir=1, scaleDir=1, weightsPrior="FDD", sdAlpha, shapeNorm0=c(), scaleNorm0=c(), shapeExpNeg0=c(), scaleExpNeg0=c(), shapeExpPos0=c(), scaleExpPos0=c(), shapeGamNegAlpha0=c(), shapeGamNegBeta0=c(), scaleGamNegAlpha0=c(), scaleGamNegBeta0=c(), shapeGamPosAlpha0=c(), shapeGamPosBeta0=c(), scaleGamPosAlpha0=c(), scaleGamPosBeta0=c(), itb, nmc, thin, average="mean",sdShape)
}


\arguments{
  \item{z}{
    Observed values
  }
  \item{normNull}{
    Indices of the normal components (that have \eqn{\mu=0}{mu=0}).
  }
  \item{expNeg}{
    Indices of the mirrored exponential components.
  }
  \item{expPos}{
    Indices of the exponential components.
  }
  \item{gamNeg}{
    Indices of the mirrored gamma components.
  }
  \item{gamPos}{
    Indices of the gamma components.
  }
  \item{sdNormNullInit}{
    Initial standard deviations of the normal components.
  }
  \item{rateExpNegInit}{
    Initial rates of the mirrored exponential components. Only relevant if mirrored exponential components are specified.
  }
  \item{rateExpPosInit}{
    Initial rates of the exponential components. Only relevant if exponential components are specified.
  }
  \item{shapeGamNegInit}{
    Initial shape parameters of the mirrored gamma components. Only relevant if mirrored Gamma components are specified.
  }
  \item{scaleGamNegInit}{
    Initial scale parameters of the mirrored gamma components. Only relevant if mirrored Gamma components are specified.
  }
  \item{shapeGamPosInit}{
    Initial shape parameters of the gamma components. Only relevant if Gamma components are specified.
  }
  \item{scaleGamPosInit}{
    Initial scale parameters of the gamma components. Only relevant if Gamma components are specified.
  }
  \item{piInit}{
    Initial weights of the components. If missing, all k components
    get the same initial weight 1/k.
  }
  \item{classificationsInit}{
    Initial classifications of the data points. If missing, all data
    points are assigned to class floor(k/2) with k = number of components.
  }
  \item{dirichletParInit}{
    Initial concentration parameter of prior distribution assigned to the mixture weights.
  }
  \item{shapeDir}{
    Prior shape parameter of Gamma distribution for concentration parameter of
    prior distribution assigned to the mixture weights.
  }
  \item{scaleDir}{
    Prior scale parameter of Gamma distribution for concentration parameter of
    prior distribution assigned to the mixture weights.
  }
  \item{weightsPrior}{
    Prior distribution assigned to mixture weights. Available are the Finite-dimensional Dirichlet prior ("FDD"), also known as Dirichlet-multinomial process, and the Truncated Dirichlet process ("TDP"). Both are approximations to the Dirichlet process for a large number of components, while the Finite-dimensional Dirichlet prior is also suited for a small number of components as a special case of the Dirichlet distribution.
  }
  \item{sdAlpha}{
    Standard deviation of proposal distribution for concentration parameter of the prior distribution assigned to the mixture weights in the Metropolis-Hastings step incorporated in the Gibbs sampler. Only relevant if \code{weightsPrior="FDD"}.
  }
  \item{shapeNorm0}{
    Prior shape parameter of Gamma distribution for precision of normal components. 
  }
  \item{scaleNorm0}{
    Prior scale parameter of Gamma distribution for precision of normal components.
  }
  \item{shapeExpNeg0}{
    Prior shape parameter of Gamma distribution for parameter of mirrored exponential components. Only relevant if mirrored exponential components are specified.
  }
  \item{scaleExpNeg0}{
    Prior scale parameter of Gamma distribution for parameter of mirrored exponential components. Only relevant if mirrored exponential components are specified.
  }
  \item{shapeExpPos0}{
    Prior shape parameter of Gamma distribution for parameter of exponential components. Only relevant if exponential components are specified.
  }
  \item{scaleExpPos0}{
    Prior scale parameter of Gamma distribution for parameter of exponential components. Only relevant if exponential components are specified.
  }
  \item{shapeGamNegAlpha0}{
    Prior shape parameter of Gamma distribution for shape parameter of mirrored Gamma components. Only relevant if mirrored Gamma components are specified.
  }
  \item{shapeGamNegBeta0}{
    Prior scale parameter of Gamma distribution for shape parameter of mirrored Gamma components. Only relevant if mirrored Gamma components are specified.
  }
  \item{scaleGamNegAlpha0}{
    Prior shape parameter of Gamma distribution for scale parameter of mirrored Gamma components. Only relevant if mirrored Gamma components are specified.
  }
  \item{scaleGamNegBeta0}{
    Prior scale parameter of Gamma distribution for scale parameter of mirrored Gamma components. Only relevant if mirrored Gamma components are specified.
  }
  \item{shapeGamPosAlpha0}{
    Prior shape parameter of Gamma distribution for shape parameter of Gamma components. Only relevant if Gamma components are specified.
  }
  \item{shapeGamPosBeta0}{
    Prior scale parameter of Gamma distribution for shape parameter of Gamma components. Only relevant if Gamma components are specified.
  }
  \item{scaleGamPosAlpha0}{
    Prior shape parameter of Gamma distribution for scale parameter of Gamma components. Only relevant if Gamma components are specified.
  }
  \item{scaleGamPosBeta0}{
    Prior scale parameter of Gamma distribution for scale parameter of Gamma components. Only relevant if Gamma components are specified.
  }
  \item{itb}{
    Number of iterations used for burn-in.
  }
  \item{nmc}{
    Number of iterations after burn-in used for analysis.
  }
  \item{thin}{
    Thinning value for the iterations after burn-in.
  }
  \item{average}{
    Way of averaging across the posterior distribution to obtain estimates of model parameters. Either \code{average="mean"} or \code{average="median"}.
    Note: For the allocation to components, results are given for posterior mean, median and maximum density regardless of the specification.
  }
  \item{sdShape}{
    Standard deviation of proposal distribution for shape parameter of Gamma components in the Metropolis-Hastings step incorporated in the Gibbs sampler. Only relevant if Gamma components are specified.
  }
}

\details{
  The convergence of Markov chains must be assessed prior to an
  interpretation of results. Inspection of trace plots via
  \code{\link{plotChains}} is therefore urgently recommended.
  Iterations during which one of the chains has not yet reached stationarity should not be taken into account for analysis
  and can be excluded by setting an appropriate burn-in value \code{itb}.
  Autocorrelation between subsequent chain values can be reduced by thinning the chain, setting an appropriate value for \code{thin}.
  To ensure a sufficient number of iterations for the chains after the burn-in, \code{nmc} should be increased when the thinning is increased.
  The standard deviations of the proposal distribution in a Metropolis-Hastings step should be tuned to achieve a medium-level acceptance rate (e.g., 0.3-0.7):
  A very low acceptance rate would cause a long running time of the algorithm, while a very high acceptance rate
  typically leads to autocorrelation between the values of the chain. Acceptance is documented for each iteration in the \code{chains} slot of objects of class \code{\link{MixModelBayes-class}}. 
}

\value{
  An object of class \code{\link{MixModelBayes-class}} storing results, data,
  priors, initial values and information about convergence.
}

\author{
  Martin Schaefer (martin.schaefer@udo.edu)
}

\seealso{
  \code{\link{plotChains}}, \code{\link{MixModelBayes-class}}
}

\examples{
set.seed(1000)
z <- c(rnorm(1000, 0, 0.5), rnorm(1000, 0, 1))
mm <- bayesMixModel(z, normNull=1:2, sdNormNullInit=c(0.1, 0.2),
  piInit=c(1/2, 1/2), shapeNorm0=c(1, 1), scaleNorm0=c(1, 1),
  shapeExpNeg0=c(), scaleExpNeg0=c(), 
  shapeExpPos0=c(), scaleExpPos0=c(), sdAlpha=1, itb=100, nmc=1000, thin=10)
mm
plotComponents(mm)
plotChains(mm, chain="pi")

z <- c(rnorm(200, 0, 1), rnorm(200, 0, 5), rexp(200, 0.1), -rexp(200, 0.1))
mm <- bayesMixModel(z, normNull=1:2, gamNeg=3, gamPos=4,
  sdNormNullInit=c(1, 1),
  shapeGamNegInit=1, scaleGamNegInit=1, shapeGamPosInit=1, scaleGamPosInit=1,
  shapeNorm0=c(1,3), scaleNorm0=c(1,3), sdAlpha=1,
  shapeGamNegAlpha0=1, shapeGamNegBeta0=1,
  scaleGamNegAlpha0=1, scaleGamNegBeta0=1,
  shapeGamPosAlpha0=1, shapeGamPosBeta0=1,
  scaleGamPosAlpha0=1, scaleGamPosBeta0=1, sdShape=0.025, 
  itb=100, nmc=1000, thin=10)
mm
plotComponents(mm)
plotChains(mm, chain="pi")
}

