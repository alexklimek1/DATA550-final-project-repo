###### Final project docker file ######

FROM rocker/r-ubuntu as base

RUN mkdir /project

WORKDIR /project

COPY .Rprofile /project
COPY renv.lock /project
COPY Makefile /project
COPY final_report.Rmd /project
COPY code/ /project/code

RUN mkdir /project/clean_code
RUN mkdir /project/output

COPY clean_code/data.rds /project/clean_code/data.rds

RUN mkdir -p renv
COPY renv/activate.R /project/renv
COPY renv/settings.json /project/renv

RUN mkdir renv/.cache
ENV RENV_PATHS_CACHE=/project/renv/.cache

RUN apt-get update && apt-get install -y \
    pandoc \
    libcurl4-openssl-dev \
    libxml2-dev \
    && rm -rf /var/lib/apt/lists/*

RUN R -e "renv::restore()"

CMD make