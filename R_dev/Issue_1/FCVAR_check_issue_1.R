# Tests and Checks after fixing issue
# with free parameters in constrained model.

devtools::load_all()

> devtools::test()
i Loading FCVAR
i Testing FCVAR
√ | F W S  OK | Context
√ |        20 | Estimation [33.9s]
√ |         9 | Postestimation [12.9s]
√ |         6 | Specification [16.1s]

== Results ========================================================================
  Duration: 62.9 s

[ FAIL 0 | WARN 0 | SKIP 0 | PASS 35 ]

> devtools::check()
-----------------------------------------------------------------------------------
  i Installed roxygen2 version (7.1.2) doesn''t match required version (7.1.1)
x check() will not re-document this package
-----------------------------------------------------------------------------------
-- Building -------------------------------------------------------------- FCVAR --
Setting env vars:
* CFLAGS    : -Wall -pedantic
* CXXFLAGS  : -Wall -pedantic
* CXX11FLAGS: -Wall -pedantic
* CXX14FLAGS: -Wall -pedantic
* CXX17FLAGS: -Wall -pedantic
* CXX20FLAGS: -Wall -pedantic
-----------------------------------------------------------------------------------
√  checking for file 'C:\Users\le279259\OneDrive - University of Central Florida\Documents\Research\FCVAR\GitRepo\FCVAR_R\FCVAR/DESCRIPTION' (1s)
-  preparing 'FCVAR': (1.2s)
√  checking DESCRIPTION meta-information ...
-  checking for LF line-endings in source and make files and shell scripts
-  checking for empty or unneeded directories
-  building 'FCVAR_0.1.1.tar.gz'

-- Checking -------------------------------------------------------------- FCVAR --
Setting env vars:
* _R_CHECK_CRAN_INCOMING_REMOTE_: FALSE
* _R_CHECK_CRAN_INCOMING_       : FALSE
* _R_CHECK_FORCE_SUGGESTS_      : FALSE
* NOT_CRAN                      : true
-- R CMD check --------------------------------------------------------------------
-  using log directory 'C:/Users/le279259/AppData/Local/Temp/RtmpOiNGJO/FCVAR.Rcheck' (486ms)
-  using R version 4.1.1 (2021-08-10)
-  using platform: x86_64-w64-mingw32 (64-bit)
-  using session charset: ISO8859-1
-  using options '--no-manual --as-cran'
√  checking for file 'FCVAR/DESCRIPTION' ...
-  this is package 'FCVAR' version '0.1.1'
-  package encoding: UTF-8
√  checking package namespace information ...
√  checking package dependencies (4.5s)
√  checking if this is a source package ...
√  checking if there is a namespace
√  checking for executable files (2.2s)
√  checking for hidden files and directories ...
√  checking for portable file names ...
√  checking whether package 'FCVAR' can be installed (7.6s)
√  checking installed package size (387ms)
√  checking package directory
√  checking for future file timestamps (940ms)
√  checking DESCRIPTION meta-information (491ms)
√  checking top-level files ...
√  checking for left-over files ...
√  checking index information ...
√  checking package subdirectories (479ms)
√  checking R files for non-ASCII characters ...
√  checking R files for syntax errors ...
√  checking whether the package can be loaded (348ms)
√  checking whether the package can be loaded with stated dependencies ...
√  checking whether the package can be unloaded cleanly ...
√  checking whether the namespace can be loaded with stated dependencies ...
√  checking whether the namespace can be unloaded cleanly (348ms)
√  checking dependencies in R code (456ms)
√  checking S3 generic/method consistency (677ms)
√  checking replacement functions ...
√  checking foreign function calls (459ms)
√  checking R code for possible problems (19.2s)
√  checking Rd files
√  checking Rd metadata
√  checking Rd line widths
√  checking Rd cross-references
√  checking for missing documentation entries
√  checking for code/documentation mismatches
√  checking Rd \usage sections
√  checking Rd contents
√  checking for unstated dependencies in examples
√  checking contents of 'data' directory
√  checking data for non-ASCII characters
√  checking LazyData
√  checking data for ASCII and uncompressed saves
√  checking examples
√  checking examples with --run-donttest (4m 36.8s)
√  checking for unstated dependencies in 'tests' ...
-  checking tests ...
√  Running 'testthat.R' [61s] (1m 0.7s)
√  checking for non-standard things in the check directory
√  checking for detritus in the temp directory


-- R CMD check results ------------------------------------------- FCVAR 0.1.1 ----
Duration: 6m 19s

0 errors √ | 0 warnings √ | 0 notes √
>






# All pass? Good. Proceed.


# Pre-submission procedures:

# Sequence of checks for submission to CRAN

# Rhub checks on Windows and Two Linux platforms:
install.packages("rhub")
library(rhub)
# rhub_results <- rhub::check_for_cran()
# rhub_results$cran_summary()
# devtools::check_win_release()
# devtools::check_win_devel()

# When all checks pass, update cran-comments.md,
# NEWS.md, and README.md.

# Then, submit to CRAN:

# This way, you get a series of questions to
# run through a checklist:
# devtools::release()

# This way is a short cut,
# which skips all the questions:
# devtools::submit_cran()


# Then wait anxiously for a response.





# Now make more rigorous tests for submission.


# > library(rhub)
#
# > rhub_results <- rhub::check_for_cran()
#
# rhub_results$cran_summary()


# Found problems related to differences in numerical precision across platforms.
# expect_equal(10, 10)
# expect_equal(10, 10 + 1e-7)
# expect_equal(10, 10 + 1e-6)
# expect_equal(10, 11)



# Common sequence of builds, tests and checks.
devtools::load_all()
devtools::document()
devtools::build_manual()
# Run these locally first to avoid embarrassment.
devtools::test()
devtools::check()
# Run these first, since they run quickly but return results with a delay.
devtools::check_win_release()
devtools::check_win_devel()
# Run this next, since it takes longer but return results quickly.
rhub_results <- rhub::check_for_cran()
devtools::release()
# devtools::submit_cran() # Shortcut without all the questions.


# After the release, an automated file CRAN-RELEASES will appear in the main directory.
# Create a tag in git as follows:
# git tag name_of_tag commit_hash
# Then push the tag, like any other commit, with this command:
# git push origin name_of_tag
# name_of_tag is usually of the form package_name_v9.9.9

# Then go to github.com and create a release linked to this tag.
# Copy the description from your NEWS.md file in the release description.

# Then delete the CRAN-RELEASES file, which will be replaced on the next release.


