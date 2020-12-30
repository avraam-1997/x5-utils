logRule <- function(left = "", center = "", right = "") {
  console_threshold <- lgr$appenders$console$threshold
  lgr$appenders$console$set_threshold("off")
  capture.output(cli_rule(left = left, center = center, right = right)) %>%
    purrr::walk(lgr$info)
  if (left != "") left <- style_bold(col_black(left))
  if (center != "") center <- style_bold(col_black(center))
  if (right != "") right <- col_grey(right)
  cat("\n")
  cli_rule(left = left, center = center, right = right)
  lgr$appenders$console$set_threshold(console_threshold)
}

