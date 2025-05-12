//docker build --platform linux/amd64 . -t  informatica22-23
//docker pull repbioinfo/informatica22-23
@Set "Build=%CD%"
@Echo(%Build%
@If Not Exist "configurationFile.txt" Set /P "=%Build%" 0<NUL 1>"configurationFile.txt"
mkdir %Build%
copy configurationFile.txt %Build%
del %Build%\id.txt
docker run  --rm --platform linux/amd64 -itv %Build%:/sharedFolder --privileged=true -p  8888:8888 repbioinfo/wt_embl_course
