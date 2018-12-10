'use strict'

moduleTipoproducto.controller('tipoproductoEditController', ['$scope', '$http', '$location', 'toolService', '$routeParams', '$window', 'sessionService',
    function ($scope, $http, $location, toolService, $routeParams, $window, oSessionService) {

        $scope.totalPages = 1;
        $scope.btnUpdate = true;
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
                $scope.id = response.data.message.id;
                $scope.desc = response.data.message.desc;
            }, function (response) {
                $scope.status = response.status;
                $scope.ajaxDataTipoproductos = response.data.message || 'Request failed';
            });
        }

        $scope.goBack = function () {
            $window.history.back();
        };

        $scope.editar = function () {
            $scope.btnUpdate = false;

            var json = {
                id: $scope.id,
                desc: $scope.desc
            }

            $http({
                method: 'POST',
                url: 'json?ob=tipoproducto&op=update',
                params: {json: JSON.stringify(json)}
            }).then(function (response) {
                $scope.status = response.status;
                $scope.ajaxDataTipoproductos = response.data.message;
                $scope.resultado = "Actualizado";
            }, function (response) {
                $scope.status = response.status;
                $scope.ajaxDataTipoproductos = response.data.message || 'Request failed';
                $scope.resultado = "No se pudo actualizar";
            });
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





