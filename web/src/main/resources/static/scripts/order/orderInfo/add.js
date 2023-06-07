layui.use(['form', 'layer'], function () {
    var form = layui.form,
        layer = layui.layer,
        $ = layui.jquery;

    form.on('submit(Add-filter)', function (data) {
        $.ajax({
            url: web.rootPath() + "orderInfo/save",
            type: "post",
            contentType: "application/json",
            data: JSON.stringify(data.field),
            dataType: 'json',
            traditional: true,
            success: function (data) {
                layer.msg("操作成功", {
                    icon: 1,
                    success: function () {
                        reloadTb("Save-frame", "#SearchBtn");
                    }
                });
            },
            error: function (e) {
                layer.msg(e.responseJSON.message, {icon: 2});
            }

        });
        return false;
    });


    form.on('select(custId-select-filter)',function (data){
        var value = data.value;
        $.ajax({
            url: web.rootPath()+'custLinkManInfo/listByCustomerId/?custId='+value,
            type: 'POST',
            contentType: 'application/json',
            dataType: "JSON",


            //成功or错误后
            success: function (d){
                console.log("success");
                $("#linkman").empty();
                $("#linkPhone").empty();
                var optionHtml = `<option value="">---请选择---</option>`
                if (d.data.length > 0){
                    console.log("大于0")
                    d.data.forEach(item=>{
                        optionHtml += `<option value="${item.id}">${item.linkman}</option>`
                    })
                }
                $("#linkman").html(optionHtml)

                form.render('select','component-form-element')


            },error: function (data){
                console.log("error")
            }
        })
    });

    form.on('select(linkman-select-filter)',function (data){
        var value = data.value;
        $.ajax({
            url: web.rootPath()+'custLinkManInfo/getLinkmanPhone/?id='+value,
            type: 'POST',
            contentType: 'application/json',
            dataType: "JSON",


            //成功or错误后
            success: function (d){
                console.log("success");
                $("#linkPhone").empty();
                var optionHtml = `<option value="${d.data}">${d.data}</option>`

                $("#linkPhone").html(optionHtml)

                form.render('select','component-form-element')


            },error: function (data){
                console.log("error")
            }
        })
    });
});
