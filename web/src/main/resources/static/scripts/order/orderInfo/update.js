layui.use(['form', 'layer'], function () {
    var form = layui.form,
        layer = layui.layer,
        $ = layui.jquery;


    form.on('submit(add-filter)', function (data) {
        $.ajax({
            url: web.rootpath() + "orderinfo/update",
            contenttype: "application/json",
            type: "put",
            data: json.stringify(data.field),
            datatype: 'json',
            success: function (data) {
                layer.msg("操作成功", {
                    icon: 1,
                    success: function () {
                        reloadtb("update-frame", "#searchbtn");
                    }
                });
            },
            error: function (e) {
                layer.msg(e.responsejson.message, {icon: 2});
            }

        })
        return false;
    });
    var selectelement = document.getelementbyid("custupdateid");
    var selectelement2 = document.getelementbyid("receiverupdate");
    var receiver= selectelement2.dataset.receiver
    var value = selectelement.dataset.custid
    console.log(value,receiver)
    $.ajax({
                    url: web.rootpath()+'custlinkmaninfo/listbycustomerid?custid='+value,
                    type: 'post',
                    contenttype: 'application/json',
                    datatype: "json",
                    //成功or错误后
                    success: function (d){
                        $("#receiverupdate").empty();
                        var optionhtml = `<option value="">---请选择---</option>`
                        if (d.data.length > 0){
                            d.data.foreach(item=>{
                            if(item.id == receiver){
                                optionhtml += `<option value="${item.id}" selected>${item.linkman}</option>`
                            }
                            else{
                                optionhtml += `<option value="${item.id}">${item.linkman}</option>`
                            }

                            })
                        }
                        $("#receiverupdate").html(optionhtml)

                        form.render('select','component-form-element')


                    },
                    error: function (data){
                        console.log("error")
                    }
                })
    form.on('select(custid-select-filter-update)',function (data){
            var value = data.value;
            $.ajax({
                url: web.rootpath()+'custlinkmaninfo/listbycustomerid?custid='+value,
                type: 'post',
                contenttype: 'application/json',
                datatype: "json",
                //成功or错误后
                success: function (d){

                    $("#linkphone").empty();
                    $("#receiverupdate").empty();
                    var optionhtml = `<option value="">---请选择---</option>`
                    if (d.data.length > 0){
                        d.data.foreach(item=>{
                            optionhtml += `<option value="${item.id}">${item.linkman}</option>`
                        })
                    }
                    $("#receiverupdate").html(optionhtml)

                    form.render('select','component-form-element')


                },error: function (data){
                    console.log("error")
                }
            })
        });
     form.on('select(receiver-select-filter-update)',function (data){
             var value = data.value;
             $.ajax({
                 url: web.rootpath()+'custlinkmaninfo/getlinkmanphone?id='+value,
                 type: 'post',
                 contenttype: 'application/json',
                 datatype: "json",


                 //成功or错误后
                 success: function (d){
                     $("#linkphoneupdate").empty();
                     var optionhtml = `<option value="${d.data}">${d.data}</option>`
                     $("#linkphoneupdate").html(optionhtml)

                     form.render('select','component-form-element')


                 },error: function (data){
                     console.log("error")
                 }
             })
         });
});
