FROM debian:bookworm

WORKDIR /work

RUN apt-get update && apt-get install -y \
    build-essential curl unzip gcc g++ make git libfl2

# Install djgpp from GitHub
# https://github.com/andrewwutw/build-djgpp/releases/tag/v3.4
RUN \
    mkdir -p /opt \
    && curl -L -o djgpp.tar.bz2 https://github.com/andrewwutw/build-djgpp/releases/download/v3.4/djgpp-linux64-gcc1220.tar.bz2 \
    && tar -xjf djgpp.tar.bz2 -C /usr/local \
    && rm -f djgpp.tar.bz2

# Install Allegro
# https://github.com/superjamie/allegro-4.2.3.1-xc
#
# Put Allegro lib and includes in /allegro - I couldn't get it to work when I placed
# them in the default DJGPP search paths.
# So we need to set -I/allegro and -L/allegro for gcc.
RUN git clone --depth 1 https://github.com/superjamie/allegro-4.2.3.1-xc.git allegro
COPY support/xmake.sh /work/allegro/xmake.sh
RUN cd allegro \
    && chmod +x xmake.sh \
    && ./xmake.sh lib \
    && mkdir -p /allegro \
    && cp lib/djgpp/liballeg.a /allegro/ \
    && cp -R include/* /allegro/ \
    && cd .. \
    && rm -rf allegro

# Set up PATH so all of our tools are accessible
ENV PATH="$PATH:/usr/local/djgpp/bin"

# And set prompt for interactive shells
ENV PS1="\w $ "
