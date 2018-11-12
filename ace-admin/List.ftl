<%--
Created by IntelliJ IDEA.
User: javaccy
Date: 2016/5/31
Time: 13:23
To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../../../source/libs.jsp"%>
<title>${entity.comment}列表</title>

<!-- ajax layout which only needs content area -->
<div class="page-header clearfix">
    <div class="pull-right">
        <div style="display: inline" id="principal_button_bar">
            <a type="button" class="btn btn-sm btn-primary" onclick="$$.clearQueryCondition()">清除</a>
        </div>
        <div class="btn-overlap btn-group" id="toolsButtons">
            <a class="buttons-colvis btn btn-white btn-primary btn-bold" title="">
                <span>
                    <i class="fa fa-columns bigger-110 blue"></i>
                    <span class="hidden">显示/隐藏 列</span>
                </span>
            </a>
            <a href="javascript:;" onclick="$.alertPrincipalEdit()" role="button" class="btn btn-white btn-primary btn-bold">
                <span>
                    <i class="fa fa-search bigger-110 blue"></i>
                    <span class="hidden">查询</span>
                </span>
            </a>
            <a class="buttons-add btn btn-white btn-primary btn-bold" href="#page/${entity.underScoreCaseName}/add">
                <span>
                    <i class="fa fa-plus bigger-110 blue"></i>
                    <span class="hidden">添加</span>
                </span>
            </a>
            <a class="buttons-add btn btn-white btn-primary btn-bold batchDeleteButton">
                <span>
                    <i class="fa fa-trash-o bigger-110 blue"></i>
                    <span class="hidden">删除</span>
                </span>
            </a>

            <a class="buttons-copy buttons-html5 btn btn-white btn-primary btn-bold">
                <span>
                    <i class="fa fa-copy bigger-110 pink"></i>
                    <span class="hidden">Copy to clipboard</span>
                </span>
            </a>
            <a class="buttons-csv buttons-html5 btn btn-white btn-primary btn-bold" title="">
            <span>
                <i class="fa fa-database bigger-110 orange"></i>
                <span class="hidden">导出CSV</span>
            </span>
            </a>
            <a class="buttons-excel buttons-flash btn btn-white btn-primary btn-bold">
                <span>
                    <i class="fa fa-file-excel-o bigger-110 green"></i>
                    <span class="hidden">导出Excel</span>
                </span>
            </a>
            <a class="buttons-pdf buttons-flash btn btn-white btn-primary btn-bold">
                <span>
                    <i class="fa fa-file-pdf-o bigger-110 red"></i>
                    <span class="hidden">导出PDF</span>
                </span>
            </a>
            <a class="buttons-print btn btn-white btn-primary btn-bold" title="">
                <span>
                    <i class="fa fa-print bigger-110 grey"></i>
                    <span class="hidden">打印预览</span>
                </span>
            </a>
        </div>
    </div>

</div><!-- /.page-header -->

