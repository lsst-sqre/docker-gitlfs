FROM docker.io/centos:7
MAINTAINER sqre-admin

ARG LFS_VER=2.3.4

USER root

COPY yum.repos.d/git-lfs.repo /etc/yum.repos.d/git-lfs.repo
COPY profile.d/rh-git29.sh /etc/profile.d/rh-git29.sh

RUN yum clean all -y; \
    yum install -y epel-release; \
    yum install -y centos-release-scl; \
    yum install -y pygpgme yum-utils; \
    yum install -y git-lfs-${LFS_VER}; \
    yum install -y rh-git29; \
    yum clean all -y

RUN useradd -m lfs

USER lfs
