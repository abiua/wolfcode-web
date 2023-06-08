layui.use(['form', 'layer'], function () {
    var form = layui.form,
        layer = layui.layer,
        $ = layui.jquery;


    form.on('submit(Add-filter)', function (data) {
        $.ajax({
            url: web.rootPath() + "orderInfo/update",
            contentType: "application/json",
            type: "put",
            data: JSON.stringify(data.field),
            dataType: 'json',
            success: function (data) {
                layer.msg("操作成功", {
                    icon: 1,
                    success: function () {
                        reloadTb("Update-frame", "#SearchBtn");
                    }
                });
            },
            error: function (e) {
                layer.msg(e.responseJSON.message, {icon: 2});
            }

        })
        return false;
    });
    var selectElement = document.getElementById("custUpdateId");
    var selectElement2 = document.getElementById("receiverUpdate");
    var receiver= selectElement2.dataset.receiver
    var value = selectElement.dataset.custid
    console.log(value,receiver)
    $.ajax({
                    url: web.rootPath()+'custLinkManInfo/listByCustomerId?custId='+value,
                    type: 'POST',
                    contentType: 'application/json',
                    dataType: "JSON",
                    //成功or错误后
                    success: function (d){
                        $("#receiverUpdate").empty();
                        var optionHtml = `<option value="">---请选择---</option>`
                        if (d.data.length > 0){
                            d.data.forEach(item=>{
                            if(item.id == receiver){
                                optionHtml += `<option value="${item.id}" selected>${item.linkman}</option>`
                            }
                            else{
                                optionHtml += `<option value="${item.id}">${item.linkman}</option>`
                            }

                            })
                        }
                        $("#receiverUpdate").html(optionHtml)

                        form.render('select','component-form-element')


                    },
                    error: function (data){
                        console.log("error")
                    }
                })
    form.on('select(custId-select-filter-update)',function (data){
            var value = data.value;
            $.ajax({
                url: web.rootPath()+'custLinkManInfo/listByCustomerId?custId='+value,
                type: 'POST',
                contentType: 'application/json',
                dataType: "JSON",
                //成功or错误后
                success: function (d){

                    $("#linkPhone").empty();
                    $("#receiverUpdate").empty();
                    var optionHtml = `<option value="">---请选择---</option>`
                    if (d.data.length > 0){
                        d.data.forEach(item=>{
                            optionHtml += `<option value="${item.id}">${item.linkman}</option>`
                        })
                    }
                    $("#receiverUpdate").html(optionHtml)

                    form.render('select','component-form-element')


                },error: function (data){
                    console.log("error")
                }
            })
        });
     form.on('select(receiver-select-filter-update)',function (data){
             var value = data.value;
             $.ajax({
                 url: web.rootPath()+'custLinkManInfo/getLinkmanPhone?id='+value,
                 type: 'POST',
                 contentType: 'application/json',
                 dataType: "JSON",


                 //成功or错误后
                 success: function (d){
                     $("#linkPhoneUpdate").empty();
                     var optionHtml = `<option value="${d.data}">${d.data}</option>`
                     $("#linkPhoneUpdate").html(optionHtml)

                     form.render('select','component-form-element')


                 },error: function (data){
                     console.log("error")
                 }
             })
         });
});
