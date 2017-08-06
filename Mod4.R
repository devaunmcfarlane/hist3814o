#install.packages("mallet")
#library("mallet")
#install.packages('RCurl')
#library(RCurl)

x <- getURL("https://raw.githubusercontent.com/shawngraham/exercise/gh-pages/CND.csv", .opts = list(ssl.verifypeer = FALSE))

documents <- read.csv(text = x, col.names=c("Article_ID", "Newspaper Title", "Newspaper City", "Newspaper Province", "Newspaper Country", "Year", "Month", "Day", "Article Type", "Text", "Keywords"), colClasses=rep("character", 3), sep=",", quote="")

counts <- table(documents$Newspaper.City)
barplot(counts, main="Cities", xlab="Number of Articles")

years <- table(documents$Year)
barplot(years, main="Publication Year", xlab="Year", ylab="Number of Articles")

keywords <- table(documents$Keywords)
barplot(keywords, main ="Article Keywords", xlab ="Keyword", ylab = "Number of Articles")

mallet.instances <- mallet.import(documents$Article_ID, documents$Text, "en.txt", token.regexp = "\\p{L}[\\p{L}\\p{P}]+\\p{L}")
