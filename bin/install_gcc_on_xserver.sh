#!/bin/bash
#
#
# curl -o- https://raw.githubusercontent.com/YukiYamashina/XSERVER-install-scripts/master/bin/install_gcc_on_xserver.sh | bash
#
#
#----------------------------------------------------------------------
#
install_dir=$HOME/opt
#
#----------------------------------------------------------------------
#
echo "Install to ${install_dir}"
cd $HOME
mkdir -p ${install_dir}/src

export LD_LIBRARY_PATH=${install_dir}/lib
export LD_RUN_PATH=${install_dir}/lib

#
#----------------------------------------------------------------------
#
resource=xz
version=5.2.2
target=bin/xz
resource_uri="http://tukaani.org/xz/${resource}-${version}.tar.gz"
configure_options="--prefix=${install_dir} --with-gmp=${install_dir}"
#
# http://qiita.com/sirone/items/511c6f68d763dbb66e14
# http://www.mpfr.org/
#
#----------------------------------------------------------------------
#
if [ ! -e ${install_dir}/${target} ]; then
    echo "Installing ${resource}-${version}..."
    cd ${install_dir}/src
    mkdir ${resource}
    wget ${resource_uri} -O ${resource}.tar.gz
    tar -xvzf ${resource}.tar.gz -C ${install_dir}/src/${resource} --strip-components=1
    cd ${resource}
    mkdir build; cd build
    ../configure ${configure_options}
    make check; make install
else
    echo "${resource} already installed..."
fi

if [ ! -e ${install_dir}/${target} ]; then
    echo "Failed to install ${resource}, exit..."
    exit
fi

#
#----------------------------------------------------------------------
#
resource=gmp
version=6.1.1
target=lib/libgmp.a
resource_uri="https://ftp.gnu.org/gnu/gmp/${resource}-${version}.tar.xz"
configure_options="--prefix=${install_dir} --enable-cxx"
#
# http://qiita.com/sirone/items/511c6f68d763dbb66e14
# https://gmplib.org/
#
#----------------------------------------------------------------------
#
if [ ! -e ${install_dir}/${target} ]; then
    echo "Installing ${resource}-${version}..."
    cd ${install_dir}/src
    mkdir ${resource}
    wget ${resource_uri} -O ${resource}.tar.xz
    unxz ${resource}.tar.xz
    tar -xf ${resource}.tar -C ${install_dir}/src/${resource} --strip-components=1
    cd ${resource}
    mkdir build; cd build
    ../configure ${configure_options}
    make -s -j2; make check -s -j2; make install
else
    echo "${resource} already installed..."
fi

if [ ! -e ${install_dir}/${target} ]; then
    echo "Failed to install ${resource}, exit..."
    exit
fi

#
#----------------------------------------------------------------------
#
resource=mpfr
version=3.1.5
target=lib/libmpfr.a
resource_uri="http://www.mpfr.org/mpfr-current/${resource}-${version}.tar.gz"
configure_options="--prefix=${install_dir} --with-gmp=${install_dir}"
#
# http://qiita.com/sirone/items/511c6f68d763dbb66e14
# http://www.mpfr.org/
#
#----------------------------------------------------------------------
#
if [ ! -e ${install_dir}/${target} ]; then
    echo "Installing ${resource}-${version}..."
    cd ${install_dir}/src
    mkdir ${resource}
    wget ${resource_uri} -O ${resource}.tar.gz
    tar -xvzf ${resource}.tar.gz -C ${install_dir}/src/${resource} --strip-components=1
    cd ${resource}
    mkdir build; cd build
    ../configure ${configure_options}
    make check; make install
else
    echo "${resource} already installed..."
fi

if [ ! -e ${install_dir}/${target} ]; then
    echo "Failed to install ${resource}, exit..."
    exit
fi

#
#----------------------------------------------------------------------
#
resource=mpc
version=1.0.3
target=lib/libmpc.a
resource_uri="ftp://ftp.gnu.org/gnu/mpc/${resource}-${version}.tar.gz"
configure_options="--prefix=${install_dir} --with-gmp=${install_dir}"
#
# http://qiita.com/sirone/items/511c6f68d763dbb66e14
# http://www.multiprecision.org/
#
#----------------------------------------------------------------------
#
if [ ! -e ${install_dir}/${target} ]; then
    echo "Installing ${resource}-${version}..."
    cd ${install_dir}/src
    mkdir ${resource}
    wget ${resource_uri} -O ${resource}.tar.gz
    tar -xvzf ${resource}.tar.gz -C ${install_dir}/src/${resource} --strip-components=1
    cd ${resource}
    mkdir build; cd build
    ../configure ${configure_options}
    make check; make install
