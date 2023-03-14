FROM openjdk:11
COPY ./target/spe_miniproject-1.0-SNAPSHOT-jar-with-dependencies.jar ./
WORKDIR ./
CMD ["java", "-jar", "spe_miniproject-1.0-SNAPSHOT-jar-with-dependencies.jar"]
