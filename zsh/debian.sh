# make mouse direction axis
xmodmap -e "pointer = 1 2 3 5 4"

# those two lines for CUDA environment
PATH="/usr/local/cuda-8.0/bin:${PATH}"
LD_LIBRARY_PATH="/usr/local/cuda/lib64:${LD_LIBRARY_PATH}"
# for Qt env
PATH="/opt/Qt5.8.0/5.8/gcc_64/bin:${PATH}"
LD_LIBRARY_PATH="/opt/Qt5.8.0/5.8/gcc_64/lib:${LD_LIBRARY_PATH}"
# for java
export JAVA_HOME="/usr/lib/jvm/jdk1.8.0_121"
export JRE_HOME="${JAVA_HOME}/jre"
export CLASSPATH="${JAVA_HOME}/lib64:${JRE_HOME}/lib64"
PATH="${JAVA_HOME}/bin:${PATH}"

