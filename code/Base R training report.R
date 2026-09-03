## scalar 
a <- 1.2
b <-"a"

## vector
va <- c(1.2,3,4.6)
mean(va)

# vb <- c("1","2","3")
# mean(vb)

## matrix
vc <- c(1.3,4.2,5.6)
vd <- c(10,3,2)

ma <- cbind(vc, vd)
mb <- rbind(vc, vd)

# x <- cbind(vc,vd)

## tricky data type: factor
vz <- c("a","b","c")
vf <- factor(vz)

## data frame
# Lake type
x <- c("Pristine", "Pristine", "Disturbed", "Disturbed", "Pristine")

# TSS: total suspended solids (mg/L)
y <- c(1.2, 2.2, 10.9, 50.0, 3.0)

(df0 <- data.frame(LakeType = x, TSS = y))

