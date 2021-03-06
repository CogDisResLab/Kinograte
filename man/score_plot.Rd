% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/score_plot.R
\name{score_plot}
\alias{score_plot}
\title{Plot the normalized score}
\usage{
score_plot(
  df,
  prec_cutoff = 0.8,
  title = "Score Plot",
  subtitle = "",
  interactive = T
)
}
\arguments{
\item{df}{dataframe that contains ranked genes/proteins}

\item{prec_cutoff}{the percentile cutoff}

\item{title}{plot title}

\item{subtitle}{plot subtitle}

\item{interactive}{boolean, option for an interactive plot. Default = TRUE}
}
\value{
dataframe of the top hits
}
\description{
This function plots the normalized score. Two options available: static or interactive plot
}
