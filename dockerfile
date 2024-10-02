FROM processmaker4/docker-sass-compiler AS sass-compiler

RUN mkdir /sass;
RUN mkdir /css;

COPY scss/* /sass
RUN sass /sass/main.scss /css/main.css;

FROM nginx:alpine AS RUNNER
WORKDIR /usr/share/nginx/html

COPY ./dist/* .
COPY --from=sass-compiler /css css
