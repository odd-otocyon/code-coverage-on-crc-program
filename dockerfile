# On selectionne la distribution alpine
FROM alpine
VOLUME ['/home/root/']
COPY ./ /home/root/

# On lance l'installation de GCC et CMake lors de la création de l'image
RUN apk update && apk add gcc g++ make cmake
