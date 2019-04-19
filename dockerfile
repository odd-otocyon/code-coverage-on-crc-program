# On selectionne la distribution alpine
FROM alpine
# VOLUME ['/home/code/']
COPY ./ /home/code/

# On se rend dans le repertoire de travail (de compilation)
WORKDIR /home/code/

# On lance l'installation de GCC et CMake lors de la création de l'image
# RUN apt update && \
#     apt install -y gcc g++ make cmake python3 python3-pip && \
#     pip3 install gcovr && \
#     chmod +x launchCompil.sh

RUN apk update && \
    apk add gcc g++ make cmake python3 && \
    pip3 install --upgrade pip && \
    pip3 install gcovr
    # chmod +x launchCompil.sh

# lancement de la compilation
# RUN [ -d build ] && rm -rf build && \
#     mkdir build && cd build && \
#     cmake -D CODE_COVERAGE=ON ../ && \
#     make && \
#     ./tests/crc && \
#     lcov --capture --directory . --output-file coverage.info && \
#     genhtml coverage.info --output-directory /home/coverage/
CMD ["sh", "launchCompil.sh"]
