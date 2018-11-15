'use strict'

moduleUsuario.controller('usuarioLoginController', ['$scope', '$http', '$location', 'toolService', '$routeParams', '$window',
    function ($scope, $http, $location, toolService, $routeParams, $window) {

        $scope.totalPages = 1;
        $scope.btnLogin = true;
      

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
                url: '/json?ob=usuario&op=login',
                params: json,
            }).then(function (response) {
                $scope.status = response.status;
                $scope.ajaxDataUsuarios = response.data.message;
                $scope.resultado = "Logueado con éxito";
            }, function (response) {
                $scope.status = response.status;
                $scope.ajaxDataUsuarios = response.data.message || 'Request failed';
                $scope.resultado = "No se pudo loguear";
            });
        };

        $scope.isActive = toolService.isActive;



    }



]);





