FROM openjdk:17-jdk-alpine
WORKDIR /app
COPY . .
RUN javac main.txt
CMD [ "java","main" ]

 