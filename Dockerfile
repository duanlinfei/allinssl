FROM frolvlad/alpine-glibc

WORKDIR /www/allinssl/

ENV TZ=Asia/Shanghai
RUN cat > /entrypoint.sh <<'EOF'
#!/bin/sh
if [ ! -f /www/allinssl/.initialized ]; then
    echo ${ALLINSSL_USER:-allinssl} | /www/allinssl/allinssl 5
    echo ${ALLINSSL_URL:-allinssl} | /www/allinssl/allinssl 4
    echo ${ALLINSSL_PWD:-allinssldocker} | /www/allinssl/allinssl 6
    echo 8888 | /www/allinssl/allinssl 7
    touch /www/allinssl/.initialized
fi
/www/allinssl/allinssl 2
exec /www/allinssl/allinssl start
EOF
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]

EXPOSE 8888
