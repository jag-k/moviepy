FROM python:3.11-slim

# Install dependencies
RUN apt-get -y update && apt-get -y install ffmpeg imagemagick fonts-liberation locales && \
    locale-gen C.UTF-8 && \
    /usr/sbin/update-locale LANG=C.UTF-8

ENV LC_ALL="C.UTF-8"

# modify ImageMagick policy file so that Textclips work correctly.
RUN cat /etc/ImageMagick-6/policy.xml | sed 's/none/read,write/g'> /etc/ImageMagick-6/policy.xml 


COPY . /var/src/moviepy/
#RUN git clone https://github.com/Zulko/moviepy.git /var/src/moviepy

# Install moviepy itself
RUN cd /var/src/moviepy/ && pip install .[optional]
