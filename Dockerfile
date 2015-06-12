#------------------------------------------------------------------------------
# Set the base image for subsequent instructions:
#------------------------------------------------------------------------------

FROM centos:7
MAINTAINER Marc Villacorta Morera <marc.villacorta@gmail.com>

#------------------------------------------------------------------------------
# Update the base image:
#------------------------------------------------------------------------------

RUN rpm --import http://mirror.centos.org/centos/7/os/x86_64/RPM-GPG-KEY-CentOS-7 && \
    yum update -y && yum clean all

#------------------------------------------------------------------------------
# Install packages:
#------------------------------------------------------------------------------

RUN yum install -y rpm-build rpm-sign git gcc make libffi-devel ruby-devel && \
    yum clean all

RUN gem install --no-document --verbose fpm

#------------------------------------------------------------------------------
# Populate root file system:
#------------------------------------------------------------------------------

ADD rootfs /
