'use strict'

moduleUsuario.controller('usuarioLoginController', ['$scope', '$window', '$http', '$location', 'toolService', '$routeParams', 'sessionService',
    function ($scope, $window, $http, $location, toolService, $routeParams, oSessionService) {


        $scope.btnLogin = false;
        $scope.conectado = false;


        $scope.entrar = function () {
            $scope.btnLogin = true;

            var json = {
                user: $scope.login,
                pass: forge_sha256($scope.pass)
            };

            $http({
                method: 'POST',
                url: 'json?ob=usuario&op=login',
                params: json
            }).then(function (response) {
                $scope.status = response.status;
                $scope.ajaxDataUsuarios = response.data.message;
                $scope.resultado = "Bienvenido " + $scope.ajaxDataUsuarios.nombre;
                oSessionService.setUserName(response.data.message.nombre + " " + response.data.message.ape1);
                oSessionService.setUsuarioId(response.data.message.id);
                oSessionService.setId_tipousuario(response.data.message.obj_tipoUsuario.id);
                $scope.conectado = true;
            }, function (response) {
                $scope.status = response.status;
                $scope.ajaxDataUsuarios = response.data.message || 'Request failed';
                $scope.resultado = "No se pudo conectar: " + $scope.ajaxDataUsuarios;
            });
        };

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





