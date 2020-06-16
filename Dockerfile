FROM postgis/postgis:11-2.5-alpine
COPY wait-for-frost.sh /wait-for-frost.sh
CMD ["/wait-for-frost.sh"]