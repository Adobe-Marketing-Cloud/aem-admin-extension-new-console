/*
 * #%L
 * aem-admin-extension-new-console
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
