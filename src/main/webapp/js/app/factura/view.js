'use strict'

moduleFactura.controller("facturaViewController", ['$scope', '$http', '$routeParams', '$window', 'sessionService',
    function ($scope, $http, $routeParams, $window, oSessionService) {

        $scope.conectado = false;

        if (oSessionService.getUserName() !== "") {
            $scope.usuarioConectado = oSessionService.getUserName();
            $scope.conectado = true;
        }
        $scope.ob = "factura";

        if (!$routeParams.id) {
            $scope.id = 1;
        } else {
            $scope.id = $routeParams.id;
        }

        $http({
            method: 'GET',
            url: 'json?ob=' + $scope.ob + '&op=get&id=' + $scope.id
        }).then(function (response) {
            $scope.status = response.status;
            $scope.ajaxDataUsuarios = response.data.message;
        }, function (response) {
            $scope.status = response.status;
            $scope.ajaxDataUsuarios = response.data.message || 'Request failed';
        });



        $scope.goBack = function () {
            $window.history.back();
        };


    }

]);