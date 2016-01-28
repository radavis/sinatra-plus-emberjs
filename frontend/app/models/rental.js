import DS from 'ember-data';

export default DS.Model.extend({
  title: DS.attr('string'),
  owner: DS.attr('string'),
  city: DS.attr('string'),
  type: DS.attr('string'),
  bedrooms: DS.attr('number'),
  image: DS.attr('string')
});
