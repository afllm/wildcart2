'use strict'

var wildcart = angular.module('MyApp', [
    'ngRoute',
    'services',
    'components',
    'commonControllers',
    'tipousuarioControllers',
    'usuarioControllers',
    'tipoproductoControllers',
    'facturaControllers',
    'productoControllers',
    'directives'
]);


var moduleCommon = angular.module ('commonControllers',[]);
var moduleService = angular.module ('services',[]);
var moduleComponent = angular.module ('components',[]);
var moduleDirectives = angular.module('directives', []);
var moduleTipousuario = angular.module ('tipousuarioControllers',[]);
var moduleUsuario = angular.module ('usuarioControllers',[]);
var moduleProducto = angular.module ('productoControllers',[]);
var moduleFactura = angular.module ('facturaControllers',[]);
var moduleTipoproducto = angular.module('tipoproductoControllers',[]);