FROM rocker/r-bspm:20.04

ARG GITHUB_PAT
VOLUME /iNZightVIT

# RUN apt-get update \
#     && apt-get -y install \
#         curl
# #       libgtk2.0-dev xorg-dev libx11-dev \
# #       libcgal-dev libglu1-mesa-dev libglu1-mesa-dev \
# #       libgdal-dev \
# #       libudunits2-dev

# ENV rspm="https://packagemanager.rstudio.com/cran/__linux__/xenial/latest"

# RUN curl -fsSL https://github.com/iNZightVIT/linux/archive/master.zip -o iNZightVIT.zip \
#     && unzip iNZightVIT.zip \
#     && rm iNZightVIT.zip \
#     && mv linux-master iNZightVIT \
#     && cd iNZightVIT \
#     && make \
#     && make install

ADD install_inzight.R .
RUN Rscript install_inzight.R

ADD profile.R /home/docker/.Rprofile
WORKDIR /iNZightVIT

CMD ["R"]
