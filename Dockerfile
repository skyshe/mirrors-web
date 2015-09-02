#复制文件 tengine-2.1.1.tar.gz 到/ace/upload 
COPY tengine-2.1.1.tar.gz /ace/upload/tengine-2.1.1.tar.gz

#复制文件 nginx.conf 到/ace/upload 
COPY nginx.conf /ace/upload/nginx.conf

#复制文件 mirrors-web-master.zip 到/ace/upload 
COPY mirrors-web-master.zip /ace/upload/mirrors-web-master.zip

# 编写你的Dockerfile 
RUN cd /ace/upload && tar -zxvf tengine-2.1.1.tar.gz && cd tengine-2.1.1 && \ 
./configure --prefix=/ace/user/nginx &&  make && make install
RUN cp -f /ace/upload/nginx.conf /ace/user/nginx/conf/
RUN unzip /ace/upload/mirrors-web-master.zip -d /ace/code/
RUN echo "/ace/user/nginx/sbin/nginx" > /ace/bin/start