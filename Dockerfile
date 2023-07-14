# Use halohub/halo:2.6 as the base image
FROM halohub/halo:2.7

# Set environment variables
ENV HALO_EXTERNAL_URL=https://halo-production-c68f.up.railway.app
ENV SPRING_SQL_INIT_PLATFORM=mysql
ENV SPRING_R2DBC_URL=r2dbc:pool:mysql://hk-cdb-hbgfyvc9.sql.tencentcdb.com:63985/halo
ENV SPRING_R2DBC_USERNAME=root
ENV SPRING_R2DBC_PASSWORD=Qw385613
ENV HALO_SECURITY_INITIALIZER_SUPERADMINUSERNAME=admin
ENV HALO_SECURITY_INITIALIZER_SUPERADMINPASSWORD=P@88w0rd

# 限制CPU使用为0.5个核心
CMD ["--cpus", "0.5"]

# 限制内存使用为512MB
CMD ["--memory", "512m"]

# Run echo command
RUN echo "Hello docker!"

# Start halo application
CMD ["java", "-jar", "/app/halo.jar"]



# WORKDIR application
# ARG JAR_FILE=application/build/libs/*.jar
# COPY ${JAR_FILE} application.jar
# RUN java -Djarmode=layertools -jar application.jar extract
#
# ################################
#
# FROM eclipse-temurin:17-jre
# MAINTAINER johnniang <johnniang@fastmail.com>
# WORKDIR application
# COPY --from=builder application/dependencies/ ./
# COPY --from=builder application/spring-boot-loader/ ./
# COPY --from=builder application/snapshot-dependencies/ ./
# COPY --from=builder application/application/ ./
#
# ENV JVM_OPTS="-Xmx256m -Xms256m" \
#     HALO_WORK_DIR="/root/.halo2" \
#     SPRING_CONFIG_LOCATION="optional:classpath:/;optional:file:/root/.halo2/" \
#     TZ=Asia/Shanghai
#
# RUN ln -sf /usr/share/zoneinfo/$TZ /etc/localtime \
#     && echo $TZ > /etc/timezone
#
# ENTRYPOINT ["sh", "-c", "java ${JVM_OPTS} org.springframework.boot.loader.JarLauncher ${0} ${@}"]
