### Using parent.env() and a loop (or a recursive function), verify that the ancestors of globalenv() include baseenv() and emptyenv(). Use the same basic idea to implement your own version of search().

e <- globalenv()
v <- c(environmentName(e))
while (!identical(e,emptyenv())) {
  e <- parent.env(e)
  v <- c(v,environmentName(e))
}
v

#  [1] "R_GlobalEnv"                      "package:pryr"                     "package:syberia"                 
#  [4] "tools:rstudio"                    "package:graphics"                 "package:grDevices"               
#  [7] "package:datasets"                 "package:stringr"                  "package:plyr"                    
# [10] "package:base64enc"                "package:rjson"                    "package:RCurl"                   
# [13] "package:bitops"                   "package:avant"                    "package:tundra"                  
# [16] "package:mungebits"                "package:mungebitsTransformations" "package:Rcpp"                    
# [19] "package:stagerunner"              "package:frost"                    "package:productivus"             
# [22] "package:stats"                    "package:pbapply"                  "package:syberiaStructure"        
# [25] "package:s3mpi"                    "package:AWS.tools"                "package:XML"                     
# [28] "package:utils"                    "package:berdie"                   "package:devtools"                
# [31] "package:Ramd"                     "package:vimcom"                   "package:setwidth"                
# [34] "package:methods"                  "Autoloads"                        "base"                            
# [37] "R_EmptyEnv"     
