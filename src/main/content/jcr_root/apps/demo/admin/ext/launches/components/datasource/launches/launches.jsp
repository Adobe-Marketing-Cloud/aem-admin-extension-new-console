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
%><%@page session="false" import="java.util.ArrayList,
                                  java.util.Iterator,
                                  java.util.List,
                                  org.apache.commons.collections.Transformer,
                                  org.apache.commons.collections.iterators.TransformIterator,
                                  org.apache.sling.api.resource.Resource,
                                  org.apache.sling.api.resource.ResourceWrapper,
                                  com.adobe.cq.launches.api.Launch,
                                  com.adobe.cq.launches.api.LaunchManager,
                                  com.adobe.granite.ui.components.Config,
                                  com.adobe.granite.ui.components.ds.AbstractDataSource,
                                  com.adobe.granite.ui.components.ds.DataSource,
                                  com.adobe.granite.ui.components.ds.EmptyDataSource"%><%
%><%@include file="/libs/granite/ui/global.jsp" %><%

    Config cfg = new Config(resource.getChild(Config.DATASOURCE));
    final String itemRT = cfg.get("itemResourceType", String.class);

    LaunchManager launchManager = resource.getResourceResolver().adaptTo(LaunchManager.class);
    final List<Resource> launches = new ArrayList<Resource>();
    for (Launch launch : launchManager.getLaunches(null)) {
        launches.add(launch.getResource());
    }
    request.setAttribute("com.adobe.cq.datasource.iterator", launches.iterator());
    request.setAttribute("com.adobe.cq.datasource.size", new Long(launches.size()));
    request.setAttribute("com.adobe.cq.datasource.nextPagePath", "");

    DataSource ds;
    if (launches.isEmpty()) {
        ds = EmptyDataSource.instance();
    } else {
        ds = new AbstractDataSource() {
            public Iterator<Resource> iterator() {
                return new TransformIterator(launches.iterator(), new Transformer() {
                    public Object transform(Object input) {
                        return new ResourceWrapper((Resource) input) {
                            public String getResourceType() {
                                return itemRT;
                            }
                        };
                    }
                });
            }
        };
    }

    request.setAttribute(DataSource.class.getName(), ds);
%>
