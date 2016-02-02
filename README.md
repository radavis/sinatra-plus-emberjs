## Sinatra Plus Ember

### Getting Started

#### Install Node and Watchman

Install Node via the [Node installer](https://nodejs.org/en/).

```
$ brew update
$ brew install watchman
```

#### Install Ember CLI

List released versions of the `ember-cli` package.

```
$ npm view ember-cli versions
```

Install the latest version.

```
$ npm install -g ember-cli@2.3.0-beta.1
$ ember -v
```

#### Create a New Ember App

We want the directory structure of our app to look like this:

```
$ tree -L 1
.
├── README.md
├── backend   - Sinatra App
└── frontend  - Ember App
```

```
$ mkdir project-name
$ cd project-name
$ ember new frontend
```

#### Start-up the Development App

```
$ cd ../backend && rackup
$ cd ../frontend && ember serve --proxy http://localhost:9292
```

Navigate to [localhost:4200](http://localhost:4200/)

## Core Concepts

The diagram [here](https://guides.emberjs.com/v2.3.0/getting-started/core-concepts/) is clutch.

* URL: http://localhost:4200/books
* The Router maps the URL to a Route Handler
* The Route Handler loads a (Handlebar) Template, which describes how the UI looks, and also loads a Model
* The Model persists to the Web Server
* The Template (HTML + Handlebars) loads Components and accesses the Model data.
* Components control how the UI behaves (Template + JS)

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

## Adapters

[Adapters](https://guides.emberjs.com/v2.3.0/models/customizing-adapters/) are used for connecting Ember Models to APIs.

```js
// app/adapters/model.js;
import DS from 'ember-data'

export default DS.RESTAdapter.extend({
  namespace: 'api'
});
```

## Feature Testing w/ Capybara

We need to build the front-end assets and place them in the `backend/public` folder. Sinatra then needs to load `index.html` at the root of the application.

```
$ cd frontend
$ ember build --output-path ../backend/public
$ cd ../backend
$ rake spec
```

* To Do: Create a Rakefile that does the following:
  - boots the development app
  - runs the test suite
