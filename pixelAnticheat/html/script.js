var reqhidetimeout, curwin, page;
$("#main").hide();
function toggle(window, state) {
    $(".main").hide();
    if (window !== undefined && state) {
        $("#main").show();
        $("#adminmenu").hide();
        curwin = window;
    }
}

function toast(message) {
    $("#toastmsg").html(message);
    $(".toast").toast("show");
}

Date.prototype.addDays = function(days) {
    var date = new Date(this.valueOf());
    date.setDate(date.getDate() + days);
    return date;
}

Date.prototype.addMonths = function(months) {
    var date = new Date(this.valueOf());
    date.setMonth(date.getMonth() + months);
    return date;
}
//            Menu Option          //
$("#pedsBtn").click(function() {
    $.post(`http://${GetParentResourceName()}/deletePeds`, JSON.stringify({}));
});
$("#objectBtn").click(function() {
    $.post(`http://${GetParentResourceName()}/deleteObjects`, JSON.stringify({}));
});
$("#vehiclesBtn").click(function() {
    $.post(`http://${GetParentResourceName()}/deleteVechicles`, JSON.stringify({}));
});
$("#closeBtn").click(function() {
    toggle();
    $.post(`http://${GetParentResourceName()}/NUIFocusOff`, JSON.stringify({}));
});
//                                 //
//            Player Option          //
$("#banbtn").click(function() {
    var ListVal = document.getElementById("targetsel2");
    var target = ListVal.value;
    if (target == 0 || target == "") {
        toast("One or more required fields are left empty");
    } else {
        $.post(`http://${GetParentResourceName()}/GetData`, JSON.stringify({ target: target , action: "ban" }));
    }
});
$("#kickbtn").click(function() {
    var ListVal = document.getElementById("targetsel2");
    var target = ListVal.value;
    if (target == 0 || target == "") {
        toast("One or more required fields are left empty");
    } else {
        $.post(`http://${GetParentResourceName()}/GetData`, JSON.stringify({ target: target , action: "kick" }));
    }
});
$("#screenshotbtn").click(function() {
    var ListVal = document.getElementById("targetsel2");
    var target = ListVal.value;
    if (target == 0 || target == "") {
        toast("One or more required fields are left empty");
    } else {
        $.post(`http://${GetParentResourceName()}/GetData`, JSON.stringify({ target: target , action: "screenshot" }));
    }
});
$("#bringbtn").click(function() {
    var ListVal = document.getElementById("targetsel2");
    var target = ListVal.value;
    if (target == 0 || target == "") {
        toast("One or more required fields are left empty");
    } else {
        $.post(`http://${GetParentResourceName()}/GetData`, JSON.stringify({ target: target , action: "bring" }));
    }
});

$("#gotobtn").click(function() {
    var ListVal = document.getElementById("targetsel2");
    var target = ListVal.value;
    if (target == 0 || target == "") {
        toast("One or more required fields are left empty");
    } else {
        $.post(`http://${GetParentResourceName()}/GetData`, JSON.stringify({ target: target , action: "goto" }));
    }
});
//                                 //

$(function() {
    
    document.onkeyup = function(data) {
        if (data.which == 27) {
            toggle();
            $.post(`http://${GetParentResourceName()}/NUIFocusOff`, JSON.stringify({}));
        }
    };
    $('form input').keydown(function (e) {
        if (e.keyCode == 13) {
            var inputs = $(this).parents("form").eq(0).find(":input");
            if (inputs[inputs.index(this) + 1] != null) {                    
                inputs[inputs.index(this) + 1].focus();
            }
            e.preventDefault();
            return false;
        }
    });

    window.addEventListener('message', function(event) {
        if (event.data.show) {
            toggle(event.data.window, true);
            page = 1;
            $(".pagination").empty();
            $("#bansearch,#warnsearch").val("");
            if (event.data.window == "adminmenu" ) {
                $("#targetsel2").empty();
                $.each(JSON.parse(event.data.players), function(k, v) {
                    console.log(k,v);
                    $("#targetsel2").append($("<option>", { value: k, html: k + " - " + v }));
                });
            }
        } else if (event.data.hide) {
            toggle();
        }

    });
});