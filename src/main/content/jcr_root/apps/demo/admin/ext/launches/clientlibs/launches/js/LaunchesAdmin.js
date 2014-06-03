/*
 * ADOBE CONFIDENTIAL
 *
 * Copyright 2014 Adobe Systems Incorporated
 * All Rights Reserved.
 *
 * NOTICE:  All information contained herein is, and remains
 * the property of Adobe Systems Incorporated and its suppliers,
 * if any.  The intellectual and technical concepts contained
 * herein are proprietary to Adobe Systems Incorporated and its
 * suppliers and may be covered by U.S. and Foreign Patents,
 * patents in process, and are protected by trade secret or copyright law.
 * Dissemination of this information or reproduction of this material
 * is strictly forbidden unless prior written permission is obtained
 * from Adobe Systems Incorporated.
 */
;
(function ($, ns) {
    "use strict";

    /**
     * Root object for Launches manipulation
     * @type {*}
     */
    ns.LaunchesAdmin = (function () {

        var self = {};

        /**
         * Launches Admin namespace
         * @type {string}
         */
        self.NAMESPACE = "apps-launches-admin";

        /**
         * URL for WCM commands
         */
        self.WCM_COMMAND_URL = ns.HTTP.externalize("/bin/wcmcommand");

        return self;

    }());

}(Granite.$, Granite));
