'use strict'

moduleProducto.controller('productoEditController', ['$scope', '$http', '$location', 'toolService', '$routeParams', '$window',
    function ($scope, $http, $location, toolService, $routeParams, $window) {

        $scope.totalPages = 1;
        $scope.btnUpdate = true;

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
                $scope.id = response.data.message.id;
                $scope.codigo = response.data.message.desc;
                $scope.desc = response.data.message.desc;
                $scope.existencias = response.data.message.existencias;
                $scope.precio = response.data.message.precio;
                $scope.foto = response.data.message.foto;
                $scope.obj_tipoProducto_desc = response.data.message.obj_tipoProducto.desc;
                $scope.obj_tipoProducto_id = response.data.message.obj_tipoProducto.id;
            }, function (response) {
                $scope.status = response.status;
                $scope.ajaxDataProductos = response.data.message || 'Request failed';
            });
        }

        $scope.goBack = function () {
            $window.history.back();
        };

        $scope.editar = function () {
            $scope.btnUpdate = false;

            var json = {
                id: $scope.id,
                codigo: $scope.codigo,
                desc: $scope.desc,
                existencias: $scope.existencias,
                precio: $scope.precio,
                foto: $scope.foto,
                id_tipoProducto: $scope.obj_tipoProducto_id
            }

            $http({
                method: 'POST',
                url: '/json?ob=producto&op=update',
                params: {json: JSON.stringify(json)}
            }).then(function (response) {
                $scope.status = response.status;
                $scope.ajaxDataProductos = response.data.message;
                $scope.resultado = "Actualizado con éxito";
            }, function (response) {
                $scope.status = response.status;
                $scope.ajaxDataProductos = response.data.message || 'Request failed';
                $scope.resultado = "No se pudo actualizar";
            });
        };

        $scope.isActive = toolService.isActive;



    }



]);





