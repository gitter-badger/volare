$(function() {
    _.mixin(_.string.exports());

    var flights = new volare.Flights();
    var player = new volare.Player(flights, $('#player'));
    var map = new volare.Map(flights, $('#map'));
    var altitudeGraph = new volare.AltitudeGraph(flights, $('#altitude'));
    var speedGraph = new volare.SpeedGraph(flights, $('#speed'));
    var chart = new volare.Chart(flights, $('#chart'));

    $.getJSON('', function(flight) {
        var f = new volare.Flight(flight, 'red');
        $('#time').text(formatTime(f.getTime()));
        $('#duration').text(formatDuration(f.getDuration()/1000));
        $('#max_altitude').text(formatAltitude(f.getMaxAltitude()));
        flights.addFlight(f);
    });

    var showName = $('#show_name');
    var editName = $('#edit_name');
    var inputName = $('#edit_name input');
    function startEditingName() {
        showName.hide();
        editName.show();
        inputName.focus();
    }
    function finishEditingName() {
        var name = inputName.val();
        $('#name').text(name);
        editName.hide();
        showName.show();

        var data = {
            name: name
        };
        $.putJSON('', data, function(flight) {
        });
    }
    $('#show_name a').on('click', function(event) {
        event.preventDefault();
        startEditingName();
    });
    $('#edit_name button').on('click', finishEditingName);
    inputName.on('keyup', function(event) {
        if (event.keyCode == 0x0d)
            finishEditingName();
    });

    function formatTime(time) {
        return _.sprintf('%04d-%02d-%02d %02d:%02d:%02d', time.getFullYear(),
                         time.getMonth() + 1, time.getDate(), time.getHours(),
                         time.getMinutes(), time.getSeconds());
    }

    function formatDuration(duration) {
        return _.sprintf('%02d:%02d:%02d', Math.floor(duration/(60*60)), (duration/60)%60, duration%60);
    }

    function formatAltitude(altitude) {
        return _.numberFormat(altitude) + 'm';
    }
});
