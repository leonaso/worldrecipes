# README

This README shows steps that are necessary to get the
application up and running.

Things to cover:

* Ruby version 2.3.0

* Rails 5.0.1

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ..........................................................

* Create new worldrecipes application
    Design app functionality based on a test first approach.
    Write code to build fucntionaly with just the necessary code to pass the test.
    Refactor code - clean-code.

* Layout application
* 

* Minitest

* Integration Testing
    test_should_get_root-home:  
      undefined local variable or method `root_url'
      ActionController::RoutingError: uninitialized constant PagesController
      AbstractController::ActionNotFound: The action 'home' could not be found for PagesController
      ActionController::UnknownFormat: PagesController#home is missing a template for this request format and variant.
    
    test_should_get_home: 
      undefined local variable or method `pages_home_url'
      ActionController::RoutingError: uninitialized constant PagesController
      AbstractController::ActionNotFound: The action 'home' could not be found for PagesController
      ActionController::UnknownFormat: PagesController#home is missing a template for this request format and variant.

    2 runs, 2 assertions, 0 failures, 0 errors, 0 skips.

* Model Tests - Unit-testing
----------------------------

Recipe -
  - recipe should be valid
  - name should be present
  - description should be present
  - chef_id should be present
  - limitations, validation and restrictions on name and description
  - 
  
Chef -
  - chefname should be present
  - email should be present
  - size restrictions on email and chefname
  - email address should be valid format
  - email should be unique, case insensitive
  - 

