/*
 * #%L
 * Adobe AEM demo for admin extension point: Launches Console
 * %%
 * Copyright (C) 2014 Adobe
 * %%
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 * 
 *      http://www.apache.org/licenses/LICENSE-2.0
 * 
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 * #L%
 */
;
(function ($, document, ns) {
    "use strict";

    var CLONE_ACTIVATOR = "." + ns.LaunchesAdmin.NAMESPACE + "-clone-activator";
    var CLONE_CMD = "cloneLaunch";

    $(document).on("click", CLONE_ACTIVATOR, function(e) {
        var selection = $(".foundation-collection").first().find(".foundation-selections-item").first();
        var path = selection.data("foundationCollectionItemId") || selection.data("path");

        var promise = $.post(ns.LaunchesAdmin.WCM_COMMAND_URL, {
            "_charset_": "UTF-8",
            ":status" : "browser",
            cmd: CLONE_CMD,
            path: path
        });

        promise.done(function () {
            var notificationSlider = new ns.UI.NotificationSlider($(".endor-Page-content.endor-Panel.foundation-content"));
            notificationSlider.notify({
                content: ns.I18n.get("Launch cloned"),
                type: "info",
                closable: false,
                className: "notification-alert--absolute admin-notification"
            });

            var contentApi = $(".foundation-content").adaptTo("foundation-content");
            contentApi.refresh();

        }).fail(function (jqXHR) {
            var errorMsg = ns.I18n.getVar($(jqXHR.responseText).find("#Message").html());
            var notificationSlider = new ns.UI.NotificationSlider($(".endor-Page-content.endor-Panel.foundation-content"));
            notificationSlider.notify({
                content: errorMsg,
                closable: false,
                className: "notification-alert--absolute admin-notification"
            });
        });
    });

})(Granite.$, document, Granite);
