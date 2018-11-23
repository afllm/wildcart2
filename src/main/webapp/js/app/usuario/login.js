'use strict'

moduleUsuario.controller('usuarioLoginController', ['$scope', '$http', '$location', 'toolService', '$routeParams', '$window', 'sessionService',
    function ($scope, $http, $location, toolService, $routeParams, $window, oSessionService) {

        $scope.totalPages = 1;
        $scope.btnLogin = true;
        $scope.conectado = false;

        $scope.goBack = function () {
            $window.history.back();
        };

        $scope.entrar = function () {
            $scope.btnLogin = false;

            var json = {
                user: $scope.login,
                pass: $scope.pass
            };

            $http({
                method: 'POST',
                url: 'json?ob=usuario&op=login',
                params: json
            }).then(function (response) {
                $scope.status = response.status;
                $scope.ajaxDataUsuarios = response.data.message;
                $scope.resultado = "Conectado";
                $scope.conectado = true;
                oSessionService.setUserName(response.data.message.nombre + " " + response.data.message.ape1);
                $scope.usuarioConectado = oSessionService.getUserName();
            }, function (response) {
                $scope.status = response.status;
                $scope.ajaxDataUsuarios = response.data.message || 'Request failed';
                $scope.resultado = "No se pudo conectar";
            });
        };

        $scope.isActive = toolService.isActive;



    }



]);





