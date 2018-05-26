# coefINLA
ggplot for INLA Fixed Effect Coefficients

### This R package provides high-level graphics functions for converting INLA model output into aesthetically-pleasing ggplot2-based visualizations.

You can get it using:
```r
devtools::install_github("hesscl/coefINLA")
```
 <br>
 
 `coefINLA()` is currently the only function in this library, and requires an `INLA` model as it's main argument (`mod.inla`) 
  - For exponentiated coefficients, set argument `exp = TRUE`
  - To omit the intercept, set argument `intercept = FALSE`
  - To exclude one or more covariates, set argument `exclude = 'varname'` or include multiple colnames with `c()`
  - For custom facet labels, save `your_labeller()` for ggplot, and utilize this with the function's `labeller` argument.
  - You can also pass a character string corresponding to a RColorBrewer palette (e.g. "Reds", "Blues") if purple isn't your thing.
  - The type of visualization this plot returns is akin to [`bayesplot::mcmc_areas()`](https://github.com/stan-dev/bayesplot#examples). 
	- Instead of showing a colored ribbon for the middle 80%, `coefINLA()` uses the middle 95% and is based on integrated nested laplace approximation (cuz' you're using `INLA`).
  - This function returns a ggplot as its output. This means you can either use the default plot configuration OR you can still pipe additional graphics helper functions for customizing labels or other aspects of the plot. 
  - See example syntax below
  
### Example default graphic using iris 

![alt text](https://github.com/hesscl/coefINLA/blob/master/example.png "example graphic")

  
### Example syntax:
  
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
  
#remove intercept  
coefINLA(mod1, intercept = FALSE)

#save plot with title to pdf
coefINLA(mod1) + 
  labs(title = "My fancy title") +
  ggsave(filename = "my fancy file.pdf")
```
