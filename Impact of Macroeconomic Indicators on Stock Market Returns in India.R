install.packages("dplyr")
install.packages("ggplot2")
install.packages("tseries")
install.packages("vars")
install.packages("urca")
install.packages("readxl")
install.packages("tsDyn", dependencies=TRUE)

library(dplyr)       # For data manipulation
library(ggplot2)     # For data visualization
library(gridExtra)
library(tseries)     # For time series analysis
library(vars)        # For VAR modeling
library(urca)        # For cointegration tests (VECM)
library(readxl)
library(lmtest)
library(tsDyn)
library(forecast)

plot1=ggplot(Masterdata,aes(x=Date,y=Nifty50))+ geom_line(colour="Blue")
plot1
plot2=ggplot(Masterdata,aes(x=Date,y=BSE))+ geom_line(colour="Red")
plot2
plot3=ggplot(Masterdata,aes(x=Date,y=GDP))+ geom_line(colour="Maroon")
plot3
plot4=ggplot(Masterdata,aes(x=Date,y=Inflation))+ geom_line(colour="Black")
plot4
plot5=ggplot(Masterdata,aes(x=Date,y=Unemployment))+ geom_line(colour="Orange")
plot5
plot6=ggplot(Masterdata,aes(x=Date,y=FDI))+ geom_line(colour="Purple")
plot6
plot7=ggplot(Masterdata,aes(x=Date,y=Interest))+ geom_line(colour="Dark Green")
plot7
plot8=ggplot(Masterdata,aes(x=Date,y=Exchange))+ geom_line(colour="Brown")
plot8
grid.arrange(plot1,plot2,plot3,plot4,plot5,plot6,plot7,plot8)

library(fBasics)
library(FinTS)
basicStats(Masterdata$Nifty50)
basicStats(Masterdata$BSE)
basicStats(Masterdata$GDP)
basicStats(Masterdata $Inflation)
basicStats(Masterdata$Unemployment)
basicStats(Masterdata $FDI)
basicStats(Masterdata $Interest)
basicStats(Masterdata $Exchange)

jarque.bera.test(Masterdata$Nifty50)
jarque.bera.test(Masterdata$BSE)
jarque.bera.test(Masterdata$GDP)
jarque.bera.test(Masterdata $Inflation)
jarque.bera.test(Masterdata$Unemployment)
jarque.bera.test(Masterdata $FDI)
jarque.bera.test(Masterdata $Interest)
jarque.bera.test(Masterdata $Exchange)

attach(Masterdata)
adf.test(Nifty50)
adf.test(BSE)
adf.test(GDP)
adf.test(Inflation)
adf.test(Unemployment)
adf.test(FDI)
adf.test(Interest)
adf.test(Exchange)

attach(Log2_Masterdata)
adf.test(L_Nifty50)
adf.test(L_BSE)
adf.test(L_GDP)
adf.test(L_Inflation)
adf.test(L_Unemployment)
adf.test(L_FDI)
adf.test(L_Interest)
adf.test(L_Exchange)

attach(df)
johansen_test <- ca.jo(df,type = "trace", K=2, ecdet = "const", spec = "longrun")
summary(johansen_test)

vecm_model <- cajorls(johansen_test, r = 1)  # Replace '3' with the number of cointegrating relationships
summary(vecm_model$rlm)
var_model <- vec2var(johansen_test, r = 1)
colnames(var_model$datamat)
granger_gdp_nifty <- grangertest(Nifty50 ~ GDP, order = 2, data = Log2_Masterdata)
granger_inflation_nifty <- grangertest(Nifty50 ~ Inflation, order = 2, data = Log2_Masterdata)
print(granger_gdp_nifty)  # p < 0.05 implies Granger causality
print(granger_inflation_nifty)

irf_gdp_nifty <- irf(var_model, impulse = "GDP", response = "Nifty50", n.ahead = 10)
plot(irf_gdp_nifty, main = "Nifty50 Response to GDP Shock")

irf_inflation_nifty <- irf(var_model, impulse = "Inflation", response = "Nifty50", n.ahead = 10)
plot(irf_inflation_nifty, main = "Nifty50 Response to Inflation Shock")

forecast_results <- predict(var_model, n.ahead = 10)  # 10-period forecast
print(forecast_results$fcst$Nifty50)  # View Nifty50 forecasts
plot(forecast_results)

serial_test <- serial.test(var_model, lags.pt = 10)
print(serial_test)  # p > 0.05 means no autocorrelation

var_model_varest <- vars::VAR(serial.test(var_model)$resid, p = 1)  # Temporary conversion
model_roots <- roots(var_model_varest)
print(model_roots)

