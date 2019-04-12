# On selectionne la distribution alpine
FROM alpine

# On lance l'installation de GCC et CMake lors de la création de l'image
RUN apk update && apk add gcc cmake
