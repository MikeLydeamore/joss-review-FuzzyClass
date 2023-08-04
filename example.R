library(FuzzyClass)
library(caret)

#' ---------------------------------------------
#' The following shows how the functions are used:
#' --------------
#' Reading a database:
#'
#' Actual training data:
data(VirtualRealityData)

VirtualRealityData <- as.data.frame(VirtualRealityData)

# Splitting into Training and Testing
split <- caTools::sample.split(t(VirtualRealityData[, 1]), SplitRatio = 0.7)
Train <- subset(VirtualRealityData, split == "TRUE")
Test <- subset(VirtualRealityData, split == "FALSE")
# ----------------

test <- Test[, -4]

# --------------------------------------------------
# Fuzzy Gaussian Naive Bayes with Fuzzy Parameters


fit_FGNB <- GauNBFuzzyParam(
    train = Train[, -4],
    cl = Train[, 4], metd = 2, cores = 1
)


print(fit_FGNB)
saida <- predict(fit_FGNB, test)
confusionMatrix(factor(Test[, 4]), saida)
#> Confusion Matrix and Statistics
#>
#>           Reference
#> Prediction  1  2  3
#>          1 62  6  0
#>          2  6 38 13
#>          3  0  7 48
#>
#> Overall Statistics
#>
#>                Accuracy : 0.8222
#>                  95% CI : (0.7584, 0.8751)
#>     No Information Rate : 0.3778
#>     P-Value [Acc > NIR] : < 2.2e-16
#>
#>                   Kappa : 0.7323
#>
#>  Mcnemar's Test P-Value : NA
#>
#> Statistics by Class:
#>
#>                      Class: 1 Class: 2 Class: 3
#> Sensitivity            0.9118   0.7451   0.7869
#> Specificity            0.9464   0.8527   0.9412
#> Pos Pred Value         0.9118   0.6667   0.8727
#> Neg Pred Value         0.9464   0.8943   0.8960
#> Prevalence             0.3778   0.2833   0.3389
#> Detection Rate         0.3444   0.2111   0.2667
#> Detection Prevalence   0.3778   0.3167   0.3056
#> Balanced Accuracy      0.9291   0.7989   0.8640

saidaMatrix <- predict(fit_FGNB, test, type = "matrix")
