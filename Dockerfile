FROM halohub/halo:2.6 as halo

ENV halo.security.initializer.superadminusername admin
ENV halo.security.initializer.superadminpassword P@88w0rd

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
