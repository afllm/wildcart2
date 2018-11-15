'use strict'

moduleProducto.controller('productoRemoveController', ['$scope', '$http', '$location', 'toolService', '$routeParams', '$window',
    function ($scope, $http, $location, toolService, $routeParams, $window) {

        $scope.totalPages = 1;
        $scope.btnBorrar=true;

        if (!$routeParams.id) {
            $scope.idError = true;
        } else {
            $scope.idError = false;
            $scope.id = $routeParams.id;

            $http({
                method: 'GET',
                url: '/json?ob=producto&op=get&id=' + $scope.id
            }).then(function (response) {
                $scope.status = response.status;
                $scope.ajaxDataProductos = response.data.message;
            }, function (response) {
                $scope.status = response.status;
                $scope.ajaxDataProductos = response.data.message || 'Request failed';
            });
        }

        $scope.goBack = function () {
            $window.history.back();
        };
        
        $scope.borrar = function(){
            $scope.btnBorrar=false;
            $http({
                method: 'GET',
                url: '/json?ob=producto&op=remove&id=' + $scope.id
            }).then(function (response) {
                $scope.status = response.status;
                $scope.ajaxDataProductos = response.data.message;
                $scope.resultado="Eliminado con éxito";
            }, function (response) {
                $scope.status = response.status;
                $scope.ajaxDataProductos = response.data.message || 'Request failed';
                $scope.resultado="No se pudo eliminar";
            });
        };

        $scope.isActive = toolService.isActive;

        

    }



]);





