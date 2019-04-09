coefINLA <- function(mod.inla=NULL,
                     palette="Purples", exp=FALSE, labeller=NULL,
                     intercept=TRUE, exclude=FALSE){

  '%!in%' <- function(x,y)!('%in%'(x,y))

  pal <- RColorBrewer::brewer.pal(n = 7, name = palette)

  coef_df <- data.frame()
  for(i in 1:nrow(mod.inla$summary.fixed)){

    name <- NULL
    fixed <- NULL
    d <- NULL

    name <- mod.inla$summary.fixed[i,] %>% rownames()
    fixed <- mod.inla$summary.fixed[i,] %>% as.numeric()


    if(exp == TRUE){
      d <- INLA::inla.tmarginal(exp, mod.inla$marginals.fixed[[i]]) %>% as.data.frame()
      fixed <- exp(fixed)
    } else{
      d <- mod.inla$marginals.fixed[[i]] %>% as.data.frame()
    }

    var_df <- data.frame(
      x = d$x,
      y = d$y,
      var = name,
      lower = fixed[3],
      upper = fixed[5],
      med = fixed[4]
    )

    coef_df <- rbind(coef_df, var_df)
  }

  if(intercept == FALSE){
    coef_df <- coef_df %>%
      dplyr::filter(var != "(Intercept)")
  }

  if(exclude[1] != FALSE){
    coef_df <- coef_df %>%
      dplyr::filter(var %!in% exclude)
  }

  if(is.null(labeller)){
    labeller <- labeller()
  }

  gg <- ggplot2::ggplot(coef_df, aes(x = x, y = y, group = var)) +
    ggplot2::facet_grid(var ~ . , scales = "free_y", labeller = labeller) +
    ggplot2::geom_vline(xintercept = 0, color = "grey70") +
    ggplot2::geom_line(stat = "identity", color = "grey20") +
    ggplot2::geom_ribbon(data = subset(coef_df, x > lower & x < upper),
                aes(ymax = y, ymin = 0, x = x),
                fill = pal[7], colour = NA, alpha = 0.5)  +
    ggplot2::geom_segment(data = coef_df, aes(xend = med, x = med, yend = 0), color = pal[7], lwd = .75) +
    ggplot2::scale_y_continuous(labels = NULL, minor_breaks = NULL) +
    ggplot2::theme_minimal() +
    ggplot2::theme(axis.title.y = element_blank(),
                   axis.text.y = element_blank(),
                   axis.ticks.y = element_blank(),
                   axis.line.x = element_line(color = "grey70"),
                   axis.ticks.x = element_line(color = "grey70"),
                   plot.background = element_blank(),
                   panel.grid = element_blank(),
                   panel.spacing = unit(0, "lines"),
                   strip.text.y = element_text(angle = 0)) +
    ggplot2::xlab("") +
    ggplot2::ylab("")
  return(gg)
}



