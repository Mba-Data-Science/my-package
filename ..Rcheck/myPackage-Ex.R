pkgname <- "myPackage"
source(file.path(R.home("share"), "R", "examples-header.R"))
options(warn = 1)
library('myPackage')

base::assign(".oldSearch", base::search(), pos = 'CheckExEnv')
base::assign(".old_wd", base::getwd(), pos = 'CheckExEnv')
cleanEx()
nameEx("hello")
### * hello

flush(stderr()); flush(stdout())

### Name: hello
### Title: Hello, World!
### Aliases: hello

### ** Examples

hello()



cleanEx()
nameEx("myPackage-package")
### * myPackage-package

flush(stderr()); flush(stdout())

### Name: myPackage-package
### Title: What the package does (short line)
### Aliases: myPackage-package myPackage
### Keywords: package

### ** Examples

# simple examples of the most important functions



### * <FOOTER>
###
cleanEx()
options(digits = 7L)
base::cat("Time elapsed: ", proc.time() - base::get("ptime", pos = 'CheckExEnv'),"\n")
grDevices::dev.off()
###
### Local variables: ***
### mode: outline-minor ***
### outline-regexp: "\\(> \\)?### [*]+" ***
### End: ***
quit('no')
