# On selectionne la distribution alpine
FROM alpine
# On copie le code source dans le conteneur
COPY ./ /root/code/

# On se rend dans le repertoire de travail (de compilation)
WORKDIR /root/code/

# On installe les programmes nécessaires à la compilation et à la couverture de code
RUN apk update && \
    apk add gcc g++ make cmake python3 && \
    pip3 install --upgrade pip && \
    pip3 install gcovr
    # chmod +x launchCompil.sh

CMD ["sh", "launchCompil.sh"]
