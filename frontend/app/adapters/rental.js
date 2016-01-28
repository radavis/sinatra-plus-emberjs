// import ActiveModelAdapter from 'active-model-adapter'

// export default ActiveModelAdapter.extend({
//   host: 'http://localhost:9292',
//   namespace: 'api'
// });

import DS from 'ember-data'
export default DS.RESTAdapter.extend({
  host: 'http://localhost:9292',
  namespace: 'api'
})
