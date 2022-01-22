library(pacman)
pacman::p_load(remotes)
remotes::install_github("grantmcdermott/lecturenotes", dependencies = TRUE)
pacman::p_load_gh("grantmcdermott/lecturenotes")
  
# File > New File > R Markdown > From Template > Lecture Notes (lecturenotes)