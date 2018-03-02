// TODO: This file was created by bulk-decaffeinate.
// Sanity-check the conversion and remove this comment.
/*
 * decaffeinate suggestions:
 * DS101: Remove unnecessary use of Array.from
 * DS102: Remove unnecessary code created because of implicit returns
 * DS207: Consider shorter variations of null checks
 * Full docs: https://github.com/decaffeinate/decaffeinate/blob/master/docs/suggestions.md
 */
"use strict";

// A composable data model that serializes cleanly to JSON and provides
// observable properties.

const Observable = require("o_0");

const defAccessor = (self, attrName) =>
  self[attrName] = function(newValue) {
    if (arguments.length > 0) {
      self.I[attrName] = newValue;

      return self;
    } else {
      return self.I[attrName];
    }
  }
;

module.exports = function(I, self) {
  if (I == null) { I = {}; }
  if (self == null) { self = {}; }
  const constructors = {};

  return extend(self, {
    I,
    
    // Generates a public jQuery style getter / setter method for each String
    // argument
    attrAccessor(...attrNames) {
      attrNames.forEach(attrName => defAccessor(self, attrName));

      return self;
    },

    // Generates a public jQuery style getter method for each String argument
    // >     myObject = Model
    // >       r: 255
    // >       g: 0
    // >       b: 100
    // >     myObject.attrAccessor "r", "g", "b"
    // >     myObject.r(254)
    attrReader(...attrNames) {
      attrNames.forEach(attrName =>
        self[attrName] = () => I[attrName]);

      return self;
    },

    // Extends an object with methods from the passed in object
    // >     I =
    // >       x: 30
    // >       y: 40
    // >       maxSpeed: 5
    // >     player = Model(I).extend
    // >       increaseSpeed: ->
    // >         I.maxSpeed += 1
    // >     player.increaseSpeed()
    extend(...objects) {
      return extend(self, ...Array.from(objects));
    },

    defaults(...objects) {
      for (let object of Array.from(objects)) {
        for (let name in object) {
          if (I[name] === undefined) {
            I[name] = object[name];
          }
        }
      }

      return self;
    },
      
    // Includes a module in this object.
    // A module is a constructor that takes two parameters, I and self
    // >     myObject = Model()
    // >     myObject.include(Bindable)
    // >     myObject.bind "someEvent", ->
    // >       alert("wow. that was easy.")
    include(...modules) {
      for (let Module of Array.from(modules)) {
        Module(I, self);
      }

      return self;
    },

    // Specify any number of attributes as observables which listen to changes
    // when the value is set
    attrObservable(...names) {
      names.forEach(function(name) {
        self[name] = Observable(I[name]);
        return self[name].observe(newValue => I[name] = newValue);
      });

      return self;
    },

    // Model an attribute as an object
    // >     self.attrDatum("position", Point)
    attrDatum(name, DataModel) {
      let model;
      I[name] = (model = DataModel(I[name]));
      self[name] = Observable(model);
      self[name].observe(newValue => I[name] = newValue);

      return self;
    },

    // Models an array attribute as an observable array of data objects
    attrData(name, DataModel) {
      const models = (I[name] || []).map(x => DataModel(x));
      self[name] = Observable(models);
      self[name].observe(newValue =>
        I[name] = newValue.map(x => DataModel(x))
      );

      return self;
    },

    // Specify an attribute to treat as an observerable model instance
    attrModel(name, Model) {
      if (typeof Model !== 'function') {
        throw new Error(`${Model} is not a function`);
      }

      constructors[name] = Model;

      const model = Model(I[name]);
      self[name] = Observable(model);
      self[name].observe(newValue => I[name] = newValue.I);

      return self;
    },

    // Observe a list of attribute models.
    // This is the same as attrModel except the attribute is expected to be an
    // array of models
    attrModels(name, Model) {
      if (typeof Model !== 'function') {
        throw new Error(`${Model} is not a function`);
      }

      constructors[name] = data =>
        (data || []).map(x => Model(x))
      ;

      const models = constructors[name](I[name]);

      self[name] = Observable(models);
      self[name].observe(newValue =>
        I[name] = newValue.map(instance => instance.I)
      );

      return self;
    },

    // Update all fields with the given raw JSON data
    // This will invoke the constructors for fields declared with
    // `attrModel` and `attrModels`
    update(data) {
      // console.log "Update", I, data
      Object.keys(data).forEach(function(key) {
        const Constructor = constructors[key];

        let value = data[key];
        
        if (Constructor) {
          value = Constructor(value);
        }

        return (typeof self[key] === 'function' ? self[key](value) : undefined);
      });

      return self;
    },

    // The JSON representation, I, is kept up to date via the observable properites
    toJSON() {
      return I;
    }
  }
  );
};

// Extend an object with the properties of other objects
var extend = Object.assign;
