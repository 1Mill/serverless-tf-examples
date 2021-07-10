FROM public.ecr.aws/lambda/nodejs:14

WORKDIR $LAMBDA_TASK_ROOT

COPY package.json package-lock.json ./
RUN npm install

COPY . .

CMD [ "index.handler" ]
