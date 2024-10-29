# ASAR DEMO
# Application of ASAR to a recently published stock assessment report
# petrale sole (U.S. West Coast)
install.packages('remotes')
install.packages('tinytex')
library(tinytex)
remotes::install_github("nmfs-ost/asar")
remotes::install_github("nmfs-ost/satf")
# Load here to form relative paths for files
library(here)

# Convert output file from SS3
asar::convert_output(output_file = "Report.sso",
                     outdir = here("asar_example"),
                     model = "ss3",
                     file_save = TRUE,
                     savedir = here("asar_example"),
                     save_name = "petrale_convert_output")
output <- read.csv(here("asar_example","petrale_convert_output.csv"))

# Create blank stock assessment report template
asar::create_template(format = "pdf",
                      office = "NWFSC",
                      region = "U.S. West Coast",
                      species = "Petrale sole",
                      spp_latin = "Eopsetta jordani",
                      year = 2023,
                      file_dir = here("asar_example"),
                      author = c("Ian G. Taylor", "Vladlena Gertseva", "Nick Tolimieri"),
                      include_affiliation = TRUE,
                      simple_affiliation = FALSE,
                      param_names = c("nf","sf"),
                      param_values = c("North fleet", "South fleet"),
                      resdir = here("asar_example"),
                      model_results = "petrale_convert_output.csv", # "Report.sso"
                      model = "SS3",
                      # new_section = "Management",
                      # section_location = "after-modeling_approach",
                      )



#### Checks ####

# stock recruitment
  # get_ncol <- function(file, skip = 0) {
  #   nummax <- max(utils::count.fields(file,
  #                                     skip = skip, quote = "",
  #                                     comment.char = ""
  #   )) + 1
  #   return(nummax)
  # }
  # output_chk <- read.table(
  #   file = here("asar_example","Report.sso"),
  #   col.names = 1:get_ncol(here("asar_example","Report.sso")), fill = TRUE, quote = "",
  #   colClasses = "character", nrows = -1, comment.char = "",
  #   blank.lines.skip = FALSE
  # )
