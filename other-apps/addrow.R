library(tidyverse)
library(readxl)

# articles <- read_excel("ArticleDataBase.xlsx")

articles <- readRDS("articles.rds")


PMID_29043580 <- RefManageR::ReadPubMed('29043580', database = 'PubMed')

articles <- articles %>% 
    add_row(
        ArticleCitation = PMID_29043580,
        PMID = PMID_29043580$eprint,
        Title = PMID_29043580$title,
        # Author = PMID_29043580$author,
        Abstract = PMID_29043580$abstract,
        Journal = PMID_29043580$journal,
        Year = PMID_29043580$year,
        Month = PMID_29043580$month,
        Volume = PMID_29043580$volume,
        Number = PMID_29043580$number,
        Pages = PMID_29043580$pages,
        PubMedLink = paste0("https://www.ncbi.nlm.nih.gov/pubmed/?term=", PMID_29043580$eprint),
        DoiNumber = PMID_29043580$doi,
        DoiLink = paste0("https://doi.org/", PMID_29043580$doi),
        Language = PMID_29043580$language,
        ISSN = PMID_29043580$issn
    ) %>% 
    unique()



saveRDS(articles, "articles.rds")


