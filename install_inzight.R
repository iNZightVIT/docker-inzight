# install CRAN packages:
install.packages("remotes")

pkgs <- c("iNZightTools", "iNZightTS", "iNZightMR", "iNZightPlots", "iNZightRegression", "iNZight",
    "iNZightModules", "FutureLearnData")

# install once
for (pkg in pkgs) remotes::install_github(sprintf("iNZightVIT/%s", pkg), upgrade = "always")

# install - in reverse - to get suggests
for (pkg in rev(pkgs)) remotes::install_github(sprintf("iNZightVIT/%s", pkg), dependencies = TRUE, force = TRUE, upgrade = "always")
