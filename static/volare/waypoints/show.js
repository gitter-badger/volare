define([
    'require',
    'lodash',
    'angular',
    'google',
    'markerwithlabel',
    'text!./show.css',
    'volare/components/name',
    'volare/util',
    'volare/util/layout'
], function(require, _, angular, google, markerWithLabel, css) {
    'use strict';

    var module = angular.module('volare.waypoint', [
        'volare.components.name',
        'volare.util',
        'volare.util.layout'
    ]);

    module.controller('WaypointController', ['$scope', '$http', 'util', function($scope, $http, util) {
        util.loadCssInline(css);

        $scope.items = [];
        $http.get('').success(function(waypoint) {
            $scope.name = waypoint.name;
            $scope.items = waypoint.items;
        });
    }]);

    module.controller('WaypointNameController', ['$scope', '$http', '$window', '$document', function($scope, $http, $window, $document) {
        $scope.update = function(name) {
            var self = this;
            $http.put('', {
                name: name
            }).success(function(waypoint) {
                self.name = waypoint.name;
            });
        };
        $scope.delete = function() {
            if ($window.confirm('Are you sure to delete these waypoints?')) {
                $http.delete('').success(function() {
                    $document[0].location.href = '/waypoints';
                });
            }
        };
    }]);

    module.directive('volareWaypoint', [function() {
        return {
            restrict: 'E',
            replace: true,
            template: '<div></div>',
            scope: {
                items: '='
            },
            link: function(scope, element, attrs) {
                var map = new google.maps.Map(element[0], {
                    mapTypeId: google.maps.MapTypeId.HYBRID
                });

                var markers = [];
                scope.$watch('items', function(items) {
                    _.each(markers, function(marker) {
                        marker.setMap(null);
                    });
                    markers = [];

                    if (items.length !== 0) {
                        var bounds = null;
                        _.each(scope.items, function(item) {
                            var position = new google.maps.LatLng(item.latitude, item.longitude);
                            var label = item.name;
                            if (item.name !== item.description) {
                                label += ' (' + item.description + ')';
                            }
                            var marker = new markerWithLabel.MarkerWithLabel({
                                map: map,
                                position: position,
                                title: item.name,
                                labelContent: label,
                                labelAnchor: new google.maps.Point(-15, 35),
                                labelClass: 'label'
                            });
                            markers.push(marker);

                            if (!bounds)
                                bounds = new google.maps.LatLngBounds(position, position);
                            else
                                bounds.extend(position);
                        });

                        map.fitBounds(bounds);
                    }
                });
            }
        };
    }]);

    return module;
});
