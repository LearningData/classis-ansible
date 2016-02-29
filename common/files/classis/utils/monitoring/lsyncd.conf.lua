--CONF--
local dest = "{{ host }}"
local port = "{{ port }}"
local user = "{{ user }}"

settings {
	logfile = "/var/log/lsyncd/lsyncd.log",
	statusFile = "/var/log/lsyncd/lsyncd.status",
	insist = true
}

sync {
	default.rsync,
	source = "{{ utils_directory }}/utils/",
	target = dest .. ":/{{ utils_directory }}",
	delay = 1,
	rsync = {
		compress = true,
		acls = true,
		verbose = true,
		rsync_path = "sudo rsync",
                owner = true,
                group = true,
                perms = true,
		rsh = "/usr/bin/ssh -p " .. port .. " -l " .. user .. " -i /home/" .. user .. "/.ssh/id_rsa -o StrictHostKeyChecking=no"
	}
}

sync {
	default.rsync,
	source = "{{ application_path }}",
	target = dest .. ":{{ application_path }}",
	delay = 1,
	rsync = {
		compress = true,
		acls = true,
		verbose = true,
		rsync_path = "sudo rsync",
                owner = true,
                group = true,
                perms = true,
		rsh = "/usr/bin/ssh -p " .. port .. " -l " .. user .. " -i /home/" .. user .. "/.ssh/id_rsa -o StrictHostKeyChecking=no"
	}
}

sync {
	default.rsync,
	source = "{{ eportfolio_directory }}",
	target = dest .. ":{{ eportfolio_directory }}",
	delay = 1,
	rsync = {
		compress = true,
		acls = true,
		verbose = true,
		rsync_path = "sudo rsync",
                owner = true,
                group = true,
                perms = true,
		rsh = "/usr/bin/ssh -p " .. port .. " -l " .. user .. " -i /home/" .. user .. "/.ssh/id_rsa -o StrictHostKeyChecking=no"
	}
}
