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
%><%@page session="false" import="java.text.SimpleDateFormat,
                                  java.util.Calendar,
                                  java.util.ResourceBundle,
                                  com.adobe.cq.launches.api.Launch,
                                  com.adobe.granite.security.user.util.AuthorizableUtil,
                                  com.day.cq.commons.date.RelativeTimeFormat"%><%
%><%@include file="/libs/granite/ui/global.jsp" %><%

    ResourceBundle resourceBundle = slingRequest.getResourceBundle(slingRequest.getLocale());

    Launch launch = resource.adaptTo(Launch.class);

    String imageUrl = request.getContextPath() + launch.getResource().getPath() + ".thumb.319.319.png" + pageCK(launch);

    Calendar liveDateRaw = launch.getLiveDate();
    String liveDate = liveDateRaw != null ? new SimpleDateFormat("dd/MM/yyyy").format(liveDateRaw.getTime()) : "";

    Calendar modifiedDateRaw = launch.getModified();
    String modifiedDate = formatDate(modifiedDateRaw, i18n.get("never"), resourceBundle);
    String modifiedBy = AuthorizableUtil.getFormattedName(resourceResolver, launch.getModifiedBy());

    Calendar promotedDateRaw = launch.getLastPromoted();
    String promotedDate = formatDate(promotedDateRaw, i18n.get("never"), resourceBundle);
    String promotedBy = AuthorizableUtil.getFormattedName(resourceResolver, launch.getLastPromotedBy());

%><article class="card-page foundation-collection-item stack" itemprop="item" itemscope data-foundation-collection-item-id="<%= xssAPI.encodeForHTMLAttr(launch.getResource().getPath()) %>" data-path="<%= xssAPI.encodeForHTMLAttr(launch.getResource().getPath()) %>" data-item-title="<%= xssAPI.encodeForHTMLAttr(launch.getTitle()) %>">
    <i class="select"></i>

    <a href="#" itemprop="admin" x-cq-linkchecker="skip">
        <div class="label">
            <span class="image"><img itemprop="thumbnail" width="192" src="<%= imageUrl %>" alt=""></span>
            <div class="main"><%
                if (launch.isLiveCopy()) {
                    %><p class="descriptor" title="<%= i18n.get("Page is a Live Copy") %>"><%= i18n.get("Live Copy") %></p><%
                }
                %><h4 itemprop="title"><%= xssAPI.filterHTML(launch.getTitle()) %></h4>
            </div>
            <div class="info">
                <p class="meta-info"><%
                    if (liveDateRaw != null) {
                        %><span class="liveDate" title="<%= i18n.get("Live Date") %>">
                            <i class="coral-Icon coral-Icon--calendar"></i>
                            <span class="date" itemprop="livedate" data-timestamp="<%= liveDateRaw.getTimeInMillis() %>"><%= xssAPI.encodeForHTML(liveDate) %></span>
                        </span><%
                    }
                    if (launch.isProductionReady()) {
                        %><span class="productionReady" title="<%= i18n.get("Production Ready") %>">
                            <i class="coral-Icon coral-Icon--check"></i>
                            <span itemprop="productionready"><%= i18n.get("Production Ready") %></span>
                        </span><%
                    }
                %></p>
                <p class="modified" title="<%= i18n.get("Modified") %>">
                    <i class="coral-Icon coral-Icon--edit"></i><%
                    if (modifiedDateRaw != null) {
                        %><span class="date" itemprop="lastmodified" data-timestamp="<%= modifiedDateRaw.getTimeInMillis() %>"><%= xssAPI.encodeForHTML(modifiedDate) %></span>
                        <span class="user" itemprop="lastmodifiedby"><%= xssAPI.encodeForHTML(modifiedBy) %></span><%
                    }
                %></p>
                <p class="promoted" title="<%= i18n.get("Live Date") %>"><%
                    if (promotedDateRaw != null) {
                        %><i class="coral-Icon coral-Icon--flag"></i>
                        <span class="date" itemprop="promoted" data-timestamp="<%= promotedDateRaw.getTimeInMillis() %>"><%= xssAPI.encodeForHTML(promotedDate) %></span>
                        <span class="user" itemprop="promotedby"><%= xssAPI.encodeForHTML(promotedBy) %></span><%
                    }
                %></p>
            </div>
        </div>
    </a>
</article><%!

    private String formatDate(Calendar cal, String defaultValue, ResourceBundle rb) {
        try {
            if (cal == null) {
                return defaultValue;
            }

            RelativeTimeFormat rtf = new RelativeTimeFormat("r", rb);
            return rtf.format(cal.getTimeInMillis(), true);
        } catch (IllegalArgumentException e) {
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            return sdf.format(cal.getTime());
        }
    }

    private String pageCK(Launch launch) {
        Calendar cal = launch.getModified();
        if (cal == null) {
            return "";
        }

        return "?ck=" + (cal.getTimeInMillis() / 1000);
    }

%>