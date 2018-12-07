'use strict'

moduleCarrito.controller('carritoShowController', ['$scope', '$http', '$location', 'toolService', '$routeParams', 'sessionService', '$window',
    function ($scope, $http, $location, toolService, $routeParams, oSessionService, $window, ) {


        $scope.conectado = false;
        $scope.ajaxDataCarrito;
        $scope.cart = false;
        $scope.factura=false;




        //llamada al show de carrito para llenar el ajaxDataCarrito
        $http({
            method: 'GET',
            url: 'json?ob=carrito&op=show'
        }).then(function (response) {
            $scope.status = response.status;
            $scope.ajaxDataCarrito = response.data.message;
            $scope.carritoVacio();
        }, function (response) {
            $scope.status = response.status;
            $scope.ajaxDataCarrito = response.data.message || 'Request failed';
            $scope.carritoVacio();
        });

        if ($scope.ajaxDataCarrito !== null && $scope.ajaxDataCarrito !== "Carrito vacio") {
            $scope.cart = true;
        } else {
            $scope.cart = false;
        }

        //console.log("after show: " + $scope.cart);

        $scope.add = function (id) {
            $http({
                method: 'GET',
                url: 'json?ob=carrito&op=add&prod=' + id
            }).then(function (response) {
                $scope.status = response.status;
                $scope.ajaxDataCarrito = response.data.message;
                $scope.carritoVacio();
            }, function (response) {
                $scope.status = response.status;
                $scope.ajaxDataCarrito = response.data.message || 'Request failed';
                $scope.carritoVacio();
            });
        };


        $scope.reduce = function (id) {
            $http({
                method: 'GET',
                url: 'json?ob=carrito&op=reduce&prod=' + id
            }).then(function (response) {
                $scope.status = response.status;
                $scope.ajaxDataCarrito = response.data.message;
                $scope.carritoVacio();
            }, function (response) {
                $scope.status = response.status;
                $scope.ajaxDataCarrito = response.data.message || 'Request failed';
                $scope.carritoVacio();
            });
        };

        $scope.empty = function (id) {
            $http({
                method: 'GET',
                url: 'json?ob=carrito&op=empty'
            }).then(function (response) {
                $scope.status = response.status;
                $scope.ajaxDataCarrito = response.data.message;
                $scope.carritoVacio();
            }, function (response) {
                $scope.status = response.status;
                $scope.ajaxDataCarrito = response.data.message || 'Request failed';
                $scope.carritoVacio();
            });
        };
        
         $scope.buy = function () {
            $http({
                method: 'GET',
                url: 'http://localhost:8081/trolleyes/json?ob=carrito&op=buy'
            }).then(function (response) {
                $scope.status = response.status;
                $scope.msg_factura = response.data.message;
                $scope.factura = true;
                 $scope.facturaOK = "ok";
                //show();
            }, function (response) {
                $scope.status = response.status;
                $scope.msg_factura = response.data.message || 'Request failed';

            });

        };
        
        

        $scope.goBack = function () {
            $window.history.back();
        };


        if (oSessionService.getUserName() !== "") {
            $scope.usuarioConectado = oSessionService.getUserName();
            $scope.usuarioId = oSessionService.getUsuarioId();
            $scope.conectado = true;
        }

        $scope.carritoVacio = function () {
        if ($scope.ajaxDataCarrito !== "" && $scope.ajaxDataCarrito !== "Carrito vacio") {
            $scope.cart = true;
        } else {
            $scope.cart = false;
        }
        };

        //console.log("after if: " + $scope.cart);

        $scope.isActive = toolService.isActive;



    }



]);