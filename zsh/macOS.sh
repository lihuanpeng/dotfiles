# for osx
alias wwwroot="cd /Library/WebServer/Documents"
alias cleanqq="rm -rf /Users/lihuanpeng/Library/Containers/com.tencent.qq/Data/Library/Application\ Support/QQ/2705313595/Image"
# those two lines for CUDA environment
CUDA_PATH="/Developer/NVIDIA/CUDA-8.0"
PATH="${CUDA_PATH}/bin:${PATH}"
LD_LIBRARY_PATH="${CUDA_PATH}/lib:${LD_LIBRARY_PATH}"

# for Qt env
if [ ${QTVERSION} = 4 ]; then
    export QTDIR="/Developer/Qt-4.8.6"
elif [ ${QTVERSION} = 5 ]; then
    export QTDIR="/Applications/Qt5.8.0/5.8/clang_64"
fi

# update PATH
PATH="${QTDIR}/bin:${PATH}"
LD_LIBRARY_PATH="${QTDIR}/lib:${LD_LIBRARY_PATH}"
