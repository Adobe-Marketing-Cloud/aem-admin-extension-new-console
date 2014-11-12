<%--
  #%L
  Adobe AEM demo for admin extension point: Launches Console
  %%
  Copyright (C) 2014 Adobe
  %%
  Licensed under the Apache License, Version 2.0 (the "License");
  you may not use this file except in compliance with the License.
  You may obtain a copy of the License at
  
       http://www.apache.org/licenses/LICENSE-2.0
  
  Unless required by applicable law or agreed to in writing, software
  distributed under the License is distributed on an "AS IS" BASIS,
  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
  See the License for the specific language governing permissions and
  limitations under the License.
  #L%
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
