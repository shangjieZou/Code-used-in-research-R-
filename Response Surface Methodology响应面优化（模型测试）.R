library("rsm")

# 实验前根据先验知识设计实验组：
# 3-factor Box-Behnken design with 2 center points
bbd(3, n0 = 4, coding = list(x1~(AA - 20)/3, x2~(Temp - 50)/5, x3~(salt-6)/3))


# 完成实验数据采集后：
# code predictors
# 从表格复制实验数据
Matrix_for_fermentation = read.table("clipboard",header = TRUE)   
attach(Matrix_for_fermentation)
Ferm = coded.data(Matrix_for_fermentation, x1~(AA - 20)/3, x2~(Temp - 50)/5, x3~(salt-6)/3)
# 这里的编码方式对应实验设计处的编码方式，将数据归一化为-1~1
as.data.frame(Ferm)


# 进行响应面拟合和构建
production = product   
Ferm.rsm = rsm(production~SO(x1,x2,x3), data = Ferm)  # SO为Second-order
summary(Ferm.rsm)


# plot result (contour)
par(mfrow = c(2,3))
contour(Ferm.rsm, ~x1+x2+x3, image = TRUE, at = summary(Ferm.rsm)$canonical$xs)


# decode to value
Best = summary(Ferm.rsm)$canonical$xs
code2val(data.frame(x1=Best[1], x2 = Best[2], x3 = -Best[3]), codings(Ferm))