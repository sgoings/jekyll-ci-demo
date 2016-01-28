FROM ruby:2.1-onbuild

EXPOSE 4000

CMD ["jekyll", "serve"]
