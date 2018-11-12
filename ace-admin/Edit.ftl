<%--
Created by IntelliJ IDEA.
User: javaccy
Date: 16-6-5
Time: 下午8:29
To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../../../source/libs.jsp"%>
<title>${entity.comment}管理</title>
<link rel="stylesheet" href="${r"${"}basePath${"}"}/plugins/select2/dist/css/select2.css" />
<link rel="stylesheet" href="${r"${"}basePath${"}"}/plugins/eonasdan-bootstrap-datetimepicker/build/css/bootstrap-datetimepicker.css" />
<div class="row">
    <div class="col-xs-12">
        <form class="form-horizontal" id="validation-form" method="post" action="/admin/${functions.underScoreCase(entity.name)}/${r"${"}empty o.id ? 'add' : 'edit' ${"}"}.json" onsubmit="return false">
            <#include "form/IdInput.ftl"/>
            <#list entity.fields as item>
            <#if item.name == 'id'>
            <#include "form/IdInput.ftl"/>
            <#else>
                <#if item.inputTemplate??>
                <#include "${item.inputTemplate}"/>
                <#else>
                <#include "form/TextInput.ftl"/>
                </#if>
            </#if>
            </#list>
            <div class="clearfix form-actions">
                <div class="col-md-offset-3 col-md-9">
                    <button id="save-btn" class="btn btn-success">
                        提交
                    </button>
                    &nbsp; &nbsp; &nbsp;
                    <button class="btn" type="reset">
                        <i class="ace-icon fa fa-undo bigger-110"></i>
                        Reset
                    </button>
                </div>
            </div>
        </form>
    </div><!-- /.col -->
</div><!-- /.row -->

<!-- page specific plugin scripts -->
<script type="text/javascript">
    var scripts = [null,
        "${r"${"}basePath${"}"}/plugins/jquery-validation/dist/jquery.validate.js",
        "${r"${"}basePath${"}"}/plugins/jquery-validation/dist/additional-methods.js",
        "${r"${"}basePath${"}"}/plugins/jquery.maskedinput/dist/jquery.maskedinput.js",
        "${r"${"}basePath${"}"}/plugins/select2/dist/js/select2.js",
        "${r"${"}basePath${"}"}/plugins/bootbox.js/bootbox.js",
        "${r"${"}basePath${"}"}/plugins/chosen/chosen.jquery.js",
        null]
    $('.page-content-area').ace_ajax('loadScripts', scripts, function() {

        $('.select2')
                .css('width','200px')
                .select2({allowClear:true})
                .on('change', function(){
                    $(this).closest('form').validate().element($(this));
                });
        var $validation = false;

        jQuery.validator.addMethod("phone", function (value, element) {
            return this.optional(element) || /^\(\d{3}\) \d{3}\-\d{4}( x\d{1,6})?$/.test(value);
        }, "Enter a valid phone number.");

        $('#validation-form').validate({
            errorElement: 'div',
            errorClass: 'help-block',
            focusInvalid: false,
            ignore: "",
            rules: {},
        messages: {},

        highlight: function (e) {
            $(e).closest('.form-group').removeClass('has-info').addClass('has-error');
        },

        success: function (e) {
            $(e).closest('.form-group').removeClass('has-error');//.addClass('has-info');
            $(e).remove();
        },

        errorPlacement: function (error, element) {
            if(element.is('input[type=checkbox]') || element.is('input[type=radio]')) {
                var controls = element.closest('div[class*="col-"]');
                if(controls.find(':checkbox,:radio').length > 1) controls.append(error);
                else error.insertAfter(element.nextAll('.lbl:eq(0)').eq(0));
            }
            else if(element.is('.select2')) {
                error.insertAfter(element.siblings('[class*="select2-container"]:eq(0)'));
            }
            else if(element.is('.chosen-select')) {
                error.insertAfter(element.siblings('[class*="chosen-container"]:eq(0)'));
            }
            else error.insertAfter(element.parent());
        },

        submitHandler: function (form) {
            form = $(form);
            $PageContentArea.ace_ajax("ajaxPost",{
                type: "POST",
                url:form.attr("action"),
                data:form.serialize(),
                dataType:"json",
                success: function(msg){

                }
            });

        },
        invalidHandler: function (form) {

        }
    });

        $(document).one('ajaxloadstart.page', function(e) {
            //in ajax mode, remove remaining elements before leaving page
            $('[class*=select2]').remove();
        });
    });
</script>
