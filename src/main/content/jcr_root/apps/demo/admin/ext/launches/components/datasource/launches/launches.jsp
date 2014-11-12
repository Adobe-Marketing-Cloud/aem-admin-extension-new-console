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
