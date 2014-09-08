## Bloccit: A community-sourced application for users to discuss anything.

Bloccit is a Ruby on Rails application. It uses Devise for authentication and Cloudinary to handle image uploads.
Bloccit is deployed to Heroku [Here](http://devtheory-bloccit.herokuapp.com)

Setup
---

**config/application.yml needs to have the following ENV variables:**

SENDGRID_USERNAME: 'your sendgrid username'

SENDGRID_PASSWORD: 'your sendgrid password'

DEVISE_SECRET_KEY: 'your devise secret key'

**config/cloudinary.yml needs to have the following ENV variables:**

cloud_name: 'your cloud name'

api_key: 'your api key'

api_secret: 'your api secret'

You can set those up under production or development if they are different.