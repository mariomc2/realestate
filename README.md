# Real Estate

	rails new realestate

## Bootstrap

Set up Bootstrap with WebPacker

    yarn add bootstrap jquery popper.js

Add the following to config/webpack/environment.js

```
const webpack = require('webpack')

environment.plugins.prepend(
  'Provide',
  new webpack.ProvidePlugin({
    $: 'jquery',
    jQuery: 'jquery',
    jquery: 'jquery',
    Popper: ['popper.js', 'default']
  })
)
```

Create a folder to hold stylesheets, and create one **scss**

    $ mkdir app/javascript/stylesheets/
    $ touch app/javascript/stylesheets/application.scss

Add the following to: app/javascript/stylesheets/application.scss

    @import "~bootstrap/scss/bootstrap";

Add the following to app/javascript/packs/applications.js

    import 'bootstrap'
    import '../stylesheets/application'

---
## simple_form

Add it to the gemfile:

    gem 'simple_form'

Run the generator with Bootstrap:

    rails generate simple_form:install --bootstrap

---
## Github

Create project on Github and add remote

    git remote add origin git@github.com:mariomc2/realestate.git

Commit code

    git add .
    git commit -m "Initial commit"

Push to Github

    git push -u origin master

---
## devise

Add it to the gemfile:

    gem 'devise'

Run the generator:

    rails generate devise:install

Add the following to config/routes.rb

    root to: 'pages#home'

Create a partial to show notifications:

	touch app/views/layouts/_alerts.html.erb

and add:

    <p class="notice"><%= notice %></p>
    <p class="alert"><%= alert %></p>

Edit the layout for alert notifications to add

	<%= render 'layouts/alerts' %>

Create the Model:

    rails generate devise User

Create the Migration to add Roles and Terms:

    rails generate migration addFieldsToUsers  \
        terms:boolean role:integer

Run the migration:

    rails db:migrate

Run the generator:

    rails generate devise:views

Add to app/views/devise/registrations/new.html.erb

	<%= f.input :role, :as => :hidden, input_html: {value: "self"}%>
    <%= f.input :terms, label: "I agree to the terms and conditions"%>

Add to app/controllers/application_controller.rb

	before_action :configure_permitted_parameters, if: :devise_controller?

	protected

	def configure_permitted_parameters
		devise_parameter_sanitizer.permit(:sign_up, keys: [:role, :terms])
	end

Add to app/models/user.rb

	validates :terms, acceptance: { message: 'must be accepted' }

	enum role:{
		"admin" => 0,
		"self" => 1,
		"managed" => 2,
	}

---
## Generate HomePage

    rails g controller pages home

---
## Create Building:

    rails generate scaffold Building type:integer identifier:string name:string

---
## Create Property:

    rails generate scaffold Property type:integer identifier:string building:belongs_to

---
## Create Engagement:

    rails generate scaffold Engagement role:integer user:belongs_to building:belongs_to

---
## Create Management:

    rails generate scaffold Management role:integer user:belongs_to property:belongs_to

---
## Add the relationships to the models:

#### User:
	has_many :engagements
	has_many :buildings, through: :engagements

	has_many :managements
	has_many :properties, through: :managements

#### Engagement:
	belongs_to :user
  	belongs_to :building

#### Management:
	belongs_to :user
  	belongs_to :property

#### Building:
	has_many :engagements
	has_many :users, through: :engagements

#### Property:
	belongs_to :building
	has_many :managements
	has_many :users, through: :managements

---
## 