else
    echo "${resource} already installed..."
fi

if [ ! -e ${install_dir}/${target} ]; then
    echo "Failed to install ${resource}, exit..."
    exit
fi

#
#----------------------------------------------------------------------
#
resource=isl
version=0.17.1
target=lib/libisl.a
resource_uri="http://isl.gforge.inria.fr/${resource}-${version}.tar.gz"
configure_options="--prefix=${install_dir} --with-gmp-prefix=${install_dir}"
#
# http://qiita.com/sirone/items/511c6f68d763dbb66e14
# http://isl.gforge.inria.fr/
# https://groups.google.com/forum/#!topic/isl-development/WqjSBN_nIeI
#
#----------------------------------------------------------------------
#
if [ ! -e ${install_dir}/${target} ]; then
    echo "Installing ${resource}-${version}..."
    cd ${install_dir}/src
    mkdir ${resource}
    wget ${resource_uri} -O ${resource}.tar.gz
    tar -xvzf ${resource}.tar.gz -C ${install_dir}/src/${resource} --strip-components=1
    cd ${resource}
    mkdir build; cd build
    ../configure ${configure_options}
    make check; make install
else
    echo "${resource} already installed..."
fi

if [ ! -e ${install_dir}/${target} ]; then
    echo "Failed to install ${resource}, exit..."
    exit
fi

#
#----------------------------------------------------------------------
#
resource=cloog
version=0.18.4
target=lib/libcloog-isl.a
resource_uri="http://www.bastoul.net/cloog/pages/download/count.php3?url=./${resource}-${version}.tar.gz"
configure_options="--prefix=${install_dir} --with-gmp-prefix=${install_dir}"
#
# http://qiita.com/sirone/items/511c6f68d763dbb66e14
# http://www.cloog.org/
#
#----------------------------------------------------------------------
#
if [ ! -e ${install_dir}/${target} ]; then
    echo "Installing ${resource}-${version}..."
    cd ${install_dir}/src
    mkdir ${resource}
    wget ${resource_uri} -O ${resource}.tar.gz
    tar -xvzf ${resource}.tar.gz -C ${install_dir}/src/${resource} --strip-components=1
    cd ${resource}
    mkdir build; cd build
    ../configure ${configure_options}
    make check; make install
else
    echo "${resource} already installed..."
fi

if [ ! -e ${install_dir}/${target} ]; then
    echo "Failed to install ${resource}, exit..."
    exit
fi

#
#----------------------------------------------------------------------
#
resource=gcc
version=4.9.4
target=bin/gcc
resource_uri="http://ftp.tsukuba.wide.ad.jp/software/gcc/releases/${resource}-${version}/${resource}-${version}.tar.gz"
configure_options="--prefix=${install_dir} --with-gmp=${install_dir} --with-mpfr=${install_dir} --with-mpc=${install_dir} --mandir=${install_dir}/share/man --infodir=${install_dir}/share/info --enable-shared --enable-threads=posix --enable-checking=release --with-system-zlib --enable-__cxa_atexit --disable-libunwind-exceptions --enable-libgcj-multifile --enable-languages=c,c++,objc,obj-c++,java,fortran,ada --enable-java-awt=gtk --disable-dssi --disable-plugin --with-java-home=/usr/lib/jvm/java-1.4.2-gcj-1.4.2.0/jre --with-cpu=generic --host=x86_64-redhat-linux"
#configure_options="--disable-multilib --enable-languages=c,c++,java --program-suffix=-${version} --prefix=${install_dir} --with-gmp=${install_dir} --with-mpfr=${install_dir} --with-mpc=${install_dir}"
#
# http://qiita.com/sirone/items/511c6f68d763dbb66e14
# https://www.gnu.org/software/gcc/
#
#----------------------------------------------------------------------
#
if [ ! -e ${install_dir}/${target} ]; then
    echo "Installing ${resource}-${version}..."
    cd ${install_dir}/src
    mkdir ${resource}
    wget ${resource_uri} -O ${resource}.tar.gz
    tar -xvzf ${resource}.tar.gz -C ${install_dir}/src/${resource} --strip-components=1
    cd ${resource}
    mkdir build; cd build
    ../configure ${configure_options}
    make; make install
else
    echo "${resource} already installed..."
fi

if [ ! -e ${install_dir}/${target} ]; then
    echo "Failed to install ${resource}, exit..."
    exit
fi