PMIDList

PMIDList2 <-("30863807") 

for (i in PMIDList) {
    print(i)
}

for (i in 1:length(PMIDList)) {
    print(i)
}

for (i in 1:length(PMIDList)) {
    print(i)
    print(PMIDList[i])
}







ilk <-  as.character(PMIDList[1])
    
RefManageR::ReadPubMed("30863807", database = "PubMed")

RefManageR::ReadPubMed(ilk, database = "PubMed")


arabul <- function(x) {
    RefManageR::ReadPubMed(x, database = "PubMed")
}

purrr::map_df(1:length(PMIDList), function(i) PMIDList[[i]] <- arabul(i))


z <- as.list.data.frame(NA)

for (i in 1:3) {
    z[i] <<-RefManageR::ReadPubMed(as.character(PMIDList[i]), database = "PubMed")
}

(x <- rep(NA_integer_, 3))
purrr::map_dbl(1:3, function(i) x[[i]] <<- -i)
x


purrr::modify(PMIDList, RefManageR::ReadPubMed, database="PubMed")




PMIDList <- c(30919742,
30895123,
30862258,
30843011)

getir <- NA
j <- NA

for(j in 1:length(PMIDList)) {
    assign(x = paste("MyPMID", j, sep = "."), 
           value = PMIDList[j]
           )
}


RefManageR::ReadPubMed(as.character(PMIDList[4]), database = "PubMed")




pelin <- c(1:10)
for(i in 1:length(pelin)){
    assign(paste("a", i, sep = ""), pelin[i]/2)    
}

purrr::reduce(
    PMIDList,
    ~ RefManageR::ReadPubMed,
    database = "PubMed"
)


magicfor::magic_for(
    # silent = TRUE
    )

for (i in 1:length(PMIDList)) {
    isim <-  paste("MyPMID", i, sep = ".")
    getir <-  PMIDList[i]
    put(isim, getir)
}

magicfor::magic_result_as_dataframe()

magicfor::magic_free()


magicfor::magic_for(
    # silent = TRUE
)

for (i in 1:length(PMIDList)) {
    isim <-  paste("MyPMID", i, sep = ".")
    getir <<-  PMIDList[i]
    assign(isim, getir)
}

magicfor::magic_result_as_dataframe()

magicfor::magic_free()



for (i in 1:length(PMIDList)) {
    isim <-  paste("MyPMID", i, sep = ".")
    getir <-  PMIDList[i]
    assign(isim, getir)
}




magicfor::magic_for(
    # silent = TRUE
)

for (i in 1:length(PMIDList)) {
    isim <-  paste("NewPMID", i, sep = ".")
    getir <- as.character(RefManageR::GetPubMedByID(PMIDList[i])
    )
    put(isim, getir)
    Sys.sleep(0.5)
}

mylist <- magicfor::magic_result()

magicfor::magic_result_as_dataframe()

magicfor::magic_free()


