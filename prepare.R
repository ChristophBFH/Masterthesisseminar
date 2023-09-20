
# load data ----
df <- read_excel("data.xlsx")

# Die obersten Zeilen anschauen
head(df)

# Die Variable `Hier habe ich einen langen Begriff für die Variable und das ist unnötig` ist unpraktisch. Bestenfalls im Online-Survey korrigieren.
df <- rename(df, var7 = `Hier habe ich einen langen Begriff für die Variable und das ist unnötig`)

head(df)

# Gibt es Auffälligkeiten in den Variablen?
describe(df) # Ja, in var8 hat es negative Werte "-99", obwohl es nur Werte von 1 - 2000 sein dürften. -99 wurde definiert als Missing im Online-Tool.

df$var8[df$var8==-99]<-NA
summary(df$var8) # Nun hat es aus den -99 NA als Missing gemacht.


# messniveau ----
str(df) # Die Variablen var1 - var6 sollten numerisch sein, sind aber charakter?

df <- df %>%
  mutate(across(c(var1, var2, var3, var4, var5, var6), as.numeric)) #Frage an ChatGPT: "in df i want to make variables var1:var6 from chr to num"

str(df)


# descriptiv ----
describe(df) # zeigt alle Werte pro Variable an
describe(df[c("var1","var2")]) # ausgewählte Variablen
hist(df$var1)
boxplot(df$var1)

# neue variable berehnen ----
df <- df %>%
  mutate(mean_score = rowMeans(select(., var1:var6), na.rm = TRUE)) #Frage an ChatGPT: "I want to calculate a new variable as a mean score of var1 - var6"

summary(df$mean_score)


# Recode ----
df <- df %>%
  mutate(
    var2rev = recode(var2, `1` = 10, `2` = 20, `3` = 30, `4` = 40, `5` = 50, `6` = 60),
    var3rev = recode(var3, `1` = 10, `2` = 20, `3` = 30, `4` = 40, `5` = 50, `6` = 60)
  )
#Frage an ChatGPT: "I want to recode var2 and var 3 from 1 = 10, 2 = 20, 3 = 30, 4 = 40, 5 = 50 and 6 = 60 and make new variables var2rev and var3rev

summary(df[c("var2rev","var3rev")])


