<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>通用后台管理模板系统</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <link rel="stylesheet" href="${request.contextPath}/layuiadmin/layui/css/layui.css" media="all">
    <link rel="stylesheet" href="${request.contextPath}/layuiadmin/style/admin.css" media="all">
    <link rel="stylesheet" href="${request.contextPath}/layuiadmin/style/common.css" media="all">
    <link rel="stylesheet" href="${request.contextPath}/layuiadmin/style/popup.css" media="all">
</head>
<body>
<script>
</script>
<div class="layui-card layui-content">
    <div class="layui-card-body">
        <form class="layui-form"  action="" lay-filter="component-form-element">
            <input type="hidden" id="id" name="id" value="${id}">
            <div class="layui-row layui-col-space10 layui-form-item">



                <div class="layui-col-lg6">
                        <label class="layui-form-label">合同客户</label>
                    <div class="layui-input-block">
<#--                        <input type="text"-->
<#--                               name="custId"-->
<#--                               value="${obj.custId}"-->
<#--                               autocomplete="off"-->
<#--                               class="layui-input">-->
                        <select name="custId" <#if obj.nullifyStatus == 1>disabled</#if>>
                            <#list customerList as list>
                                <#if obj.custId==list.id>
                                    <option selected value="${list.id}">${list.customerName}</option>
                                <#else>
                                    <option value="${list.id}">${list.customerName}</option>
                                </#if>
                            </#list>
                        </select>
                    </div>
                </div>


                <div class="layui-col-lg6">
                        <label class="layui-form-label">合同名称</label>
                    <div class="layui-input-block">
                        <input type="text"
                               name="contractName"
                               value="${obj.contractName}"
                               autocomplete="off"
                               <#if obj.nullifyStatus == 1>disabled</#if>
                               class="layui-input">
                    </div>
                </div>


                <div class="layui-col-lg6">
                        <label class="layui-form-label">合同编码</label>
                    <div class="layui-input-block">
                        <input type="text"
                               name="contractCode"
                               value="${obj.contractCode}"
                               autocomplete="off"
                               <#if obj.nullifyStatus == 1>disabled</#if>
                               class="layui-input">
                    </div>
                </div>


                <div class="layui-col-lg6">
                        <label class="layui-form-label">合同金额</label>
                    <div class="layui-input-block">
                        <input type="text"
                               id="price"
                               name="amounts"
                               value="${obj.amounts}"
                               autocomplete="off"
                               <#if obj.nullifyStatus == 1>disabled</#if>
                               class="layui-input">
                    </div>
                </div>


                <div class="layui-col-lg6">
                        <label class="layui-form-label">合同生效开始时间</label>
<#--                    <div class="layui-input-block">-->
<#--                        <input type="text"-->
<#--                               name="startDate"-->
<#--                               value="${obj.startDate}"-->
<#--                               autocomplete="off"-->
<#--                               class="layui-input">-->
<#--                    </div>-->
                    <div class="layui-input-block">
                        <input  <#if obj.nullifyStatus == 1>disabled</#if> value="${obj.startDate}" type="text" id="startDate" name="startDate" placeholder="请输入"  autocomplete="off" class="layui-input">
                    </div>
                </div>


                <div class="layui-col-lg6">
                        <label class="layui-form-label">合同生效结束时间</label>
<#--                    <div class="layui-input-block">-->
<#--                        <input type="text"-->
<#--                               name="endDate"-->
<#--                               value="${obj.endDate}"-->
<#--                               autocomplete="off"-->
<#--                               class="layui-input">-->
<#--                    </div>-->
                    <div class="layui-input-block">
                        <input <#if obj.nullifyStatus == 1>disabled</#if> value="${obj.endDate}" type="text" id="endDate" name="endDate" placeholder="请输入"  autocomplete="off" class="layui-input">
                    </div>
                </div>


                <div class="layui-col-lg6">
                        <label class="layui-form-label">合同内容</label>
                    <div class="layui-input-block">
                        <input type="text"
                               name="content"
                               value="${obj.content}"
                               autocomplete="off"
                               <#if obj.nullifyStatus == 1>disabled</#if>
                               class="layui-input">
                    </div>
                </div>


                <div class="layui-col-lg6">
                        <label class="layui-form-label">是否盖章确认 0 否 1 是</label>
                    <div class="layui-input-block">

                        <select name="affixSealStatus" <#if obj.nullifyStatus == 1>disabled</#if>>
                                <option value="1" <#if obj.affixSealStatus == 1>selected</#if>>是</option>
                                <option value="0" <#if obj.affixSealStatus == 0>selected</#if>>否</option>
                        </select>
                    </div>
                </div>


                <div class="layui-col-lg6">
                        <label class="layui-form-label">审核状态 0 未审核 1 审核通过 -1 审核不通过</label>
                    <div class="layui-input-block">
<#--                        <input type="text"-->
<#--                               name="auditStatus"-->
<#--                               value="${obj.auditStatus}"-->
<#--                               autocomplete="off"-->
<#--                               class="layui-input">-->
                        <select name="auditStatus" <#if obj.nullifyStatus == 1>disabled</#if>>
                            <option <#if obj.auditStatus == 0>selected</#if> value="0">未审核</option>
                            <option <#if obj.auditStatus == 1>selected</#if> value="1">审核通过</option>
                            <option <#if obj.auditStatus == -1>selected</#if> value="-1">审核不通过</option>
                        </select>
                    </div>
                </div>


                <div class="layui-col-lg6">
                        <label class="layui-form-label">是否作废 1 作废 0 在用</label>
                    <div class="layui-input-block">

                         <select name="nullifyStatus" <#if obj.nullifyStatus == 1>disabled</#if>>
                              <option value="0" <#if obj.nullifyStatus == 0>selected</#if>>在用</option>
                              <option value="1" <#if obj.nullifyStatus == 1>selected</#if>>作废</option>
                          </select>
                    </div>
                </div>


                <div class="layui-form-item">
                    <div class="layui-input-block">
                        <button class="layui-btn layui-btn-normal" lay-submit lay-filter="Add-filter">修改</button>
                        <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                    </div>
                </div>
            </div>
        </form>
    </div>
</div>

<script src="${request.contextPath}/layuiadmin/layui/layui.js"></script>
<script src="${request.contextPath}/layui-extend.js"></script>
<script src="${request.contextPath}/webjars/jquery/jquery.min.js"></script>
<script>
       let update = price.value.replace(/,/g,'')
       price.value = update
</script>
<script type="text/javascript" src="${request.contextPath}/scripts/custContract/custContractInfo/update.js?_=${randomNum}"></script>
</body>
