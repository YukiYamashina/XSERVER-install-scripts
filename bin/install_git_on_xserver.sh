#!/bin/bash
#
#
# curl -o- https://raw.githubusercontent.com/YukiYamashina/XSERVER-install-scripts/master/bin/install_git_on_xserver.sh | bash
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

#
#----------------------------------------------------------------------
#
resource=gettext
version=0.19.8
target=bin/gettext
resource_uri="http://ftp.gnu.org/pub/gnu/gettext/${resource}-${version}.tar.gz"
configure_options="--prefix=${install_dir}"
#
#----------------------------------------------------------------------
#
if [ ! -e ${install_dir}/${target} ]; then
    echo "Installing ${resource}-${version} for git..."
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

#
#----------------------------------------------------------------------
#
resource=curl
version=7.50.3
target=bin/curl
resource_uri="http://curl.askapache.com/download/${resource}-${version}.tar.gz"
configure_options="--prefix=${install_dir} --enable-libcurl-option"
#
#----------------------------------------------------------------------
#
if [ ! -e ${install_dir}/${target} ]; then
    echo "Installing ${resource}-${version} for git..."
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

#
#----------------------------------------------------------------------
#
resource=git
target=bin/git
configure_options="--prefix=${install_dir} --with-curl=${install_dir} --with-expat==${install_dir}"
#
#----------------------------------------------------------------------
#
if [ ! -e ${install_dir}/${target} ]; then
    echo "Installing ${resource}..."
    cd ${install_dir}/src
    wget https://github.com/git/git/archive/master.zip
    unzip master.zip
    cd git-master
    autoconf
    ./configure ${configure_options} CFLAGS="-I${install_dir}/include"
    make -i all
    make -i install
else
    echo "${resource} already installed..."
fi

if [ ! -e ${install_dir}/${target} ]; then
    echo "Failed to install ${resource}, exit..."
    exit
fi