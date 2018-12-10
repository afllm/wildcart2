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
                //$scope.pass = ""; (si lo pongo, encriptar)
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
        
        $scope.tipoUsuarioRefresh = function (f, consultar) {
            var form = f;
            if (consultar) {
                $http({
                    method: 'GET',
                    url: 'json?ob=tipousuario&op=get&id=' + $scope.obj_tipoUsuario.id
                }).then(function (response) {
                    $scope.obj_tipoUsuario = response.data.message;
                    form.userForm.obj_tipousuario.$setValidity('valid', true);
                }, function (response) {
                    //$scope.status = response.status;
                    form.userForm.obj_tipousuario.$setValidity('valid', false);
                });
            } else {
                form.userForm.obj_tipousuario.$setValidity('valid', true);
            }
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





