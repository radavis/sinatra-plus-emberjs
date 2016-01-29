## Sinatra Plus Ember

Notes from [guides.emberjs.com](https://guides.emberjs.com/v2.2.0/)

## Getting Started

#### Install Node and Watchman

**Note:** Eventually I ran into some trouble with Homebrew and Node, so I used the [Node installer](https://nodejs.org/en/).

```
$ brew install node watchman
```

#### Install Ember CLI

```
$ npm install -g ember-cli
$ ember -v
```

Latest version of Ember is v2.3.0

#### Create a New Ember App

```
$ ember new app-name
```

In `bower.json`, set your version of `ember` to "~2.2.0", "ember-cli-shims": "0.1.0", and `ember-data` to "^2.3.0".

[source](http://emberjs.com/blog/2016/01/12/ember-data-2-3-released.html#toc_changes-in-ember-data-2-3)

```
$ npm install -g bower
```

#### Start the Server

```
$ ember server
```

Navigate to [localhost:4200](http://localhost:4200/)

## Core Concepts

The diagram [here](https://guides.emberjs.com/v2.2.0/getting-started/core-concepts/) is clutch.

* URL: http://localhost:4200/books
* The Router maps the URL to a Route Handler
* The Route Handler loads a (Handlebar) Template, which describes how the UI looks, and also loads a Model
* The Model persists to the Web Server
* The Template (HTML + Handlebars) loads Components and accesses the Model data.
* Components control how the UI behaves (Template + JS)

## Serving (Fake) Data

```
$ ember install ember-cli-mirage
```

(uninstall `npm uninstall ember-cli-mirage --save`)

Add code to `app/mirage`

## Classes in Ember

`Person = Ember.Object.extend({})` defines a new class.
`var person = Person.create();` creates a new object.
  * `.init()` - called on object creation.
  * `.get(property_name)` - retrieve the value associated with an object property.
  * `.set(property_name, property_value)` - set an object property.

`export default Ember.Component.extend({})` creates a new subclass that inherits from `Component`.

```
Person = Ember.Object.extend({
  init() {
    this.set('shoppingList', ['eggs', 'cheese']);
  }
});

Person.create({
  name: 'Stefan Penner',
  addItem() {
    this.get('shoppingList').pushObject('bacon');
  }
});

Person.create({
  name: 'Robert Jackson',
  addItem() {
    this.get('shoppingList').pushObject('sausage');
  }
});
```

## ActiveModel Adapter

```
$ ember install active-model-adapter
```

## Running the app

```
$ cd backend
$ rackup
```

```
$ cd frontend
$ ember serve
```


## Capybara

Currently stuck on how to run feature tests. Perhaps [this](https://blog.codeship.com/how-to-write-smoke-tests-for-an-ember-rails-stack/) will help.

* [Cross Origin Resource Sharing](https://developer.mozilla.org/en-US/docs/Web/HTTP/Access_control_CORS)
* [Content Security Policy](https://developer.mozilla.org/en-US/docs/Web/Security/CSP)
* [ember-cli-csp](https://github.com/rwjblue/ember-cli-content-security-policy)
