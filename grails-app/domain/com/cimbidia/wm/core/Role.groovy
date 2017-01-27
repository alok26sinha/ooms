/**
 * Copyright (c) Cimbidia.  All rights reserved.
 * The use and distribution terms for this software are covered by the
 * Eclipse Public License 1.0 (http://opensource.org/licenses/eclipse-1.0.php)
 * which can be found in the file epl-v10.html at the root of this distribution.
 * By using this software in any fashion, you are agreeing to be bound by
 * the terms of this license.
 * You must not remove this notice, or any other, from this software.
 * */
package com.cimbidia.wm.core

import com.cimbidia.wm.core.RoleType;

// import java.util.Date;

class Role implements Serializable, Comparable<Role> {

    String id
    RoleType roleType;
    String description;

    static constraints = {
        roleType(nullable: false)
        description(nullable: true, maxSize: 255)
    }

    static mapping = {
        id generator: 'uuid'
    }

    String toString() { return "${roleType.name}"; }

    static Role admin() {
        Role.findByRoleType(RoleType.ROLE_ADMIN)
    }

    static Role manager() {
        Role.findByRoleType(RoleType.ROLE_MANAGER)
    }

    static Role assistant() {
        Role.findByRoleType(RoleType.ROLE_ASSISTANT)
    }

    static Role browser() {
        Role.findByRoleType(RoleType.ROLE_BROWSER)
    }

    @Override
    public int compareTo(Role role) {
        if (role) {
            return this?.roleType?.sortOrder?.compareTo(role?.roleType?.sortOrder)
        }
    }

}


