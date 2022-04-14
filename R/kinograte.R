#' Integrate omic datasets using PCSF 
#' 
#' This function integrates omic datasets using prize-collecting Steiner forest (PCSF) algorithm
#'
#' @param df combined ranked omic datasets
#' @param ppi_network dataframe of protein-protein interactions
#' @param seed (optional) set seed number
#' @param n An integer value to determine the number of runs with random noise added edge costs. A default value is 10.
#' @param w A numeric value for tuning the number of trees in the output. A default value is 2.
#' @param r A numeric value to determine additional random noise to edge costs. A random noise upto r percent of the edge cost is added to each edge. A default value is 0.1
#' @param b A numeric value for tuning the node prizes. A default value is 1.
#' @param mu A numeric value for a hub penalization. A default value is 0.0005.
#'
#' @return list(network, nodes, edges)
#' 
#' @export
#'


kinograte <- function(df, ppi_network, n = 10, w = 10, r = 0.1, b = 2, mu = 0.005,seed = NULL) {
  
  
  terms <- df$prize
  names(terms) <- df$name
  
  ppi_net <- base::as.data.frame(ppi_net)
  ppi <- PCSF::construct_interactome(ppi_net)
  
  # running pcsf 
  if(!is.null(seed)) {
    base::set.seed(seed)
  }
  
  subnet <- PCSF::PCSF_rand(ppi, terms, n = n , w = w, r = r, b = b, mu = mu)
  

  # tidying data
  igraph::as_data_frame(subnet, what = c("edges", "vertices", "both")) -> edges
  
  
  nodes <- dplyr::tibble(Protein = c(edges$from %>% base::unique(), edges$to %>% base::unique())) %>% 
    dplyr::distinct()
  
  dplyr::left_join(nodes, df,  by = c("Protein" = "name")) %>% 
    dplyr::mutate(type = ifelse(is.na(type), "Hidden", type), 
           prize = ifelse(is.na(prize), 2, prize)) -> nodes
  
  
  return(
    list(
      network = subnet,
      nodes = nodes,
      edges = edges
    )
  )
  
}