# alias
alias i3config="vim ~/.i3/config"

# those two lines for CUDA environment
CUDA_PATH="/usr/local/cuda"
PATH="${CUDA_PATH}/bin:${PATH}"
LD_LIBRARY_PATH="${CUDA_PATH}/lib64:${LD_LIBRARY_PATH}"

# for Qt env
if [ ${QTVERSION} = 4 ]; then
    export QTDIR="/usr/local/Qt-4.8.5"
elif [ ${QTVERSION} = 5 ]; then
    export QTDIR="/opt/Qt5.8.0/5.8/gcc_64"
fi

# update PATH
PATH="${QTDIR}/bin:${PATH}"
LD_LIBRARY_PATH="${QTDIR}/lib:${LD_LIBRARY_PATH}"

# for java
export JAVA_HOME="/usr/lib/jvm/jdk1.8.0_121"
export JRE_HOME="${JAVA_HOME}/jre"
export CLASSPATH="${JAVA_HOME}/lib64:${JRE_HOME}/lib64"
PATH="${JAVA_HOME}/bin:${PATH}"

