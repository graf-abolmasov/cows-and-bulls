angular.module('cnb', ['ngResource', 'rails']).config ['$httpProvider', (provider) ->
  provider.defaults.headers.common['X-CSRF-Token'] = $('meta[name=csrf-token]').attr('content')
]