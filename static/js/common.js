var common = common || {};

(function() {
    _.mixin(_.string.exports());

    $.ajaxSetup({
        accept: 'application/json; charset=utf-8'
    });

    $.ajaxJSON = function(method, url, data, success) {
        $.ajax({
            type: method,
            url: url,
            contentType: 'application/json; charset=utf-8',
            data: JSON.stringify(data),
            dataType: 'json'
        }).done(success);
    };

    $.postJSON = function(url, data, success) {
        return $.ajaxJSON('POST', url, data, success);
    };

    $.putJSON = function(url, data, success) {
        return $.ajaxJSON('PUT', url, data, success);
    };

    $.deleteJSON = function(url, success) {
        return $.ajaxJSON('DELETE', url, {}, success);
    };

    common.inherit = (function() {
        var Proxy = function() {
        };
        return function(clazz, parent) {
            Proxy.prototype = parent.prototype;
            clazz.prototype = new Proxy();
            clazz.super_ = parent.prototype;
            clazz.prototype.constructor = clazz;
        };
    })();

    common.wrap = function(proto, o) {
        var w = Object.create(proto);
        _.each(o, function(value, key) {
            w['_' + key] = value;
        });
        return w;
    };

    common.basename = function(name) {
        return name.replace(/\.[^.]*$/, '');
    };

    common.formatTime = function(time) {
        return _.sprintf('%04d-%02d-%02d %02d:%02d:%02d', time.getFullYear(),
                         time.getMonth() + 1, time.getDate(), time.getHours(),
                         time.getMinutes(), time.getSeconds());
    };

    common.formatDuration = function(duration) {
        return _.sprintf('%02d:%02d:%02d', Math.floor(duration/(60*60)), (duration/60)%60, duration%60);
    };

    common.formatAltitude = function(altitude) {
        return _.numberFormat(altitude) + 'm';
    };

    common.formatDistance = function(distance) {
        return _.sprintf('%.1f', distance/1000);
    };
})();
