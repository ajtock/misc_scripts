#!/applications/R/R-3.5.0/bin/Rscript

# Usage:
# /applications/R/R-3.5.0/bin/Rscript forLoopIterations.R 1 10

args <- commandArgs(trailingOnly = TRUE)
loopStart <- as.integer(args[1])
loopStop <- as.integer(args[2])

loopIters <- NULL
for(i in loopStart:loopStop) {
  loopIters <- c(loopIters, i)
}
write.table(loopIters,
            file = paste0("loopIters_loopStart", loopStart, "_loopStop", loopStop, ".txt"),
            row.names = F, col.names = F)
