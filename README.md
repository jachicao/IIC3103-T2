# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

rails g scaffold User usuario:string nombre:string apellido:string twitter:string
resources :usuario, controller: 'usuarios'
validates :usuario, presence: true
validates :nombre, presence: true