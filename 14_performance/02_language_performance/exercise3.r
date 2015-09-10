### How does the performance of S3 method dispatch change with the length of the class vector?

f <- function(x) UseMethod("f")
f.a <- function(x) "Class a"
f.default <- function(x) "Unknown class"

microbenchmark::microbenchmark(
  f(structure(list(), class = "a")),
  f(structure(list(), class = c("a", "b", "c", "d", "e"))),
  f(structure(list(), class = c("a", "b", "c", "d", "e", "f", "g", "h", "i", "j")))
)

# Unit: microseconds
# min     lq     mean    median      uq    max neval
# 7.839 8.5165  9.14292  8.8395  9.3095 27.343   100
# 8.566 9.2575 10.52906  9.6640 10.1560 38.714   100
# 8.934 9.9385 11.18612 10.3935 10.8850 66.471   100

# It looks like S3 dispatch has a linear increase of about 0.8mcs per added class.


### How does performance of S4 method dispatch change with number of superclasses?

setClass("Animal", slots = list(type = "character"))
setClass("Person", slots = list(name = "character", species = "Animal"), contains = "Animal")
setClass("Employee", slots = list(boss = "Person"), contains = "Person")

get_species <- function(a) "No species found."
setGeneric(get_species)
setMethod("get_species", c(a = "Animal"), function(a) { a@type })
setMethod("get_species", c(a = "Person"), function(a) { a@species@type })

microbenchmark::microbenchmark({ giraffe <<- new("Animal", type = "Giraffe") })
# Unit: microseconds
#  min      lq     mean     median      uq     max neval
# 86.795 91.1045 100.2427   94.7815 108.629 245.877   100
microbenchmark::microbenchmark({ human <<- new("Animal", type = "Human") })
# Unit: microseconds
microbenchmark::microbenchmark({ rob <<- new("Person", name = "Rob", species = human) })
microbenchmark::microbenchmark({ peter <<- new("Employee", name = "Peter", species = human, boss = rob) })

get_species(NA)
# "No species found."
get_species(giraffe)
# "Giraffe"
get_species(rob)
# "Human"
get_species(peter)
# "Human"

microbenchmark::microbenchmark(get_species(NA), get_species(giraffe), get_species(rob), get_species(peter))
# Unit: microseconds
#                  expr    min     lq     mean  median      uq    max neval
#       get_species(NA)  9.496 12.027 14.82556 14.0330 15.9730 44.845   100
#  get_species(giraffe) 10.168 11.614 14.22492 13.3555 15.9020 53.546   100
#      get_species(rob) 10.166 11.827 14.53664 14.1910 16.0935 44.303   100
#    get_species(peter) 10.024 11.770 14.03743 13.5185 15.8680 31.670   100



### How about RC?
