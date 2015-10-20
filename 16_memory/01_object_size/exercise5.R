### Explain the difference in size between 1:5 and list(1:5).

> pryr::object_size(1:5)
72 B
> pryr::object_size(list(1:5))
120 B
> pryr::object_size(list())
40 B
> 72 + 40
[1] 112

# You have to allocate extra space for the list itself.
