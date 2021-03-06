% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/polya_plots.R
\name{plot_nanopolish_qc}
\alias{plot_nanopolish_qc}
\title{Plot Nanopolish polya QC}
\usage{
plot_nanopolish_qc(nanopolish_processing_info, color_palette = "Set1",
  reverse_palette = FALSE, frequency = TRUE)
}
\arguments{
\item{nanopolish_processing_info}{output of \link{get_nanopolish_processing_info}}

\item{color_palette}{RcolorBrewer palette to use}

\item{reverse_palette}{Should the palette be reversed}

\item{frequency}{show frequency plot instead of counts plot}
}
\value{
\link[ggplot2]{ggplot} object
}
\description{
Plot Nanopolish polya QC
}
