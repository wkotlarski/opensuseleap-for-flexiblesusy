FROM opensuse/leap:latest

LABEL version = "0.1.1"
LABEL maintainer = "wojciech.kotlarski@tu-dresden.de"
LABEL description = "openSUSY Leap docker image for FlexibleSUSY"

# update the default image
RUN zypper dup --no-confirm --no-recommends

RUN zypper in --no-confirm --no-recommends tar gzip wget git
RUN zypper in --no-confirm --no-recommends make gcc-c++ gcc-fortran libboost_headers1_66_0-devel libboost_test1_66_0-devel gsl-devel eigen3-devel

# install Wolfram Engine
RUN wget https://account.wolfram.com/download/public/wolfram-engine/desktop/LINUX && bash LINUX -- -auto -verbose && rm LINUX

# activation of Wolfram Engine works only though wolframscript but it's not installed automatically on openSUSE
RUN rpm -i /usr/local/Wolfram/WolframEngine/12.0/SystemFiles/Installation/wolframscript-1.3-2019101401.x86_64.rpm

# FlexibleSUSY extras

# install LoopTools
# install FeynArts
# install FormCalc
# install Collier
