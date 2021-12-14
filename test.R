#!/applications/R/R-4.0.0/bin/Rscript

# Usage - Condor submission on node7:
# /scripts/csmit -m 1G -c 1 "/applications/R/R-4.0.0/bin/Rscript test.R"

# Or to avoid having to specify the R installation path:
# chmod +x test.R
# /scripts/csmit -m 1G -c 1 "./test.R"

print("this is a test")
