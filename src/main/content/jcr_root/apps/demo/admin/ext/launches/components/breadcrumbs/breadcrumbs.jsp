<%--
  ADOBE CONFIDENTIAL

  Copyright 2014 Adobe Systems Incorporated
  All Rights Reserved.

  NOTICE:  All information contained herein is, and remains
  the property of Adobe Systems Incorporated and its suppliers,
  if any.  The intellectual and technical concepts contained
  herein are proprietary to Adobe Systems Incorporated and its
  suppliers and may be covered by U.S. and Foreign Patents,
  patents in process, and are protected by trade secret or copyright law.
  Dissemination of this information or reproduction of this material
  is strictly forbidden unless prior written permission is obtained
  from Adobe Systems Incorporated.
--%><%
%><%@page session="false" import="com.adobe.granite.ui.components.AttrBuilder,
                                  com.adobe.granite.ui.components.Config,
                                  com.adobe.granite.ui.components.ExpressionHelper,
                                  com.adobe.granite.ui.components.Tag,
                                  com.day.cq.i18n.I18n"%><%
%><%@include file="/libs/granite/ui/global.jsp" %><%

    Config cfg = cmp.getConfig();
    ExpressionHelper ex = cmp.getExpressionHelper();

    Tag tag = cmp.consumeTag();
    AttrBuilder attrs = tag.getAttrs();
    attrs.addClass("endor-Crumbs");

    AttrBuilder mcCrumbsItem = new AttrBuilder(request, xssAPI);
    mcCrumbsItem.addClass("endor-Crumbs-item");
    mcCrumbsItem.addHref("href", "http://marketing.adobe.com");

    AttrBuilder mcIcon = new AttrBuilder(request, xssAPI);
    mcIcon.addClass("coral-Icon");
    mcIcon.addClass("coral-Icon--adobeMarketingCloud");
    mcIcon.addClass("coral-Icon--sizeM");

    AttrBuilder crumbsEllipsisItem = new AttrBuilder(request, xssAPI);
    crumbsEllipsisItem.addClass("endor-Crumbs-item");
    crumbsEllipsisItem.addClass("endor-Crumbs-item--ellipsis");
    crumbsEllipsisItem.addHref("href", "#");

    AttrBuilder aemCrumbsItem = new AttrBuilder(request, xssAPI);
    aemCrumbsItem.addClass("endor-Crumbs-item");
    aemCrumbsItem.addHref("href", "/");


%><nav <%= attrs.build() %>>
    <a <%= mcCrumbsItem.build() %>><i <%= mcIcon.build() %>></i>
        Adobe Marketing Cloud
    </a>
    <a <%= crumbsEllipsisItem.build() %>></a>
    <a <%= aemCrumbsItem.build() %>>Experience Manager</a><%

%></nav>
