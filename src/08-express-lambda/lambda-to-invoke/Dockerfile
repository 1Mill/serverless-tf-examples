FROM public.ecr.aws/lambda/nodejs:14

WORKDIR $LAMBDA_TASK_ROOT

COPY package.json package-lock.json ./
RUN npm install

COPY . .

ENV NODE_ENV=production

RUN find . -type d -exec chmod 755 {} \;
RUN find . -type f -exec chmod 644 {} \;

CMD [ "index.handler" ]
