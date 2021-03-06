var config_data;

$(function(){
    $("#btn-write").on('click',config_write);
    $(window).on('beforeunload', function(e){
        if(modified()){
            return "ちょっと待ってください。";
        }
    });

    $("#new-script-dialog").dialog({
        autoOpen: false,
        height: 150,
        width:  400,
        modal: false,
        buttons: {
            "新規作成" : function(){
                var name = $("#config-script-name").val();
                if(name == ""){
                    alert("スクリプト名を入力して下さい");
                } else if(name.length > 8){
                    alert("スクリプト名は8文字以下にして下さい");
                } else {
                    $.ajax({
                        url: "/api",
                        type: "GET",
                        data: {cmd : "new_script", name: name},
                        dataType: "text",
                        success: function(data, datatype){
                            read_script_list(name);
                        },
                        error: function(xhr, textStatus, e){
                            console.log(textStatus + ":" +
                                        xhr.responseText);
                            alert("スクリプトの作成に失敗しました。"
                                  + xhr.responseText);
                        },
                    });
                    $(this).dialog("close");
                }
            },
            "キャンセル" : function(){
                $(this).dialog("close");
            }
        },
    });
    $("#dialog2").dialog({ autoOpen: false});
        

    $("#btn-new-script").button().click(function(){
        $("#new-script-dialog").dialog("open");
        return false;
    });

    read_config(function(data,dataType){
        config_data = data;
        for(let prop in data){
            $("#config-" + prop).val(data[prop]);
        }
        read_script_list(data.script);
    });
});

function read_script_list( script_name )
{
    $.ajax({
        url: "/api",
        type : "GET",
        data: { cmd : "list_script" },
        dataType: "json",
        success: function(data, dataType){
            var s = "";
            for(let n of data){
                s += "<option value='" + n + "'";
                if(n == script_name)
                    s += " selected";
                s += ">";
                s += n;
                s += "</option>";
            }
            $("#config-script").html(s);
        },
        error: function(XMLHttpRequest, textStatus, e){
            console.log("error:" + textStatus + ":" + e.message);
        },
    });
}

function get_data(){
    var  d = {};
    for(let name of ['moduleType','moduleRow','moduleColumn',
                     'plane','bright','script','ledMode']){
        d[name] = $("#config-" + name).val();
    }
    return d;
}

function config_write()
{
    console.log("config_write");

    var d = get_data();
    var formData = new FormData();
    var blob = new Blob([JSON.stringify(d,null,' ')],{
        type:'application/json'});
    formData.append("foo",blob);

    $.ajax({
        url: "/upload_config",
        type: "POST",
        data: formData,
        cache: false,
        contentType : false,
        processData : false,
        dataType: "html"
    })
    .done(function(data, textStatus,jqXHR){
        console.log("done:" + textStatus + " data:" + data);
        $.ajax({
            url: "/api",
            type: "POST",
            data: {cmd : "reload_config"},
        })
        .done(function(data,textStatus,jqXHR){
            console.log("reload_config done:" + textStatus);
        })
        .fail(function(jqXHR,textStatus,errorThrown){
            console.log("reload_config fail:" + textStatus);
        });

    })
    .fail(function(jqXHR, textStatus, errorThrown){
        console.log("fail:" + textStatus);
    });
}

function modified(){
    var d = get_data();
    var dc = 0;
    for(let n in config_data){
        if(config_data[n] != d[n]){
            console.log(n + " differ " + config_data[n] + " : " + d[n]);
            dc++;
        }
    }

    return dc > 0;
}
