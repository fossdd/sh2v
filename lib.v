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
		vsh << "system('$line')"
	}
	return vsh
}
