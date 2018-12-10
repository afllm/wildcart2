'use strict'

moduleUsuario.controller('usuarioLogoutController', ['$scope', '$http', '$location', 'toolService', '$routeParams', '$window', 'sessionService',
    function ($scope, $http, $location, toolService, $routeParams, $window, oSessionService) {

        $scope.conectado = false;

        if (oSessionService.getUserName() !== "") {
            $scope.usuarioConectado = oSessionService.getUserName();
            $scope.usuarioId = oSessionService.getUsuarioId();
            $scope.id_tiposusario = oSessionService.getId_tipousuario();
            $scope.conectado = true;
        }

        $scope.goBack = function () {
            $window.history.back();
        };

        $scope.logout = function () {
            $http({
                method: 'GET',
                url: 'json?ob=usuario&op=logout'
            }).then(function () {
                $scope.conectado = false;
                oSessionService.setSessionInactive();
            });
        };



        $scope.isActive = toolService.isActive;

    }]);