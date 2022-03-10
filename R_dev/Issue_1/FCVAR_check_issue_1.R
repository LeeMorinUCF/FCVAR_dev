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







# All pass? Good. Proceed.


# Pre-submission procedures:

# Sequence of checks for submission to CRAN

# Rhub checks on Windows and Two Linux platforms:
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


