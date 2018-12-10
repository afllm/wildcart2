'use strict'

moduleFactura.controller("facturaRemoveController", ['$scope', '$http', '$routeParams', 'toolService', '$window', 'sessionService',
    function ($scope, $http, $routeParams, toolService, $window, oSessionService) {
        
        $scope.btnBorrar=true;
        $scope.conectado = false;
        
        if (!$routeParams.id) {
            $scope.idError = true;
        } else {
            $scope.idError = false;
            $scope.id = $routeParams.id;
        }

        $http({
            method: 'GET',
            url: 'json?ob=factura&op=get&id=' + $scope.id
        }).then(function (response) {
            $scope.status = response.status;
            $scope.ajaxDataUsuarios = response.data.message;
        }, function (response) {
            $scope.status = response.status;
            $scope.ajaxDataUsuarios = response.data.message || 'Request failed';
        });
        
        $scope.borrar = function () {
            $scope.btnBorrar=false;
            $http({
                method: "GET",
                url: 'json?ob=factura&op=remove&id=' + $scope.id
            }).then(function (response) {
                $scope.status = response.status;
                $scope.ajaxDataUsuarios = response.data.message;
                $scope.resultado="Eliminada";
            }), function (response) {
                $scope.status = response.status;
                $scope.ajaxDataUsuarios = response.data.message || 'Request failed';
                $scope.resultado="No se pudo eliminar: "+$scope.ajaxDataUsuarios;
            }
        }

        $scope.goBack = function () {
            $window.history.back();
        }
        
       if (oSessionService.getUserName() !== "") {
            $scope.usuarioConectado = oSessionService.getUserName();
            $scope.usuarioId = oSessionService.getUsuarioId();
            $scope.id_tiposusario = oSessionService.getId_tipousuario();
            $scope.conectado = true;
        }
       
       $scope.isActive = toolService.isActive;
    }

]);