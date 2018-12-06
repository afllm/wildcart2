'use strict'

moduleCarrito.controller('carritoPlistController', ['$scope', '$http', '$location', 'toolService', '$routeParams', 'sessionService',
    function ($scope, $http, $location, toolService, $routeParams, oSessionService) {

        $scope.totalPages = 1;
        $scope.conectado = false;
        $scope.ajaxDataAddRed;






        if (!$routeParams.order) {
            $scope.orderURLServidor = "";
            $scope.orderURLCliente = "";
        } else {
            $scope.orderURLServidor = "&order=" + $routeParams.order;
            $scope.orderURLCliente = $routeParams.order;
        }

        if (!$routeParams.rpp) {
            $scope.rpp = '10';//String, para que aparezca al principio (by Carlos)
        } else {
            $scope.rpp = $routeParams.rpp;
        }

        if (!$routeParams.page) {
            $scope.page = 1;
        } else {
            if ($routeParams.page >= 1) {
                $scope.page = $routeParams.page;
            } else {
                $scope.page = 1;
            }
        }

        //llamada al show de carrito para llenar el ajaxDataAddRed
        $http({
            method: 'GET',
            url: 'json?ob=carrito&op=show'
        }).then(function (response) {
            $scope.status = response.status;
            $scope.ajaxDataAddRed = response.data.message;
        }, function (response) {
            $scope.status = response.status;
            $scope.ajaxDataAddRed = response.data.message || 'Request failed';
        });




        $scope.add = function (id) {
            $http({
                method: 'GET',
                url: 'json?ob=carrito&op=add&prod=' + id
            }).then(function (response) {
                $scope.status = response.status;
                $scope.ajaxDataAddRed = response.data.message;
            }, function (response) {
                $scope.status = response.status;
                $scope.ajaxDataAddRed = response.data.message || 'Request failed';
            });
        };


        $scope.reduce = function (id) {
            $http({
                method: 'GET',
                url: 'json?ob=carrito&op=reduce&prod=' + id
            }).then(function (response) {
                $scope.status = response.status;
                $scope.ajaxDataAddRed = response.data.message;
            }, function (response) {
                $scope.status = response.status;
                $scope.ajaxDataAddRed = response.data.message || 'Request failed';
            });
        };


        $scope.resetOrder = function () {
            $location.url(`carrito/plist/` + $scope.rpp + `/` + $scope.page);
        }


        $scope.ordena = function (order, align) {
            if ($scope.orderURLServidor == "") {
                $scope.orderURLServidor = "&order=" + order + "," + align;
                $scope.orderURLCliente = order + "," + align;
            } else {
                $scope.orderURLServidor = $scope.orderURLServidor + "-" + order + "," + align;
                $scope.orderURLCliente = $scope.orderURLCliente + "-" + order + "," + align;
            }
            $location.url(`carrito/plist/` + $scope.rpp + `/` + $scope.page + `/` + $scope.orderURLCliente);
        }

        //getcount
        $http({
            method: 'GET',
            url: 'json?ob=producto&op=getcount'
        }).then(function (response) {
            $scope.status = response.status;
            $scope.ajaxDataNum = response.data.message;
            $scope.totalPages = Math.ceil($scope.ajaxDataNum / $scope.rpp);
            if ($scope.page > $scope.totalPages) {
                $scope.page = $scope.totalPages;
                $scope.update();
            }
            pagination2();
        }, function (response) {
            $scope.ajaxDataNum = response.data.message || 'Request failed';
            $scope.status = response.status;
        });

        $http({
            method: 'GET',
            url: 'json?ob=producto&op=getpage&rpp=' + $scope.rpp + '&page=' + $scope.page + $scope.orderURLServidor
        }).then(function (response) {
            $scope.status = response.status;
            $scope.ajaxData = response.data.message;
        }, function (response) {
            $scope.status = response.status;
            $scope.ajaxData = response.data.message || 'Request failed';
        });



        $scope.update = function () {
            $location.url(`carrito/plist/` + $scope.rpp + `/` + $scope.page + '/' + $scope.orderURLCliente);
        };




        //paginacion neighbourhood
        function pagination2() {
            $scope.list2 = [];
            $scope.neighborhood = 3;
            for (var i = 1; i <= $scope.totalPages; i++) {
                if (i === $scope.page) {
                    $scope.list2.push(i);
                } else if (i <= $scope.page && i >= ($scope.page - $scope.neighborhood)) {
                    $scope.list2.push(i);
                } else if (i >= $scope.page && i <= ($scope.page - -$scope.neighborhood)) {
                    $scope.list2.push(i);
                } else if (i === ($scope.page - $scope.neighborhood) - 1) {
                    $scope.list2.push("...");
                } else if (i === ($scope.page - -$scope.neighborhood) + 1) {
                    $scope.list2.push("...");
                }
            }
        }

        if (oSessionService.getUserName() !== "") {
            $scope.usuarioConectado = oSessionService.getUserName();
            $scope.conectado = true;
        }

        $scope.isActive = toolService.isActive;


        //se ejecuta en cada span de cantidad, cuando se carga
        $scope.sacaMuelas = function (idProd) {
            //tengo que recorrer ajaxDataAddRed y buscar el producto idProd
            //si lo encuentro entonces devolver la cantidad
            var arrayLength = $scope.ajaxDataAddRed.length;
            for (var i = 0; i < arrayLength; i++) {
                if ($scope.ajaxDataAddRed !== null && $scope.ajaxDataAddRed !=="Carrito vacio") {
                    if ($scope.ajaxDataAddRed[i].obj_producto.id === idProd) {
                        return $scope.ajaxDataAddRed[i].cantidad;
                    }
                }
            }
            return 0;
        }



    }



]);