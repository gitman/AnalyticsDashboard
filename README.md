Analyticsdashboard
========================

* git: true
* dev_webserver: webrick
* prod_webserver: thin
* database: postgresql
* templates: haml
* unit_test: rspec
* integration: rspec-capybara
* continuous_testing: guard
* fixtures: machinist
* frontend: bootstrap2
* email: gmail
* authentication: devise
* devise_modules: default
* authorization: cancan
* form_builder: simple_form
* starter_app: admin_app
* rvmrc: false
* quiet_assets: true
* local_env_file: figaro
* better_errors: true
* ban_spiders: true
* github: true

===============================================================================

  Be sure to have a copy of the Bootstrap stylesheet available on your
  application, you can get it on http://twitter.github.com/bootstrap.

  Inside your views, use the 'simple_form_for' with one of the Bootstrap form
  classes, '.form-horizontal', '.form-inline', '.form-search' or
  '.form-vertical', as the following:

    = simple_form_for(@user, html: {class: 'form-horizontal' }) do |form|

===============================================================================

===============================================================================

Some setup you must do manually if you haven't yet:

  1. Ensure you have defined default url options in your environments files. Here
     is an example of default_url_options appropriate for a development environment
     in config/environments/development.rb:

       config.action_mailer.default_url_options = { :host => 'localhost:3000' }

     In production, :host should be set to the actual host of your application.

  2. Ensure you have defined root_url to *something* in your config/routes.rb.
     For example:

       root :to => "home#index"

  3. Ensure you have flash messages in app/views/layouts/application.html.erb.
     For example:

       <p class="notice"><%= notice %></p>
       <p class="alert"><%= alert %></p>

  4. If you are deploying on Heroku with Rails 3.2 only, you may want to set:

       config.assets.initialize_on_precompile = false

     On config/application.rb forcing your application to not access the DB
     or load models when precompiling your assets.

  5. You can copy Devise views (for customization) to your app by running:

       rails g devise:views

===============================================================================

===============================================================================

An initializer file has been created here: config/initializers/rolify.rb, you
can change rolify settings to match your needs.
Defaults values are commented out.

A Role class has been created in app/models (with the name you gave as
argument otherwise the default is role.rb), you can add your own business logic
inside.

Inside your User class (or the name you gave as argument otherwise the default
is user.rb), rolify method has been inserted to provide rolify methods.
