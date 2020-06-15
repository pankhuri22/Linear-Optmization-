rm(list=ls())

### example of 1- sample test; follwing is the word problem. 
#A producer specifies that the mean lifetime of a certain type of battery is at least 240 hours. A sample of 18 such batteries yielded the following data.
#237, 242, 232, 242, 248, 230, 244, 243, 254, 262, 234, 220, 225, 
#236, 232, 218, 228, 240. Assuming that the life of the batteries is approximately normally distributed, do
#the data indicate that the specifications are not being met?

data_q2<-c(237, 242, 232, 242, 248, 230, 244, 
           243, 254, 262, 234, 220, 225, 236, 232, 218, 228, 240)

mean_q2<-mean(data_q2); sd_q2<-sqrt(var(data_q2))
t_val_q2<-((mean_q2-240)/(sd_q2/sqrt(length(data_q2))))
df_q2<-length(data_q2)-1
t_criticalval_q2<-(qt(0.05,df_q2,lower.tail = TRUE))

#t_pval_q2<-((pt((t_val_q2),df_q2,lower.tail = TRUE))) # evalaution of p-value, this will be discussed later


### example of 2- sample test; follwing is the word problem.
#Twenty-five men between the ages of 25 and 30, who were participating in a well- known heart study carried out in Framingham, Massachusetts, were randomly selected. Of these, 11 were smokers and 14 were not. The following data refer to readings of their systolic blood pressure.

#Smokers : 124, 134, 136, 125, 133, 127, 135, 131, 133, 125, 118.
#Nonsmokers : 130, 122, 128, 129, 118, 122, 116, 127, 135, 120, 122, 120, 115, 123.
#Use this data to test the hypothesis that the mean blood pressures of smokers and nonsmokers are the same.

data1_q4<-c(124, 134, 136, 125, 133, 127, 135, 131, 133, 125, 118)
data2_q4<-c(130, 122, 128, 129, 118, 122, 116, 127, 135, 120, 
            122, 120, 115, 123)

n1_q4<-length(data1_q4); n2_q4<-length(data2_q4)

mean1_q4<-mean(data1_q4); mean2_q4<-mean(data2_q4)

sigma_1<-var(data1_q4); sigma_2<-var(data2_q4)

sigma_pool<-(((n1_q4-1)*sigma_1)+((n2_q4-1)*sigma_2))/(n1_q4+n2_q4-2)
t_val<-((mean1_q4-mean2_q4)/(sqrt(sigma_pool)*sqrt((1/n1_q4)+(1/n2_q4))))
t_criticalval_q2<-(qt(0.025,df=(n1_q4+n2_q4-2),lower.tail = TRUE))

#t_pval<-2*(pt(abs(t_val),df=(n1_q4+n2_q4-2),lower.tail = FALSE))
