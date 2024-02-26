FROM mainjpd.devops-acc-us.jfrog.team/demo-docker-virtual/maven:3.8.5-jdk-11 AS build
COPY src /usr/src/app/src
COPY pom.xml /usr/src/app
RUN mvn -f /usr/src/app/pom.xml clean package


FROM mainjpd.devops-acc-us.jfrog.team/demo-docker-virtual/openjdk
COPY --from=build /usr/src/app/target/hello.jar /usr/app/
RUN java -cp /usr/app/hello.jar com.example.hello.Hello