<div class="row">
    <div class="col-xs-12">
        <!-- PAGE CONTENT BEGINS -->
        <div class="row">
            <div class="col-xs-12">
                <table id="dataTable" dataMode="${entity.uncapitalizeName}" class="table dataTable table-striped table-bordered table-hover">
                    <thead>
                    <tr>
                        <th class="center fixedWidth">
                            <label class="pos-rel">
                                <input type="checkbox" class="ace selectAllButton" />
                                <span class="lbl"></span>
                            </label>
                        </th>
                        <th class="detail-col fixedWidth">详情</th>
                        <#list entity.fields as item >
                                <th data-type="${item.type.simpleName}" class="sorting" data-name="${item.name}">${item.comment}</th>
                        </#list>
                        <th class="fixedWidth">操作</th>
                    </tr>
                    </thead>

                    <tbody>
                    <c:forEach var="o" items="${r"${"}page.data${r"}"}" >
                        <tr class="dataRow" dataId="${r"${"}o.id${r"}"}">
                            <td class="center">
                                <label class="pos-rel">
                                    <input type="checkbox" class="ace" value="${r"${"}o.id${r"}"}"/>
                                    <span class="lbl"></span>
                                </label>
                            </td>

                            <td class="center">
                                <div class="action-buttons">
                                    <a class="green bigger-140 show-details-btn" title="Show Details">
                                        <i class="ace-icon fa fa-angle-double-down"></i>
                                        <span class="sr-only">Details</span>
                                    </a>
                                </div>
                            </td>
                        <#list entity.fields as item >
                           <td data-name="${item.name}">${r"${o."}${item.name}${r"}"}</td>
                        </#list>
                            <td>
                                <div class="hidden-sm hidden-xs btn-group">
                                    <button class="btn btn-xs btn-info">
                                        <a href="#page/${entity.underScoreCaseName}/edit?id=${r"${o."}id${r"}"}"><i class="ace-icon fa fa-pencil bigger-120"></i></a>
                                    </button>
                                    <button class="btn btn-xs btn-danger deleteButton">
                                        <i class="ace-icon fa fa-trash-o bigger-120"></i>
                                    </button>
                                </div>

                                <div class="hidden-md hidden-lg">
                                    <div class="inline pos-rel">
                                        <button class="btn btn-minier btn-primary dropdown-toggle" data-toggle="dropdown" data-position="auto">
                                            <i class="ace-icon fa fa-cog icon-only bigger-110"></i>
                                        </button>
                                        <ul class="dropdown-menu dropdown-only-icon dropdown-yellow dropdown-menu-right dropdown-caret dropdown-close">
                                            <li>
                                                <a href="#page/${entity.underScoreCaseName}/edit?id=${r"${o."}id${r"}"}" class="tooltip-success" data-rel="tooltip" title="Edit">
													<span class="green">
														<i class="ace-icon fa fa-pencil-square-o bigger-120"></i>
													</span>
                                                </a>
                                            </li>
                                            <li>
                                                <a class="tooltip-error deleteButton" data-rel="tooltip" title="Delete">
													<span class="red">
														<i class="ace-icon fa fa-trash-o bigger-120"></i>
													</span>
                                                </a>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                            </td>
                        </tr>
                        <tr class="detail-row">
                            <td colspan="8">
                                <div class="table-detail">
                                    <div class="row">
                                        <div class="col-xs-12 col-sm-2">
                                            <div class="text-center">
                                                <img height="150" class="thumbnail inline no-margin-bottom" alt="Domain Owner's Avatar" src="../../assets/avatars/profile-pic.jpg" />
                                                <br />
                                                <div class="width-80 label label-info label-xlg arrowed-in arrowed-in-right">
                                                    <div class="inline position-relative">
                                                        <a class="user-title-label" href="#">
                                                            <i class="ace-icon fa fa-circle light-green"></i>
                                                            &nbsp;<span class="white">Alex M. Doe</span>
                                                        </a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="col-xs-12 col-sm-7">
                                            <div class="space visible-xs"></div>

                                            <div class="profile-user-info profile-user-info-striped">
                                                <div class="profile-info-row">
                                                    <div class="profile-info-name"> Username </div>

                                                    <div class="profile-info-value">
                                                        <span>usernmae</span>
                                                    </div>
                                                </div>

                                                <div class="profile-info-row">
                                                    <div class="profile-info-name"> Location </div>

                                                    <div class="profile-info-value">
                                                        <i class="fa fa-map-marker light-orange bigger-110"></i>
                                                        <span>Netherlands, Amsterdam</span>
                                                    </div>
                                                </div>

                                                <div class="profile-info-row">
                                                    <div class="profile-info-name"> Age </div>

                                                    <div class="profile-info-value">
                                                        <span>38</span>
                                                    </div>
                                                </div>

                                                <div class="profile-info-row">
                                                    <div class="profile-info-name"> Joined </div>

                                                    <div class="profile-info-value">
                                                        <span>2010/06/20</span>
                                                    </div>
                                                </div>

                                                <div class="profile-info-row">
                                                    <div class="profile-info-name">
                                                        Last Online
                                                    </div>

                                                    <div class="profile-info-value">
                                                        <span>3 hours ago</span>
                                                    </div>
                                                </div>

                                                <div class="profile-info-row">
                                                    <div class="profile-info-name"> About Me </div>

                                                    <div class="profile-info-value">
                                                        <span>Bio</span>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="col-xs-12 col-sm-3">
                                            <div class="space visible-xs"></div>
                                            <h4 class="header blue lighter less-margin">Send a message to Alex</h4>

                                            <div class="space-6"></div>

                                            <form>
                                                <fieldset>
                                                    <textarea class="width-100" resize="none" placeholder="Type something…"></textarea>
                                                </fieldset>

                                                <div class="hr hr-dotted"></div>

                                                <div class="clearfix">
                                                    <label class="pull-left">
                                                        <input type="checkbox" class="ace" />
                                                        <span class="lbl"> Email me a copy</span>
                                                    </label>

                                                    <button class="pull-right btn btn-sm btn-primary btn-white btn-round" type="button">
                                                        Submit
                                                        <i class="ace-icon fa fa-arrow-right icon-on-right bigger-110"></i>
                                                    </button>
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            ${r"${"}page.html${r"}"}
            </div><!-- /.span -->
        </div><!-- /.row -->
        <!-- PAGE CONTENT ENDS -->
    </div><!-- /.col -->
</div><!-- /.row -->
<script type="text/javascript">
    var searchForm = ${r"${"}searchForm${r"}"}
    var scripts = [null,
        "${r"${"}basePath${"}"}/static/page.js"
        ,null];
    $('.page-content-area').ace_ajax('loadScripts', scripts, function() {
        $("#dataTable").InitDataTable({ignoreClass:"fixedWidth"});
    })
</script>