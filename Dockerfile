FROM nginx
ENV NODE_ENV production
WORKDIR /usr/src/app
EXPOSE 80
COPY ["package.json", "package-lock.json*", "npm-shrinkwrap.json*", "./"]
RUN npm install --production --silent && mv node_modules ../
COPY . .
CMD npm start
COPY ./index.html /usr/share/nginx/html/
COPY ./dist /usr/share/nginx/html/dist