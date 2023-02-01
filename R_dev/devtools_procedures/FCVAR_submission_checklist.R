
############################################################
# CRAN Submission Procedures:
# Common sequence of builds, tests and checks.
############################################################



#-----------------------------------------------------------
# Preparing the Workspace
#-----------------------------------------------------------

# Clear workspace.
rm(list=ls(all=TRUE))

# Load package with development tools
library(devtools)

# Set working directory.

# Original:
# fcvar_dir <- '~/Research/FCVAR/GitRepo/FCVAR'
# Copied from explorer:
# 'C:\Users\le279259\Documents\Research\FCVAR\GitRepo\FCVAR'
#
# fcvar_dir <- 'C:/Users/le279259/Documents/Research/FCVAR/GitRepo/FCVAR'

# Current version for GitHub repo with R package only:
fcvar_dir <- "~/Research/FCVAR/GitRepo/FCVAR_R/FCVAR"
setwd(fcvar_dir)




#-----------------------------------------------------------
# Pre-submission procedures to update documentation.
devtools::load_all()
devtools::document()
devtools::build_manual()
#-----------------------------------------------------------


#-----------------------------------------------------------
# Local tests
#-----------------------------------------------------------

# Run these locally first to avoid embarrassment.
devtools::test()
devtools::check()


#-----------------------------------------------------------
# Online tests
#-----------------------------------------------------------

# Run these first, since they run quickly but return results with a delay.
devtools::check_win_release()
devtools::check_win_devel()

# Run this next, since it takes longer but return results quickly.
rhub_results <- rhub::check_for_cran()


#-----------------------------------------------------------
# Release and Submission
#-----------------------------------------------------------

# Standard version:
devtools::release()

# Short cut:
# devtools::submit_cran() # Shortcut without all the questions.



#-----------------------------------------------------------
# Post-submission Updates
#-----------------------------------------------------------


# After the release, an automated file CRAN-RELEASES will appear in the main directory.
# Create a tag in git as follows:
# git tag name_of_tag commit_hash
# Then push the tag, like any other commit, with this command:
# git push origin name_of_tag
# name_of_tag is usually of the form package_name_v9.9.9

# Then go to github.com and create a release linked to this tag.
# Copy the description from your NEWS.md file in the release description.

# Then delete the CRAN-RELEASES file, which will be replaced on the next release.





############################################################
#
############################################################

# After submission, check usage statistics on CRAN.

library(installr)

# fcvar_usage_dir <- "~/Research/FCVAR/UsageStats"

# The first two functions might take a good deal of time to run (depending on the date range)
RStudio_CRAN_data_folder <-
  download_RStudio_CRAN_data(START = '2022-05-01',
                             END = '2022-06-30') #,
                            # END = '2022-08-24') #,
                             # log_folder = fcvar_usage_dir)

my_RStudio_CRAN_data <- read_RStudio_CRAN_data(RStudio_CRAN_data_folder,
                                               packages = 'FCVAR')

# barplots: (more functions can easily be added in the future)
# barplot_package_users_per_day("plyr", my_RStudio_CRAN_data)
# barplot_package_users_per_day("installr", my_RStudio_CRAN_data)
barplot_package_users_per_day("FCVAR", my_RStudio_CRAN_data)



############################################################
# End
############################################################
