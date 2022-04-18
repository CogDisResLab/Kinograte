#' Plot the normalized score
#' 
#' This function plots the normalized score. Two options available: static or interactive plot
#'
#' @param df dataframe that contains ranked genes/proteins
#' @param prec_cutoff the percentile cutoff  
#' @param title plot title
#' @param subtitle plot subtitle 
#' @param interactive boolean, option for an interactive plot. Default = TRUE
#'
#' @return dataframe of the top hits 
#' 
#' @export
#'
#' 
#' 

score_plot <- function(df, prec_cutoff = 0.8, title = "Score Plot", subtitle = "", interactive = T) {
  
  df %>% 
    dplyr::mutate_if(is.numeric, round, 3) -> df
  
  if(interactive) {
    df %>% 
      echarts4r::e_charts(name) %>% 
      echarts4r::e_step(score, legend = F) %>% 
      echarts4r::e_visual_map(score) %>% 
      echarts4r::e_x_axis(axisLabel =  list(show  = F)) %>% 
      echarts4r::e_y_axis(name = "Normalized Score", nameLocation = "center", nameGap = 40, nameTextStyle =  list()) %>% 
      echarts4r::e_mark_line(data = list(yAxis = prec_cutoff), title = "Score Cutoff", symbolSize = F, silent = T) %>% 
      echarts4r::e_tooltip(trigger = "axis") %>% 
      echarts4r::e_title(title, subtext = subtitle)
      }
  
  else {
    df %>% 
      ggplot2::ggplot(ggplot2::aes(stats::reorder(name, dplyr::desc(score)), score, group = 1)) + 
      ggplot2::geom_line() +
      ggplot2::theme_classic() +
      ggplot2::theme(axis.text.x = ggplot2::element_blank(),
                     axis.ticks.x = ggplot2::element_blank()
                     
                     ) + 
      ggplot2::geom_hline(yintercept = prec_cutoff,linetype = "dashed") + 
      ggplot2::labs(y = "Normalized Score", 
           x = "",
           title = title, 
           subtitle = subtitle
           )
  }
  
    
  
}