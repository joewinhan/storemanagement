/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/7.0.47
 * Generated at: 2020-12-30 15:57:48 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.page.sys;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class in_005fstore_005fstatistics_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  private javax.el.ExpressionFactory _el_expressionfactory;
  private org.apache.tomcat.InstanceManager _jsp_instancemanager;

  public java.util.Map<java.lang.String,java.lang.Long> getDependants() {
    return _jspx_dependants;
  }

  public void _jspInit() {
    _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
    _jsp_instancemanager = org.apache.jasper.runtime.InstanceManagerFactory.getInstanceManager(getServletConfig());
  }

  public void _jspDestroy() {
  }

  public void _jspService(final javax.servlet.http.HttpServletRequest request, final javax.servlet.http.HttpServletResponse response)
        throws java.io.IOException, javax.servlet.ServletException {

    final javax.servlet.jsp.PageContext pageContext;
    javax.servlet.http.HttpSession session = null;
    final javax.servlet.ServletContext application;
    final javax.servlet.ServletConfig config;
    javax.servlet.jsp.JspWriter out = null;
    final java.lang.Object page = this;
    javax.servlet.jsp.JspWriter _jspx_out = null;
    javax.servlet.jsp.PageContext _jspx_page_context = null;


    try {
      response.setContentType("text/html; charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("\r\n");
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html>\r\n");
      out.write("<head>\r\n");
      out.write("<meta charset=\"UTF-8\">\r\n");
      out.write("<title>入库统计</title>\r\n");
      out.write("</head>\r\n");
      out.write("<body>\r\n");
      out.write("<script type=\"text/javascript\">\r\n");
      out.write("$(function(){\r\n");
      out.write("\t$('#in_store_statistics_table').datagrid({    \r\n");
      out.write("\t    url:'page/showPurchaseOrderByStatus?status=5',    \r\n");
      out.write("\t    columns:[[    \r\n");
      out.write("\t        {field:'id',title:'编号',width:100,hidden:true},    \r\n");
      out.write("\t        {field:'createtime',title:'创建时间',width:100,align:'right'},    \r\n");
      out.write("\t        {field:'finishtime',title:'完成时间',width:100,align:'right'},\r\n");
      out.write("\t        {field:'supplierId',title:'供应商',width:100,align:'right'},\r\n");
      out.write("\t        {field:'amount',title:'商品数量',width:100,align:'right'},\r\n");
      out.write("\t        {field:'price',title:'订单总价',width:100,align:'right'},\r\n");
      out.write("\t        {field:'commodityId',title:'商品',width:100,align:'right'},\r\n");
      out.write("\t        {field:'status',title:'订单状态',width:100,align:'right'},\r\n");
      out.write("\t    ]],\r\n");
      out.write("\t    pagination:true,\r\n");
      out.write("\t    pageList:[8,12,18],\r\n");
      out.write("\t    pageSize:8,\r\n");
      out.write("\t    fitColumns:true,\r\n");
      out.write("\t    striped:true,\r\n");
      out.write("\t    rownumbers:true,\r\n");
      out.write("\t    toolbar:\"#in_easyui_toolbar\"\r\n");
      out.write("\t    \r\n");
      out.write("\t});\r\n");
      out.write("}) \r\n");
      out.write("\r\n");
      out.write("$('#in_searchBox').searchbox({ \r\n");
      out.write("\tsearcher:function(value,name){ \r\n");
      out.write("\t\t$('#in_store_statistics_table').datagrid({    \r\n");
      out.write("\t\t    url:'page/showPurchaseOrderByParams',    \r\n");
      out.write("\t\t    columns:[[    \r\n");
      out.write("\t\t        {field:'id',title:'编号',width:100,hidden:true},    \r\n");
      out.write("\t\t        {field:'createtime',title:'创建时间',width:100,align:'right'},    \r\n");
      out.write("\t\t        {field:'finishtime',title:'完成时间',width:100,align:'right'},\r\n");
      out.write("\t\t        {field:'supplierId',title:'供应商',width:100,align:'right'},\r\n");
      out.write("\t\t        {field:'amount',title:'商品数量',width:100,align:'right'},\r\n");
      out.write("\t\t        {field:'price',title:'订单总价',width:100,align:'right'},\r\n");
      out.write("\t\t        {field:'commodityId',title:'商品',width:100,align:'right'},\r\n");
      out.write("\t\t        {field:'status',title:'订单状态',width:100,align:'right'},\r\n");
      out.write("\t\t    ]],\r\n");
      out.write("\t\t    pagination:true,\r\n");
      out.write("\t\t    pageList:[8,12,18],\r\n");
      out.write("\t\t    pageSize:8,\r\n");
      out.write("\t\t    fitColumns:true,\r\n");
      out.write("\t\t    striped:true,\r\n");
      out.write("\t\t    rownumbers:true,\r\n");
      out.write("\t\t    toolbar:\"#in_easyui_toolbar\",\r\n");
      out.write("\t\t    queryParams:{paramName:name,paramValue:value},\r\n");
      out.write("\t\t});  \r\n");
      out.write("\t}, \r\n");
      out.write("\tmenu:'#in_searchParam', \r\n");
      out.write("\tprompt:'请输入搜索条件' \r\n");
      out.write("});\r\n");
      out.write("</script>\r\n");
      out.write(" <div  id=\"in_easyui_toolbar\" style=\"border-bottom: 1px solid #ddd; height: 32px; padding: 2px 5px; background: #fafafa;\">\r\n");
      out.write("\t<div id=\"in_searchDiv\" style=\"float: left;\">\r\n");
      out.write("\t\t<input id=\"in_searchBox\"></input> \r\n");
      out.write("\t\t<div id=\"in_searchParam\" style=\"width:120px\"> \r\n");
      out.write("\t\t\t<div data-options=\"name:'commodity',selected:true\">商品名</div>\r\n");
      out.write("\t\t\t<div data-options=\"name:'supplier'\">供应商名</div>\r\n");
      out.write("\t\t</div>   \r\n");
      out.write("\t</div>\r\n");
      out.write("</div>\r\n");
      out.write("<table id=\"in_store_statistics_table\"></table> \r\n");
      out.write("</body>\r\n");
      out.write("</html>");
    } catch (java.lang.Throwable t) {
      if (!(t instanceof javax.servlet.jsp.SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try { out.clearBuffer(); } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}