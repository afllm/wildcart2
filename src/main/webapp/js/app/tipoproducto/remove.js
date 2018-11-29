'use strict'

moduleTipoproducto.controller('tipoproductoRemoveController', ['$scope', '$http', '$location', 'toolService', '$routeParams', '$window', 'sessionService',
    function ($scope, $http, $location, toolService, $routeParams, $window, oSessionService) {

        $scope.totalPages = 1;
        $scope.btnBorrar=true;
        $scope.conectado = false;
        
        if (!$routeParams.id) {
            $scope.idError = true;
        } else {
            $scope.idError = false;
            $scope.id = $routeParams.id;

            $http({
                method: 'GET',
                url: 'json?ob=tipoproducto&op=get&id=' + $scope.id
            }).then(function (response) {
                $scope.status = response.status;
                $scope.ajaxDataTipoproducto = response.data.message;
            }, function (response) {
                $scope.status = response.status;
                $scope.ajaxDataTipoproducto = response.data.message || 'Request failed';
            });
        }

        $scope.goBack = function () {
            $window.history.back();
        };
        
        $scope.borrar = function(){
            $scope.btnBorrar=false;
            $http({
                method: 'GET',
                url: 'json?ob=tipoproducto&op=remove&id=' + $scope.id
            }).then(function (response) {
                $scope.status = response.status;
                $scope.ajaxDataTipoproducto = response.data.message;
                $scope.resultado="Eliminado";
            }, function (response) {
                $scope.status = response.status;
                $scope.ajaxDataTipoproducto = response.data.message || 'Request failed';
                $scope.resultado="No se pudo eliminar";
            });
        };
        
        if (oSessionService.getUserName() !== "") {
            $scope.usuarioConectado = oSessionService.getUserName();
            $scope.conectado = true;
        }
        
        $scope.isActive = toolService.isActive;

        

    }



]);


