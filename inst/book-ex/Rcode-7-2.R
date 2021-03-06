ukcons2 <- ts(embed(diff(ukcons), dim=2),
              start=c(1967,4), freq=4)
colnames(ukcons2) <- c('lc.d', 'li.d', 'lw.d',
                       'lc.d1', 'li.d1', 'lw.d1')
error.ecm1 <- window(lag(error.lc, k=-1),
                     start=c(1967,4), end=c(1991, 2))
error.ecm2 <- window(lag(error.li, k=-1),
                     start=c(1967,4), end=c(1991, 2))
ecm.eq1 <- lm(lc.d ~ error.ecm1 + lc.d1 + li.d1 + lw.d1,
              data=ukcons2)
ecm.eq2 <- lm(li.d ~ error.ecm2 + lc.d1 + li.d1 + lw.d1,
              data=ukcons2)
