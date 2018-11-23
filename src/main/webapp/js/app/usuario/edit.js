'use strict'

moduleUsuario.controller('usuarioEditController', ['$scope', '$http', '$location', 'toolService', '$routeParams', '$window', 'sessionService',
    function ($scope, $http, $location, toolService, $routeParams, $window, oSessionService) {

        $scope.totalPages = 1;
        $scope.btnUpdate = true;
        $scope.conectado = false;
        $scope.resultado = "---";
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
                $scope.id = response.data.message.id;
                $scope.nombre = response.data.message.nombre;
                $scope.dni = response.data.message.dni;
                $scope.ape1 = response.data.message.ape1;
                $scope.ape2 = response.data.message.ape2;
                $scope.login = response.data.message.login;
                //$scope.pass = "";
                $scope.obj_tipoUsuario_desc = response.data.message.obj_tipoUsuario.desc;
                $scope.obj_tipoUsuario_id = response.data.message.obj_tipoUsuario.id;
            }, function (response) {
                $scope.status = response.status;
                $scope.ajaxDataUsuarios = response.data.message || 'Request failed';
            });
        }

        $scope.goBack = function () {
            $window.history.back();
        };

        $scope.editar = function () {
            $scope.btnUpdate = false;

            var json = {
                id: $scope.id,
                dni: $scope.dni,
                nombre: $scope.nombre,
                ape1: $scope.ape1,
                ape2: $scope.ape2,
                login: $scope.login,
                id_tipoUsuario: $scope.obj_tipoUsuario_id
            }

            $http({
                method: 'POST',
                url: 'json?ob=usuario&op=update',
                params: {json: JSON.stringify(json)}
            }).then(function (response) {
                $scope.status = response.status;
                $scope.ajaxDataUsuarios = response.data.message;
                $scope.resultado = "Actualizado";
            }, function (response) {
                $scope.status = response.status;
                $scope.ajaxDataUsuarios = response.data.message || 'Request failed';
                $scope.resultado = "No se pudo actualizar";
            });
        };
        
        if (oSessionService.getUserName() !==""){
            $scope.usuarioConectado = oSessionService.getUserName();
            $scope.conectado = true;
        }
        
        $scope.logout = function (){
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





