# make mouse direction axis
# xmodmap -e "pointer = 1 2 3 5 4"

# develop env
export QTVERSION=4

# those two lines for CUDA environment
PATH="/usr/local/cuda-8.0/bin:${PATH}"
LD_LIBRARY_PATH="/usr/local/cuda/lib64:${LD_LIBRARY_PATH}"

# for Qt env
if [ ${QTVERSION} = 4 ]; then
    export QTDIR="/usr/local/Qt-4.8.5"
    PATH="${QTDIR}/bin:${PATH}"
    LD_LIBRARY_PATH="${QTDIR}/lib:${LD_LIBRARY_PATH}"
elif [ ${QTVERSION} = 5 ]; then
    export QTDIR="/opt/Qt5.8.0/5.8/gcc_64"
    PATH="${QTDIR}/bin:${PATH}"
    LD_LIBRARY_PATH="${QTDIR}/lib:${LD_LIBRARY_PATH}"
fi

# for java
export JAVA_HOME="/usr/lib/jvm/jdk1.8.0_121"
export JRE_HOME="${JAVA_HOME}/jre"
export CLASSPATH="${JAVA_HOME}/lib64:${JRE_HOME}/lib64"
PATH="${JAVA_HOME}/bin:${PATH}"

