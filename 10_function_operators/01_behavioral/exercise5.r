### There are three places we could have added a memoise call: why did we choose the one we did?

download <- memoise(dot_every(10, delay_by(1, download_file)))
download <- dot_every(10, memoise(delay_by(1, download_file)))
download <- dot_every(10, delay_by(1, memoise(download_file)))


# Memoising before the delay_by effectively nullifies the utility of 'delaying' 
