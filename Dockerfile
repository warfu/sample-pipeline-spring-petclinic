FROM frolvlad/alpine-oraclejdk8
VOLUME /tmp
COPY target/petclinic.war app.war
ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-jar","/app.war"]
