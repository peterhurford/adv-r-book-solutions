### Write a function that opens a graphics device, runs the supplied code, and closes the graphics device (always, regardless of whether or not the plotting code worked).

plot.pdf <- function(path, code) {
  pdf(path)
  on.exit(dev.off())
  force(code)
}

# Successfully make plot
plot.pdf("~/Desktop/plot1.pdf",{x <- seq(0,100); plot(x,x^2)})

# This code has an error
plot.pdf("~/Desktop/plot2.pdf",{})
