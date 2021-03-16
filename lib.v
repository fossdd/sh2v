module main

// Translates the shell script (lines as array) to a vsh script (lines as
// array)
fn translate(sh []string) []string {
	mut vsh := []string{}
	for line in sh {
		if line.starts_with('#!/') {
			vsh << '#!/usr/bin/env -S v run'
			continue
		}
		if line.strip_margin() == '' {
			vsh << ''
			continue
		}
		if line.strip_margin().starts_with('chmod') {
			args := line.strip_margin().split(' ')
			vsh << "chmod('${args[2]}', ${args[1]})"
			continue
		}
		vsh << "system('$line')"
	}
	return vsh
}
