'use strict'

moduleProducto.controller('productoNewController', ['$scope', '$http', '$location', 'toolService', '$routeParams', '$window',
    function ($scope, $http, $location, toolService, $routeParams, $window) {

        $scope.totalPages = 1;
        $scope.btnNew = true;
        
        $scope.goBack = function () {
            $window.history.back();
        };

        $scope.nuevo = function () {
            $scope.btnNew = false;

            var json = {
                codigo: $scope.codigo,
                desc: $scope.desc,
                existencias: $scope.existencias,
                precio: $scope.precio,
                foto: $scope.foto,
                id_tipoProducto: 1
            }

            $http({
                method: 'POST',
                url: '/json?ob=producto&op=create',
                params: {json: JSON.stringify(json)}
            }).then(function (response) {
                $scope.status = response.status;
                $scope.ajaxDataProductos = response.data.message;
                $scope.resultado = "Creado con éxito";
            }, function (response) {
                $scope.status = response.status;
                $scope.ajaxDataProductos = response.data.message || 'Request failed';
                $scope.resultado = "No se pudo crear";
            });
        };

        $scope.isActive = toolService.isActive;



    }



]);





