'use strict'

moduleUsuario.controller('usuarioRemoveController', ['$scope', '$http', '$location', 'toolService', '$routeParams', '$window', 'sessionService',
    function ($scope, $http, $location, toolService, $routeParams, $window, oSessionService) {

        $scope.totalPages = 1;
        $scope.btnBorrar=true;

        if (!$routeParams.id) {
            $scope.idError = true;
        } else {
            $scope.idError = false;
            $scope.id = $routeParams.id;

            $http({
                method: 'GET',
                url: 'json?ob=usuario&op=get&id=' + $scope.id
            }).then(function (response) {
                $scope.status = response.status;
                $scope.ajaxDataUsuarios = response.data.message;
            }, function (response) {
                $scope.status = response.status;
                $scope.ajaxDataUsuarios = response.data.message || 'Request failed';
            });
        }

        $scope.goBack = function () {
            $window.history.back();
        };
        
        $scope.borrar = function(){
            $scope.btnBorrar=false;
            $http({
                method: 'GET',
                url: 'json?ob=usuario&op=remove&id=' + $scope.id
            }).then(function (response) {
                $scope.status = response.status;
                $scope.ajaxDataUsuarios = response.data.message;
                $scope.resultado="Eliminado con éxito";
            }, function (response) {
                $scope.status = response.status;
                $scope.ajaxDataUsuarios = response.data.message || 'Request failed';
                $scope.resultado="No se pudo eliminar";
            });
        };
        
        if (oSessionService.getUserName() !== "") {
            $scope.usuarioConectado = oSessionService.getUserName();
            $scope.conectado = true;
        }

        $scope.logout = function () {
            $http({
                method: 'GET',
                url: 'json?ob=usuario&op=logout'
            }).then(function () {
                $location.url('/');
            });
        }

        $scope.isActive = toolService.isActive;

        

    }



]);





