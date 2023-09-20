#libraries
# Libraries to load
libraries <- c("psych", "dplyr", "readxl") #Hier könnt ihr eure Packages laden.

# Install and load libraries
for (library_name in libraries) {
  if (!require(library_name, character.only = TRUE)) {
    install.packages(library_name, dependencies = TRUE)
    library(library_name, character.only = TRUE)
  } else {
    library(library_name, character.only = TRUE)
  }
}
