
hkcolors <- function (n, name=c("rouge", "happytogether", "infernal", "moodforlove", "chungking")) { # options for palettes

  # grDevices creates the hex colors of each palette using the RGB combination.
  rouge = rgb(c(217,242,217,115,191), c(130,223,153,34,83), c(162,235,130,26,73), maxColorValue = 255)
  happytogether = rgb(c(213,242,242,191,89), c(217,233,154,85,18), c(138,99,46,23,2), maxColorValue = 255)
  infernal = rgb(c(84,63,138,173,8), c(115,82,176,212,13), c(140,89,191,217,11), maxColorValue = 255)
  moodforlove = rgb(c(38,140,217,191,89), c(1,35,115,81, 23), c(4,44,26,17,8), maxColorValue = 255)
  chungking = rgb(c(202,90,106,217,140), c(89,39,131,32,17), c(9,140,171,7,17), maxColorValue = 255)

  # Match possible arguments (names) with the selected one
  name = match.arg(name)

  orig = eval(parse(text = name)) # parse the string
  rgb = t(col2rgb(orig))  # col2rgb() turns the hex code to rgb, t() saves this to a matrix
  temp = matrix(NA, ncol = 3, nrow = n) # create an empty matrix based on user input of number of colors
  x = seq(0, 1, , length(orig)) # create an equal range of sequence of numbers (5 total, b/c of the range of the palettes)
  xg = seq(0, 1, , n) # create an equal range of sequence of numbers (n based on user input)
  for (k in 1:3) {
    hold = spline(x, rgb[, k], n = n)$y # interpolate each of r,g, and b numbers in between default range
    hold[hold < 0] = 0
    hold[hold > 255] = 255
    temp[, k] = round(hold)
  }
  palette = rgb(temp[, 1], temp[, 2], temp[, 3], maxColorValue = 255) # final color palette, where each row is r,g,b
  palette
}
