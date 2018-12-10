'use strict'

moduleFactura.controller("facturaViewController", ['$scope', '$http', '$routeParams', 'toolService', '$window', 'sessionService',
    function ($scope, $http, $routeParams, toolService, $window, oSessionService) {

        $scope.conectado = false;


        $scope.ob = "factura";

        if (!$routeParams.id) {
            $scope.idError=true;
        } else {
            $scope.id = $routeParams.id;
            $scope.idError=false;
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

        if (oSessionService.getUserName() !== "") {
            $scope.usuarioConectado = oSessionService.getUserName();
            $scope.usuarioId = oSessionService.getUsuarioId();
            $scope.id_tiposusario = oSessionService.getId_tipousuario();
            $scope.conectado = true;
        }

        $scope.isActive = toolService.isActive;

    }

]);