# OD乘稀释倍数
dat = read.table("clipboard",header = F)
calculed = matrix(nrow = nrow(dat), ncol = ncol(dat))
for (i in 1:nrow(dat)){
  for(j in 1:ncol(dat)){
    calculed[i,j] = dat[i,j]*5
    }
}
calculed

write.table(calculed, file = "E:/R language install/OutputDat")

# 单位OD光子响应数量
Photons = read.table("clipboard", header = F) # 先复制光子数据并运行
Photons
OD = read.table("clipboard", header = F) # 复制OD数据并运行
OD
PhotonPerOD = matrix(nrow = nrow(Photons), ncol = ncol(Photons))
for (i in 1:nrow(Photons)) {
for (j in 1:ncol(Photons)) {
  PhotonPerOD[i,j] = Photons[i,j]/OD[i,j]
}  
}
PhotonPerOD

write.table(PhotonPerOD, file = "E:/A邹商杰/实验数据记录/光子响应数据/PhotonPerOD")