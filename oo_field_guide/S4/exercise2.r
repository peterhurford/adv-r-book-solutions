### What happens if you define a new S4 class that doesn't "contain" an existing class? (Hint: read about virtual classes in `?Classes`.

# Making a normal class

setClass("Nonvirtual", slots = list(name = "character"))
roland <- new("Nonvirtual", name = "Roland Freedom")

getClass('Nonvirtual')
#Class "Nonvirtual" [in ".GlobalEnv"]
#
#Slots:
#
#Name:       name
#Class: character

isS4(getClass('Nonvirtual'))
#[1] TRUE

getClass('Nonvirtual')@prototype
#<S4 Type Object>
#attr(,"name")
#character(0)

roland
#An object of class "Nonvirtual"
#Slot "name":
#[1] "Roland Freedom"

roland@name
# [1] "Roland Freedom"


# Making a virtual class

setClass("Virtual", contains=NULL)
getClass('Virtual')
# Virtual Class "Virtual" [in ".GlobalEnv"]
#
#No slots, prototype of class "NULL"

getClass('Virtual')@prototype
#NULL

# You can't make objects for a virtual class
roland <- new("Virtual")
#Error in new("Virtual") :
#  trying to generate an object from a virtual class ("Virtual")


# But defining slots makes the object not virtual, even though contains=NULL
setClass("Virtual", contains=NULL, slots = list(name = 'character'))
getClass('Virtual')
#Class "Virtual" [in ".GlobalEnv"]
#
#Slots:
#
#Name:       name
#Class: character

roland <- new("Virtual")
roland
#An object of class "Virtual"
#Slot "name":
#character(0)

