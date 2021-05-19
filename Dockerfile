FROM infracloudio/csvserver:latest
COPY ./inputFile /csvserver/inputdata
ENV CSVSERVER_BORDER=Ornage
