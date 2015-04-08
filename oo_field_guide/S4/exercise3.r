### What happens if you pass an S4 object to an S3 generic?
setClass("Classy")
isS4(getClass("Classy"))
#[1] TRUE

ftype(print)
#[1] "s3"      "generic"

print(getClass("Classy"))
#Virtual Class "Classy" [in ".GlobalEnv"]
#
#No Slots, prototype of class "NULL"


### What happens if you pass an S3 object to an S4 generic?
setOldClass("Grandpa")

getClass("Grandpa")
# Virtual Class "Grandpa" [in ".GlobalEnv"]
#
#Slots:
#
#Name:   .S3Class
#Class: character
#
#Extends: "oldClass"

# Grandpa is S4 because setOldClass makes an S3 object as an S4 object
isS4(getClass("Grandpa"))
#[1] TRUE

setGeneric('some_method', function(x) {
  print(x)
})

isS4(some_method)
#[1] TRUE

some_method(getClass("Grandpa"))
# Virtual Class "Grandpa" [in ".GlobalEnv"]
#
#Slots:
#
#Name:   .S3Class
#Class: character
#
#Extends: "oldClass"

