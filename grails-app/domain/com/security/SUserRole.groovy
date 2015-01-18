package com.security

import org.apache.commons.lang.builder.HashCodeBuilder

class SUserRole implements Serializable {

	private static final long serialVersionUID = 1

	SUser sUser
	Role role

	boolean equals(other) {
		if (!(other instanceof SUserRole)) {
			return false
		}

		other.sUser?.id == SUser?.id &&
			other.role?.id == role?.id
	}

	int hashCode() {
		def builder = new HashCodeBuilder()
		if (SUser) builder.append(SUser.id)
		if (role) builder.append(role.id)
		builder.toHashCode()
	}

	static SUserRole get(long SUserId, long roleId) {
		SUserRole.where {
			SUser == SUser.load(SUserId) &&
			role == Role.load(roleId)
		}.get()
	}

	static SUserRole create(SUser sUser, Role role, boolean flush = false) {
		new SUserRole(sUser: sUser, role: role).save(flush: flush, insert: true)
	}

	static boolean remove(SUser u, Role r, boolean flush = false) {

		int rowCount = SUserRole.where {
			SUser == SUser.load(u.id) &&
			role == Role.load(r.id)
		}.deleteAll()

		rowCount > 0
	}

	static void removeAll(SUser u) {
		SUserRole.where {
			SUser == SUser.load(u.id)
		}.deleteAll()
	}

	static void removeAll(Role r) {
		SUserRole.where {
			role == Role.load(r.id)
		}.deleteAll()
	}

	static mapping = {
		id composite: ['role', 'sUser']
		version false
	}
}
