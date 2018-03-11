# coefINLA
ggplot for INLA Fixed Effect Coefficients

### This R package is very early in development, but is intended to provide high-level graphics functions for converting `INLA` model output into aesthetically-pleasing `ggplot2`-based visualizations.

You can get it using:
```r
devtools::install_github("hesscl/coefINLA")
```
 
 `coefINLA()` is currently the only function in this library, and accepts a `INLA` model as it's main argument (`mod.inla` is `NULL` by default). 
  - You can also pass a character string corresponding to a RColorBrewer palette (e.g. "Reds", "Blues") if purple isn't your thing (Go Dawgs).
  - The type of visualization this plot returns is akin to [`bayesplot::mcmc_areas()`](https://github.com/stan-dev/bayesplot#examples). Instead of showing a colored ribbon for the middle 80%, `coefINLA()` uses the middle 95% and is based on integrated nested laplace approximation (cuz' you're using `INLA`).
  - This function returns a ggplot as it's output. This means you can either use the default plot configuration OR you can still pipe additional graphics helper functions for customizing labels or other aspects of the plot. See examples below.
  
### Examples:
  
```r
#setup your model, run it through INLA
mod1 <- inla(form1, data = df, ...)

#default
coefINLA(mod1)

#for those that don't like purple...
coefINLA(mod1, "Blues")

#add title
coefINLA(mod1) +
  labs(title = "My fancy title")

#save plot with title to pdf
coefINLA(mod.inla) + 
  labs(title = "My fancy title") +
  ggsave(filename = "my fancy file.pdf")


  ```
